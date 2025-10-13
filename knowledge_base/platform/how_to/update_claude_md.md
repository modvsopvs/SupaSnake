# How to Update CLAUDE.md

**Goal:** Keep CLAUDE.md current with accurate Current Work section.

**Time required:** 5-10 minutes per update

**Frequency:** After each major milestone or feature change

---

## Overview

CLAUDE.md is mission control - always loaded, providing persistent memory. The **Current Work section (80%)** must stay current for fast recovery and effective work.

**Key Principle:** 20% invariants (never changes) / 80% current work (updates frequently)

---

## When to Update

**Update CLAUDE.md when:**
- ✅ Complete a major milestone
- ✅ Switch to new feature
- ✅ Architecture decision made
- ✅ Blocker encountered
- ✅ Before running /clear
- ✅ After auto-compact (if needed)

**Don't update for:**
- ❌ Minor bug fixes
- ❌ Trivial changes
- ❌ Work in progress (mid-task)
- ❌ Temporary investigations

**Frequency:** Every 1-2 hours of active work, or at natural breakpoints

---

## CLAUDE.md Structure

```markdown
# Mission Control

## 📌 Invariants (Always True) - 20%
[Never changes - platform architecture, non-negotiables, key decisions]

## 🎯 Current Work (Update Frequently) - 80%
[Changes often - current feature, status, blockers, next action]

## 🧭 Context Management
[Decision matrix, when to /clear, active loading]

## ⚡ Quick Commands
[Essential commands, imports]
```

---

## Step-by-Step Update Process

### Step 1: Read Current CLAUDE.md

```
@CLAUDE.md
```

**Check:**
- Current Work section accurate?
- Feature name correct?
- Status matches reality?
- Next action still relevant?

### Step 2: Identify What Changed

**Ask yourself:**
- What feature am I working on now?
- What's the current status? (Design / Implementation / Review / Done)
- Are there any blockers?
- What are the key files for this feature?
- What's the next specific action?

### Step 3: Update Current Work Section

**Template:**
```markdown
## 🎯 Current Work (Update After Each Milestone)

**Feature:** [Feature name]
**Status:** [Design / Implementation / Review / Complete]
**Blocker:** [None / Describe blocker if exists]

**Architecture (this feature):**
- [Key architectural decision]
- [Integration points]
- [Dependencies]

**Key Files:**
- [Primary implementation file]
- [Test file]
- [Related integration files]

**Next Action:**
[Specific next step - be concrete]

**Recovery Protocol:**
After /clear:
1. Load: @docs/features/[feature]_spec.md
2. Load: [list key files to reload]
3. Resume: [what to continue doing]
```

**Example - Good Current Work:**
```markdown
## 🎯 Current Work

**Feature:** Speed Boost Powerup
**Status:** Implementation phase - physics and economy complete
**Blocker:** None

**Architecture (this feature):**
- Speed multiplier applied in PhysicsEngine.update()
- DNA cost deducted in Economy.purchasePowerup()
- VFX trail rendered via ParticleSystem
- Duration managed by PowerupManager

**Key Files:**
- src/features/speed_boost/SpeedBoost.ts
- src/features/speed_boost/SpeedBoost.test.ts
- src/physics/PhysicsEngine.ts (integration point)
- src/economy/Economy.ts (integration point)

**Next Action:**
Implement VFX trail effect in src/vfx/SpeedBoostTrail.ts

**Recovery Protocol:**
After /clear:
1. Load: @docs/features/speed_boost_spec.md
2. Load: @src/features/speed_boost/SpeedBoost.ts
3. Load: @src/vfx/SpeedBoostTrail.ts
4. Resume: Implementing particle trail effect
```

### Step 4: Write Updated Version

Use Edit tool to update only the Current Work section:

```typescript
Edit(
  file_path="/Users/josefbell/Snake_2/CLAUDE.md",
  old_string="[Old Current Work section]",
  new_string="[New Current Work section]"
)
```

**Important:**
- Only update Current Work section
- Preserve Invariants section (never changes)
- Keep Context Management and Quick Commands sections

### Step 5: Verify Update

```
@CLAUDE.md
```

**Check:**
- ✅ Feature name correct
- ✅ Status accurate
- ✅ Key files listed
- ✅ Next action specific
- ✅ Recovery protocol clear

---

## What to Include

### Feature Name

**Good:**
- "Speed Boost Powerup"
- "User Authentication System"
- "Leaderboard with Daily/Weekly views"

**Bad:**
- "Working on stuff"
- "Feature"
- "Implementing things"

### Status

**Be specific:**
- "Design phase - gathering requirements"
- "Implementation - physics integration complete, economy in progress"
- "Review phase - awaiting security audit"
- "Complete - merged to main"

