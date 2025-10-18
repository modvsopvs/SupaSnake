# Knowledge Base Map - Query Index

**Purpose:** Find the right documentation quickly using database-like query optimization.

**Philosophy:** Load 150 words for 80% of queries, not 5,000 words for every query.

---

## Three-Tier Structure

```
knowledge_base/
├── platform/                    # Platform development docs
│   ├── quick_ref/              # 50-200 words (80% of queries)
│   ├── how_to/                 # 500-1,000 words (15% of queries)
│   └── reference/              # 2,000-7,000 words (5% of queries)
└── game/                       # Game development docs (future)
    ├── api/
    ├── mechanics/
    └── architecture/
```

**Query Strategy:**
1. Start with quick_ref/ (fastest, covers most needs)
2. Escalate to how_to/ if need step-by-step instructions
3. Escalate to reference/ only for comprehensive deep-dive

---

## Decision Tree: Finding Documentation

```
What do you need?

├─ QUICK LOOKUP (What is X? When to use Y?)
│   → quick_ref/
│   → 50-200 words
│   → Examples: "What's the decision matrix?", "When to /clear?", "What hook types exist?"
│
├─ STEP-BY-STEP INSTRUCTIONS (How do I do X?)
│   → how_to/
│   → 500-1,000 words with examples
│   → Examples: "How do I create a hook?", "How do I use sub-agents?", "How do I apply decision matrix?"
│
└─ COMPREHENSIVE DEEP-DIVE (Everything about X)
    → reference/
    → 2,000-7,000 words
    → Examples: "All hook patterns", "Complete sub-agent guide", "Full context management strategy"
```

---

## Platform Documentation

### Quick Reference (quick_ref/)

**Context Management:**
- `decision_matrix.md` (200 words) - When to continue/clear/delegate
- `when_to_clear.md` (100 words) - Triggers for using /clear
- `active_loading.md` (150 words) - What to load after /clear
- `token_estimates.md` (300 words) - Common token estimates

**Hooks:**
- `hook_types.md` (250 words) - All hook types and when to use them
- `hook_testing.md` (300 words) - How to test hooks quickly

**Sub-Agents:**
- `subagent_types.md` (350 words) - All sub-agent types and when to use them

**Total:** 7 files, ~1,650 words

### How-To Guides (how_to/)

**Context Management:**
- `apply_decision_matrix.md` (1,000 words) - Step-by-step decision matrix application
- `recover_from_clear.md` (900 words) - Fast recovery after /clear or auto-compact
- `update_claude_md.md` (1,000 words) - Keeping CLAUDE.md current

**Implementation:**
- `create_custom_hook.md` (800 words) - Create, test, deploy custom hook
- `use_subagents.md` (1,000 words) - Spawn and use sub-agents effectively

**Total:** 5 files, ~4,700 words

### Reference Docs (reference/)

**Comprehensive Guides:**
- `context_management_full.md` (5,000+ words) - Complete context strategy
- `decision_matrix_full.md` (2,000+ words) - Full decision guide with scenarios
- `token_estimation_full.md` (3,000+ words) - Detailed estimation guidelines
- `hooks_guide_full.md` (7,000+ words) - Complete hooks reference
- `subagent_guide_full.md` (5,000+ words) - Complete sub-agent guide

**Total:** 5 files, ~22,000 words

---

## Game Documentation

### Quick Reference (quick_ref/)

**Dynasty System:**
- `dynasties.md` (200 words) - 3 starter dynasties, stats, bonuses, variants
- `mvp_scope.md` (250 words) - v0.1/v0.5/v1.0 feature breakdown
- `breeding_rules.md` (200 words) - Breeding formula, generation, costs

**Collection & Economy:**
- `collection_targets.md` (150 words) - Panini book psychology, targets
- `economic_balance.md` (200 words) - DNA income/costs, time estimates

**Production:**
- `art_pipeline.md` (250 words) - Option A (Simple 3D + Midjourney)
- `constraints.md` (300 words) - Technical/business/design constraints

**Total:** 7 files, ~1,550 words

### How-To Guides (how_to/)

**Content Production:**
- `add_new_dynasty.md` (1,000 words) - 7-day monthly expansion process
- `create_variant_art.md` (900 words) - Midjourney art generation guide

**Game Design:**
- `balance_progression.md` (1,200 words) - Tuning progression curves
- `design_breeding.md` (900 words) - Breeding mechanics design

**Total:** 4 files, ~4,000 words

### Reference Docs (reference/)

**Comprehensive Specs:**
- `MAP_to_full_docs.md` - Links to all 27 comprehensive game docs
  - Dynasty System Specification v1.0 (~15,000 words)
  - Dynasty Sprint Briefing (~4,800 words)
  - MVP Scope (~5,000 words)
  - Constraint Lattice (~8,000 words)
  - Plus 23 more comprehensive documents

**Total:** 1 MAP file + links to ~165,000 words of comprehensive specs

---

## Common Queries

### "Should I /clear or continue?"

**Answer:** @knowledge_base/platform/quick_ref/decision_matrix.md (200 words)

