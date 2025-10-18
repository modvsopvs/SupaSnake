# Game Documentation - Reference MAP

**Purpose**: Links to comprehensive game documentation (full specs, deep-dive guides)

**When to use**: 5% of queries requiring complete context, comprehensive analysis, or implementation reference

**Philosophy**: Most queries should use quick_ref (80%) or how_to (15%). Only escalate to reference docs for deep-dive needs.

---

## When to Use Reference Docs vs Quick Ref

### Use Quick Ref When:
- ✅ You need a quick answer ("What dynasties exist?")
- ✅ You want summary information (200-300 words)
- ✅ You're checking facts (colors, costs, timelines)
- ✅ You need overview, not details

### Use How-To When:
- ✅ You're implementing a feature (step-by-step guide)
- ✅ You need process documentation (900-1,200 words)
- ✅ You want examples and workflows
- ✅ You need practical application, not theory

### Use Reference Docs When:
- ✅ You need complete specification (all details)
- ✅ You're making architectural decisions
- ✅ You need to understand all options and trade-offs
- ✅ You're doing comprehensive analysis (5,000-20,000 words)

---

## Core Systems (Complete Specifications)

### Dynasty System Specification v1.0
**File**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md
**Size**: ~15,000 words
**Status**: 🔒 LOCKED FOR PRODUCTION

**When to use**:
- Implementing dynasty system from scratch
- Understanding all 7 critical decisions and rationale
- Database schema design
- Art production pipeline details
- Implementation roadmap (5-week plan)
- Monthly expansion playbook

**Quick Ref Alternative**: @knowledge_base/game/quick_ref/dynasties.md (200 words)

**Contents**:
- All 7 critical questions answered and LOCKED
- 3 starter dynasties fully specified (CYBER, PRIMAL, COSMIC)
- 10 variants per dynasty (rarity, stats, lore, unlock costs)
- Database schema (5 tables with triggers)
- UI/UX design (Panini book + gameplay integration)
- Breeding rules (same dynasty only v0.1, cross-dynasty v0.5+)
- Set bonuses (stacking +10% DNA income)
- Art production (Midjourney + simple 3D pipeline)
- Implementation roadmap (Weeks 6-10)
- Monthly expansion (7-day playbook)
- Testing checklist (backend, UI, 3D, breeding)

---

### Dynasty Sprint Briefing
**File**: @docs/game/systems/DYNASTY_SPRINT_BRIEFING.md
**Size**: ~4,800 words
**Status**: Historical (pre-sprint materials)

**When to use**:
- Understanding why decisions were made
- Reviewing evidence that informed choices
- Learning sprint methodology
- Historical context for Dynasty System

**Quick Ref Alternative**: @knowledge_base/game/quick_ref/dynasties.md (current state only)

**Contents**:
- Synthesis of all dynasty mentions across 25 docs
- 7 critical questions with evidence
- 4 design directions (Cosmetic, Stats, Abilities, Hybrid)
- Recommendation matrix with trade-offs
- Sprint agenda (5 days, 20 hours)
- Direction 4 (Hybrid) recommended → APPROVED

---

### Dynasty System Requirements
**File**: @docs/game/systems/DYNASTY_SYSTEM_requirements.md
**Size**: ~3,000 words (estimated)
**Status**: Pre-spec requirements gathering

**When to use**:
- Understanding original requirements (before decisions)
- Comparing requirements to final spec
- Requirements gathering methodology

**Quick Ref Alternative**: @knowledge_base/game/quick_ref/mvp_scope.md (final scope only)

**Contents**:
- Original requirements from design docs
- User constraints (3-5 dynasties, Midjourney art, Panini book)
- Technical constraints (mobile performance, budget)
- Feature requirements (collection, breeding, progression)

---

## Project Overview (High-Level Context)

### MVP Scope
**File**: @docs/game/02_MVP_SCOPE.md
**Size**: ~5,000 words (estimated)
**Status**: Production scope definition

**When to use**:
- Understanding overall MVP (not just dynasties)
- v0.1 / v0.5 / v1.0 feature breakdown
- Timeline and milestones
- Complete feature list

**Quick Ref Alternative**: @knowledge_base/game/quick_ref/mvp_scope.md (250 words)

**Contents**:
- v0.1 MVP features (Weeks 1-10)
- v0.5 Abilities update (Weeks 11-15)
- v1.0 PvP launch (Weeks 16-20)
- Feature descriptions for all systems
- Technical stack
- Testing strategy

---

### Constraint Lattice
**File**: @docs/game/00_CONSTRAINT_LATTICE.md
**Size**: ~8,000 words (estimated)
**Status**: Foundational constraints

**When to use**:
- Understanding project constraints (technical, business, design)
- Making architectural decisions within constraints
- Explaining "why we can't do X"
- Comprehensive constraint analysis

**Quick Ref Alternative**: @knowledge_base/game/quick_ref/constraints.md (300 words)

**Contents**:
- Technical constraints (performance, platform, budget)
- Business constraints (timeline, team size, revenue)
- Design constraints (core mechanics, user expectations)
- Trade-off analysis
- Constraint hierarchy (hard vs soft)

