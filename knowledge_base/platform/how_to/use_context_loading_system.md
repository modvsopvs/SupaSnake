# How to Use the Context Loading System

**Goal:** Ensure you always work with the right context while preventing context bloat through deterministic enforcement.

**Time required:** 2-5 minutes per task

---

## Overview

The Context Loading System enforces two critical rules:

**Rule #1 (Existential):** Never work without the right context
- Without correct context: Wrong decisions, wrong implementations, wrong answers
- This is the failure mode that breaks everything

**Rule #2 (Protective):** Never bloat context with irrelevant content
- Bloat pushes out the right context (violates Rule #1)
- 200k tokens with 50% irrelevant = effectively 100k relevant

**Enforcement:** Hooks make both rules deterministic (not relying on AI judgment)

---

## The Protocol (5 Steps)

### Step 1: Analyze Context Needs

Before any substantive work, determine:
- What does this query require?
- What's the current state? (CLAUDE.md, roadmaps, plans)
- What knowledge base files are needed?
- What tier? (quick_ref / how_to / reference)

**Example:**
```
User: "Continue with the plan"

Analysis:
→ Check CLAUDE.md: "Current Feature: Breeding System"
→ Check roadmap: Need egg gacha implementation
→ Required context:
  - breeding_overview.md (core mechanics)
  - f2p_economy.md (DNA costs)
```

### Step 2: Create Context Plan

Write JSON plan to `state/context_plan_<timestamp>.json`:

```json
{
  "session_id": "20251019_103000",
  "timestamp": "2025-10-19T10:30:00Z",
  "query": "Continue with the plan - implement breeding system",
  "analysis": "User wants egg gacha implementation from roadmap",
  "required_context": [
    {
      "file": "knowledge_base/game/quick_ref/breeding_overview.md",
      "reason": "Core breeding mechanics",
      "tier": "quick_ref",
      "priority": "critical"
    },
    {
      "file": "knowledge_base/game/quick_ref/f2p_economy.md",
      "reason": "DNA cost balancing",
      "tier": "quick_ref",
      "priority": "critical"
    }
  ],
  "optional_context": [
    {
      "file": "knowledge_base/game/quick_ref/dynasties.md",
      "reason": "Dynasty-specific breeding rules",
      "tier": "quick_ref",
      "priority": "optional"
    }
  ],
  "loaded": [],
  "blocked": [],
  "status": "pending"
}
```

**Field Guide:**
- `session_id`: Unique identifier (timestamp works)
- `query`: User's original request
- `analysis`: Your understanding of what's needed
- `required_context`: Files you MUST load (critical priority)
- `optional_context`: Files you MAY load if needed
- `loaded`: Auto-populated by hooks as files load
- `blocked`: Auto-populated if hooks block inappropriate loads
- `status`: pending → loading → loaded → complete

### Step 3: State Your Plan to User

Be transparent about what you're loading:

```
"I need to load breeding and economy context:
- breeding_overview.md (core mechanics)
- f2p_economy.md (DNA costs)

Loading now..."
```

**Why:** User sees what context you're using, can correct if wrong.

### Step 4: Load Files

Read each required file:

```
Read("knowledge_base/game/quick_ref/breeding_overview.md")
→ PreToolUse hook 05 validates against plan ✅
→ Adds to loaded[] array
→ Read succeeds

Read("knowledge_base/game/quick_ref/f2p_economy.md")
→ PreToolUse hook 05 validates against plan ✅
→ Adds to loaded[] array
→ Read succeeds

Read("knowledge_base/game/quick_ref/monetization_model.md")  // NOT in plan!
→ PreToolUse hook 05 BLOCKS ❌
→ Error: "File not in context plan"
→ Skip this file or update plan
```

**Hook Enforcement (Rule #2):**
- Every knowledge_base Read is validated
- Off-plan reads are blocked
- Prevents context bloat automatically

### Step 5: Implement with Context

Once context is loaded, implement:

```
Write("src/breeding/egg_gacha.ts", "...")
→ PreToolUse hook 06 checks context plan
→ Verifies all critical files loaded ✅
→ Write succeeds
```

**Hook Enforcement (Rule #1):**
- Can't implement without loaded context
- All critical files must be loaded first
- Deterministic guarantee

---

## What Hooks Do

### PreToolUse Hook 05: Validate Context Reads

**File:** `.claude/hooks/pre-tool-use/05-validate-context-reads.sh`

**Purpose:** Enforce Rule #2 (no context bloat)

**Behavior:**
- Runs on every Read tool call
- Only validates knowledge_base reads
- Checks if file is in context plan (required or optional)
- Blocks if not in plan
- Updates loaded[] array if allowed

**Blocks when:**
- No context plan exists (must create plan first)
- File not in required_context or optional_context
- Loading unplanned files that would bloat context

**Example Block Message:**
```
❌ BLOCKED: File not in context plan

Attempting to load: knowledge_base/game/quick_ref/monetization_model.md

Required files in plan:
  - knowledge_base/game/quick_ref/breeding_overview.md (Core breeding mechanics)
  - knowledge_base/game/quick_ref/f2p_economy.md (DNA cost balancing)

Rule #2: Only load planned context (prevents bloat)

Fix: Either:
  1. Update context plan to include this file (if truly needed)
  2. Use a different file that's already in the plan
  3. Remove this read (if not needed)
```

### PreToolUse Hook 06: Require Context for Implementation

**File:** `.claude/hooks/pre-tool-use/06-require-context-for-implementation.sh`

**Purpose:** Enforce Rule #1 (must have context)

**Behavior:**
- Runs on every Write/Edit tool call
- Skips state/, docs/, .claude/ writes (allowed without context)
- Checks if context plan exists
- Checks if critical files are loaded
- Blocks implementation without context

**Blocks when:**
- No context plan exists
- Context plan created but no files loaded yet
- Not all critical priority files have been loaded

**Example Block Message:**
```
❌ BLOCKED: Critical context files not loaded

Missing:
  - knowledge_base/game/quick_ref/breeding_overview.md (Core breeding mechanics)

Rule #1: Must have all critical context before implementing

Fix: Read the missing files first
```

### Stop Hook 03: Audit Context Compliance

**File:** `.claude/hooks/stop/03-audit-context-compliance.sh`

**Purpose:** Report on context compliance

**Behavior:**
- Runs when Claude finishes responding
- Checks if context plan exists
- Reports loading status
- Shows loaded files
- Reports blocked loads

**Example Output:**
```
=== Context Compliance Audit ===

Query: Continue with the plan - implement breeding system
Status: loaded
Required files: 2
Loaded files: 2

✅ Context properly loaded before implementation

Loaded files:
  - knowledge_base/game/quick_ref/breeding_overview.md
  - knowledge_base/game/quick_ref/f2p_economy.md

✅ Rule #2: Blocked 1 inappropriate load (prevented bloat)
Blocked files:
  - knowledge_base/game/quick_ref/monetization_model.md
===============================
```

---

## Common Scenarios

### Scenario 1: Simple Query

**Query:** "What's a PreToolUse hook?"

**Steps:**
1. Analyze: Definition query → quick_ref tier
2. Create plan: hook_types.md (critical)
3. State: "Loading hook_types.md..."
4. Read: hook_types.md (validated ✅)
5. Answer from context

**Result:** Loaded 250 words instead of 7,000 words (96% savings)

### Scenario 2: Implementation Task

**Query:** "Implement the breeding system"

**Steps:**
1. Analyze: Major feature → need mechanics + economy + UI
2. Create plan:
   - breeding_overview.md (critical)
   - f2p_economy.md (critical)
   - lab_ui.md (critical)
3. State plan to user
4. Load all 3 files (validated ✅)
5. Implement (context verified ✅)

**Result:** Had exactly the context needed, nothing more

### Scenario 3: Short Prompt

**Query:** "Continue"

**Steps:**
1. Analyze: Check CLAUDE.md Current Work section
2. Determine current feature context needed
3. Create plan based on current work
4. Load relevant files only
5. Continue work with correct context

**Result:** Works even with minimal user input

### Scenario 4: Blocked Load (Rule #2)

**Query:** "Add leaderboard feature"

**Steps:**
1. Create plan: competitive_ladder.md (critical)
2. Load competitive_ladder.md ✅
3. Try to load monetization_model.md (curiosity)
4. Hook BLOCKS ❌ "Not in context plan"
5. Skip and implement with just competitive_ladder.md

**Result:** Prevented context bloat, stayed focused

### Scenario 5: Missing Context (Rule #1)

**Query:** "Implement breeding"

**Steps:**
1. Create plan: breeding_overview.md (critical)
2. Skip loading (forget or try to implement directly)
3. Try Write("src/breeding.ts", "...")
4. Hook BLOCKS ❌ "Critical context files not loaded"
5. Go back and load breeding_overview.md
6. Try Write again ✅

**Result:** Prevented implementation without context

---

## Troubleshooting

### Hook Blocks My Read

**Problem:** "❌ BLOCKED: File not in context plan"

**Cause:** You're trying to load a file that's not in your context plan

**Solutions:**
1. **If file is actually needed:** Update context plan to include it
2. **If exploring:** Add to optional_context instead of required_context
3. **If not needed:** Skip the read, use what's already in plan

### Hook Blocks My Write

**Problem:** "❌ BLOCKED: Critical context files not loaded"

**Cause:** You're trying to implement without loading required context

**Solution:**
1. Check context plan: `cat state/context_plan_*.json | jq .required_context`
2. Load each required file
3. Try Write/Edit again

### No Context Plan Exists

**Problem:** "❌ BLOCKED: No context plan found"

**Cause:** You're trying to load knowledge_base files without creating a plan

**Solution:**
1. Create context plan first (Step 2)
2. Then load files (Step 4)

### Plan Created But Nothing Loaded

**Problem:** Stop hook shows "Context plan created but never executed"

**Cause:** You created a plan but didn't actually load the files

**Solution:**
1. After creating plan, actually Read the files
2. Don't skip Step 4

---

## Best Practices

### DO ✅

- **Create plan before loading** - Always
- **Be specific in analysis** - What exactly do you need?
- **Mark critical vs optional** - Distinguish must-have from nice-to-have
- **Consult MAP.md** - Use query patterns to find right files
- **State plan to user** - Transparency
- **Load only what's planned** - Resist curiosity loads

### DON'T ❌

- **Skip context plan** - Hooks will block you anyway
- **Load first, plan later** - Wrong order
- **Mark everything critical** - Reserve for truly required files
- **Load adjacent files "just in case"** - Causes bloat
- **Ignore hook blocks** - They're protecting you from mistakes

---

## Benefits

**Deterministic Quality:**
- Rule #1 enforced: Can't work without context (hooks block)
- Rule #2 enforced: Can't bloat context (hooks block)
- Not relying on AI judgment (hooks ensure compliance)

**Transparency:**
- Context plan is human-readable JSON
- User sees what you're loading
- Stop hook shows audit report
- Full visibility into context usage

**Efficiency:**
- Load 300 words instead of 5,000 words (94% savings typical)
- Attention budget focused on what matters
- No irrelevant content diluting attention

**Recovery:**
- Context plans are preserved in state/
- After /clear, can see what context was used
- Audit trail for debugging

---

## Quick Reference

**Workflow:**
1. Analyze → 2. Create plan → 3. State plan → 4. Load files → 5. Implement

**Key Files:**
- Context plan: `state/context_plan_<timestamp>.json`
- Hook 05: Validates reads (Rule #2)
- Hook 06: Requires context (Rule #1)
- Hook 03: Audits compliance (Stop)

**Status Flow:**
```
pending → loading → loaded → complete
            ↓
         blocked (if violations)
```

---

**See also:**
- @CLAUDE.md - Context Loading Protocol section
- @knowledge_base/MAP.md - Query patterns for finding right files
- @knowledge_base/platform/quick_ref/decision_matrix.md - When to load context

---

**Version:** 1.0
**Status:** Active
**Philosophy:** Deterministic context management through hook enforcement
