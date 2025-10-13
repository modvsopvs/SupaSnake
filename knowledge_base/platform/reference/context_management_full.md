# Context Management Strategy v2.0
## Proactive Curation for Optimal Attention Budget

**Philosophy:** Active context curation, not passive accumulation. Embrace full token budget with strategic /clear and selective loading.

---

## Core Principles

### 1. Context is Attention

**Key insight:** LLMs have finite attention capacity.

```
Attention per token = Total Attention / Context Size

Examples:
50k tokens:  Each token gets 1/50,000 attention (100% baseline)
100k tokens: Each token gets 1/100,000 attention (50% of baseline)
150k tokens: Each token gets 1/150,000 attention (33% of baseline)
```

**Result:** At 150k tokens, critical instructions receive 3× less attention than at 50k.

**Therefore:** Every token must earn its place.

### 2. Proactive > Reactive

**Old approach (reactive):**
- Let context accumulate passively
- React when auto-compact happens
- Limit coordinator to prevent context growth

**New approach (proactive):**
- Curate context actively with /clear
- Use full token budget intelligently
- Coordinator can do complex work at 150k, then /clear for next task

### 3. Invariants vs Dynamic

**20% Invariants (Always in Context):**
- Core architecture decisions
- Non-negotiable standards
- Enforcement mechanisms
- These survive /clear and auto-compact

**80% Dynamic (Current Work Only):**
- Current feature progress
- Blockers
- Feature-specific architecture
- Files being worked on
- These change frequently

### 4. /clear is a Tool, Not a Failure

**When to /clear:**
- Starting new feature (different domain)
- Context >120k before significant task
- Switching work context
- Before complex analysis needing clean slate

**/clear is proactive curation, not emergency recovery.**

---

## Decision Matrix

### Before Every Significant Task

**Step 1: Estimate Task Tokens**

```
Task analysis:
- Conversation: [estimate based on complexity]
- Files to read: [count files × avg size]
- Implementation context: [estimate]
→ Total Estimate: X tokens
```

**Estimation guidelines:**
- Small discussion: 5-10k tokens
- Medium feature: 20-30k tokens
- Large refactor: 40-60k tokens
- File read: 2-10k tokens per file

**Step 2: Check Current Usage**

```
Current context: Y tokens

Estimate methods:
- Count recent conversation length
- Count tool results
- Count files read
- Rule of thumb: ~1k tokens per message exchange
```

**Step 3: Calculate Total**

```
Total = Current (Y) + Estimate (X)
```

**Step 4: Apply Decision Matrix**

```
┌────────────────────────────────────────────┐
│ Total < 100k (50% capacity)               │
│ → CONTINUE NORMALLY                        │
│                                            │
│ Rationale:                                 │
│ - Context has plenty of room               │
│ - No curation needed                       │
│ - Work normally                            │
└────────────────────────────────────────────┘

┌────────────────────────────────────────────┐
│ 100k < Total < 150k (50-75% capacity)     │
│ → /CLEAR + ACTIVE LOAD                     │
│                                            │
│ Rationale:                                 │
│ - Context approaching limit                │
│ - Likely has cruft from previous work      │
│ - Proactive curation needed                │
│                                            │
│ Protocol:                                  │
│ 1. /clear (reset to ~0 tokens)            │
│ 2. CLAUDE.md auto-loads (invariants)      │
│ 3. Load current feature spec              │
│ 4. Load current files only                │
│ 5. Begin task (~20-30k relevant context)  │
└────────────────────────────────────────────┘

┌────────────────────────────────────────────┐
│ Total > 150k OR Task >30k tokens           │
│ → DELEGATE TO SUB-AGENT                    │
│                                            │
│ Rationale:                                 │
│ - Context too high for coordinator         │
│ - OR task too large to fit comfortably    │
│ - Sub-agent gets 200k fresh context       │
│                                            │
│ Action:                                    │
│ "Use [Agent] sub-agent to [task]"         │
│                                            │
│ Agent returns results to coordinator       │
│ Coordinator stays lean                     │
└────────────────────────────────────────────┘
```

