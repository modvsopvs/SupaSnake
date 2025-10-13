# Context Management Decision Matrix
## Visual Guide for Every Task

```
╔═══════════════════════════════════════════════════════════════╗
║          BEFORE EVERY SIGNIFICANT TASK                        ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## Step-by-Step Process

### Step 1: Estimate Task Tokens

```
┌─────────────────────────────────────────┐
│ What will this task require?           │
├─────────────────────────────────────────┤
│ • Conversation tokens: _____           │
│ • Files to read: _____                 │
│ • Implementation context: _____         │
│                                         │
│ Total Estimate: _____ tokens           │
└─────────────────────────────────────────┘

Estimation Guidelines:
• Small discussion: 5-10k tokens
• Medium feature: 20-30k tokens
• Large refactor: 40-60k tokens
• File read: 2-10k per file
```

### Step 2: Check Current Usage

```
┌─────────────────────────────────────────┐
│ Current context usage: _____  tokens   │
│                                         │
│ Estimate methods:                       │
│ • Count recent messages (~1k each)     │
│ • Count tool results                    │
│ • Count files read                      │
│ • Rule of thumb: Last 20-30 exchanges  │
│   = 40-60k tokens                       │
└─────────────────────────────────────────┘
```

### Step 3: Calculate Total

```
┌─────────────────────────────────────────┐
│ Current: _____ tokens                   │
│ + Task:  _____ tokens                   │
│ ──────────────────                      │
│ = Total: _____ tokens                   │
└─────────────────────────────────────────┘
```

### Step 4: Apply Decision Matrix

```
          Total Context Budget

0k        50k       100k      150k      200k
├──────────┼──────────┼──────────┼──────────┤
   GREEN      YELLOW      ORANGE      RED
```

---

## Decision Paths

### Path A: Total < 100k tokens (GREEN ZONE)

```
╔═══════════════════════════════════════════╗
║  ✅ CONTINUE NORMALLY                     ║
╚═══════════════════════════════════════════╝

Status: 🟢 GREEN - Plenty of room

Rationale:
• Context has 100k+ tokens available
• No curation needed
• Work naturally without overhead

Action:
→ Proceed with task normally
→ No /clear needed
→ No delegation needed

Example:
Current: 40k tokens
Task: 30k tokens
Total: 70k tokens (35% capacity)
→ CONTINUE NORMALLY
```

**When to override:**
- Context is mostly irrelevant (cruft)
- Switching to different feature domain

---

### Path B: 100k < Total < 150k tokens (YELLOW/ORANGE ZONE)

```
╔═══════════════════════════════════════════╗
║  ♻️  /CLEAR + ACTIVE LOAD                 ║
╚═══════════════════════════════════════════╝

Status: 🟡 YELLOW/ORANGE - Approaching limit

Rationale:
• Context approaching 75% capacity
• Likely accumulated cruft from previous work
• Proactive curation prevents limit issues
• Fresh context improves attention

Action:
1. /clear (reset to ~0 tokens)
2. CLAUDE.md auto-loads (invariants + current work)
3. Load current feature spec (@docs/feature.md)
4. Load current files only (not historical)
5. Load recent decisions (git log -5)
6. Begin task with curated context

Result:
~20-35k tokens of highly relevant context

Example:
Current: 120k tokens
Task: 30k tokens
Total: 150k tokens (75% capacity)
→ /CLEAR + ACTIVE LOAD
```

**When to override:**
- All current context is highly relevant
- Mid-complex reasoning (don't interrupt)

**Active Loading Checklist:**
```
□ /clear executed
□ CLAUDE.md loaded (automatic)
□ Feature spec loaded (@docs/...)
□ Current files loaded (src/...)
□ Recent decisions loaded (git log)
□ Ready to begin with clean context
```

---

### Path C: Total > 150k OR Task > 30k tokens (RED ZONE)

```
╔═══════════════════════════════════════════╗
║  🚀 DELEGATE TO SUB-AGENT                 ║
╚═══════════════════════════════════════════╝

Status: 🔴 RED - Over capacity OR task too large

Rationale:
• Context exceeds 75% capacity
• OR task is self-contained and large
• Sub-agent gets 200k fresh context
• Coordinator stays lean and effective

Action:
"Use [Agent Name] sub-agent to [specific task]"

Agent Selection:
• Security Reviewer → Security audit
• Performance Reviewer → Performance analysis
• Design Architect → Technical specifications
• Code Quality Reviewer → Maintainability review
• UX Reviewer → Usability analysis
• Validator → Production readiness check

Result:
• Sub-agent completes task with 200k context
• Returns comprehensive results
• Coordinator remains at current level

Example 1:
Current: 140k tokens
Task: 40k tokens
Total: 180k tokens (90% capacity)
→ DELEGATE TO SUB-AGENT

Example 2:
Current: 80k tokens
Task: 35k tokens (large analysis)
Total: 115k tokens
→ DELEGATE (task >30k threshold)
```

**When to override:**
- Task requires coordinator integration
- Task is NOT self-contained
- Multiple back-and-forth needed

---

## Visual Flow Chart

```
                    START
                      │
                      ▼
         ┌────────────────────────┐
         │ Estimate Task Tokens   │
         │    (Conversation +     │
         │  Files + Context)      │
         └────────┬───────────────┘
                  │
                  ▼
         ┌────────────────────────┐
         │ Check Current Usage    │
         │  (Message count +      │
         │   Tool results)        │
         └────────┬───────────────┘
                  │
                  ▼
         ┌────────────────────────┐
         │  Calculate Total       │
         │  Current + Estimate    │
         └────────┬───────────────┘
                  │
                  ▼
         ┌────────────────────────┐
         │   Apply Matrix         │
         └─────┬──────────────────┘
               │
        ┌──────┴──────┬─────────────┐
        │             │             │
        ▼             ▼             ▼
  [<100k]      [100-150k]      [>150k OR >30k]
     │              │               │
     ▼              ▼               ▼
