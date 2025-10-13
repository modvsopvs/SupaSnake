#!/usr/bin/env python3
"""
ZTE Platform Orchestrator
Coordinates multiple Claude instances for autonomous development
"""

import json
import subprocess
import time
import os
from datetime import datetime
from typing import Dict, List, Optional
from pathlib import Path


class WorktreeManager:
    """Manages git worktrees for parallel agent development"""

    def __init__(self, base_dir: str = ".."):
        self.base_dir = base_dir
        self.prefix = "worktree-"

    def create(self, name: str, branch: str) -> str:
        """Create a new worktree and return its path"""
        path = f"{self.base_dir}/{self.prefix}{name}"

        # Remove if already exists
        if os.path.exists(path):
            print(f"⚠️  Worktree {path} already exists, removing...")
            self.remove(name)

        cmd = f"git worktree add {path} -b {branch}"
        result = subprocess.run(cmd, shell=True, capture_output=True)

        if result.returncode != 0:
            error = result.stderr.decode()
            raise Exception(f"Failed to create worktree: {error}")

        print(f"✓ Created worktree: {path} (branch: {branch})")
        return path

    def remove(self, name: str) -> None:
        """Remove a worktree"""
        path = f"{self.base_dir}/{self.prefix}{name}"

        if os.path.exists(path):
            subprocess.run(f"git worktree remove {path} --force", shell=True)
            print(f"✓ Removed worktree: {path}")

    def list_active(self) -> List[Dict]:
        """Get all active worktrees"""
        result = subprocess.run(
            "git worktree list --porcelain",
            shell=True,
            capture_output=True
        )

        # Parse worktree list output
        worktrees = []
        lines = result.stdout.decode().split('\n')

        current = {}
        for line in lines:
            if line.startswith('worktree '):
                if current:
                    worktrees.append(current)
                current = {'path': line.split(' ', 1)[1]}
            elif line.startswith('branch '):
                current['branch'] = line.split(' ', 1)[1]

        if current:
            worktrees.append(current)

        # Filter platform worktrees only
        return [w for w in worktrees if self.prefix in w.get('path', '')]

    def cleanup_all(self) -> None:
        """Remove all platform worktrees"""
        for wt in self.list_active():
            name = wt['path'].split(self.prefix)[1]
            self.remove(name)


class SpawnManager:
    """Manages spawning Claude instances in terminals"""

    def __init__(self):
        self.active_agents = {}

    def spawn(self, agent_name: str, worktree_path: str, task_brief: str) -> Dict:
        """Spawn a Claude instance with task brief"""

        # Write task brief
        brief_path = f"{worktree_path}/AGENT_TASK.md"
        with open(brief_path, 'w') as f:
            f.write(task_brief)

        print(f"✓ Wrote task brief: {brief_path}")

        # Spawn tmux window
        cmd = f"""
        tmux new-window -n {agent_name} -c {worktree_path}
        tmux send-keys -t {agent_name} 'claude' Enter
        tmux send-keys -t {agent_name} 'Read AGENT_TASK.md and execute the task. Commit with completion signal when done.' Enter
        """

        subprocess.run(cmd, shell=True)

        spawn_info = {
            "agent": agent_name,
            "worktree": worktree_path,
            "status": "spawned",
            "started_at": datetime.utcnow().isoformat()
        }

        self.active_agents[agent_name] = spawn_info
        print(f"✓ Spawned {agent_name} in tmux window")

        return spawn_info

    def check_status(self, agent_name: str, branch: str) -> str:
        """Check agent status via git log"""

        # Check for completion signal
        cmd = f"git log {branch} --oneline --grep '\\[.*:COMPLETE\\]' -1"
        result = subprocess.run(cmd, shell=True, capture_output=True)

        if result.stdout:
            return "complete"

        # Check for question signal
        cmd = f"git log {branch} --oneline --grep '\\[.*:QUESTION\\]' -1"
        result = subprocess.run(cmd, shell=True, capture_output=True)

        if result.stdout:
            return "blocked"

        return "in_progress"