### Override Cases

**When to ignore matrix:**

1. **Mid-complex reasoning** - Don't /clear during important discussion
2. **Highly relevant context** - Current context IS the task context
3. **Final integration** - Need full conversation history for decision

**Use judgment, not just numbers.**

---

## /clear Strategy

### When to /clear (Proactive Triggers)

**1. Starting New Feature**
```
Previous: User authentication (complete)
New: Multiplayer networking

Context: 90k tokens of auth-related history
Task: 40k tokens estimated

Decision: /clear + load multiplayer context
Rationale: Auth context not relevant to networking
Result: Clean slate with ~25k relevant context
```

**2. Context Budget Near Limit**
```
Current: 120k tokens
Task: 35k tokens estimated
Total: 155k tokens (78% capacity)

Decision: /clear + active load
Rationale: Context likely has cruft, approaching limit
Result: ~30k tokens of curated, relevant context
```

**3. Switching Work Context**
```
Working on: Frontend UI implementation
Switch to: Backend API optimization

Context: 80k tokens of frontend context
Task: Backend analysis

Decision: /clear (remove frontend context)
Load: Backend context only
Result: Relevant context for backend work
```

**4. Before Complex Analysis**
```
Current: 60k tokens (mixed contexts)
Task: Deep architectural analysis requiring focus

Decision: /clear for clean mental slate
Load: Architecture docs + relevant code
Result: Focused context for deep thinking
```

### When NOT to /clear

**1. Continuing Same Feature**
```
Current: Implementing multiplayer sync (60k tokens)
Next: Add more multiplayer features

Decision: Keep context (it's relevant)
Rationale: All context is about multiplayer
```

**2. Low Token Usage**
```
Current: 40k tokens
Task: 15k tokens
Total: 55k tokens (28% capacity)

Decision: Continue normally
Rationale: Plenty of room, no cruft
```

**3. Mid-Complex Reasoning**
```
In middle of: Important architectural decision
Conversation: 30 messages of valuable discussion

Decision: Keep context (don't interrupt)
Rationale: Conversation history is the task
```

**4. All Context is Relevant**
```
Current: 70k tokens about current feature
Task: Continue same feature

Decision: Keep context
Rationale: No cruft to remove
```

---

## Active Loading Protocol

### After /clear: What to Load (and in What Order)

**Phase 1: Invariants (Automatic)**
```
/clear executes
→ CLAUDE.md auto-loads (always)
→ Invariants section loads (20% of CLAUDE.md)
→ Current Work section loads (80% of CLAUDE.md)

Result: ~700 tokens of essential context
```

**Phase 2: Current Feature Context**
```
Load: Feature specification or design doc
Example: @docs/features/multiplayer_spec.md

What to load:
- High-level architecture for THIS feature
- Key technical decisions
- API contracts/interfaces
- Data models

Result: +5-10k tokens of feature context
```

**Phase 3: Current Files Only**
```
Load: Files being actively worked on

What to load:
- Implementation files for current feature
- Related test files
- Configuration files if relevant

What NOT to load:
- Historical/old code
- Unrelated features
- Full codebase

Example:
✅ Read: src/multiplayer/GameServer.ts
✅ Read: src/multiplayer/CollisionEngine.ts
❌ Don't read: src/auth/* (not relevant)

Result: +10-15k tokens of code context
```

**Phase 4: Recent Decisions (If Needed)**
```
Optional: Recent architecture decisions

Load:
git log --oneline --grep="Decision" -5

Or check:
Architecture decision log (if maintained)

Result: +2-5k tokens of decision context
```

**Total After Active Loading: ~20-35k tokens of highly relevant context**

Compare to: 120k tokens of mixed/stale context before /clear

