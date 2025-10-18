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

**Backend & Infrastructure:**
- `backend_supabase.md` (299 words) - PostgreSQL, real-time, storage, RLS, database schema
- `auth_system.md` (399 words) - Authentication flow, JWT, sessions, user permissions

**Core Gameplay:**
- `core_snake_game.md` (379 words) - Snake mechanics, grid system, collision, DNA farming
- `energy_system.md` (392 words) - Stamina gating, regeneration (1/20min), session pacing
- `resource_generation.md` (500 words) - DNA collection formulas, score-to-DNA conversion
- `classic_mode.md` (588 words) - Classic Snake gameplay, victory conditions, difficulty

**Lab Systems:**
- `collection_lab.md` (344 words) - Panini book UI, collection targets, set bonuses
- `breeding_lab.md` (344 words) - Breeding mechanics, same-dynasty breeding (v0.1)
- `evolution_lab.md` (415 words) - Evolution system (v0.5+), rarity transformation
- `lab_ui.md` (442 words) - Lab navigation, tab structure, shared components

**UI & Navigation:**
- `ui_framework.md` (437 words) - React Native structure, navigation, key components

**Dynasty System:**
- `dynasties.md` (270 words) - 3 starter dynasties (CYBER, PRIMAL, COSMIC), 30 variants
- `breeding_rules.md` (252 words) - Breeding formula, generation, costs, inheritance

**Economy & Progression:**
- `collection_targets.md` (203 words) - Panini book psychology, completion targets
- `economic_balance.md` (265 words) - DNA income/costs, time estimates, progression

**Meta & Overview:**
- `glossary.md` (503 words) - Key terminology quick lookup (DNA, Dynasty, Variant, etc.)
- `system_graph.md` (435 words) - System dependencies, build order, tiers
- `player_journey.md` (674 words) - New player flow, progression loops, retention hooks
- `mvp_scope.md` (297 words) - v0.1/v0.5/v1.0 feature breakdown

**Production:**
- `art_pipeline.md` (334 words) - Midjourney 2D + Simple 3D pipeline
- `constraints.md` (414 words) - Technical/business/design constraints

**Total:** 21 files, ~8,186 words

### How-To Guides (how_to/)

**Backend Implementation:**
- `setup_supabase_backend.md` (1,908 words) - Supabase setup, database tables, RLS, storage
- `implement_auth.md` (1,650 words) - Authentication implementation, JWT, sessions

**Gameplay Implementation:**
- `implement_energy_system.md` (1,101 words) - Energy state, regeneration, depletion, UI
- `tune_classic_mode.md` (1,179 words) - Balance tuning, grid size, speed, DNA rewards

**Lab Implementation:**
- `design_lab_ui.md` (1,746 words) - Lab screen design, Panini book style, navigation
- `implement_evolution.md` (1,530 words) - Evolution system (v0.5+), rarity transformation

**UI Implementation:**
- `create_react_native_screens.md` (1,530 words) - React Native screen creation, navigation

**Content Production:**
- `add_new_dynasty.md` (1,248 words) - Monthly dynasty expansion process (7-day sprint)
- `create_variant_art.md` (1,543 words) - Midjourney art generation workflow

**Game Design:**
- `balance_progression.md` (1,529 words) - Tuning progression curves, retention
- `design_breeding.md` (1,447 words) - Breeding mechanics design, formulas

**Total:** 11 files, ~16,411 words

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

### Backend & Infrastructure

**"How do I set up Supabase?"**
- **Answer:** @knowledge_base/game/quick_ref/backend_supabase.md (299 words)
- **If implementing:** @knowledge_base/game/how_to/setup_supabase_backend.md (1,908 words)

**"How does authentication work?"**
- **Answer:** @knowledge_base/game/quick_ref/auth_system.md (399 words)
- **If implementing:** @knowledge_base/game/how_to/implement_auth.md (1,650 words)

### Core Gameplay

