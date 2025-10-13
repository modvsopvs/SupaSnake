# Token Estimation Guide
## Accurate Predictions for Better Decisions

**Why estimate?** Decision matrix requires accurate token predictions. Better estimates = better decisions.

---

## Core Conversion Rates

### Text to Tokens

**English text:** ~1 token per 0.75 words (4 characters)

```
100 words = ~133 tokens
500 words = ~665 tokens
1,000 words = ~1,330 tokens
```

**Code:** ~1 token per 0.5 words (denser than prose)

```
100 lines of code = ~200 words = ~400 tokens
500 lines of code = ~1,000 words = ~2,000 tokens
1,000 lines of code = ~2,000 words = ~4,000 tokens
```

**JSON/Structured data:** ~1 token per 0.3 words (very dense)

```
100 lines JSON = ~300 words = ~1,000 tokens
```

---

## Estimating Conversation Tokens

### Message-Based Estimation

**Short message (50-100 words):**
- User: ~100 tokens
- Assistant: ~150 tokens

**Medium message (200-300 words):**
- User: ~300 tokens
- Assistant: ~450 tokens

**Long message (500+ words):**
- User: ~700 tokens
- Assistant: ~1,000 tokens

### Conversation Exchange Estimation

**One exchange = User message + Assistant response**

```
Typical exchange:
├─ User: 100 words = ~133 tokens
└─ Assistant: 300 words = ~400 tokens
Total: ~533 tokens per exchange

Rule of thumb: ~500-1,000 tokens per exchange
```

### Multi-Message Conversation

**Small discussion (10 exchanges):**
```
10 exchanges × 600 tokens avg = 6,000 tokens
```

**Medium discussion (20 exchanges):**
```
20 exchanges × 700 tokens avg = 14,000 tokens
```

**Large discussion (40 exchanges):**
```
40 exchanges × 800 tokens avg = 32,000 tokens
```

### Tool Results in Conversation

**File read result:**
- Small file: +500-2,000 tokens
- Medium file: +2,000-5,000 tokens
- Large file: +5,000-10,000 tokens

**Bash output:**
- Command output: +100-500 tokens

**Web fetch:**
- Article: +2,000-5,000 tokens
- Documentation page: +3,000-8,000 tokens

---

## Estimating File Tokens

### By Lines of Code

**JavaScript/TypeScript:**
```
100 lines = ~400 tokens
250 lines = ~1,000 tokens
500 lines = ~2,000 tokens
1,000 lines = ~4,000 tokens
2,000 lines = ~8,000 tokens
```

**Python:**
```
100 lines = ~350 tokens (more concise)
250 lines = ~875 tokens
500 lines = ~1,750 tokens
1,000 lines = ~3,500 tokens
```

**HTML/CSS:**
```
100 lines = ~450 tokens (verbose)
250 lines = ~1,125 tokens
500 lines = ~2,250 tokens
```

**JSON:**
```
100 lines = ~600 tokens (very dense)
250 lines = ~1,500 tokens
500 lines = ~3,000 tokens
```

### By File Size

**Rule of thumb:**
- 1 KB text ≈ 200-300 tokens
- 10 KB file ≈ 2,000-3,000 tokens
- 50 KB file ≈ 10,000-15,000 tokens
- 100 KB file ≈ 20,000-30,000 tokens

**Quick estimation:**
```bash
# Check file size
ls -lh src/components/GameEngine.ts
# 45K

# Estimate tokens
45 KB × 250 tokens/KB = ~11,250 tokens
```

---

## Estimating Task Tokens

### Bug Fix

**Typical bug fix:**
```
Discussion:
├─ Understand bug: 3-5 exchanges = 3k tokens
├─ Investigate: 2-3 exchanges = 2k tokens
└─ Plan fix: 2 exchanges = 1k tokens
Subtotal: ~6k tokens

Files:
├─ Read affected file: 2-5k tokens
├─ Read test file: 1-2k tokens
└─ Read related files: 2-3k tokens
Subtotal: ~7k tokens

Implementation:
├─ Fix discussion: 2k tokens
└─ Testing: 1k tokens
Subtotal: ~3k tokens

Total: 6k + 7k + 3k = ~16k tokens
```

**Range: 10-20k tokens**

### Feature Implementation

