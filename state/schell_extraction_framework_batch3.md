# Schell Extraction Framework - Batch 3 (Chapters 17-24)

**Purpose**: Guide extraction sub-agents to create consistent, query-optimized game design knowledge from Jesse Schell's "The Art of Game Design" (3rd Edition, 2020).

**Version**: Batch 3
**Edition**: 3rd Edition (2020)
**Chapters**: 17-24 (Story, Worlds, Aesthetics, Multiplayer)
**Created**: 2025-10-18

---

## Batch 3 Chapter Overview

**Chapter 17**: One Kind of Experience Is the Story
- Narrative design fundamentals
- Story as player experience
- Linear vs emergent storytelling

**Chapter 18**: Story and Game Structures Can Be Artfully Merged with Indirect Control
- Indirect control techniques
- Narrative pacing
- Player agency in story

**Chapter 19**: Stories and Games Take Place in Worlds
- World building
- Transmedia worlds
- World coherence

**Chapter 20**: Worlds Contain Characters
- Character design
- NPCs vs player characters
- Character relationships

**Chapter 21**: Worlds Contain Spaces
- Level design
- Architectural game design
- Space as storytelling

**Chapter 22**: Some Interfaces Create a Feeling of Presence
- Immersion and presence
- VR/AR considerations
- Breaking the fourth wall

**Chapter 23**: The Look and Feel of a World Is Defined by Its Aesthetics
- Art direction
- Visual language
- Audio design

**Chapter 24**: Some Games Are Played with Other Players
- Multiplayer design
- Cooperation vs competition
- Social dynamics

---

## Edition Context (3rd Edition 2020)

**Already Modern:**
- VR/AR examples (2020 was post-VR wave)
- Modern multiplayer patterns (Battle Royale, live service)
- Transmedia franchises (Marvel, Pokémon)

**Still Modernize to SupaSnake:**
- Apply to mobile single-player with potential multiplayer future
- Solo dev context (not AAA team)
- React Native / Supabase stack
- Collection-focused game (not story-heavy)

---

## SupaSnake Relevance Tiers

**MEDIUM** (create how_tos + quick_refs):
- Story: SupaSnake has minimal narrative (dynasty lore, variant descriptions)
- Characters: Variants as characters (personality through design)
- Aesthetics: Mobile art style, audio design
- Multiplayer: Future feature (leaderboards, trading, co-op breeding)

**HIGH** (create detailed how_tos):
- Worlds: Dynasty worlds as thematic containers
- Spaces: Lab UI as architectural space
- Indirect Control: Player-driven collection journey

**LOW** (reference summaries only):
- Presence: Not VR/AR game
- Advanced story techniques: Minimal narrative

---

## Output Structure Requirements

### Quick Refs (200-300 words each)

**Naming Convention:**
- Story: `concept_story_[name].md`
- Worlds: `concept_world_[name].md`
- Characters: `concept_character_[name].md`
- Spaces: `concept_space_[name].md`
- Aesthetics: `concept_aesthetic_[name].md`
- Multiplayer: `concept_multiplayer_[name].md`
- Lenses: `lens_[number]_[name].md`

**Required Sections:**
```markdown
# [Concept Name] - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter X

## Core Concept
[2-3 sentence summary]

## Key Points
- Point 1
- Point 2
- Point 3

## Application to SupaSnake
[How this applies to mobile Snake + collection game]

**SupaSnake Context:**
- [Specific application to dynasties, variants, labs, or collection]

## See Also
- **How-To:** @knowledge_base/game_design/how_to/[relevant_guide].md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/[relevant_system].md
```

### How-To Guides (800-1,200 words)

**Naming Convention:**
- `apply_[concept]_to_supasnake.md`
- `design_[element]_for_supasnake.md`