**"How does the Snake game work?"**
- **Answer:** @knowledge_base/game/quick_ref/core_snake_game.md (379 words)

**"How does the Energy system work?"**
- **Answer:** @knowledge_base/game/quick_ref/energy_system.md (392 words)
- **If implementing:** @knowledge_base/game/how_to/implement_energy_system.md (1,101 words)

**"How do players earn DNA?"**
- **Answer:** @knowledge_base/game/quick_ref/resource_generation.md (500 words)

**"How do I tune Classic Mode difficulty?"**
- **Answer:** @knowledge_base/game/quick_ref/classic_mode.md (588 words)
- **If tuning balance:** @knowledge_base/game/how_to/tune_classic_mode.md (1,179 words)

### Lab Systems

**"How does the Collection Lab work?"**
- **Answer:** @knowledge_base/game/quick_ref/collection_lab.md (344 words)

**"How does breeding work?"**
- **Answer:** @knowledge_base/game/quick_ref/breeding_lab.md (344 words)
- **If implementing:** @knowledge_base/game/how_to/design_breeding.md (1,447 words)

**"How does Evolution work?" (v0.5+)**
- **Answer:** @knowledge_base/game/quick_ref/evolution_lab.md (415 words)
- **If implementing:** @knowledge_base/game/how_to/implement_evolution.md (1,530 words)

**"How do I design Lab UI screens?"**
- **Answer:** @knowledge_base/game/quick_ref/lab_ui.md (442 words)
- **If implementing:** @knowledge_base/game/how_to/design_lab_ui.md (1,746 words)

### UI & Navigation

**"How is the UI structured?"**
- **Answer:** @knowledge_base/game/quick_ref/ui_framework.md (437 words)
- **If creating screens:** @knowledge_base/game/how_to/create_react_native_screens.md (1,530 words)

### Dynasty System

**"What dynasties exist in MVP?"**
- **Answer:** @knowledge_base/game/quick_ref/dynasties.md (270 words)
- **If adding new:** @knowledge_base/game/how_to/add_new_dynasty.md (1,248 words)
- **If need complete spec:** @knowledge_base/game/reference/MAP_to_full_docs.md → Dynasty System Specification v1.0

**"What's the breeding formula?"**
- **Answer:** @knowledge_base/game/quick_ref/breeding_rules.md (252 words)
- **If implementing:** @knowledge_base/game/how_to/design_breeding.md (1,447 words)

### Economy & Progression

**"What are the DNA costs?"**
- **Answer:** @knowledge_base/game/quick_ref/economic_balance.md (265 words)
- **If balancing:** @knowledge_base/game/how_to/balance_progression.md (1,529 words)

**"What are collection targets?"**
- **Answer:** @knowledge_base/game/quick_ref/collection_targets.md (203 words)

### Meta & Overview

**"What does this term mean?"**
- **Answer:** @knowledge_base/game/quick_ref/glossary.md (503 words)
- **If need complete:** @docs/game/03_GLOSSARY.md (13,800+ words)

**"What's the system build order?"**
- **Answer:** @knowledge_base/game/quick_ref/system_graph.md (435 words)
- **If need complete:** @docs/game/01_SYSTEM_GRAPH.md (7,200+ words)

**"What's the player journey?"**
- **Answer:** @knowledge_base/game/quick_ref/player_journey.md (674 words)

**"What's the MVP scope?"**
- **Answer:** @knowledge_base/game/quick_ref/mvp_scope.md (297 words)
- **If need complete:** @knowledge_base/game/reference/MAP_to_full_docs.md → MVP Scope

### Production

**"How do I create variant art?"**
- **Answer:** @knowledge_base/game/quick_ref/art_pipeline.md (334 words)
- **If creating art:** @knowledge_base/game/how_to/create_variant_art.md (1,543 words)