**Typical feature:**
```
Design Discussion:
├─ Requirements: 5 exchanges = 4k tokens
├─ Architecture: 5 exchanges = 4k tokens
├─ API design: 3 exchanges = 2k tokens
└─ Edge cases: 3 exchanges = 2k tokens
Subtotal: ~12k tokens

Files to Read:
├─ Related features: 3 files × 3k = 9k tokens
├─ Integration points: 2 files × 2k = 4k tokens
└─ Documentation: 2k tokens
Subtotal: ~15k tokens

Implementation:
├─ Main feature: 5k tokens
├─ Tests: 3k tokens
├─ Integration: 3k tokens
└─ Review: 2k tokens
Subtotal: ~13k tokens

Total: 12k + 15k + 13k = ~40k tokens
```

**Range: 30-50k tokens**

### Refactoring

**Typical refactor:**
```
Analysis:
├─ Understand current code: 10 exchanges = 8k tokens
├─ Identify patterns: 5 exchanges = 4k tokens
└─ Plan refactor: 5 exchanges = 4k tokens
Subtotal: ~16k tokens

Files:
├─ Files to refactor: 8 files × 3k = 24k tokens
├─ Related files: 4 files × 2k = 8k tokens
└─ Tests: 3 files × 2k = 6k tokens
Subtotal: ~38k tokens

Implementation:
├─ Refactoring: 10k tokens
├─ Test updates: 5k tokens
└─ Verification: 3k tokens
Subtotal: ~18k tokens

Total: 16k + 38k + 18k = ~72k tokens
```

**Range: 60-90k tokens**
**Recommendation: Delegate to sub-agent**

### Architecture Design

**Major architecture decision:**
```
Research:
├─ Options exploration: 15 exchanges = 12k tokens
├─ Tradeoff analysis: 10 exchanges = 8k tokens
└─ Prototyping ideas: 10 exchanges = 8k tokens
Subtotal: ~28k tokens

Context:
├─ Current architecture: 5 files × 4k = 20k tokens
├─ Documentation: 10k tokens
└─ Related systems: 5 files × 3k = 15k tokens
Subtotal: ~45k tokens

Design:
├─ Specification: 10k tokens
├─ Diagrams/planning: 5k tokens
└─ Decision documentation: 5k tokens
Subtotal: ~20k tokens

Total: 28k + 45k + 20k = ~93k tokens
```

**Range: 80-120k tokens**
**Recommendation: Delegate to Design Architect agent**

---

## Estimating by Complexity

### Simple Task (Bug Fix, Small Feature)
```
Complexity: Low
Discussion: 5-10 exchanges = 5-8k tokens
Files: 2-5 files × 2k = 4-10k tokens
Implementation: 3-5k tokens

Total: 12-23k tokens
Decision: Usually < 100k total (continue)
```

### Medium Task (Feature, Enhancement)
```
Complexity: Medium
Discussion: 15-25 exchanges = 12-20k tokens
Files: 5-10 files × 3k = 15-30k tokens
Implementation: 8-15k tokens

Total: 35-65k tokens
Decision: May push > 100k (consider /clear)
```

### Complex Task (Refactor, Architecture)
```
Complexity: High
Discussion: 30-50 exchanges = 25-40k tokens
Files: 10-20 files × 3k = 30-60k tokens
Implementation: 15-30k tokens

Total: 70-130k tokens
Decision: Likely > 150k (delegate)
```

---

## Quick Estimation Techniques

### Technique 1: Count Messages

**Current conversation:**
```
Count last N messages in this session
Rule of thumb: 1 message = 500-1,000 tokens

20 messages = ~15k tokens
40 messages = ~30k tokens
60 messages = ~45k tokens
```

### Technique 2: Count Files Read

**Files in current session:**
```
Small files (< 200 lines): 1-2k tokens each
Medium files (200-500 lines): 2-5k tokens each
Large files (> 500 lines): 5-10k tokens each

3 small + 2 medium = 3×1.5k + 2×3.5k = 11.5k tokens
```

### Technique 3: Rule of 50

**"Rule of 50" quick estimate:**
```
Last 50 messages ≈ 40k tokens (typical)
Last 50 tool results ≈ 30k tokens (typical)
Last 50 file operations ≈ 50k tokens (varies widely)

Current ≈ (messages + tools + files) / estimation
```

### Technique 4: Git Diff Estimation

**Estimate changes:**
```bash
# Check lines changed
git diff --stat HEAD~5

Example output:
10 files changed, 500 insertions(+), 200 deletions(-)

Estimate:
700 lines changed × 4 tokens/line = ~2,800 tokens
Discussion about changes: ~5k tokens
Total context: ~8k tokens
```

---

## Estimation Examples