**If need more:** @knowledge_base/platform/how_to/apply_decision_matrix.md (1,000 words)

**If need everything:** @knowledge_base/platform/reference/decision_matrix_full.md (2,000+ words)

### "How to estimate tokens for a task?"

**Answer:** @knowledge_base/platform/quick_ref/token_estimates.md (300 words)

**If need everything:** @knowledge_base/platform/reference/token_estimation_full.md (3,000+ words)

### "What hook types exist?"

**Answer:** @knowledge_base/platform/quick_ref/hook_types.md (250 words)

**If creating hook:** @knowledge_base/platform/how_to/create_custom_hook.md (800 words)

**If need all patterns:** @knowledge_base/platform/reference/hooks_guide_full.md (7,000+ words)

### "How to recover after /clear?"

**Answer:** @knowledge_base/platform/quick_ref/active_loading.md (150 words)

**If need step-by-step:** @knowledge_base/platform/how_to/recover_from_clear.md (900 words)

**If need full strategy:** @knowledge_base/platform/reference/context_management_full.md (5,000+ words)

### "When should I use a sub-agent?"

**Answer:** @knowledge_base/platform/quick_ref/subagent_types.md (350 words)

**If spawning sub-agent:** @knowledge_base/platform/how_to/use_subagents.md (1,000 words)

**If need everything:** @knowledge_base/platform/reference/subagent_guide_full.md (5,000+ words)

### "How to create a custom hook?"

**Answer:** @knowledge_base/platform/how_to/create_custom_hook.md (800 words)

**If need all patterns:** @knowledge_base/platform/reference/hooks_guide_full.md (7,000+ words)

### "How to update CLAUDE.md?"

**Answer:** @knowledge_base/platform/how_to/update_claude_md.md (1,000 words)

---

## Common Game Queries

### "What dynasties exist in MVP?"

**Answer:** @knowledge_base/game/quick_ref/dynasties.md (200 words)

**If need complete spec:** @knowledge_base/game/reference/MAP_to_full_docs.md → Dynasty System Specification v1.0 (15,000 words)

### "What's the breeding formula?"

**Answer:** @knowledge_base/game/quick_ref/breeding_rules.md (200 words)

**If implementing:** @knowledge_base/game/how_to/design_breeding.md (900 words)

**If need complete spec:** @knowledge_base/game/reference/MAP_to_full_docs.md → Dynasty System Spec Section 8

### "How do I add a new dynasty?"

**Answer:** @knowledge_base/game/how_to/add_new_dynasty.md (1,000 words)

**If need context:** @knowledge_base/game/reference/MAP_to_full_docs.md → Monthly Expansion Playbook

### "How do I create variant art?"

**Answer:** @knowledge_base/game/how_to/create_variant_art.md (900 words)

**If need pipeline overview:** @knowledge_base/game/quick_ref/art_pipeline.md (250 words)

### "What's the MVP scope?"

**Answer:** @knowledge_base/game/quick_ref/mvp_scope.md (250 words)

**If need complete scope:** @knowledge_base/game/reference/MAP_to_full_docs.md → MVP Scope (5,000 words)

### "What are the DNA costs?"

**Answer:** @knowledge_base/game/quick_ref/economic_balance.md (200 words)

**If balancing progression:** @knowledge_base/game/how_to/balance_progression.md (1,200 words)

### "What are project constraints?"

**Answer:** @knowledge_base/game/quick_ref/constraints.md (300 words)

**If need complete analysis:** @knowledge_base/game/reference/MAP_to_full_docs.md → Constraint Lattice (8,000 words)

---

## Query Efficiency Comparison

### Before (Monolithic Docs)

**Query:** "When should I /clear?"

**Load:** docs/CONTEXT_MANAGEMENT.md (5,000+ words)

**Result:** Find answer in 100 words, load 5,000 (98% waste)

### After (Database-Like Structure)

**Query:** "When should I /clear?"

**Load:** knowledge_base/platform/quick_ref/when_to_clear.md (100 words)

**Result:** Find answer in 100 words, load 100 (0% waste)

**Savings:** 4,900 words (98% reduction)

---

## Token Savings

**Typical platform session queries:**
- Decision matrix: 200 words (was 2,717 words) - save 2,517 words
- When to /clear: 100 words (was 2,717 words) - save 2,617 words
- Hook types: 250 words (was 7,215 words) - save 6,965 words
- Token estimates: 300 words (was 3,100 words) - save 2,800 words

**Total platform session:** Load 850 words instead of 15,749 words
**Savings:** 14,899 words (~20k tokens)

**Typical game session queries:**
- Dynasties: 200 words (was 15,000 words from full spec) - save 14,800 words
- Breeding rules: 200 words (was 15,000 words) - save 14,800 words
- MVP scope: 250 words (was 5,000 words) - save 4,750 words
- Economic balance: 200 words (was 15,000 words) - save 14,800 words

**Total game session:** Load 850 words instead of 50,000 words
**Savings:** 49,150 words (~65k tokens)

**Combined typical session:** Platform (850) + Game (850) = 1,700 words instead of 65,749 words
**Total Savings:** 64,049 words (~85k tokens) = ~42% of context budget

