# How to Recover After /clear or Auto-Compact

**Goal:** Quickly restore context and resume work after /clear or auto-compact.

**Time required:** 1-2 minutes

---

## Overview

When you run `/clear` or Claude auto-compacts, the conversation context is reset. The **Active Loading Protocol** ensures you can recover quickly with only relevant context.

**Key Principle:** Load what you need, not everything.

---

## What Happens During /clear

**Before /clear:**
- Conversation history: 100-150k tokens
- Mix of relevant and irrelevant context
- Diluted attention

**After /clear:**
- Fresh context window
- CLAUDE.md auto-loads (~700 tokens)
- Ready for targeted loading

**Result:** Clean slate with essential invariants

---

## Active Loading Protocol

### Phase 1: Invariants (Automatic)

```
/clear executes
→ CLAUDE.md auto-loads
→ Invariants + Current Work
→ ~700 tokens
```

**No action needed** - CLAUDE.md loads automatically and provides:
- Platform architecture
- Non-negotiables
- Key decisions
- Current work status
- Recovery instructions

### Phase 2: Current Feature Context

**Load the feature specification:**
```
@docs/features/[current_feature]_spec.md
```

**Example:**
```
@docs/features/speed_boost_spec.md
```

**Result:** +5-10k tokens of feature context

**Why this matters:**
- Provides requirements, architecture decisions
- Ensures you're working from spec
- Avoids re-discussing already-decided items

### Phase 3: Current Files Only

**Load only active implementation files:**

```
# Current implementation files
@src/features/speed_boost/SpeedBoost.ts
@src/features/speed_boost/SpeedBoost.test.ts

# Related integration points (if needed)
@src/physics/PhysicsEngine.ts
```

**Don't load:**
- Historical/old code
- Unrelated features
- Full codebase
- Previous conversation history

**Result:** +10-15k tokens of code context

### Phase 4: Recent Decisions (Optional)

**If needed, load recent architecture decisions:**
```bash
git log --oneline --grep="Decision" -5
```

**Or reference specific decision docs:**
```
@docs/decisions/speed_boost_architecture.md
```

**Result:** +2-5k tokens

---

## Total After Loading

**~20-35k tokens of highly relevant context**

**Compare to:** 120k+ tokens of mixed context before /clear

**Benefit:**
- Higher attention per token
- Faster responses
- Better quality
- Room for new work

---

## Step-by-Step Recovery

### Step 1: Confirm CLAUDE.md Loaded

After /clear, check that CLAUDE.md auto-loaded:
- See "Mission Control" or "Invariants"
- Current Work section present
- Recovery protocol visible

**If not auto-loaded:**
```
@CLAUDE.md
```

### Step 2: Identify Current Work

Check CLAUDE.md Current Work section:
```
## 🎯 Current Work
Feature: Speed Boost Powerup
Status: Implementation phase - physics integration complete
Next: Economy cost deduction, VFX trail
```

### Step 3: Load Feature Spec

```
@docs/features/speed_boost_spec.md
```

**Provides:**
- Requirements
- Architecture decisions
- Implementation plan
- Acceptance criteria

### Step 4: Load Current Files

**Only load files you're actively working on:**
```
@src/features/speed_boost/SpeedBoost.ts
@src/features/speed_boost/SpeedBoost.test.ts
```

**If integrating:**
```
@src/economy/Economy.ts
@src/vfx/TrailEffect.ts
```

### Step 5: Resume Work

```
Continue implementing speed boost economy integration.
Current status: Physics done, need to deduct DNA cost.
```

**Total context:** ~25k tokens, all relevant

---

## Example Recovery Scenarios

### Scenario 1: Mid-Feature Implementation

**Context:**
- Was implementing speed boost feature
- Auto-compact occurred
- Need to resume economy integration

**Recovery:**
```
1. /clear (if needed) or wait for CLAUDE.md auto-load
2. @docs/features/speed_boost_spec.md
3. @src/features/speed_boost/SpeedBoost.ts
4. @src/economy/Economy.ts
5. "Continue implementing economy cost deduction for speed boost"
```

**Time:** 90 seconds
**Context loaded:** 25k tokens (relevant)

### Scenario 2: Switching Features

**Context:**
- Was working on notifications
- Now switching to leaderboards
- Want fresh context

**Recovery:**
```
1. /clear
2. Update CLAUDE.md Current Work (or ask Claude to update it)
3. @docs/features/leaderboards_spec.md
4. @src/features/leaderboards/Leaderboard.ts
5. "Begin implementing leaderboard feature"
```

**Time:** 2 minutes
**Context loaded:** 30k tokens (all new feature)

### Scenario 3: Complex Analysis Task

**Context:**
- Need to analyze performance
- Current context at 140k
- Want sub-agent with fresh context

**Recovery:**
```
1. Don't /clear - stay in current context
2. Delegate to sub-agent:
   Task(
     subagent_type="performance_reviewer",
     prompt="Analyze game loop performance..."
   )
3. Sub-agent gets fresh 200k context
4. Main coordinator preserves current work
```

**Time:** 0 seconds (no recovery needed)
**Benefit:** Sub-agent has clean context for analysis

---

## Tips for Fast Recovery

1. **Keep CLAUDE.md Current Work updated**
   - Update after each milestone
   - Include next steps
   - Note key files

2. **Write feature specs**
   - Create before implementation
   - Reference architecture decisions
   - Update as you learn

3. **Don't fear /clear**
   - It's a tool, not an emergency
   - Proactive curation is good
   - 25k clean > 150k mixed

4. **Load incrementally**
   - Start with spec
   - Add files as needed
   - Don't preload everything

5. **Use git for context**
   - `git log --oneline -10` for recent work
   - `git diff --stat` for changes
   - `git show <commit>` for specific changes

---

## Common Mistakes

❌ **Loading everything** - Don't reload 100k of context
❌ **Forgetting feature spec** - Leads to re-discussing requirements
❌ **Loading old conversations** - Previous discussions rarely relevant
❌ **Not updating CLAUDE.md** - Recovery takes longer
❌ **Avoiding /clear** - Trying to squeeze into full context

---

## What NOT to Load

**Don't load after /clear:**
- ❌ Full conversation history
- ❌ Previous feature contexts
- ❌ Unrelated code files
- ❌ Complete codebase
- ❌ All documentation
- ❌ Historical decisions (unless needed)

**Why:** Dilutes attention, wastes tokens

---

## Recovery Time Targets

**After /clear:**
- Simple feature: < 1 minute
- Medium feature: 1-2 minutes
- Complex feature: 2-3 minutes

**After auto-compact:**
- CLAUDE.md auto-loads
- Check Current Work section
- Load feature spec if needed
- Resume: < 2 minutes

**If recovery > 3 minutes:**
- CLAUDE.md needs better Current Work section
- Feature spec missing or unclear
- Too much context being loaded

---

## Quick Reference

**Active Loading Steps:**
1. CLAUDE.md (auto) - ~700 tokens
2. Feature spec - ~5-10k tokens
3. Current files only - ~10-15k tokens
4. Recent decisions (optional) - ~2-5k tokens

**Total:** ~20-35k highly relevant context

**Time:** 1-2 minutes

**Result:** Clean, focused context ready for work

---

**See also:**
- @knowledge_base/platform/quick_ref/active_loading.md (quick protocol)
- @knowledge_base/platform/quick_ref/when_to_clear.md (when to use /clear)
- @knowledge_base/platform/reference/context_management_full.md (complete strategy)