### Example 1: Simple Bug Fix

**Task:** Fix login button not working

**Estimate:**
```
Discussion:
├─ Report bug: 2 messages = 1k
├─ Reproduce: 3 messages = 2k
└─ Fix plan: 2 messages = 1k
Subtotal: 4k

Files:
├─ LoginButton.tsx: 150 lines = 600 tokens
├─ auth.test.ts: 200 lines = 800 tokens
Subtotal: 1.4k

Fix:
├─ Implementation: 2 messages = 1k
├─ Testing: 2 messages = 1k
Subtotal: 2k

Total: 4k + 1.4k + 2k = 7.4k ≈ 8k tokens
```

**Decision:** Add to current context (likely < 100k total)

### Example 2: New Feature

**Task:** Add user notifications system

**Estimate:**
```
Design:
├─ Requirements: 8 messages = 6k
├─ Architecture: 6 messages = 5k
├─ API design: 4 messages = 3k
Subtotal: 14k

Files:
├─ Related features:
│   ├─ NotificationBadge.tsx: 3k
│   ├─ UserSettings.tsx: 4k
│   └─ API routes: 5k
├─ Read spec: 2k
Subtotal: 14k

Implementation:
├─ Backend: 10 messages = 8k
├─ Frontend: 8 messages = 6k
├─ Tests: 6 messages = 4k
Subtotal: 18k

Total: 14k + 14k + 18k = 46k tokens
```

**Decision:**
- If current < 60k: Continue (total < 110k)
- If current > 100k: /clear + active load

### Example 3: Performance Analysis

**Task:** Analyze and optimize game loop

**Estimate:**
```
Analysis:
├─ Profile code: 8 messages = 6k
├─ Identify bottlenecks: 10 messages = 8k
├─ Research solutions: 8 messages = 6k
Subtotal: 20k

Files:
├─ GameLoop.ts: 600 lines = 2.4k
├─ PhysicsEngine.ts: 800 lines = 3.2k
├─ Renderer.ts: 1000 lines = 4k
├─ StateManager.ts: 500 lines = 2k
├─ Tests: 600 lines = 2.4k
Subtotal: 14k

Optimization:
├─ Implement fixes: 12 messages = 10k
├─ Benchmark: 6 messages = 4k
├─ Documentation: 4 messages = 3k
Subtotal: 17k

Total: 20k + 14k + 17k = 51k tokens
```

**Decision:**
- Task > 30k → Delegate to Performance Reviewer agent
- OR if current > 100k → Definitely delegate

---

## Calibration Over Time

### Track Your Estimates

**Keep a log:**
```
Task: Bug fix login
Estimate: 8k tokens
Actual: 12k tokens
Error: +50% (underestimated discussion)

Task: Notification feature
Estimate: 45k tokens
Actual: 38k tokens
Error: -16% (overestimated files)

Task: Performance analysis
Estimate: 50k tokens
Actual: 55k tokens
Error: +10% (good estimate)
```

**Learn patterns:**
- Tend to underestimate discussion? Add 20% buffer
- Tend to overestimate files? Reduce estimate
- Calibrate based on your work style

### Common Estimation Errors

**Underestimating:**
- ❌ Forgetting tool results count as tokens
- ❌ Not counting discussion back-and-forth
- ❌ Missing related files that get read
- ❌ Ignoring implementation iterations

**Overestimating:**
- ❌ Assuming all files fully read (often partial)
- ❌ Counting potential not actual tokens
- ❌ Not accounting for efficient communication

**Better to overestimate than underestimate!**

---

## Summary Tables

### Quick Reference

| Item | Tokens |
|------|--------|
| Message exchange | 500-1,000 |
| Small file | 1-3k |
| Medium file | 3-7k |
| Large file | 7-15k |
| Bug fix task | 10-20k |
| Feature task | 30-50k |
| Refactor task | 60-90k |
| Architecture | 80-120k |

### By Task Type

| Task | Discussion | Files | Implementation | Total |
|------|-----------|-------|----------------|-------|
| Bug fix | 5-8k | 5-10k | 3-5k | 13-23k |
| Feature | 12-20k | 15-30k | 10-20k | 37-70k |
| Refactor | 15-25k | 30-50k | 15-30k | 60-105k |
| Architecture | 25-40k | 30-60k | 20-40k | 75-140k |

---

**Remember:** Better to overestimate and be pleasantly surprised than underestimate and exceed capacity.

**Version:** 2.0
**Philosophy:** Accurate predictions enable proactive decisions