**"What are project constraints?"**
- **Answer:** @knowledge_base/game/quick_ref/constraints.md (414 words)
- **If need complete:** @knowledge_base/game/reference/MAP_to_full_docs.md → Constraint Lattice

---

## Game Design Documentation (Schell Extraction)

### Overview - Batch 1: Chapters 1-8

**Source:** Jesse Schell, "The Art of Game Design" (1st Edition, 2008)
**Coverage:** Foundational game design principles applied to SupaSnake
**Extraction Date:** 2025-10-18
**Total:** 48 files, ~34,666 words of SupaSnake-specific knowledge

**Key Deliverables:**
- **Theme defined**: "Collection joy through mastery achievement"
- **Target personas**: Emma (32, casual mobile) and Tyler (14, hardcore collector)
- **2008 → 2025**: All concepts modernized for mobile F2P context

### Quick Reference (quick_ref/)

**Designer Foundations (Chapters 1-2):**
- `principles/principle_confidence.md` (348 words) - "I am a game designer" mantra
- `principles/principle_listening.md` (400 words) - Most important skill
- `principles/principle_five_listenings.md` (440 words) - Team, Audience, Game, Client, Self
- `principles/principle_major_gift.md` (483 words) - Love of work > innate talent
- `concepts/concept_experience_vs_game.md` (501 words) - Game is artifact, experience is mental state
- `concepts/concept_essential_experience.md` (509 words) - Core experience definition
- `concepts/concept_introspection.md` (545 words) - Defeating Heisenberg, memory techniques

**Game Theory (Chapters 3-4):**
- `concept_game_definition.md` (250 words) - Problem-solving with playful attitude
- `concept_fun.md` (283 words) - Pleasure with surprises
- `concept_play.md` (305 words) - Manipulation that indulges curiosity
- `concept_endogenous_value.md` (311 words) - Internal game meaning
- `concept_elemental_tetrad.md` (299 words) - Mechanics, Story, Aesthetics, Technology
- `principle_holographic_design.md` (326 words) - See skin AND skeleton

**Theme & Ideas (Chapters 5-6):**
- `concept_theme.md` (297 words) - Unifying idea behind game
- `lens_09_unification.md` (280 words) - Theme reinforcement
- `lens_10_resonance.md` (309 words) - Theme depth
- `concept_problem_statement.md` (318 words) - What problem does game solve?
- `lens_11_infinite_inspiration.md` (356 words) - Sources of ideas
- `lens_12_problem_statement.md` (333 words) - Lens application
- `concept_subconscious_mind.md` (379 words) - Working with subconscious
- `principle_brainstorming_essentials.md` (390 words) - Effective ideation

**Player Psychology (Chapters 7-8):**
- `concepts/concept_eight_filters.md` (258 words) - Eight design filters
- `concepts/concept_rule_of_loop.md` (266 words) - Iteration principle
- `concepts/concept_demographics.md` (305 words) - Age, gender, lifestyle
- `concepts/concept_psychographics.md` (375 words) - LeBlanc's 8 pleasures, Bartle types
- `concepts/concept_prototyping.md` (442 words) - Fast iteration
- `concepts/concept_empathy_projection.md` (496 words) - Becoming your player
- `concepts/concept_gender_play_differences.md` (438 words) - Male/female play patterns

**Total:** 29 quick_refs, ~10,717 words

### How-To Guides (how_to/)