---

## Invariants vs Dynamic Content

### What Belongs in CLAUDE.md Invariants (20%)

**Core Architecture (Never Changes):**
- Platform = Hooks + Sub-agents + Orchestration
- Hooks enforce deterministically
- Sub-agents get 200k fresh context

**Non-Negotiables (Project Standards):**
- Test coverage requirements (95%+)
- Security requirements (no secrets in code)
- Quality requirements (complete implementations)

**Key Technical Decisions (Foundational):**
- Technology choices (language, frameworks)
- Enforcement mechanisms (hook system)
- Platform-specific constraints (macOS compatibility)

**Tools & Structure:**
- Where hooks live (`.claude/hooks/`)
- Where agents live (`.claude/agents/`)
- Where docs live (`docs/`)

### What Belongs in Current Work (80%)

**Current Feature (Changes Frequently):**
- Feature name and description
- Progress percentage
- What's complete, what's next

**Blockers (Changes Constantly):**
- Current blockers
- Technical challenges
- Dependencies waiting on

**Feature Architecture (Specific to Current Work):**
- Technical decisions for THIS feature
- Rationale for decisions
- Alternative approaches considered

**Files (Changes with Feature):**
- Key files for current feature
- Purpose of each file
- Where to find things

**Next Action (Always Specific):**
- Concrete next step
- Actionable direction
- Recovery instructions

**Example:**
```markdown
## Invariants (Never Changes)
- Platform = Hooks + Sub-agents + Orchestration
- 95%+ test coverage required
- No secrets in code

## Current Work (Changes Frequently)
- Feature: Multiplayer Sync
- Status: 70% - Collision done, leaderboard pending
- Blocker: Redis scaling for 10k users
- Architecture: WebSocket for state, HTTP for bulk
- Next: Implement Redis sorted sets
```

### Updating CLAUDE.md

**Update Invariants (Rare):**
- Major platform change
- New non-negotiable standard
- Fundamental architecture shift

**Frequency:** Months

**Update Current Work (Frequent):**
- After each milestone
- When starting new feature
- When blocker changes
- When switching tasks

**Frequency:** Daily or after each work session

---

## Token Estimation Guidelines

### Estimating Conversation Tokens

**Rule of thumb:** ~1 token per 0.75 words

**Examples:**
- Short message (50 words): ~65 tokens
- Medium message (200 words): ~265 tokens
- Long message (500 words): ~665 tokens

**Conversation estimation:**
```
20-message exchange:
10 user messages × 100 words avg = 1,000 words = ~1,330 tokens
10 assistant messages × 300 words avg = 3,000 words = ~4,000 tokens
→ Total: ~5,330 tokens
```

### Estimating File Tokens

**Code files:** ~1 token per 0.5 words (denser)

**Examples:**
- Small file (100 lines): ~200 words = ~400 tokens
- Medium file (500 lines): ~1,000 words = ~2,000 tokens
- Large file (1,000+ lines): ~2,000+ words = ~4,000+ tokens

**JSON/Structured:** ~1 token per 0.3 words (very dense)

### Estimating Task Tokens

**Small task (bug fix):**
- Conversation: 5k tokens
- Files: 5k tokens (2-3 files)
- Total: ~10k tokens

**Medium task (feature):**
- Conversation: 10k tokens
- Files: 15k tokens (5-10 files)
- Implementation context: 5k tokens
- Total: ~30k tokens

**Large task (refactor):**
- Conversation: 15k tokens
- Files: 30k tokens (10-20 files)
- Analysis: 10k tokens
- Total: ~55k tokens

**Very large task (architecture):**
- Conversation: 20k tokens
- Files: 40k tokens (20+ files)
- Design: 20k tokens
- Total: ~80k tokens
→ **Should delegate to sub-agent**

---

## Real-World Examples

### Example 1: Starting New Feature

