# Schell Extraction Framework - Batch 1 (Chapters 1-8)

**Purpose**: Guide extraction sub-agents to create consistent, query-optimized game design knowledge from Jesse Schell's "The Art of Game Design" (1st Edition, 2008).

**Version**: Batch 1
**Chapters**: 1-8 (Foundations, Experience Design, Player Understanding)
**Created**: 2025-10-18

---

## Batch 1 Chapter Overview

**Chapter 1**: In the Beginning, There Is the Designer
- Designer mindset, confidence building ("I am a game designer")
- Skills needed (15+ disciplines)
- The Most Important Skill: Listening
- Five Kinds of Listening (Team, Audience, Game, Client, Self)
- The Secret of the Gifted (love of work > innate talent)

**Chapter 2**: The Designer Creates an Experience
- Game vs Experience distinction
- Three Practical Approaches to experience design
- Introspection techniques
- Essential Experience concept
- "All That's Real Is What You Feel"

**Chapter 3**: The Experience Rises Out of a Game
- Game definitions
- What constitutes a game
- Theoretical foundations

**Chapters 4-7**: [To be identified from actual files]

**Chapter 8**: The Game is Made for a Player / Prototyping
- Demographics analysis
- Psychographics analysis
- Player understanding
- (Possibly software engineering/prototyping - verify in file)

---

## Extraction Principles

### 1. Timelessness Filter (2008 Edition Context)

**Extract WITHOUT modification:**
- ✅ Player psychology principles
- ✅ Experience design concepts
- ✅ Core game mechanics theory
- ✅ Designer mindset principles
- ✅ Listening frameworks
- ✅ Balance concepts

**Note as DATED (but extract with modern context):**
- ⚠️ Technology examples (mobile was nascent in 2008)
- ⚠️ Social network references (pre-Facebook gaming era)
- ⚠️ Distribution models (pre-App Store)
- ⚠️ Monetization examples (pre-F2P mobile dominance)

**Example annotation:**
```markdown
**Schell's Example (2008):** "Console games on physical media..."
**Modern Context:** Mobile F2P games distributed via app stores...
**SupaSnake Application:** Downloaded via iOS App Store / Google Play...
```

### 2. SupaSnake Relevance Tiers

**CRITICAL** (must create how_to guides):
- Player psychology (demographics, psychographics)
- Experience design for mobile
- Listening to your game/audience
- Designer confidence in solo/small team dev

**HIGH** (create quick_refs + consider how_tos):
- Core game theory
- Experience vs game distinction
- Essential experience concept

**MEDIUM** (create quick_refs):
- Historical context
- Theoretical foundations
- Designer skills inventory

**LOW** (reference summaries only):
- Outdated technology examples
- Non-applicable concepts

---

## Output Structure Requirements

### Quick Refs (200-300 words each)

**Naming Convention:**
- Principles: `principle_[name].md`
- Concepts: `concept_[name].md`
- Lenses (if introduced): `lens_[name].md`

**Required Sections:**
```markdown
# [Principle/Concept Name] - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (2008), Chapter X

## Core Concept
[2-3 sentence summary]

## Key Points
- Point 1
- Point 2
- Point 3

## Application to SupaSnake
[How this applies to our mobile Snake + collection game]

## Modern Context (if dated)
**2008 Context:** [Original context]
**2025 Mobile F2P:** [Modern interpretation]

## See Also
- **How-To:** @knowledge_base/game_design/how_to/apply_[concept]_to_supasnake.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/[relevant_system].md
- **Complete:** @knowledge_base/game_design/reference/batch1_chapters/chapter_0X_summary.md
```

### How-To Guides (800-1,200 words)

**Naming Convention:**
- `apply_[concept]_to_supasnake.md`
- `implement_[framework]_in_supasnake.md`

**Required Sections:**
```markdown
# How to Apply [Concept] to SupaSnake

**Schell's Principle:** [1-2 sentence summary]
**SupaSnake Context:** [Why this matters for mobile Snake + collection]

---

## Overview
[What we're implementing and why]

## Step 1: [Action]
[Detailed explanation with examples]

**Example from SupaSnake:**
[Concrete application]

## Step 2: [Action]
[Continue...]

---

## SupaSnake-Specific Implementation

**Collection Lab:**
[How this concept applies]

**Core Snake Gameplay:**
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
- **Quick Ref:** @knowledge_base/game_design/quick_ref/principle_[name].md
- **SupaSnake:** @knowledge_base/game/quick_ref/[system].md
```