**Applying to SupaSnake:**
- `apply_to_supasnake/apply_five_listenings_to_supasnake.md` (1,980 words) - Team/Audience/Game/Client/Self listening
- `apply_to_supasnake/apply_experience_design_to_collection_lab.md` (2,035 words) - Experience-first design
- `apply_problem_solving_lens_to_supasnake.md` (1,427 words) - Games as problems
- `apply_elemental_tetrad_to_supasnake.md` (1,872 words) - Harmonizing four elements
- `apply_theme_to_supasnake.md` (1,898 words) - Theme reinforcement across all elements
- `state_design_problem.md` (1,772 words) - Problem statement workshop
- `work_with_subconscious.md` (2,226 words) - Subconscious techniques
- `apply_to_supasnake/apply_eight_filters_to_supasnake.md` (2,214 words) - Eight design filters
- `apply_to_supasnake/understand_supasnake_target_audience.md` (2,218 words) - Emma & Tyler personas
- `apply_to_supasnake/apply_player_psychology_to_supasnake.md` (2,432 words) - Pleasures & motivations
- `apply_to_supasnake/maximize_iteration_loops.md` (2,783 words) - Rapid prototyping
- `apply_to_supasnake/design_for_mobile_f2p_players.md` (2,501 words) - Mobile F2P design

**Total:** 12 how_tos, ~25,358 words

### Reference Summaries (reference/)

**Chapter Summaries (batch1_chapters/):**
- `chapter_01_designer_summary.md` (795 words) - Designer foundations
- `chapter_02_experience_summary.md` (1,193 words) - Experience design
- `chapter_03_experience_rises_from_game_summary.md` - Game definitions
- `chapter_04_game_consists_of_elements_summary.md` - Elemental tetrad
- `chapter_05_theme_summary.md` - Theme unification
- `chapter_06_idea_summary.md` - Idea generation
- `chapter_07_iteration_summary.md` - Prototyping & iteration
- `chapter_08_player_summary.md` - Player understanding

**Total:** 8 reference summaries, ~8,591 words

---

## Common Game Design Queries

### Designer Mindset

**"How do I build confidence as a designer?"**
- **Answer:** @knowledge_base/game_design/quick_ref/principles/principle_confidence.md (348 words)

**"What's the most important designer skill?"**
- **Answer:** @knowledge_base/game_design/quick_ref/principles/principle_listening.md (400 words)
- **If applying:** @knowledge_base/game_design/how_to/apply_to_supasnake/apply_five_listenings_to_supasnake.md (1,980 words)

**"Do I need natural talent to design games?"**
- **Answer:** @knowledge_base/game_design/quick_ref/principles/principle_major_gift.md (483 words)

### Core Design Principles

**"What's SupaSnake's theme?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_theme.md (297 words)
- **If applying:** @knowledge_base/game_design/how_to/apply_theme_to_supasnake.md (1,898 words)

**"What's the elemental tetrad?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_elemental_tetrad.md (299 words)
- **If applying:** @knowledge_base/game_design/how_to/apply_elemental_tetrad_to_supasnake.md (1,872 words)

**"How do I define my design problem?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_problem_statement.md (318 words)
- **If applying:** @knowledge_base/game_design/how_to/state_design_problem.md (1,772 words)

### Player Understanding

**"Who is SupaSnake's target audience?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concepts/concept_demographics.md (305 words)
- **If need personas:** @knowledge_base/game_design/how_to/apply_to_supasnake/understand_supasnake_target_audience.md (2,218 words)

**"What motivates mobile players?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concepts/concept_psychographics.md (375 words)
- **If applying:** @knowledge_base/game_design/how_to/apply_to_supasnake/apply_player_psychology_to_supasnake.md (2,432 words)

**"How do I design for mobile F2P players?"**
- **Answer:** @knowledge_base/game_design/how_to/apply_to_supasnake/design_for_mobile_f2p_players.md (2,501 words)

### Design Process

**"How do I work with my subconscious?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_subconscious_mind.md (379 words)
- **If applying:** @knowledge_base/game_design/how_to/work_with_subconscious.md (2,226 words)

**"How do I maximize iteration speed?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concepts/concept_prototyping.md (442 words)
- **If applying:** @knowledge_base/game_design/how_to/apply_to_supasnake/maximize_iteration_loops.md (2,783 words)

**"What are the eight design filters?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concepts/concept_eight_filters.md (258 words)
- **If applying:** @knowledge_base/game_design/how_to/apply_to_supasnake/apply_eight_filters_to_supasnake.md (2,214 words)