**Not:**
- "In progress"
- "Working on it"
- "Almost done"

### Key Files

**List actual file paths:**
```
- src/features/speed_boost/SpeedBoost.ts
- src/features/speed_boost/SpeedBoost.test.ts
- src/physics/PhysicsEngine.ts (integration)
```

**Not:**
- "The speed boost files"
- "All the feature files"
- "You know, the usual files"

### Next Action

**Be concrete:**
- "Implement VFX trail in src/vfx/SpeedBoostTrail.ts"
- "Write integration tests for speed boost + obstacles"
- "Security review of authentication system"

**Not:**
- "Keep working"
- "Finish the feature"
- "Do the next thing"

---

## Example Updates

### Example 1: Starting New Feature

**Before:**
```markdown
**Feature:** Speed Boost Powerup
**Status:** Complete - merged to main
```

**After:**
```markdown
**Feature:** Leaderboard System
**Status:** Design phase - creating technical spec
**Blocker:** None

**Architecture (this feature):**
- Daily/weekly/all-time views
- Cached rankings updated hourly
- Redis for fast reads
- PostgreSQL for persistence

**Key Files:**
- docs/features/leaderboard_spec.md (being written)

**Next Action:**
Complete technical specification with Design Architect sub-agent

**Recovery Protocol:**
After /clear:
1. Load: @docs/features/leaderboard_spec.md
2. Resume: Designing leaderboard architecture
```

### Example 2: Mid-Implementation Update

**Before:**
```markdown
**Feature:** Leaderboard System
**Status:** Design phase - creating technical spec
```

**After:**
```markdown
**Feature:** Leaderboard System
**Status:** Implementation - backend API complete, frontend in progress
**Blocker:** None

**Architecture (this feature):**
- RESTful API: GET /api/leaderboard?period=daily|weekly|alltime
- Redis cache with 1-hour TTL
- Background job updates rankings every 30 minutes
- React component with auto-refresh

**Key Files:**
- src/api/leaderboard.ts (complete)
- src/api/leaderboard.test.ts (complete)
- src/components/Leaderboard.tsx (in progress)
- src/components/Leaderboard.test.tsx (pending)

**Next Action:**
Complete Leaderboard.tsx component with period selector

**Recovery Protocol:**
After /clear:
1. Load: @docs/features/leaderboard_spec.md
2. Load: @src/components/Leaderboard.tsx
3. Load: @src/api/leaderboard.ts
4. Resume: Implementing frontend component
```

### Example 3: Encountered Blocker

**Before:**
```markdown
**Blocker:** None
```

**After:**
```markdown
**Blocker:** Redis connection pooling causing memory leak under load
- Memory usage grows 50MB/hour
- Suspect connection not being released
- Need to investigate connection lifecycle
- May need to switch to ioredis library

**Next Action:**
Debug Redis connection handling in src/cache/RedisClient.ts
```

---

## Automation with PreCompact Hook

The PreCompact hook automatically updates parts of CLAUDE.md:
- Reads recent git commits
- Updates current work status from git context
- Preserves manual updates

**You still need to manually update:**
- Architecture decisions
- Blockers
- Recovery protocol
- Next action (if not obvious from git)

---

## Tips for Good Updates

1. **Be specific** - Concrete file paths, specific actions
2. **Update frequently** - After each milestone
3. **Include blockers** - Document problems immediately
4. **List integration points** - Where feature touches other systems
5. **Write recovery protocol** - Make /clear recovery instant
6. **Keep it current** - Stale info is worse than no info

---

## Common Mistakes

❌ **Updating too rarely** - CLAUDE.md becomes stale
❌ **Vague descriptions** - "Working on stuff"
❌ **Forgetting blockers** - Problems get lost
❌ **No recovery protocol** - Slow recovery after /clear
❌ **Modifying Invariants** - These should never change
❌ **Too much detail** - Keep it concise (aim for ~400-600 words for Current Work)

---

## Quick Reference

**Update when:**
- Complete milestone
- Switch features
- Hit blocker
- Before /clear

**Include:**
- Feature name
- Status
- Blocker (if any)
- Architecture (this feature)
- Key files
- Next action
- Recovery protocol

**Keep:**
- Concise (400-600 words for Current Work)
- Specific (concrete paths, actions)
- Current (update frequently)

**Time:** 5-10 minutes per update

**Result:** Fast recovery, always know where you are

---

**See also:**
- @CLAUDE.md (the file itself)
- @templates/CURRENT_WORK_TEMPLATE.md (detailed template)
- @knowledge_base/platform/reference/claude_md_strategy_full.md (complete strategy)
