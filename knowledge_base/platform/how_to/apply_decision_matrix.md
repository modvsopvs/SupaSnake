# How to Apply the Decision Matrix

**Goal:** Make proactive context management decisions before starting any task.

**Time required:** 2-3 minutes

---

## Overview

The decision matrix helps you decide whether to continue in current context, clear and reload, or delegate to a sub-agent. This prevents auto-compact and optimizes attention budget.

**Key Principle:** Proactive curation, not reactive recovery.

---

## Step-by-Step Process

### Step 1: Estimate Task Tokens

Before starting work, estimate the total tokens required.

**Quick estimation:**
```
Task tokens = Discussion + Files + Implementation

Simple bug fix:
- Discussion: 5-10 exchanges = 5-8k tokens
- Files: 2-3 files × 2k = 4-6k tokens
- Implementation: 3-5k tokens
Total: 12-19k tokens

Medium feature:
- Discussion: 15-25 exchanges = 12-20k tokens
- Files: 5-10 files × 3k = 15-30k tokens
- Implementation: 10-20k tokens
Total: 37-70k tokens

Complex refactor:
- Discussion: 30-50 exchanges = 25-40k tokens
- Files: 10-20 files × 3k = 30-60k tokens
- Implementation: 20-40k tokens
Total: 75-140k tokens
```

**Tips:**
- Count message exchanges (1 exchange ≈ 500-1,000 tokens)
- Count files to read (small: 2k, medium: 4k, large: 8k)
- Add implementation discussion tokens
- Add 20% buffer if uncertain

**See also:** @knowledge_base/platform/quick_ref/token_estimates.md

### Step 2: Check Current Context Usage

Estimate how much context you're currently using.

**Quick estimation methods:**

**Message counting:**
```bash
# Count recent messages in conversation
Last 20 messages ≈ 15k tokens
Last 40 messages ≈ 30k tokens
Last 60 messages ≈ 45k tokens
```

**File counting:**
```bash
# Count files read in this session
3 small files ≈ 6k tokens
2 medium files ≈ 8k tokens
1 large file ≈ 10k tokens
```

**Rule of thumb:**
- Started fresh session? Current ≈ 5-10k tokens
- Been working 30 min? Current ≈ 30-50k tokens
- Been working 1 hour? Current ≈ 60-90k tokens
- Been working 2+ hours? Current ≈ 100k+ tokens

### Step 3: Calculate Total Context

```
Total = Current usage + Task estimate
```

**Examples:**
```
Scenario 1:
Current: 40k tokens (20 messages, 3 files)
Task: 20k tokens (bug fix)
Total: 60k tokens

Scenario 2:
Current: 90k tokens (working 1 hour)
Task: 50k tokens (feature)
Total: 140k tokens

Scenario 3:
Current: 120k tokens (long session)
Task: 30k tokens (medium task)
Total: 150k tokens
```

### Step 4: Apply the Matrix

**Decision tree:**

```
Is Total < 100k (50% capacity)?
├─ YES → CONTINUE NORMALLY
│   Context has room, work naturally
│   No action needed
│
└─ NO → Is Total between 100-150k (50-75% capacity)?
    ├─ YES → /CLEAR + ACTIVE LOAD
    │   1. Run /clear to reset context
    │   2. CLAUDE.md auto-loads (invariants + current work)
    │   3. Load current feature spec
    │   4. Load current files only
    │   5. Begin with ~25k clean context
    │   Result: Total ≈ 25k + Task estimate
    │
    └─ NO → Is Total > 150k (>75% capacity) OR Task > 30k?
        └─ YES → DELEGATE TO SUB-AGENT
            1. Choose appropriate sub-agent type
            2. Write clear, focused prompt
            3. Sub-agent gets 200k fresh context
            4. Review sub-agent output
            Result: Main context preserved
```

### Step 5: Execute the Decision

**If Continue (Total < 100k):**
```
✓ No action needed
✓ Proceed with task normally
✓ Keep working in current context
```

**If /clear + Load (100k < Total < 150k):**
```
1. Run: /clear
2. Wait for CLAUDE.md to auto-load
3. Load feature spec:
   @docs/features/[current_feature]_spec.md
4. Load only current implementation files
5. Proceed with ~25k curated context
```