---

### Overview - Batch 2: Chapters 9-16

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020)
**Coverage:** Player psychology, motivation, mechanics, balance, puzzles, interface, engagement
**Extraction Date:** 2025-10-18
**Total:** 50 files, ~47,109 words of SupaSnake-specific knowledge

**Key Deliverables:**
- **Player Psychology**: Mental models, focus, empathy applied to Emma & Tyler
- **Motivation Systems**: Intrinsic vs extrinsic motivation, Self-Determination Theory
- **Six Core Mechanics**: Space, Objects, Actions, Rules, Skill, Chance (applied to Snake + collection)
- **Balance Methodology**: Skill vs chance, economic balance, progression tuning
- **Mobile Interface Design**: Touch controls, feedback loops, juiciness
- **Interest Curves**: Session-based pacing for 5-10 minute mobile play

**Edition Notes:** 3rd edition (2020) already includes modern mobile examples and F2P monetization. Still applied SupaSnake-specific context (React Native, Supabase, solo dev).

### Quick Reference (quick_ref/) - Batch 2

**Player Psychology & Motivation (Chapters 9-11):**
- `concept_player_mental_models.md` (399 words) - How players construct game understanding
- `concept_focus_attention.md` (391 words) - Managing player attention budget
- `concept_empathy.md` (249 words) - Designer empathy for players
- `concept_imagination.md` (285 words) - Activating player imagination
- `concept_motivation_foundations.md` (291 words) - What drives players
- `concept_intrinsic_motivation.md` (244 words) - Skill mastery, autonomy, purpose
- `concept_extrinsic_motivation.md` (323 words) - Rewards, achievements, collection
- `concept_player_needs.md` (311 words) - Fundamental psychological needs
- `concept_autonomy_competence_relatedness.md` (301 words) - Self-Determination Theory
- `lens_19_player.md` (258 words) - Player-centered design
- `lens_20_pleasure.md` (304 words) - LeBlanc's 8 pleasures
- `lens_21_flow.md` (315 words) - Flow state optimization
- `lens_22_needs.md` (249 words) - Player needs lens
- `lens_23_motivation.md` (267 words) - Motivation analysis
- `lens_24_novelty.md` (290 words) - Novelty and surprise
- `lens_25_judgment.md` (270 words) - Player judgment avoidance

**Core Mechanics & Balance (Chapters 12-13):**
- `mechanic_space.md` (303 words) - Discrete 2D grid for Snake
- `mechanic_objects.md` (297 words) - Snake, DNA, variants as game objects
- `mechanic_actions.md` (288 words) - Movement, collection, breeding actions
- `mechanic_rules.md` (311 words) - Collision, scoring, breeding rules
- `mechanic_skill.md` (292 words) - Snake mastery, player skill expression
- `mechanic_chance.md` (285 words) - Variant RNG, collection gacha
- `concept_game_balance.md` (299 words) - Balance types overview
- `concept_balance_types.md` (388 words) - Fairness, challenge, meaningful choice

**Interface & Engagement (Chapters 14-16):**
- `concept_puzzle_design.md` (297 words) - Good puzzle principles
- `concept_good_puzzles.md` (311 words) - What makes puzzles good
- `concept_interface_design.md` (295 words) - Mobile touch interface
- `concept_feedback_loops.md` (303 words) - Visual/audio/haptic feedback
- `concept_interest_curves.md` (297 words) - Engagement pacing
- `concept_pacing.md` (285 words) - Session pacing for mobile
- `lens_54_accessibility.md` (249 words) - Accessibility considerations
- `lens_55_visible_progress.md` (261 words) - Progress visualization

**Total:** 30 quick_refs, ~8,728 words

### How-To Guides (how_to/) - Batch 2

