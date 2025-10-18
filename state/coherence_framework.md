# Coherence Framework - SupaSnake Game Documentation

**Purpose**: Ensure all documentation extractor sub-agents use consistent terminology, naming conventions, and cross-reference patterns.

**Version**: 1.0
**Created**: 2025-10-18
**Status**: CANONICAL - All sub-agents MUST read this FIRST

---

## 1. Key Terminology (from GLOSSARY)

### ✅ DEFINED Terms (Use These)

**DNA (Quantum DNA)**
- **What**: Primary in-game currency earned through gameplay
- **Use**: "DNA" or "Quantum DNA" (both acceptable)
- **❌ Don't Use**: "DNA Strands", "points", "currency" (too generic)
- **Example**: "Costs 200 DNA to breed" ✅

**Dynasty**
- **What**: Collection of 10 thematically-related snake variants
- **MVP Count**: 3 dynasties (CYBER, PRIMAL, COSMIC)
- **Post-MVP**: +1 dynasty per month
- **Example**: "The CYBER dynasty features neon aesthetics" ✅

**Variant**
- **What**: Individual snake within a dynasty (30 total in MVP: 10×3)
- **Properties**: Name, rarity, stats, generation, dynasty membership
- **❌ Don't Use**: "skin", "type", "breed" (incorrect)
- **Example**: "CYBER SPARK is a Common variant" ✅

**Generation**
- **What**: Breeding depth counter (Gen 0 = starter, Gen 1 = first breed)
- **Formula**: `max(parent1.gen, parent2.gen) + 1`
- **Example**: "Gen 2 snake bred from two Gen 1 parents" ✅

**Rarity**
- **What**: Variant scarcity tier affecting stats and unlock cost
- **Tiers**: Common (3) / Uncommon (3) / Rare (2) / Epic (1) / Legendary (1)
- **Distribution**: Per dynasty (10 variants total)
- **Example**: "Epic variants cost 800 DNA to unlock" ✅

**Breeding** (v0.1)
- **What**: Combine two snakes to create offspring (same dynasty only in v0.1)
- **❌ Don't Confuse With**: Evolution (different system, v0.5+)
- **Formula**: `cost = 200 + (avg_generation × 100)` DNA
- **Example**: "Breeding two Gen 0 snakes costs 200 DNA" ✅

**Evolution** (v0.5+)
- **What**: Transform single snake to higher rarity (v0.5 feature)
- **❌ Don't Confuse With**: Breeding (separate system)
- **Status**: NOT in v0.1 MVP
- **Example**: "Evolution unlocks in v0.5" ✅

**Collection**
- **What**: All variants the player owns (can have duplicates)
- **❌ Don't Confuse With**: Set (grouping of variants)
- **Example**: "Player's collection includes 15 snakes" ✅

**Set**
- **What**: Grouping of variants (dynasty set, rarity set, generation set)
- **Set Bonus**: +10% DNA income per completed dynasty set
- **Example**: "Completing the CYBER dynasty set grants +10% DNA" ✅

**Clan**
- **What**: Player organization (social feature, v1.0)
- **❌ Don't Use**: "Corp", "Corporation", "Guild"
- **Example**: "Join a clan to compete in clan wars" ✅

---

## 2. System Dependencies (from SYSTEM_GRAPH)

### Tier 0: Foundation (No Dependencies)
- **Core Snake Game**: Snake mechanics, grid, movement, collision
- **UI Framework**: React Native, navigation, components
- **Backend (Supabase)**: Database, API, CDN, real-time
- **Auth System**: Login, JWT, sessions, user accounts

**Build First**: These 4 systems are independent, can build in parallel

---

### Tier 1: Core Loop (Depends on Tier 0)
- **Energy System**: Stamina for gameplay (depends on Auth for user state)
- **Resource Generation**: DNA collection (depends on Core Snake)
- **Classic Mode**: Classic Snake gameplay (depends on Core Snake + Energy)

**Build Second**: After Tier 0 complete

---

### Tier 2: Meta-Game (Depends on Tier 0 + Tier 1)
- **Collection Lab**: View owned snakes (depends on Backend + Auth)
- **Dynasty System**: 3 dynasties, 30 variants (depends on Backend)
- **Breeding Lab**: Breed snakes (depends on Dynasty + Collection + Resources)
- **Evolution Lab**: Transform snakes (depends on Dynasty + Collection, v0.5+)
- **Lab UI**: Lab navigation (depends on UI Framework)

**Build Third**: After core loop functional

---

### Tier 3-6: Advanced Features
- **Abilities System** (v0.5): Speed boost, shields, etc.
- **PvP Arena** (v1.0): Competitive multiplayer
- **Leaderboards** (v1.0): Rankings
- **Social Features** (v1.0): Clans, gifting

**Build Last**: Post-MVP features

---

## 3. Naming Conventions