class StateBus:
    """File-based inter-agent communication"""

    def __init__(self, state_dir: str = "state"):
        self.state_dir = state_dir

        # Ensure state directory exists
        os.makedirs(state_dir, exist_ok=True)

    def write(self, agent: str, data: Dict) -> None:
        """Write agent state file"""
        path = f"{self.state_dir}/{agent}_output.json"

        # Add timestamp if not present
        if 'timestamp' not in data:
            data['timestamp'] = datetime.utcnow().isoformat() + "Z"

        # Add schema version if not present
        if 'schema_version' not in data:
            data['schema_version'] = "1.0.0"

        with open(path, 'w') as f:
            json.dump(data, f, indent=2)

        print(f"✓ Wrote state: {path}")

    def read(self, agent: str) -> Optional[Dict]:
        """Read agent state file"""
        path = f"{self.state_dir}/{agent}_output.json"

        if not os.path.exists(path):
            return None

        with open(path, 'r') as f:
            return json.load(f)

    def wait_for(self, agent: str, timeout: int = 600) -> Dict:
        """Wait for agent to complete, polling state file"""
        start_time = time.time()

        while time.time() - start_time < timeout:
            state = self.read(agent)

            if state and state.get("status") == "complete":
                print(f"✅ {agent} completed")
                return state

            if state and state.get("status") == "failed":
                raise Exception(f"{agent} failed: {state.get('error', 'Unknown error')}")

            time.sleep(5)  # Poll every 5 seconds

        raise TimeoutError(f"{agent} did not complete within {timeout}s")

    def read_all(self, agents: List[str]) -> Dict[str, Dict]:
        """Read states for all agents"""
        return {agent: self.read(agent) for agent in agents}


class PipelineExecutor:
    """Executes pipeline stages"""

    def __init__(self, orchestrator):
        self.orch = orchestrator

    def execute(self, pipeline: Dict, context: Dict) -> Dict:
        """Execute full pipeline"""

        print(f"\n{'='*70}")
        print(f"EXECUTING PIPELINE: {pipeline['name']}")
        print(f"{'='*70}\n")

        for stage in pipeline['stages']:
            print(f"\n{'='*70}")
            print(f"STAGE: {stage['name'].upper()}")
            print(f"{'='*70}")

            # Check conditionals
            if 'conditional' in stage:
                if not self.check_condition(stage['conditional'], context):
                    print(f"⏭  Skipping {stage['name']} (condition not met)")
                    continue

            # Execute stage
            if stage.get('mode') == "parallel":
                results = self.execute_parallel(stage, context)
            else:
                results = self.execute_serial(stage, context)

            # Update context
            context[f"{stage['name']}_results"] = results

            # Check for blockers
            if self.has_critical_failures(results):
                raise Exception(f"Stage {stage['name']} had critical failures")

        return context

    def execute_parallel(self, stage: Dict, context: Dict) -> Dict:
        """Execute agents in parallel"""
        agents = stage['agents']

        print(f"Spawning {len(agents)} agents in parallel...")

        # Create worktrees and spawn agents
        worktrees = {}
        for agent in agents:
            branch = f"feature/{context['task_id']}-{agent}"
            worktree_path = self.orch.worktree_mgr.create(agent, branch)

            task_brief = self.generate_brief(agent, context)

            spawn_info = self.orch.spawn_mgr.spawn(agent, worktree_path, task_brief)
            spawn_info['branch'] = branch

            worktrees[agent] = spawn_info

        print(f"\nWaiting for {len(agents)} agents to complete...")

        # Wait for all to complete
        results = {}
        timeout = stage.get('timeout', 600)

        for agent in agents:
            try:
                state = self.orch.state_bus.wait_for(agent, timeout=timeout)
                results[agent] = state
            except TimeoutError:
                print(f"⚠️  {agent} timed out")
                results[agent] = {"status": "timeout", "agent": agent}

        return results

    def execute_serial(self, stage: Dict, context: Dict) -> Dict:
        """Execute agents serially"""
        results = {}

        for agent in stage['agents']:
            print(f"\nExecuting {agent}...")

            branch = f"feature/{context['task_id']}-{agent}"
            worktree_path = self.orch.worktree_mgr.create(agent, branch)

            task_brief = self.generate_brief(agent, context)

            spawn_info = self.orch.spawn_mgr.spawn(agent, worktree_path, task_brief)
            spawn_info['branch'] = branch

            # Wait for completion
            state = self.orch.state_bus.wait_for(agent, timeout=stage.get('timeout', 600))
            results[agent] = state

        return results

    def generate_brief(self, agent: str, context: Dict) -> str:
        """Generate task brief for agent"""

        return f"""# Agent Task: {agent}

## Context
Task ID: {context['task_id']}
User Request: {context['user_request']}

## Your Responsibility
{self.get_agent_responsibility(agent, context)}

## Completion Protocol
1. Complete your implementation
2. Write tests
3. Write state file: state/{agent}_output.json
4. Commit with message: "[{agent.upper()}:COMPLETE] Completed {agent} implementation"

## State File Schema
```json
{{
  "schema_version": "1.0.0",
  "agent": "{agent}",
  "task": "{context['task_id']}",
  "status": "complete",
  "timestamp": "ISO-8601",
  "outputs": {{
    // Your agent-specific outputs
  }},
  "modified_files": ["list", "of", "files"],
  "tests_added": 0
}}
```

## Rules
- NO TODO comments
- Complete all implementations
- Write comprehensive tests
- Handle all error cases
- Document complex logic

Begin implementation now.
"""

    def get_agent_responsibility(self, agent: str, context: Dict) -> str:
        """Get agent-specific responsibility"""
        responsibilities = {
            "physics": "Implement physics mechanics and behavior",
            "economy": "Implement economy, costs, and rewards",
            "vfx": "Implement visual effects and particles",
            "ui": "Implement user interface elements",
            "content": "Create content assets and data",
            "audio": "Implement audio systems",
            "networking": "Implement networking and multiplayer",
            "ai": "Implement AI behaviors"
        }

        return responsibilities.get(agent, f"Implement {agent} system")

    def check_condition(self, conditional: str, context: Dict) -> bool:
        """Check if conditional is met"""
        # Simple evaluation for now
        return True

    def has_critical_failures(self, results: Dict) -> bool:
        """Check if any critical failures occurred"""
        for agent, result in results.items():
            if result.get('status') in ['failed', 'timeout']:
                return True
        return False