**Player Psychology & Motivation:**
- `apply_player_mental_models_to_supasnake.md` (1,847 words) - Designing for Emma & Tyler's mental models
- `design_for_player_attention.md` (1,712 words) - Managing attention in mobile context
- `balance_intrinsic_extrinsic_in_supasnake.md` (1,802 words) - Balancing skill mastery with collection rewards
- `design_engagement_loops.md` (1,684 words) - Session-based engagement (5-10 min sessions)

**Core Mechanics & Balance:**
- `balance_supasnake_mechanics.md` (2,140 words) - Balancing Snake (skill) + collection (chance)
- `tune_dna_economy.md` (1,753 words) - Economic balance, DNA costs, progression
- `balance_skill_vs_chance.md` (1,889 words) - Skill floor/ceiling for casual vs hardcore

**Interface & Engagement:**
- `design_mobile_touch_interface.md` (1,931 words) - Touch controls, feedback, juiciness
- `create_engagement_curves.md` (1,847 words) - Interest curves for mobile sessions
- `design_puzzles_for_supasnake.md` (1,502 words) - Optional puzzle content (breeding challenges)

**Total:** 11 how_tos, ~18,107 words

### Reference Summaries (reference/) - Batch 2

**Chapter Summaries (batch2_chapters/):**
- `chapter_09_player_summary.md` (804 words) - Player understanding
- `chapter_10_mind_summary.md` (892 words) - Player mental models
- `chapter_11_motivation_summary.md` (793 words) - Motivation systems
- `chapter_12_mechanics_summary.md` (1,247 words) - Six core mechanics
- `chapter_13_balance_summary.md` (1,104 words) - Game balance
- `chapter_14_puzzles_summary.md` (801 words) - Puzzle design
- `chapter_15_interface_summary.md` (847 words) - Interface design
- `chapter_16_interest_summary.md` (738 words) - Interest curves

**Total:** 8 reference summaries, ~7,226 words

---

## Common Game Design Queries - Batch 2

### Player Psychology

**"How do players build mental models of my game?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_player_mental_models.md (399 words)
- **If applying:** @knowledge_base/game_design/how_to/apply_player_mental_models_to_supasnake.md (1,847 words)

**"How do I manage player attention?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_focus_attention.md (391 words)
- **If applying:** @knowledge_base/game_design/how_to/design_for_player_attention.md (1,712 words)

**"What motivates players intrinsically vs extrinsically?"**
- **Quick refs:**
  - @knowledge_base/game_design/quick_ref/concept_intrinsic_motivation.md (244 words)
  - @knowledge_base/game_design/quick_ref/concept_extrinsic_motivation.md (323 words)
- **If balancing:** @knowledge_base/game_design/how_to/balance_intrinsic_extrinsic_in_supasnake.md (1,802 words)

**"What is Self-Determination Theory?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_autonomy_competence_relatedness.md (301 words)

### Game Mechanics

**"What are the six core mechanics?"**
- **Quick refs:**
  - Space: @knowledge_base/game_design/quick_ref/mechanic_space.md (303 words)
  - Objects: @knowledge_base/game_design/quick_ref/mechanic_objects.md (297 words)
  - Actions: @knowledge_base/game_design/quick_ref/mechanic_actions.md (288 words)
  - Rules: @knowledge_base/game_design/quick_ref/mechanic_rules.md (311 words)
  - Skill: @knowledge_base/game_design/quick_ref/mechanic_skill.md (292 words)
  - Chance: @knowledge_base/game_design/quick_ref/mechanic_chance.md (285 words)
- **If applying:** @knowledge_base/game_design/how_to/balance_supasnake_mechanics.md (2,140 words)

**"How do I balance Snake mechanics with collection?"**
- **Answer:** @knowledge_base/game_design/how_to/balance_supasnake_mechanics.md (2,140 words)
- **Quick context:** Covers skill (Snake) vs chance (collection), progression curves, floor/ceiling balance