**Situation:**
```
Just completed: User authentication system
Context: 90k tokens (auth implementation, tests, docs)

Starting: Multiplayer networking system
Estimate: 40k tokens (new domain, many files)

Total: 130k tokens (65% capacity)
```

**Decision:** /clear + active load

**Rationale:**
- Auth context not relevant to networking
- Context will be 130k (approaching limit)
- Clean slate better for new domain

**Actions:**
```
1. /clear

2. CLAUDE.md auto-loads:
   - Invariants (platform architecture)
   - Current work (update to multiplayer)

3. Load multiplayer context:
   @docs/features/multiplayer_spec.md

4. Load current files:
   src/multiplayer/GameServer.ts
   src/multiplayer/NetworkProtocol.ts
   src/multiplayer/StateSync.ts

5. Begin implementation
```

**Result:**
- Before: 90k tokens (mostly irrelevant auth context)
- After: ~25k tokens (highly relevant multiplayer context)
- Attention: 3.6× more per token

### Example 2: High Context, Large Task

**Situation:**
```
Current: 140k tokens (mixed features)
Task: Performance analysis of game loop (30k estimate)
Total: 170k tokens (85% capacity)
```

**Decision:** Delegate to sub-agent

**Rationale:**
- Total exceeds 150k threshold
- Task is self-contained (analysis)
- Sub-agent gets 200k fresh context

**Actions:**
```
"Use Performance Reviewer agent to analyze game loop performance
and identify bottlenecks. Focus on frame rate consistency and
memory usage patterns."
```

**Result:**
- Sub-agent does analysis with 200k context
- Returns comprehensive report
- Coordinator stays at 140k (manageable)

### Example 3: Continuing Same Feature

**Situation:**
```
Current: 60k tokens (multiplayer implementation)
Next: Add player matchmaking to multiplayer
Estimate: 15k tokens

Total: 75k tokens (38% capacity)
```

**Decision:** Continue normally

**Rationale:**
- Low total context (38% capacity)
- All context is relevant (multiplayer)
- No cruft to remove
- Task is continuation of current work

**Actions:**
```
Continue working normally
No /clear needed
```

**Result:**
- Work efficiently with relevant context
- No unnecessary context loss
- Natural flow maintained

### Example 4: Context Cruft Accumulation

**Situation:**
```
Current: 110k tokens
  - 40k: Frontend UI work (done)
  - 30k: Backend API work (done)
  - 40k: Current database optimization

Next: Continue database optimization (20k estimate)
Total: 130k tokens (65% capacity)
```

**Decision:** /clear + active load

**Rationale:**
- Frontend/backend context no longer relevant (70k of cruft)
- Database work is the focus
- Total approaching limit
- Most context is stale

**Actions:**
```
1. /clear

2. CLAUDE.md loads (invariants + current work)

3. Load database context:
   @docs/database/optimization_strategy.md
   src/database/QueryOptimizer.ts
   src/database/ConnectionPool.ts

4. Check recent decisions:
   git log --oneline -5

5. Resume optimization work
```

**Result:**
- Before: 110k tokens (70k irrelevant)
- After: ~30k tokens (100% relevant)
- Attention: 3.6× more per token
- Focus: Much improved

### Example 5: Mid-Complex Decision

**Situation:**
```
Current: 80k tokens
In middle of: Critical architecture decision
Conversation: 40 messages discussing tradeoffs

Next: Make final decision based on discussion
```