┌─────────┐   ┌──────────┐   ┌────────────┐
│CONTINUE │   │ /CLEAR + │   │ DELEGATE   │
│NORMALLY │   │  LOAD    │   │ SUB-AGENT  │
└─────────┘   └──────────┘   └────────────┘
```

---

## Quick Reference Card

### Thresholds
```
<100k   → 🟢 Continue
100-150k → 🟡 /clear + load
>150k   → 🔴 Delegate
Task >30k → 🔴 Delegate
```

### Estimation Quick Guide
```
Conversation:
├─ Short: 5-10k
├─ Medium: 15-25k
└─ Long: 30-50k

Files:
├─ Small: 2-5k per file
├─ Medium: 5-10k per file
└─ Large: 10-20k per file

Tasks:
├─ Bug fix: 10-15k total
├─ Feature: 25-35k total
├─ Refactor: 40-60k total
└─ Architecture: 60-80k total (delegate!)
```

### Decision Override Cases
```
Override "Continue" if:
├─ Context is mostly stale/irrelevant
└─ Starting completely new feature

Override "/clear" if:
├─ All context highly relevant
└─ Mid-complex reasoning

Override "Delegate" if:
├─ Task requires coordinator integration
└─ Task not self-contained
```

---

## Practical Examples

### Example 1: Small Bug Fix

```
Task: Fix button click handler bug

Estimate:
├─ Conversation: 5k (discuss bug)
├─ Files: 3k (read component file)
└─ Fix: 2k (implement + test)
Total: 10k tokens

Current: 60k tokens

Decision: 60k + 10k = 70k → 🟢 CONTINUE
```

### Example 2: New Feature Implementation

```
Task: Implement user notification system

Estimate:
├─ Conversation: 15k (design discussion)
├─ Files: 20k (read 5-6 files)
└─ Implementation: 10k (context)
Total: 45k tokens

Current: 110k tokens

Decision: 110k + 45k = 155k → 🟡 /CLEAR + LOAD

Actions:
1. /clear
2. Load notification spec
3. Load current notification files
4. Begin with ~30k clean context
```

### Example 3: Performance Analysis

```
Task: Analyze game loop performance

Estimate:
├─ Analysis: 30k (deep dive into code)
└─ Self-contained task
Total: 30k tokens

Current: 90k tokens

Decision: Task >30k → 🔴 DELEGATE

Action:
"Use Performance Reviewer agent to analyze game loop
performance, identify bottlenecks, and recommend
optimizations for 60fps target."
```

### Example 4: Continue Current Work

```
Task: Add more tests to current feature

Estimate:
├─ Conversation: 5k
├─ Files: 5k (already loaded)
└─ Tests: 5k
Total: 15k tokens

Current: 55k tokens

Decision: 55k + 15k = 70k → 🟢 CONTINUE
Rationale: Same feature, all context relevant
```

---

## Color-Coded Status

```
🟢 GREEN (0-100k)
├─ Status: Healthy
├─ Action: Continue normally
└─ Attention: Optimal

🟡 YELLOW (100-130k)
├─ Status: Approaching limit
├─ Action: Consider /clear
└─ Attention: Good

🟠 ORANGE (130-150k)
├─ Status: Near limit
├─ Action: /clear recommended
└─ Attention: Reduced

🔴 RED (150k+)
├─ Status: Over capacity
├─ Action: Delegate or /clear
└─ Attention: Significantly reduced
```

---

## When NOT to Follow Matrix

**Situations where judgment overrides:**

1. **Mid-Critical Discussion**
   - Matrix says: /clear or delegate
   - Reality: Conversation IS the context
   - Action: Override, continue

2. **100% Relevant Context**
   - Matrix says: /clear (high tokens)
   - Reality: All context is current feature
   - Action: Override, continue

3. **Task Requires Integration**
   - Matrix says: Delegate (>30k)
   - Reality: Coordinator needed for integration
   - Action: Override, /clear + load instead

4. **Almost Done**
   - Matrix says: /clear (high tokens)
   - Reality: 95% done with feature
   - Action: Override, finish then /clear

**Remember:** Matrix is a guide, not a rule. Use judgment.

---

## Summary Table

| Current | Task | Total | Zone | Action |
|---------|------|-------|------|--------|
| 40k | 20k | 60k | 🟢 | Continue |
| 70k | 25k | 95k | 🟢 | Continue |
| 90k | 30k | 120k | 🟡 | /clear + load |
| 120k | 35k | 155k | 🔴 | /clear + load |
| 140k | 40k | 180k | 🔴 | Delegate |
| 80k | 35k | 115k | 🔴 | Delegate (task >30k) |
| 60k | 40k | 100k | 🔴 | Delegate (task >30k) |

---

**Version:** 2.0
**Philosophy:** Proactive decisions, not reactive scrambling
**Remember:** Every token is attention. Curate actively.