### Reference Summaries (500-800 words per chapter)

**Naming Convention:**
- `chapter_0X_[title_slug]_summary.md`

**Required Sections:**
```markdown
# Chapter X: [Full Title] - Summary

**Edition:** 1st Edition (2008)
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
[List any lenses from this chapter]

## SupaSnake Applications
[How the chapter's concepts apply to SupaSnake]

## 2008 vs 2025 Context
[Notable dated elements and modern interpretations]

## Cross-References
- [Related SupaSnake docs]
- [Related Schell concepts]
```

---

## SupaSnake Cross-Reference Patterns

### When to Link SupaSnake Docs

**Player Psychology → Link to:**
- `@knowledge_base/game/quick_ref/player_journey.md`
- `@knowledge_base/game/quick_ref/collection_targets.md` (Panini psychology)

**Experience Design → Link to:**
- `@knowledge_base/game/quick_ref/collection_lab.md`
- `@knowledge_base/game/quick_ref/lab_ui.md`

**Retention/Engagement → Link to:**
- `@knowledge_base/game/quick_ref/energy_system.md`
- `@knowledge_base/game/how_to/balance_progression.md`

**Game Mechanics → Link to:**
- `@knowledge_base/game/quick_ref/core_snake_game.md`
- `@knowledge_base/game/quick_ref/breeding_rules.md`

---

## Quality Standards

### Word Counts
- Quick Refs: 200-300 words (strict)
- How-Tos: 800-1,200 words (flexible for comprehensive guides)
- Reference Summaries: 500-800 words per chapter

### Terminology
- Use "SupaSnake" (not "the game" or "our game")
- Use SupaSnake terminology: DNA (not points), variant (not skin), dynasty, generation
- Reference Schell's original terms, then translate to SupaSnake context

### Completeness
- ❌ No placeholder sections
- ✅ All cross-references valid
- ✅ Every principle gets SupaSnake application
- ✅ Every how_to has concrete examples

---

## Sub-Agent Assignments

### Agent 1: Foundations (Chapters 1-2)
**Focus:** Designer mindset, confidence, listening, experience design
**Priority:** CRITICAL - foundational for all SupaSnake development
**Expected Output:**
- `principle_confidence.md`
- `principle_listening.md`
- `principle_five_listenings.md`
- `principle_major_gift.md`
- `concept_experience_vs_game.md`
- `concept_essential_experience.md`
- `apply_five_listenings_to_supasnake.md`
- `apply_experience_design_to_collection_lab.md`
- 2 chapter summaries

### Agent 2: Theory (Chapters 3-4)
**Focus:** Game definitions, theoretical foundations
**Priority:** MEDIUM - provides theoretical grounding
**Expected Output:**
- `concept_game_definition.md`
- Core theory quick_refs
- 2 chapter summaries

### Agent 3: Mid-Batch (Chapters 5-6)
**Focus:** [To be determined from actual chapter content]
**Priority:** [TBD]
**Expected Output:**
- TBD based on chapter content

### Agent 4: Player Understanding (Chapters 7-8)
**Focus:** Demographics, psychographics, player psychology
**Priority:** CRITICAL - essential for mobile F2P audience understanding
**Expected Output:**
- `concept_demographics.md`
- `concept_psychographics.md`
- `apply_player_psychology_to_supasnake.md`
- `understand_supasnake_target_audience.md`
- 2 chapter summaries

---

## Verification Checklist

Before returning results, verify:

✅ **Word Counts:** All files within specified ranges
✅ **Cross-References:** All links use @knowledge_base/... pattern
✅ **SupaSnake Application:** Every principle has concrete SupaSnake example
✅ **Modern Context:** Dated 2008 examples noted and modernized
✅ **Terminology:** Uses SupaSnake terms (DNA, variant, dynasty)
✅ **Completeness:** No placeholders, all sections filled
✅ **Quality:** Actionable, specific, production-ready

---

**End of Extraction Framework**

**Instructions for Sub-Agents:**
1. Read this entire framework FIRST
2. Read assigned chapter files
3. Extract principles, concepts, lenses
4. Create quick_refs + how_tos + reference summaries
5. Apply modern context to 2008 material
6. Link to SupaSnake docs
7. Verify quality checklist
8. Return file list with word counts