class Orchestrator:
    """Main orchestrator coordinating all agents"""

    def __init__(self):
        self.worktree_mgr = WorktreeManager()
        self.spawn_mgr = SpawnManager()
        self.state_bus = StateBus()
        self.pipeline_exec = PipelineExecutor(self)
        self.start_time = None
        self.current_task = None

    def execute_request(self, user_request: str):
        """Execute a user request through the full pipeline"""

        self.start_time = time.time()
        self.current_task = user_request

        print("\n" + "="*70)
        print("ZTE PLATFORM - ORCHESTRATION START")
        print("="*70)
        print(f"Request: {user_request}")
        print(f"Started: {datetime.now().isoformat()}")
        print("="*70 + "\n")

        try:
            # 1. Analyze request
            print("[1/7] Analyzing request...")
            analysis = self.analyze_request(user_request)

            # 2. Design questions (optional for now)
            print("\n[2/7] Design phase...")
            # In production, would ask questions here

            # 3. Approval
            print("\n[3/7] Getting approval...")
            approved = self.get_approval(analysis)

            if not approved:
                print("❌ User did not approve. Aborting.")
                return

            # 4. Load pipeline
            print("\n[4/7] Loading pipeline...")
            pipeline = self.load_pipeline(analysis.get('recommended_pipeline', 'simple_feature'))

            # 5. Execute pipeline
            print("\n[5/7] Executing pipeline...")
            context = {
                "task_id": f"task_{int(time.time())}",
                "user_request": user_request,
                "analysis": analysis
            }

            result = self.pipeline_exec.execute(pipeline, context)

            # 6. Integration
            print("\n[6/7] Integrating results...")
            # In production, would merge branches here

            # 7. Report
            print("\n[7/7] Generating report...")
            self.generate_report(result)

            # Cleanup
            print("\nCleaning up worktrees...")
            self.worktree_mgr.cleanup_all()

            print("\n" + "="*70)
            print("ORCHESTRATION COMPLETE")
            print("="*70)

        except Exception as e:
            print(f"\n❌ Orchestration failed: {e}")
            import traceback
            traceback.print_exc()

    def analyze_request(self, request: str) -> Dict:
        """Analyze user request"""
        # Simplified analysis for now
        return {
            "affected_systems": ["physics", "economy", "vfx"],
            "complexity_score": 7,
            "recommended_pipeline": "simple_feature",
            "estimated_duration": "15-20 minutes"
        }

    def get_approval(self, analysis: Dict) -> bool:
        """Get user approval"""
        print("\n" + "-"*70)
        print("IMPLEMENTATION PLAN")
        print("-"*70)
        print(f"Affected systems: {', '.join(analysis['affected_systems'])}")
        print(f"Complexity: {analysis['complexity_score']}/10")
        print(f"Estimated duration: {analysis['estimated_duration']}")
        print("-"*70)

        approval = input("\nApprove? (yes/no): ")
        return approval.lower() in ['yes', 'y']

    def load_pipeline(self, pipeline_name: str) -> Dict:
        """Load pipeline definition"""

        # Simple feature pipeline
        if pipeline_name == "simple_feature":
            return {
                "name": "Simple Feature",
                "stages": [
                    {
                        "name": "implementation",
                        "agents": ["physics", "economy", "vfx"],
                        "mode": "parallel",
                        "timeout": 600
                    }
                ]
            }

        # Default pipeline
        return {
            "name": "Default",
            "stages": [
                {
                    "name": "implementation",
                    "agents": ["main"],
                    "mode": "serial",
                    "timeout": 600
                }
            ]
        }

    def generate_report(self, result: Dict):
        """Generate completion report"""
        duration = time.time() - self.start_time

        print("\n" + "="*70)
        print("COMPLETION REPORT")
        print("="*70)
        print(f"Duration: {duration/60:.1f} minutes")
        print(f"Status: Complete")
        print("="*70)


def main():
    """Main entry point"""
    orchestrator = Orchestrator()

    # Example usage
    orchestrator.execute_request("Add speed boost powerup to SupaSnake")


if __name__ == "__main__":
    main()