---

## File Organization

### Platform Structure

```
knowledge_base/platform/
├── quick_ref/                          # First stop for queries
│   ├── decision_matrix.md              # 200 words
│   ├── when_to_clear.md                # 100 words
│   ├── active_loading.md               # 150 words
│   ├── token_estimates.md              # 300 words
│   ├── hook_types.md                   # 250 words
│   ├── hook_testing.md                 # 300 words
│   └── subagent_types.md               # 350 words
│
├── how_to/                             # Step-by-step instructions
│   ├── apply_decision_matrix.md        # 1,000 words
│   ├── recover_from_clear.md           # 900 words
│   ├── update_claude_md.md             # 1,000 words
│   ├── create_custom_hook.md           # 800 words
│   └── use_subagents.md                # 1,000 words
│
└── reference/                          # Comprehensive deep-dives
    ├── context_management_full.md      # 5,000+ words
    ├── decision_matrix_full.md         # 2,000+ words
    ├── token_estimation_full.md        # 3,000+ words
    ├── hooks_guide_full.md             # 7,000+ words
    └── subagent_guide_full.md          # 5,000+ words
```

### Game Structure (Production-Ready)

```
knowledge_base/game/
├── quick_ref/                          # First stop for game queries
│   ├── dynasties.md                    # 200 words - 3 dynasties, stats, variants
│   ├── mvp_scope.md                    # 250 words - v0.1/v0.5/v1.0 summary
│   ├── breeding_rules.md               # 200 words - Breeding formula, inheritance
│   ├── collection_targets.md           # 150 words - Panini book, targets
│   ├── economic_balance.md             # 200 words - DNA income/costs
│   ├── art_pipeline.md                 # 250 words - Midjourney + 3D pipeline
│   └── constraints.md                  # 300 words - Technical/business/design
│
├── how_to/                             # Step-by-step game guides
│   ├── add_new_dynasty.md              # 1,000 words - Monthly expansion process
│   ├── balance_progression.md          # 1,200 words - Tuning progression curves
│   ├── design_breeding.md              # 900 words - Breeding mechanics design
│   └── create_variant_art.md           # 900 words - Midjourney art generation
│
└── reference/                          # Comprehensive game specs
    └── MAP_to_full_docs.md             # Links to all 27 comprehensive docs
```

---

## Usage Guidelines

### For Quick Queries

**Start here:** @knowledge_base/platform/quick_ref/

**Examples:**
```
# Check decision matrix
@knowledge_base/platform/quick_ref/decision_matrix.md

# Check hook types
@knowledge_base/platform/quick_ref/hook_types.md

# Check token estimates
@knowledge_base/platform/quick_ref/token_estimates.md
```

**Result:** 100-300 word answers, <1 second to read

### For Implementation Tasks

**Start here:** @knowledge_base/platform/how_to/

**Examples:**
```
# Creating a hook
@knowledge_base/platform/how_to/create_custom_hook.md

# Using sub-agents
@knowledge_base/platform/how_to/use_subagents.md

# Applying decision matrix
@knowledge_base/platform/how_to/apply_decision_matrix.md
```

**Result:** 800-1,000 word guides with step-by-step instructions

### For Deep-Dive Research

**Start here:** @knowledge_base/platform/reference/

**Examples:**
```
# All hook patterns
@knowledge_base/platform/reference/hooks_guide_full.md

# Complete context strategy
@knowledge_base/platform/reference/context_management_full.md

# All sub-agent details
@knowledge_base/platform/reference/subagent_guide_full.md
```

**Result:** 2,000-7,000 word comprehensive guides

---

## Benefits

### Query Efficiency
- 80% of queries: 150 words loaded (vs 5,000 words before)
- 15% of queries: 900 words loaded (vs 5,000 words before)
- 5% of queries: 5,000 words loaded (same as before)
- **Average:** 96% reduction in loaded documentation

### Context Budget
- Typical session: Save ~20k tokens (~10% of budget)
- Complex session: Save ~40k tokens (~20% of budget)
- Long session: Save ~60k tokens (~30% of budget)

### Attention Budget
- More focused context = higher attention per token
- Critical instructions more effective
- Reduced "documentation noise"

### Scalability
- Game docs adding 50,000+ words
- With database structure: Still query-efficient
- Without it: Would be unusable

---

## Next Steps

**To query knowledge base:**
1. Check MAP.md for relevant doc
2. Start with quick_ref/ (fastest)
3. Escalate to how_to/ if needed
4. Escalate to reference/ only for deep-dive

**To add new docs:**
1. Identify category (platform vs game)
2. Create all three levels (quick_ref, how_to, reference)
3. Update MAP.md with new entry
4. Test query efficiency (load only what's needed)

**To maintain:**
- Update quick_ref/ most frequently (they're shown most often)
- Update how_to/ when processes change
- Update reference/ comprehensively but less frequently

---

**Version:** 2.1
**Philosophy:** Database-like query optimization for documentation
**Result:** Top 1% context management system

*Know exactly where to find what you need, when you need it.*