### File Names
- **Pattern**: `snake_case_with_underscores.md`
- **Examples**:
  - ✅ `backend_supabase.md`
  - ✅ `core_snake_game.md`
  - ✅ `collection_lab.md`
  - ❌ `BackendSupabase.md` (PascalCase)
  - ❌ `backend-supabase.md` (kebab-case)

### Component Names (Code)
- **Pattern**: `PascalCase`
- **Examples**:
  - ✅ `CollectionLab.tsx`
  - ✅ `SnakeGrid.tsx`
  - ✅ `DynastyCard.tsx`

### Database Tables (Supabase)
- **Pattern**: `lowercase_snake_case` (singular or plural as needed)
- **Examples**:
  - ✅ `users`
  - ✅ `snake_variants`
  - ✅ `player_collection`
  - ✅ `breeding_history`

### Variable Names (Code)
- **Pattern**: `camelCase`
- **Examples**:
  - ✅ `currentDNA`
  - ✅ `selectedVariant`
  - ✅ `breedingCost`

---

## 4. Cross-Reference Patterns

### Quick Reference Links
**Pattern**: `@knowledge_base/game/quick_ref/[system].md`

**Examples**:
- ✅ `@knowledge_base/game/quick_ref/dynasties.md`
- ✅ `@knowledge_base/game/quick_ref/breeding_rules.md`
- ✅ `@knowledge_base/game/quick_ref/backend_supabase.md`

### How-To Links
**Pattern**: `@knowledge_base/game/how_to/[task].md`

**Examples**:
- ✅ `@knowledge_base/game/how_to/add_new_dynasty.md`
- ✅ `@knowledge_base/game/how_to/setup_supabase_backend.md`
- ✅ `@knowledge_base/game/how_to/implement_auth.md`

### Complete Spec Links
**Pattern**: `@docs/game/systems/[SYSTEM_NAME].md` or `@docs/game/[DOCUMENT_NAME].md`

**Examples**:
- ✅ `@docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md`
- ✅ `@docs/game/systems/BACKEND_SUPABASE_part1.md`
- ✅ `@docs/game/03_GLOSSARY.md`

### Platform Documentation Links
**Pattern**: `@knowledge_base/platform/[tier]/[file].md`

**Examples**:
- ✅ `@knowledge_base/platform/quick_ref/decision_matrix.md`
- ✅ `@knowledge_base/platform/how_to/use_subagents.md`

---

## 5. Design Constraints

### Technical Constraints
- **Performance**: 60fps target (16.67ms frame budget)
- **Memory**: 512MB RAM maximum
- **App Size**: <100MB total (Apple App Store limit)
- **Platform**: Mobile-first (iOS/Android via React Native)
- **Backend**: Supabase (PostgreSQL + real-time + storage + auth)

### Business Constraints
- **Budget**: $120/month (Midjourney Pro for art generation)
- **Timeline**:
  - v0.1 MVP: 10 weeks (Weeks 1-10)
  - v0.5 Abilities: +5 weeks (Weeks 11-15)
  - v1.0 PvP: +5 weeks (Weeks 16-20)
- **Team**: Solo developer + AI assistance
- **Art**: 2D Midjourney (not 3D for MVP)

### Design Constraints
- **Dynasty Count**:
  - MVP: 3 dynasties (CYBER, PRIMAL, COSMIC)
  - Post-MVP: +1 dynasty per month
  - System must be expandable from start
- **Variants Per Dynasty**: 10 (rarity distribution: 3/3/2/1/1)
- **Collection Model**: Panini book style (psychological hooks: scarcity, completion, visual progress)
- **Art Pipeline**: Midjourney 2D cards + simple 3D snake with color/shader
- **Visual Disconnect**: Accept that gameplay (3D snake) differs from collection art (2D Midjourney)

---

## 6. MVP Scope (v0.1, v0.5, v1.0)

### v0.1 MVP (Weeks 1-10)
**Core Features**:
- 3 dynasties (CYBER, PRIMAL, COSMIC)
- 30 variants total (10 per dynasty)
- Collection Lab (Panini book UI)
- Breeding Lab (same-dynasty only)
- Classic Mode gameplay
- Energy System
- DNA collection
- Basic backend + auth

**What's NOT in v0.1**:
- ❌ Abilities (v0.5)
- ❌ Evolution (v0.5)
- ❌ Cross-dynasty breeding (v0.5)
- ❌ PvP (v1.0)
- ❌ Leaderboards (v1.0)
- ❌ Social features (v1.0)

### v0.5 Abilities Update (Weeks 11-15)
**Adds**:
- Abilities system (Speed Boost, Shield, Magnet, etc.)
- Evolution Lab (transform snakes to higher rarity)
- Cross-dynasty breeding
- Expanded progression

### v1.0 PvP Launch (Weeks 16-20)
**Adds**:
- PvP Arena (competitive multiplayer)
- Leaderboards (global + clan rankings)
- Social features (clans, gifting, chat)

---

## 7. Documentation Extraction Guidelines

### Quick Reference (200-300 words)
**Answer**: "What is this system?"

