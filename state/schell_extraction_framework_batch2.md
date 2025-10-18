# Schell Extraction Framework - Batch 2 (Chapters 9-16)

**Purpose**: Guide extraction sub-agents to create consistent, query-optimized game design knowledge from Jesse Schell's "The Art of Game Design" (3rd Edition, 2020).

**Version**: Batch 2
**Edition**: 3rd Edition (2020) - Updated content
**Chapters**: 9-16 (Player Psychology, Game Mechanics)
**Created**: 2025-10-18

---

## Batch 2 Chapter Overview

**Chapter 9**: The Game Is Made for a Player
- Player understanding fundamentals
- Demographics and psychographics
- Player empathy and projection

**Chapter 10**: The Experience Is in the Player's Mind
- Player mental models
- Focus and attention
- Empathy techniques
- Imagination and motivation

**Chapter 11**: The Player's Mind Is Driven by the Player's Motivation
- Intrinsic vs extrinsic motivation
- Player needs and desires
- Motivational frameworks
- Engagement drivers

**Chapter 12**: Some Elements Are Game Mechanics
- Six core mechanics: Space, Objects, Actions, Rules, Skill, Chance
- Mechanic interactions
- Mechanical balance

**Chapter 13**: Game Mechanics Must Be in Balance
- Types of game balance
- Balancing methodologies
- Economy balancing
- Dynamic balance

**Chapter 14**: Game Mechanics Support Puzzles
- Puzzle design principles
- Good vs bad puzzles
- Puzzle integration

**Chapter 15**: Players Play Games through an Interface
- Interface design
- Input/output channels
- Feedback loops
- Usability

**Chapter 16**: Experiences Can Be Judged by Their Interest Curves
- Pacing and flow
- Interest curve patterns
- Engagement measurement

---

## Extraction Principles

### 1. Edition Context (3rd Edition 2020 vs Batch 1's 1st Edition 2008)

**What's Updated in 3rd Edition:**
- ✅ Modern game references (Portal 2, modern mobile games, current platforms)
- ✅ Updated technology landscape (smartphones ubiquitous, VR/AR emerging)
- ✅ Modern monetization (F2P, live service, mobile-first)
- ✅ Current player demographics (broader, more diverse)

**What Remains Timeless:**
- ✅ Player psychology principles
- ✅ Core mechanics theory
- ✅ Balance concepts
- ✅ Puzzle design principles