**Required Sections:**
```markdown
# How to [Action] for SupaSnake

**Schell's Principle:** [1-2 sentence summary from 3rd edition]
**SupaSnake Context:** [Why this matters for mobile collection game]

---

## Overview
[What we're implementing and why]

## Step 1: [Action]
[Detailed explanation with examples]

**SupaSnake Example:**
[Concrete application to dynasties, variants, collection, or gameplay]

---

## SupaSnake-Specific Implementation

**Dynasty Worlds:**
[How concept applies to CYBER, PRIMAL, COSMIC themes]

**Variant Design:**
[How concept applies to variant personality/character]

**Lab UI:**
[How concept applies to Collection/Breeding/Evolution Labs]

**Future Multiplayer:**
[How concept applies to planned multiplayer features]

---

## Tips for Success
✅ **DO:**
- Tip 1
- Tip 2

❌ **DON'T:**
- Mistake 1
- Mistake 2
```

### Reference Summaries (500-800 words per chapter)

**Naming Convention:**
- `chapter_[XX]_[title_slug]_summary.md`

---

## SupaSnake Cross-Reference Patterns

### Link to Previous Batches

**Batch 1 (Ch 1-8):**
- Theme → Story (narrative reinforcement)
- Experience design → World building
- Player psychology → Character design

**Batch 2 (Ch 9-16):**
- Player mental models → Story comprehension
- Motivation → Multiplayer engagement
- Interface design → Presence and immersion
- Interest curves → Story pacing

### Link to SupaSnake Systems

**Story & Narrative:**
- `@knowledge_base/game/quick_ref/dynasties.md` (dynasty lore)
- `@docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md` (complete lore)

**Worlds & Aesthetics:**
- `@knowledge_base/game/quick_ref/art_pipeline.md` (visual style)
- `@knowledge_base/game/quick_ref/dynasties.md` (thematic worlds)

**Characters:**
- `@knowledge_base/game/quick_ref/dynasties.md` (variants as characters)

**Multiplayer:**
- `@knowledge_base/game/quick_ref/player_journey.md` (social features future)

---

## Sub-Agent Assignments

### Agent 1: Story & Narrative (Chapters 17-18)
**Focus:** Story design, indirect control, narrative in collection games
**Priority:** MEDIUM - SupaSnake has minimal narrative
**Expected Output:**
- Quick refs: concept_story_fundamentals.md, concept_indirect_control.md, concept_emergent_narrative.md, relevant lenses
- How-tos: apply_story_to_supasnake.md, design_dynasty_lore.md
- Reference: chapter_17_story_summary.md, chapter_18_indirect_control_summary.md

**Key Deliverable:** How to use minimal narrative (dynasty lore, variant descriptions) to reinforce theme and collection motivation

### Agent 2: Worlds & Characters (Chapters 19-20)
**Focus:** World building, character design, transmedia
**Priority:** HIGH - Dynasties are thematic worlds, variants are characters
**Expected Output:**
- Quick refs: concept_world_building.md, concept_transmedia.md, concept_character_design.md, concept_character_relationships.md, relevant lenses
- How-tos: design_dynasty_worlds.md, design_variants_as_characters.md
- Reference: chapter_19_worlds_summary.md, chapter_20_characters_summary.md

**Key Deliverable:** Design dynasties as cohesive thematic worlds, variants as collectible characters with personality

### Agent 3: Spaces & Presence (Chapters 21-22)
**Focus:** Level design, architectural game design, immersion
**Priority:** HIGH - Lab UI is architectural space design
**Expected Output:**
- Quick refs: concept_space_design.md, concept_architectural_design.md, concept_presence.md, relevant lenses
- How-tos: design_lab_spaces.md, create_presence_in_mobile.md
- Reference: chapter_21_spaces_summary.md, chapter_22_presence_summary.md

**Key Deliverable:** Design Collection/Breeding/Evolution Labs as explorable spaces that create presence