**Decision:** Continue (don't /clear)

**Rationale:**
- Conversation IS the context
- Clearing would lose decision rationale
- Current context directly relevant
- Not near token limit

**Actions:**
```
Continue discussion
Make decision based on full conversation
Document decision in CLAUDE.md
```

**Result:**
- Quality decision based on full context
- Rationale preserved
- No unnecessary context loss

---

## Integration with Platform

### How This Works with Hooks

**PreCompact Hooks (Automatic):**
1. `01-save-session-state.sh` - Saves full snapshot
2. `02-update-claude-md.sh` - Updates Current Work section

**Result:** After auto-compact, recovery is fast

**But:** With active /clear strategy, auto-compact is less frequent

### How This Works with Sub-Agents

**When to delegate vs /clear:**

**Delegate if:**
- Task is self-contained (analysis, review, spec)
- Task is >30k tokens
- Task would push total >150k

**Example:** "Use Security Reviewer agent to audit auth system"

**/clear if:**
- Task is integration work (coordinator needed)
- Switching feature domains
- Context has stale cruft

**Example:** Starting new feature after finishing previous one

### How This Works with Orchestration

**Multi-instance coordination:**
- Each worktree = separate Claude instance
- Each has own context
- Use /clear freely per instance
- Coordinator manages overall flow

---

## Best Practices

### DO ✅

1. **Estimate before every significant task**
   - Prevents surprises
   - Enables proactive decisions

2. **Use /clear proactively**
   - Starting new features
   - Switching contexts
   - Before complex work

3. **Load selectively after /clear**
   - Invariants (auto)
   - Current feature spec
   - Current files only

4. **Update Current Work section frequently**
   - After milestones
   - When switching tasks
   - Daily if active development

5. **Trust the decision matrix**
   - It's based on attention budget science
   - Override only with good reason

6. **Keep invariants minimal**
   - Only truly unchanging things
   - 20% of CLAUDE.md or less

### DON'T ❌

1. **Don't prevent auto-compact artificially**
   - Use full token budget
   - /clear is the tool, not prevention

2. **Don't /clear mid-complex reasoning**
   - Conversation context is valuable
   - Finish reasoning first

3. **Don't load everything after /clear**
   - Be selective
   - Only current context

4. **Don't let Current Work go stale**
   - Update after milestones
   - Keep it relevant

5. **Don't add to invariants unnecessarily**
   - Keep invariants minimal
   - Most things belong in Current Work

6. **Don't forget to estimate**
   - Always estimate before major tasks
   - Better to overestimate than underestimate

---

## Measuring Success

### Indicators of Good Context Management

**1. Attention Efficiency**
- Critical instructions are followed consistently
- Complex reasoning is coherent
- Quality doesn't degrade late in session

**2. Token Efficiency**
- Context stays <150k most of the time
- Regular /clear usage (not emergency)
- Minimal irrelevant context

**3. Work Efficiency**
- Fast context switch between features
- Clean mental slate for new work
- No "carrying baggage" between tasks

**4. Recovery Efficiency**
- Fast recovery after /clear (<2 minutes)
- Fast recovery after auto-compact (<2 minutes)
- Clear sense of "where we are"

### Red Flags (Poor Context Management)

**1. Context Bloat**
- Regularly exceeding 150k tokens
- Never using /clear
- Accumulating cruft

**2. Degraded Performance**
- Instructions ignored late in session
- Confusion about current task
- Need to repeat context

**3. Emergency /clear**
- Only clearing when forced to
- Panic at high token counts
- Reactive rather than proactive

**4. Stale CLAUDE.md**
- Current Work section outdated
- Unclear what feature is active
- No update for weeks

---

## Summary

**Old Model (Reactive):**
- Prevent context growth
- React to auto-compact
- Limit coordinator work
- Passive accumulation

**New Model (Proactive):**
- Use full token budget
- Curate with /clear proactively
- Enable complex coordinator work
- Active curation

**Decision Matrix:**
- <100k: Continue
- 100-150k: /clear + active load
- >150k or >30k task: Delegate

**CLAUDE.md Structure:**
- 20% invariants (always true)
- 80% current work (updates frequently)

**Philosophy:**
Active curation, not passive accumulation. Every token earns its place.

---

**Version:** 2.0
**Status:** Active
**Philosophy:** Proactive context curation for optimal attention budget