---

## Sub-Systems (Detailed Specs)

### Breeding System
**Quick Ref**: @knowledge_base/game/quick_ref/breeding_rules.md (200 words)
**How-To**: @knowledge_base/game/how_to/design_breeding.md (900 words)
**Complete Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 8)

**Use Quick Ref for**: Basic rules (same dynasty only, generation formula, cost)
**Use How-To for**: Designing breeding mechanics, UI/UX, cost tuning
**Use Complete Spec for**: Database schema, implementation details, future expansion

---

### Economic Balance
**Quick Ref**: @knowledge_base/game/quick_ref/economic_balance.md (200 words)
**How-To**: @knowledge_base/game/how_to/balance_progression.md (1,200 words)
**Complete Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 10)

**Use Quick Ref for**: DNA income/costs, time-to-unlock estimates
**Use How-To for**: Balancing progression curves, tuning knobs, A/B testing
**Use Complete Spec for**: Complete economic model, formulas, scaling

---

### Art Production
**Quick Ref**: @knowledge_base/game/quick_ref/art_pipeline.md (250 words)
**How-To**: @knowledge_base/game/how_to/create_variant_art.md (900 words)
**Complete Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 9)

**Use Quick Ref for**: Option A (Simple 3D + Midjourney), cost comparison
**Use How-To for**: Step-by-step Midjourney generation, prompt templates
**Use Complete Spec for**: Complete pipeline, 3D shader details, timelines

---

### Collection Mechanics (Panini Book)
**Quick Ref**: @knowledge_base/game/quick_ref/collection_targets.md (150 words)
**How-To**: Not yet created (could be added if needed)
**Complete Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 6)

**Use Quick Ref for**: Collection targets, psychology, retention strategy
**Use Complete Spec for**: UI/UX design, visual progress, set completion

---

## Query Examples

### Example 1: "What dynasties exist in MVP?"

**Best Answer**: @knowledge_base/game/quick_ref/dynasties.md (200 words)
- Lists 3 dynasties (CYBER, PRIMAL, COSMIC)
- Shows colors, bonuses, variant counts
- Quick facts (unlock costs, set bonuses)
- **Result**: Answer in 30 seconds

**If need more**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 3)
- Complete dynasty specs (10 variants each with lore, stats, art URLs)
- **Result**: Deep dive in 5 minutes

---

### Example 2: "How do I add a new dynasty after MVP?"

**Best Answer**: @knowledge_base/game/how_to/add_new_dynasty.md (1,000 words)
- 7-day step-by-step process
- Midjourney generation, database insert, CDN upload, shader creation
- **Result**: Complete guide in 5 minutes

**If need context**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 11)
- Monthly expansion playbook with rationale
- **Result**: Additional context in 3 minutes

---

### Example 3: "What's the breeding formula?"

**Best Answer**: @knowledge_base/game/quick_ref/breeding_rules.md (200 words)
- Formula: `200 + (avg_gen × 100)` DNA
- Generation: `max(p1, p2) + 1`
- Examples with actual numbers
- **Result**: Answer in 20 seconds

**If implementing**: @knowledge_base/game/how_to/design_breeding.md (900 words)
- Design rationale, UI/UX, testing
- **Result**: Implementation guide in 5 minutes

**If need complete spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 8)
- Database schema, triggers, future expansion
- **Result**: Complete technical spec in 10 minutes

---

### Example 4: "What are the project constraints?"

**Best Answer**: @knowledge_base/game/quick_ref/constraints.md (300 words)
- Technical (60fps, mobile, <100MB)
- Business (3-5 dynasties, $120 budget)
- Design (Panini book, Midjourney art)
- **Result**: Quick overview in 1 minute

**If making architectural decision**: @docs/game/00_CONSTRAINT_LATTICE.md (8,000 words)
- Complete constraint analysis with trade-offs
- **Result**: Comprehensive understanding in 20 minutes

---

## Document Status Legend

**🔒 LOCKED**: Production-ready, do not change without approval
**✅ Complete**: Finished, ready for reference
**🚧 In Progress**: Being updated
**📋 Historical**: For context, not current implementation

---

## Usage Guidelines

**Start with Quick Ref** (80% of queries):
- Fastest answers (150-300 words)
- Facts, summaries, checklists
- Decision already made, just need details

**Escalate to How-To** (15% of queries):
- Need step-by-step implementation
- Want examples and workflows
- Making similar feature, need template

**Use Reference Docs** (5% of queries):
- Need complete specification
- Making architectural decisions
- Comprehensive analysis required
- Understanding all options and trade-offs

**Golden Rule**: If quick_ref answers your question, don't load full spec (save 14,800 words / ~20k tokens)

---

## See Also

**Platform Documentation**: @knowledge_base/MAP.md (query index for entire knowledge base)
**Quick Ref Index**: @knowledge_base/game/quick_ref/ (7 files)
**How-To Index**: @knowledge_base/game/how_to/ (4 files)