**"How do I balance skill vs chance?"**
- **Answer:** @knowledge_base/game_design/how_to/balance_skill_vs_chance.md (1,889 words)
- **Quick context:** Skill floor for casual players (Emma), skill ceiling for hardcore (Tyler)

### Balance & Economy

**"How do I tune DNA economy?"**
- **Answer:** @knowledge_base/game_design/how_to/tune_dna_economy.md (1,753 words)
- **Quick ref:** @knowledge_base/game/quick_ref/economic_balance.md (265 words)

**"What types of game balance exist?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_balance_types.md (388 words)
- **Context:** Fairness, challenge, meaningful choice, skill vs chance

### Mobile Interface & Engagement

**"How do I design mobile touch interface?"**
- **Answer:** @knowledge_base/game_design/how_to/design_mobile_touch_interface.md (1,931 words)
- **Quick ref:** @knowledge_base/game_design/quick_ref/concept_interface_design.md (295 words)

**"How do I create feedback loops?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_feedback_loops.md (303 words)
- **Context:** Visual, audio, haptic feedback for mobile

**"How do I pace mobile game sessions?"**
- **Answer:** @knowledge_base/game_design/how_to/create_engagement_curves.md (1,847 words)
- **Quick refs:**
  - Interest curves: @knowledge_base/game_design/quick_ref/concept_interest_curves.md (297 words)
  - Pacing: @knowledge_base/game_design/quick_ref/concept_pacing.md (285 words)

**"How do I design engagement loops for mobile?"**
- **Answer:** @knowledge_base/game_design/how_to/design_engagement_loops.md (1,684 words)
- **Context:** 5-10 minute sessions, energy gating, retention hooks

### Puzzles (Optional Content)

**"Should I add puzzles to SupaSnake?"**
- **Answer:** @knowledge_base/game_design/quick_ref/concept_puzzle_design.md (297 words)
- **If implementing:** @knowledge_base/game_design/how_to/design_puzzles_for_supasnake.md (1,502 words)
- **Context:** Breeding challenges as optional puzzle content

---

### Overview - Batch 3: Chapters 17-24

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020)
**Coverage:** Story, worlds, characters, spaces, aesthetics, multiplayer
**Extraction Date:** 2025-10-18
**Total:** ~50 files, ~14,000 words of SupaSnake-specific knowledge

**Key Deliverables:**
- **Minimal Story Design**: Dynasty lore, variant flavor text, emergent collection narratives
- **Dynasties as Worlds**: CYBER/PRIMAL/COSMIC as coherent thematic realms
- **Variants as Characters**: Silent character design, personality through visuals
- **Labs as Spaces**: Architectural UI design (Collection/Breeding/Evolution Labs)
- **Visual/Audio Identity**: Dynasty-specific aesthetics, mobile-first design
- **Future Multiplayer**: Async-first social features (leaderboards, trading, guilds)

**Quick Refs Created:** Story fundamentals, indirect control, world building, character design, space design, presence, art direction, multiplayer design + 13 lenses

**How-Tos Created:** Apply story to SupaSnake, design dynasty lore, design dynasty worlds, design variants as characters, design lab spaces, create presence in mobile, design SupaSnake aesthetics, plan multiplayer features

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

**Typical game session queries (complete coverage):**
- Backend setup: 299 words (was 22,000 words from full spec) - save 21,701 words
- Energy system: 392 words (was 12,500 words) - save 12,108 words
- Core gameplay: 379 words (was 18,000 words) - save 17,621 words
- Lab systems: 344 words (was 11,000 words) - save 10,656 words
- UI framework: 437 words (was 23,000 words) - save 22,563 words
- Dynasties: 270 words (was 15,000 words) - save 14,730 words
- Glossary: 503 words (was 13,800 words) - save 13,297 words

**Total game session:** Load ~2,600 words instead of ~115,000 words
**Savings:** ~112,400 words (~150k tokens)

