# Token Estimates - Quick Reference

## Core Conversion Rates

**English text:**
- 100 words = ~133 tokens
- 500 words = ~665 tokens
- 1,000 words = ~1,330 tokens

**Code:**
- 100 lines = ~400 tokens
- 500 lines = ~2,000 tokens
- 1,000 lines = ~4,000 tokens

**Files by size:**
- 10 KB = ~2,500 tokens
- 50 KB = ~12,500 tokens
- 100 KB = ~25,000 tokens

## Common Items

| Item | Tokens |
|------|--------|
| Message exchange | 500-1,000 |
| Small file (< 200 lines) | 1-3k |
| Medium file (200-500 lines) | 3-7k |
| Large file (> 500 lines) | 7-15k |
| Documentation page | 3-8k |

## Task Estimates

| Task Type | Total Tokens | Decision |
|-----------|--------------|----------|
| Bug fix | 10-20k | Continue normally |
| Small feature | 30-50k | Watch context, may /clear |
| Refactor | 60-90k | Consider delegating |
| Architecture | 80-120k | Delegate to sub-agent |

## Quick Estimation Method

**Step 1:** Estimate discussion
- Simple: 5-10 exchanges = 5-8k tokens
- Medium: 15-25 exchanges = 12-20k tokens
- Complex: 30-50 exchanges = 25-40k tokens

**Step 2:** Estimate files to read
- Count files × avg tokens per file
- Small: 2k, Medium: 4k, Large: 8k

**Step 3:** Estimate implementation
- Simple: 3-5k tokens
- Medium: 10-20k tokens
- Complex: 20-40k tokens

**Step 4:** Total = Discussion + Files + Implementation

**Step 5:** Apply decision matrix
- < 100k → Continue
- 100-150k → /clear + load
- > 150k → Delegate

## Rule of Thumb

**Message counting:**
- 20 messages ≈ 15k tokens
- 40 messages ≈ 30k tokens
- 60 messages ≈ 45k tokens

**File counting:**
- 3 small files ≈ 6k tokens
- 2 medium files ≈ 8k tokens
- 1 large file ≈ 10k tokens

**Better to overestimate than underestimate!**

Add 20-30% buffer if uncertain.

**See:** @knowledge_base/platform/reference/token_estimation_full.md for detailed estimates