### Agent 4: Aesthetics & Multiplayer (Chapters 23-24)
**Focus:** Art direction, audio design, multiplayer patterns
**Priority:** HIGH - Visual/audio identity critical, multiplayer is future feature
**Expected Output:**
- Quick refs: concept_art_direction.md, concept_visual_language.md, concept_audio_design.md, concept_multiplayer_design.md, concept_cooperation_competition.md, relevant lenses
- How-tos: design_supasnake_aesthetics.md, plan_multiplayer_features.md
- Reference: chapter_23_aesthetics_summary.md, chapter_24_multiplayer_summary.md

**Key Deliverable:** Define SupaSnake's visual/audio identity, plan future multiplayer (leaderboards, trading, co-op breeding)

---

## Quality Standards

### Word Counts
- Quick Refs: 200-300 words (strict)
- How-Tos: 800-1,200 words (flexible for comprehensive guides)
- Reference Summaries: 500-800 words per chapter

### Terminology
- Use "SupaSnake" consistently
- Use SupaSnake terminology: DNA, variant, dynasty, generation, Collection Lab, Breeding Lab
- Dynasty names: CYBER, PRIMAL, COSMIC (all caps)
- Reference Emma & Tyler personas from Batch 1
- Cross-reference Batch 1 theme: "Collection joy through mastery achievement"

### Completeness
- ❌ No placeholder sections
- ✅ All cross-references valid (link to Batches 1-2 and SupaSnake docs)
- ✅ Every principle gets SupaSnake application
- ✅ Story/character/world concepts applied to collection game context (not ignored because "SupaSnake has no story")

### SupaSnake-Specific Applications

**Story (even though minimal):**
- Dynasty origin lore (why CYBER/PRIMAL/COSMIC exist)
- Variant flavor text (personality through description)
- Collection journey as emergent narrative ("I completed CYBER dynasty!")

**Worlds:**
- Each dynasty is a thematic world
- CYBER: Digital/tech aesthetic
- PRIMAL: Nature/ancient aesthetic
- COSMIC: Space/mystical aesthetic

**Characters:**
- Variants are collectible characters
- Express personality through design (not dialogue)
- Build emotional connection through collection

**Spaces:**
- Collection Lab: Gallery/museum space
- Breeding Lab: Workshop space
- Evolution Lab: Transformation space
- Each lab has distinct architectural identity

**Aesthetics:**
- Mobile-first visual design (readable at small sizes)
- Dynasty-specific color palettes
- Audio cues for collection, breeding, evolution
- Haptic feedback for rare pulls

**Multiplayer (future):**
- Leaderboards (competitive)
- Trading (social/cooperative)
- Co-op breeding (collaborative)
- Async multiplayer (mobile-friendly)

---

## Verification Checklist

Before returning results, verify:

✅ **Word Counts:** All files within specified ranges
✅ **Cross-References:** All links use @knowledge_base/... pattern
✅ **SupaSnake Application:** Every concept applied to collection game context
✅ **Emma & Tyler:** Reference target personas where relevant
✅ **Batch 1-2 Integration:** Link to previous concepts (theme, motivation, mechanics)
✅ **Dynasty Context:** CYBER/PRIMAL/COSMIC used appropriately
✅ **Story Justification:** Explain how minimal narrative supports collection
✅ **Terminology:** Consistent SupaSnake vocabulary
✅ **Completeness:** No placeholders, all sections filled
✅ **Quality:** Actionable, specific, production-ready

---

**End of Extraction Framework**

**Instructions for Sub-Agents:**
1. Read this entire framework FIRST
2. Read assigned chapter files from 3rd edition epub
3. Extract story/world/character/aesthetic/multiplayer concepts
4. Create quick_refs + how_tos + reference summaries
5. Apply to SupaSnake context (collection game, dynasties as worlds, variants as characters)
6. Even though SupaSnake has minimal narrative, apply story principles to dynasty lore and collection journey
7. Link to Batches 1-2 concepts where relevant
8. Link to existing SupaSnake docs
9. Verify quality checklist
10. Return file list with word counts
