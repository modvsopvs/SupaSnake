# Mission Control

## 📌 Invariants (Always True)

**Platform Architecture:**
- ZTE Platform = Hooks (quality gates) + Sub-agents (specialized analysis) + Orchestration (multi-instance)
- PreToolUse hooks enforce deterministically (exit 1 blocks operations)
- Sub-agents get 200k fresh context each

**Non-Negotiables:**
- 95%+ test coverage (hooks enforce)
- No secrets in code (use env vars - hooks enforce)
- No SQL concatenation (parameterized only - hooks enforce)
- Test-first development (tests before implementation)
- Complete implementations only (no placeholders - hooks enforce)

**Key Decisions:**
- macOS BSD compatibility (grep -E not grep -P)
- Exit 1 for blocking hooks
- stderr for hook messages (>&2)
- Project-level hook configuration

**Tools:**
- 6 hook types operational: `.claude/hooks/*/`
- 8 sub-agents configured: `.claude/agents/`
- Orchestration: `automation/orchestrator.py`, `automation/analyze_request.py`

---

## 🎯 Current Work (Update After Each Milestone)

**Feature:** [Your current feature name]
**Status:** [Design / Implementation / Review / Complete]
**Blocker:** None

**Last Auto-Update:** 2025-10-14 19:26
**Branch:** main
**Last Commit:** 61be37b Update PLATFORM_STATUS.md with initialization date

**Recent Changes:**
```
 M .claude/hooks/pre-tool-use/03-block-security-issues.sh
 M .claude/settings.local.json
 M CLAUDE.md
?? docs/game/
?? docs/platform/
```

**Recent Files:**
```
.claude/settings.local.json
.env.example
PLATFORM_STATUS.md
README.md
docs/ENVIRONMENT_SETUP.md
```

**Note:** Update manually after milestones with specific feature info.
See templates/CURRENT_WORK_TEMPLATE.md for guidance.

**Recovery (After /clear or Auto-Compact):**
1. Check CLAUDE.md Current Work section (this section)
2. Read: `cat .claude/session_state/precompact_*.md` for detailed snapshot
3. Load relevant context as specified in Current Work
4. Resume from last commit or Next Action

---

## 🧭 Context Management (Active Curation)

### Decision Matrix (Before Every Task)

**Estimate:** Task tokens (conversation + files + context)
**Current:** Check token usage
**Total:** Current + Estimate

```
Total < 100k → Continue normally
100k < Total < 150k → /clear + active load
Total > 150k OR Task >30k → Delegate to sub-agent
```

### When to /clear (Proactive Triggers)

- Starting new feature (different context domain)
- Context >120k tokens before significant task
- Switching work context (frontend ↔ backend)
- Before complex analysis that needs clean slate

### Active Loading (After /clear)

**Load in order:**
1. CLAUDE.md (auto-loads - invariants + current work)
2. Current feature spec: `@docs/current_feature.md`
3. Current files only (not historical)
4. Recent architecture decisions (last 5 commits)

**Don't load:**
- Old conversation history
- Previous feature contexts
- Unrelated files

### When NOT to /clear

- Continuing same feature (context is relevant)
- Low token usage (<80k)
- Mid-complex reasoning (valuable conversation context)

---

## ⚡ Quick Commands

```bash
# Context management
/clear                          # Reset context (before new feature)
# Then load: invariants (auto) + feature spec + current files

# Recovery
cat .claude/session_state/precompact_*.md  # Last snapshot
cat PLATFORM_STATUS.md                     # Platform status
git log --oneline -5                       # Recent work

# Hooks & agents
/hooks list                     # View hooks
/agents list                    # View agents
"Run [Agent] agent to [task]"   # Delegate to sub-agent

# Checkpoints
git add . && git commit -m "Checkpoint: [milestone]"
```

---

## 📚 Documentation

**Query Entry Point:**
- @knowledge_base/MAP.md - Query index for all docs

**Quick Reference (50-200 words):**
- @knowledge_base/platform/quick_ref/decision_matrix.md
- @knowledge_base/platform/quick_ref/when_to_clear.md
- @knowledge_base/platform/quick_ref/hook_types.md
- @knowledge_base/platform/quick_ref/subagent_types.md
- @knowledge_base/platform/quick_ref/token_estimates.md

**How-To Guides (500-1,000 words):**
- @knowledge_base/platform/how_to/apply_decision_matrix.md
- @knowledge_base/platform/how_to/use_subagents.md
- @knowledge_base/platform/how_to/create_custom_hook.md

**Complete Reference (2,000-7,000 words):**
- @knowledge_base/platform/reference/context_management_full.md
- @knowledge_base/platform/reference/hooks_guide_full.md
- @knowledge_base/platform/reference/subagent_guide_full.md

**Platform:**
- @PLATFORM_STATUS.md - Platform status

---

**Target:** 600-800 tokens | **Philosophy:** Active curation + database-like query optimization