**If Delegate (Total > 150k OR Task > 30k):**
```python
# Choose sub-agent type:
# - design_architect: Architecture/design
# - security_reviewer: Security audit
# - performance_reviewer: Performance analysis
# - code_quality_reviewer: Code review

result = Task(
    subagent_type="[agent_type]",
    description="[Short description]",
    prompt="""
    [Clear, focused prompt]
    [Specific files to review]
    [Expected output format]
    [Minimum word count if needed]
    """
)
```

---

## Example Scenarios

### Scenario 1: Simple Bug Fix (Continue)

**Situation:**
- Current: 40k tokens (been working 20 minutes)
- Task: Fix login button (estimate: 15k tokens)
- Total: 55k tokens

**Decision:** Continue normally (< 100k)

**Action:** None needed, proceed with bug fix

### Scenario 2: New Feature (Clear + Load)

**Situation:**
- Current: 95k tokens (working 1+ hour on previous feature)
- Task: Add notifications (estimate: 45k tokens)
- Total: 140k tokens

**Decision:** /clear + active load (100-150k range)

**Action:**
```bash
/clear
# Wait for CLAUDE.md auto-load
# Load: @docs/features/notifications_spec.md
# Load: src/components/NotificationBadge.tsx
# Load: src/api/notifications.ts
# Result: ~30k curated context, proceed with feature
```

### Scenario 3: Performance Analysis (Delegate)

**Situation:**
- Current: 80k tokens
- Task: Analyze game loop performance (estimate: 50k tokens)
- Total: 130k tokens
- Task is self-contained analysis

**Decision:** Delegate to sub-agent (task > 30k)

**Action:**
```python
perf_review = Task(
    subagent_type="performance_reviewer",
    description="Analyze game loop performance",
    prompt="""
    Analyze performance of the game loop and rendering pipeline.

    Files to review:
    - src/core/GameLoop.ts (600 lines)
    - src/rendering/Renderer.ts (800 lines)
    - src/physics/PhysicsEngine.ts (500 lines)

    Target: Maintain 60fps on mid-range devices

    Provide:
    - Performance metrics
    - Bottleneck identification
    - Optimization recommendations
    - Expected improvements

    Minimum 400 words.
    """
)
```

---

## Override Conditions

**When to override the matrix:**

**Continue even if > 100k:**
- Mid-complex reasoning (don't interrupt flow)
- All context highly relevant
- Almost done with current task

**Clear even if < 100k:**
- Switching to completely different domain
- Previous context no longer relevant
- Want fresh start on complex problem

**Don't delegate even if > 150k:**
- Task requires coordinator's full context
- Not easily parallelizable
- Needs interactive back-and-forth

**Use your judgment!** The matrix is a guide, not a rigid rule.

---

## Tips for Success

1. **Better to overestimate than underestimate** - Add 20-30% buffer
2. **Track your patterns** - Calibrate estimates over time
3. **Don't fear /clear** - It's a proactive tool, not emergency measure
4. **Use sub-agents liberally** - They have fresh 200k context
5. **Keep CLAUDE.md updated** - Ensures good recovery after /clear

---

## Common Mistakes

❌ **Not estimating before starting** - Leads to reactive auto-compact
❌ **Underestimating discussion tokens** - Forget back-and-forth adds up
❌ **Avoiding /clear** - Trying to cram into limited context
❌ **Not using sub-agents** - Missing opportunity for parallel analysis
❌ **Forgetting current work** - Only estimating task, not current usage

---

## Quick Reference

**Decision matrix:**
- < 100k → Continue
- 100-150k → /clear + load
- > 150k OR task > 30k → Delegate

**After /clear, load:**
1. CLAUDE.md (auto)
2. Current feature spec
3. Current files only
4. Recent decisions (if needed)

**Result:** ~25k highly relevant context

---

**See also:**
- @knowledge_base/platform/quick_ref/decision_matrix.md (quick lookup)
- @knowledge_base/platform/quick_ref/token_estimates.md (estimation help)
- @knowledge_base/platform/reference/context_management_full.md (complete guide)