**Extract WITH 2020 context** (don't need to modernize to 2025):
- Technology examples are already current
- Monetization already reflects modern F2P
- Demographics already reflect diverse audience

**Still Modernize to SupaSnake Mobile Context:**
- Apply to mobile touchscreen (even though 2020 edition mentions mobile)
- Apply to solo/small team indie dev (book assumes teams)
- Apply to React Native/Supabase stack specifically

### 2. SupaSnake Relevance Tiers

**CRITICAL** (must create how_to guides):
- Player motivation for mobile F2P
- Game mechanics for Snake + collection hybrid
- Balance for progression systems (DNA, energy, breeding)
- Interface for mobile touch (Snake controls, Collection Lab UI)
- Interest curves for session-based mobile play

**HIGH** (create quick_refs + consider how_tos):
- Player mental models
- Puzzle design (optional side-content)
- Space mechanics (Snake grid)
- Pacing and flow

**MEDIUM** (create quick_refs):
- Advanced balance methodologies
- Complex mechanics not in SupaSnake

**LOW** (reference summaries only):
- Mechanics not applicable (3D space, complex physics)

---

## Output Structure Requirements

### Quick Refs (200-300 words each)

**Naming Convention:**
- Mechanics: `mechanic_[name].md`
- Concepts: `concept_[name].md`
- Lenses (if introduced): `lens_[number]_[name].md`

**Required Sections:**
```markdown
# [Mechanic/Concept Name] - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter X

## Core Concept
[2-3 sentence summary]

## Key Points
- Point 1
- Point 2
- Point 3

## Application to SupaSnake
[How this applies to mobile Snake + collection game]

## Modern Mobile Context (if needed)
**3rd Edition (2020):** [What Schell says]
**SupaSnake Specific:** [Our mobile implementation]

## See Also
- **How-To:** @knowledge_base/game_design/how_to/apply_[concept]_to_supasnake.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/[relevant_system].md
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_[XX]_summary.md
```

### How-To Guides (800-1,200 words)

**Naming Convention:**
- `apply_[concept]_to_supasnake.md`
- `balance_[system]_in_supasnake.md`
- `design_[element]_for_supasnake.md`

**Required Sections:**
```markdown
# How to Apply [Concept] to SupaSnake

**Schell's Principle:** [1-2 sentence summary from 3rd edition]
**SupaSnake Context:** [Why this matters for mobile Snake + collection]

---

## Overview
[What we're implementing and why]

## Step 1: [Action]
[Detailed explanation with examples]

**Example from SupaSnake:**
[Concrete application to Snake, Collection Lab, Breeding, Energy System]

## Step 2: [Action]
[Continue...]

---

## SupaSnake-Specific Implementation

**Core Snake Gameplay:**
[How this concept applies]

**Collection Lab:**
[How this concept applies]

**Energy System:**
[How this concept applies]

**Dynasty/Breeding:**
[How this concept applies]

---

## Tips for Success
✅ **DO:**
- Tip 1
- Tip 2

❌ **DON'T:**
- Mistake 1
- Mistake 2

---

## See Also
- **Quick Ref:** @knowledge_base/game_design/quick_ref/[name].md
- **SupaSnake:** @knowledge_base/game/quick_ref/[system].md
```

### Reference Summaries (500-800 words per chapter)

**Naming Convention:**
- `chapter_[XX]_[title_slug]_summary.md`

**Required Sections:**
```markdown
# Chapter X: [Full Title] - Summary

**Edition:** 3rd Edition (2020)
**Relevance to SupaSnake:** [High/Medium/Low]

## Chapter Overview
[3-4 sentences on main themes]

## Key Concepts Extracted

### Concept 1: [Name]
[Brief summary]
**Quick Ref:** @knowledge_base/game_design/quick_ref/[file].md

### Concept 2: [Name]
[Continue...]

## Lenses Introduced
[List any lenses from this chapter with numbers]

## SupaSnake Applications
[How the chapter's concepts apply to SupaSnake]

## 3rd Edition Updates (vs 1st Edition)
[Notable updates from 2008 → 2020 if significant]

## Cross-References
- [Related SupaSnake docs]
- [Related Schell concepts from Batch 1]
```

---

## SupaSnake Cross-Reference Patterns

### Link to Batch 1 Concepts

**Player Psychology (Ch 9-11) → Link to Batch 1:**
- `@knowledge_base/game_design/quick_ref/concepts/concept_demographics.md` (Batch 1, Ch 8)
- `@knowledge_base/game_design/quick_ref/concepts/concept_psychographics.md` (Batch 1, Ch 8)
- `@knowledge_base/game_design/how_to/apply_to_supasnake/understand_supasnake_target_audience.md` (Emma & Tyler)

**Mechanics (Ch 12) → Link to SupaSnake Systems:**
- `@knowledge_base/game/quick_ref/core_snake_game.md`
- `@knowledge_base/game/quick_ref/collection_lab.md`
- `@knowledge_base/game/quick_ref/breeding_lab.md`

**Balance (Ch 13) → Link to SupaSnake Economy:**
- `@knowledge_base/game/quick_ref/economic_balance.md`
- `@knowledge_base/game/quick_ref/energy_system.md`
- `@knowledge_base/game/how_to/balance_progression.md`

**Interface (Ch 15) → Link to SupaSnake UI:**
- `@knowledge_base/game/quick_ref/lab_ui.md`
- `@knowledge_base/game/quick_ref/ui_framework.md`
- `@knowledge_base/game/how_to/create_react_native_screens.md`

**Interest Curves (Ch 16) → Link to SupaSnake Retention:**
- `@knowledge_base/game/quick_ref/player_journey.md`
- `@knowledge_base/game/quick_ref/energy_system.md` (pacing gates)

---

## Quality Standards

### Word Counts
- Quick Refs: 200-300 words (strict)
- How-Tos: 800-1,200 words (flexible for comprehensive guides)
- Reference Summaries: 500-800 words per chapter

### Terminology
- Use "SupaSnake" consistently
- Use SupaSnake terminology: DNA, variant, dynasty, generation, Collection Lab, Breeding Lab
- Reference Schell's original terms, then translate to SupaSnake context
- Use Emma & Tyler personas from Batch 1

### Completeness
- ❌ No placeholder sections
- ✅ All cross-references valid (link to both Batch 1 and existing SupaSnake docs)
- ✅ Every principle gets SupaSnake application
- ✅ Every how_to has concrete examples (Snake, Collection, Breeding, Energy)

### 3rd Edition Awareness
- Note when Schell's 2020 examples are already modern
- Still apply SupaSnake-specific mobile context
- Cross-reference improvements from 1st → 3rd edition if significant

---

## Sub-Agent Assignments

### Agent 1: Player Psychology (Chapters 9-10)
**Focus:** Player understanding, mental models, empathy, motivation foundations
**Priority:** CRITICAL - essential for mobile F2P player retention
**Expected Output:**
- `concept_player_mental_models.md`
- `concept_focus_attention.md`
- `concept_empathy.md`
- `concept_motivation_drivers.md`
- `lens_13_empathy.md` (if introduced)
- `lens_14_problem_solving.md` (if introduced)
- `apply_player_mental_models_to_supasnake.md`
- `design_for_player_attention.md`
- 2 chapter summaries

**Key Deliverable:** How do Emma & Tyler's mental models differ? How does SupaSnake design for both?

### Agent 2: Motivation Systems (Chapter 11)
**Focus:** Intrinsic vs extrinsic motivation, player needs, engagement
**Priority:** CRITICAL - core to mobile F2P retention
**Expected Output:**
- `concept_intrinsic_motivation.md`
- `concept_extrinsic_motivation.md`
- `concept_player_needs.md`
- Lenses related to motivation
- `balance_intrinsic_extrinsic_in_supasnake.md`
- `design_engagement_loops.md`
- 1 chapter summary

**Key Deliverable:** How does SupaSnake balance skill progression (intrinsic) with collection (extrinsic)?

### Agent 3: Core Mechanics & Balance (Chapters 12-13)
**Focus:** Six mechanics (Space, Objects, Actions, Rules, Skill, Chance), balance types
**Priority:** HIGH - essential for Snake gameplay + collection balance
**Expected Output:**
- `mechanic_space.md` (Snake grid)
- `mechanic_objects.md` (Snake, DNA, variants)
- `mechanic_actions.md` (movement, collection, breeding)
- `mechanic_rules.md` (collision, scoring)
- `mechanic_skill.md` (Snake mastery)
- `mechanic_chance.md` (variant RNG)
- `concept_game_balance.md`
- `balance_supasnake_mechanics.md`
- `tune_dna_economy.md`
- 2 chapter summaries

**Key Deliverable:** How do Snake mechanics interact with collection mechanics? Balance methodology for SupaSnake.

### Agent 4: Interface & Engagement (Chapters 14-16)
**Focus:** Puzzles, interface design, interest curves, pacing
**Priority:** HIGH - mobile UI/UX and retention critical
**Expected Output:**
- `concept_puzzle_design.md`
- `concept_interface_design.md`
- `concept_feedback_loops.md`
- `concept_interest_curves.md`
- `concept_pacing.md`
- `design_mobile_touch_interface.md`
- `create_engagement_curves.md`
- 3 chapter summaries

**Key Deliverable:** Mobile touch interface best practices. Interest curves for session-based play (5-10 min sessions).

---

## Verification Checklist

Before returning results, verify:

✅ **Word Counts:** All files within specified ranges
✅ **Cross-References:** All links use @knowledge_base/... pattern
✅ **SupaSnake Application:** Every concept has concrete SupaSnake example (Snake, Collection, Breeding, Energy)
✅ **Emma & Tyler:** Reference target personas from Batch 1 where relevant
✅ **Batch 1 Integration:** Link to relevant Batch 1 concepts (theme, listening, etc.)
✅ **3rd Edition Content:** Use 2020 edition examples/updates
✅ **Terminology:** Uses SupaSnake terms consistently
✅ **Completeness:** No placeholders, all sections filled
✅ **Quality:** Actionable, specific, production-ready

---

**End of Extraction Framework**

**Instructions for Sub-Agents:**
1. Read this entire framework FIRST
2. Read assigned chapter files from 3rd edition epub
3. Extract mechanics, concepts, lenses
4. Create quick_refs + how_tos + reference summaries
5. Apply to SupaSnake mobile context (Snake, Collection, Breeding, Energy)
6. Link to Batch 1 concepts where relevant (theme, personas, listening)
7. Link to existing SupaSnake docs
8. Verify quality checklist
9. Return file list with word counts