**Combined typical session:** Platform (850) + Game (2,600) = 3,450 words instead of 130,749 words
**Total Savings:** 127,299 words (~170k tokens) = ~85% context budget saved

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

### Game Structure (Complete Coverage - v2.2)

```
knowledge_base/game/
├── quick_ref/                                # 21 files, ~8,186 words total
│   ├── backend_supabase.md                   # 299w - Database, real-time, RLS
│   ├── auth_system.md                        # 399w - JWT, sessions, permissions
│   ├── core_snake_game.md                    # 379w - Snake mechanics, collision
│   ├── energy_system.md                      # 392w - Stamina, regeneration
│   ├── resource_generation.md                # 500w - DNA earning formulas
│   ├── classic_mode.md                       # 588w - Victory, difficulty
│   ├── collection_lab.md                     # 344w - Panini book UI
│   ├── breeding_lab.md                       # 344w - Breeding mechanics
│   ├── evolution_lab.md                      # 415w - Evolution (v0.5+)
│   ├── lab_ui.md                             # 442w - Lab navigation
│   ├── ui_framework.md                       # 437w - React Native structure
│   ├── dynasties.md                          # 270w - 3 dynasties, 30 variants
│   ├── breeding_rules.md                     # 252w - Breeding formula
│   ├── collection_targets.md                 # 203w - Panini psychology
│   ├── economic_balance.md                   # 265w - DNA costs, progression
│   ├── glossary.md                           # 503w - Key terminology
│   ├── system_graph.md                       # 435w - Dependencies, build order
│   ├── player_journey.md                     # 674w - Player flow, retention
│   ├── mvp_scope.md                          # 297w - v0.1/v0.5/v1.0
│   ├── art_pipeline.md                       # 334w - Midjourney + 3D
│   └── constraints.md                        # 414w - Technical/business/design
│
├── how_to/                                   # 11 files, ~16,411 words total
│   ├── setup_supabase_backend.md             # 1,908w - Database, RLS, storage
│   ├── implement_auth.md                     # 1,650w - Auth flow, JWT
│   ├── implement_energy_system.md            # 1,101w - Energy state, regen
│   ├── tune_classic_mode.md                  # 1,179w - Balance tuning
│   ├── design_lab_ui.md                      # 1,746w - Lab screens, Panini style
│   ├── implement_evolution.md                # 1,530w - Evolution (v0.5+)
│   ├── create_react_native_screens.md        # 1,530w - Screen creation
│   ├── add_new_dynasty.md                    # 1,248w - Monthly expansion
│   ├── create_variant_art.md                 # 1,543w - Midjourney workflow
│   ├── balance_progression.md                # 1,529w - Progression curves
│   └── design_breeding.md                    # 1,447w - Breeding mechanics
│
└── reference/                                # Comprehensive specs
    └── MAP_to_full_docs.md                   # Links to 27 comprehensive docs
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

**Version:** 2.5 - Complete Game Coverage + Game Design (Schell Batches 1-3)
**Coverage:**
- Platform: 7 quick_refs + 5 how_tos + 5 reference docs
- Game Implementation: 21 quick_refs + 11 how_tos covering ALL 26 systems
- Game Design Batch 1: 29 quick_refs + 12 how_tos + 8 summaries (Ch 1-8, Foundations)
- Game Design Batch 2: 30 quick_refs + 11 how_tos + 8 summaries (Ch 9-16, Psychology/Mechanics/Balance)
- Game Design Batch 3: ~35 quick_refs + 8 how_tos + 8 summaries (Ch 17-24, Story/Worlds/Aesthetics/Multiplayer)
- **Total Game Design**: ~94 quick_refs + 31 how_tos + 24 summaries = ~149 files, ~96,000 words
**Philosophy:** Database-like query optimization for documentation
**Result:** Top 1% context management + comprehensive game design knowledge

*Query efficiency: Load 300 words instead of 34,000 words per game design query. Context savings: 99%+ reduction.*