**Must Include**:
- 2-3 sentence overview
- Key features (bulleted list)
- Core concepts (table or bullets)
- Quick facts (costs, timelines, constraints)
- Cross-references (3-5 links to related docs)

**Format**:
```markdown
# [System Name] - Quick Reference

[2-3 sentence overview]

## Key Features
- Feature 1: [brief]
- Feature 2: [brief]

## Core Concepts
| Concept | Description |
|---------|-------------|
| ...     | ...         |

## Quick Facts
- Fact 1
- Fact 2

## See Also
- **Quick Ref**: @knowledge_base/game/quick_ref/[related].md
- **How-To**: @knowledge_base/game/how_to/[guide].md
- **Complete Spec**: @docs/game/systems/[full_doc].md
```

### How-To (800-1,200 words)
**Answer**: "How do I implement/use this?"

**Must Include**:
- Clear goal statement
- Timeline/duration
- Prerequisites
- Step-by-step process (numbered)
- Code examples with syntax highlighting
- Tips for success
- Common mistakes to avoid
- Cross-references

**Format**:
```markdown
# How to [Task Name]

**Goal**: [1 sentence]
**Timeline**: [duration]
**Prerequisites**: [list]

---

## Step 1: [First Step]
[Explanation]

**Example**:
```language
[code]
```

[Tips/warnings]

## Step 2: [Second Step]
[Continue pattern...]

---

## Tips for Success
✅ **DO**:
- Tip 1
- Tip 2

❌ **DON'T**:
- Mistake 1
- Mistake 2

---

## See Also
- **Quick Ref**: @knowledge_base/game/quick_ref/[related].md
- **Complete Spec**: @docs/game/systems/[full_doc].md
```

---

## 8. Word Count Requirements

**Quick Reference**:
- Minimum: 200 words
- Maximum: 300 words
- Use `wc -w` to verify

**How-To**:
- Minimum: 800 words
- Maximum: 1,200 words
- Use `wc -w` to verify

**CRITICAL**: Files outside these ranges will be rejected. Count before submission.

---

## 9. Quality Standards

### No Placeholders
All sections must be complete with actual content, not temporary markers or incomplete notes.

### All Sections Complete
✅ Every section has content
✅ All examples filled in
✅ All cross-references valid
✅ All tables populated

### Code Examples
✅ Use proper syntax highlighting (```typescript, ```python, etc.)
✅ Include actual code, not pseudocode
✅ Test examples work (if possible)
✅ Add comments for clarity

### Cross-References
✅ Use `@knowledge_base/game/` pattern
✅ Link to 3-5 related docs per file
✅ Verify linked files exist
✅ No broken references

---

## 10. Consistency Checks

Before returning results, verify:

✅ **Terminology**: Uses terms from this framework (DNA not "points", variant not "skin")
✅ **Dependencies**: Respects system graph (don't reference v1.0 features in v0.1 docs)
✅ **Naming**: Follows conventions (snake_case files, PascalCase components)
✅ **Word Counts**: Within 200-300 (quick_ref) or 800-1,200 (how_to)
✅ **Cross-References**: Use `@knowledge_base/game/` pattern
✅ **Completeness**: No placeholders, all sections filled
✅ **Constraints**: Respects 3 dynasties, 60fps, <100MB, $120 budget

---

## 11. System Assignments (for Phase 2)

### Backend Extractor
- backend_supabase.md (300w quick_ref)
- auth_system.md (250w quick_ref)
- setup_supabase_backend.md (1,000w how-to)
- implement_auth.md (900w how-to)

### Gameplay Extractor
- core_snake_game.md (200w quick_ref)
- energy_system.md (200w quick_ref)
- resource_generation.md (200w quick_ref)
- classic_mode.md (200w quick_ref)
- implement_energy_system.md (1,000w how-to)
- tune_classic_mode.md (900w how-to)

### Lab Extractor
- Expand collection_lab.md to 300w (currently 150w)
- Expand breeding_lab.md to 250w (currently 200w)
- evolution_lab.md (250w quick_ref, note v0.5+)
- design_lab_ui.md (1,000w how-to)
- implement_evolution.md (900w how-to)

### UI Extractor
- ui_framework.md (300w quick_ref)
- create_react_native_screens.md (1,000w how-to)

### Meta Extractor
- glossary.md (400w quick_ref - distilled from GLOSSARY.md)
- system_graph.md (200w quick_ref - distilled from SYSTEM_GRAPH.md)
- player_journey.md (300w quick_ref)
- lab_ui.md (200w quick_ref)

---

**End of Coherence Framework**

**Instructions for Sub-Agents**:
1. Read this entire document FIRST
2. Use ONLY the terminology defined here
3. Follow naming conventions exactly
4. Respect system dependencies (don't reference v1.0 in v0.1 docs)
5. Meet word count requirements (200-300 or 800-1,200)
6. Include 3-5 cross-references per file
7. No placeholders - complete all sections
8. Return confirmation of adherence in final output
