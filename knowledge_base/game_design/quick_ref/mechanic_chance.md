# Chance Mechanic - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 12

## Core Concept

Chance is uncertainty, and uncertainty creates surprise - a key ingredient of fun. Chance interacts with all other mechanics (space, time, objects, actions, rules, skill). While chance can be mathematically tricky and counter-intuitive, mastering probability lets designers sculpt experiences full of challenging decisions and interesting surprises. Balancing chance vs skill determines whether games feel like tests of ability or relaxing risk-taking.

## Key Points

**Why Chance Matters:**
- Uncertainty = Surprise = Fun
- Prevents perfect predictability
- Balances skill disparities
- Creates memorable moments
- Adds replayability (different outcomes each time)

**Probability Basics (Schell's 10 Rules - Key Highlights):**
- Fractions = Decimals = Percents (½ = 0.5 = 50%)
- Probabilities range 0-100% only (no negative, no >100%)
- Probability = "Looked for" outcomes ÷ Total possible outcomes
- Enumerate outcomes when possible
- OR means ADD (if mutually exclusive events)
- AND means MULTIPLY (if independent events)

**Balancing Chance:**
- Too much chance frustrates skilled players (skill irrelevant)
- Too little chance bores casual players (too predictable)
- Common pattern: Alternate chance and skill (deal cards = chance, play cards = skill)

## Application to SupaSnake

**SupaSnake Chance Elements:**

**1. Variant Gacha (Pure Chance):**
- Pull dynasty-specific gacha for 50 DNA
- Outcomes:
  - 10% Common (9 different variants per dynasty)
  - 1% Rare (3 different variants per dynasty)
  - 0.1% Mythic (1 variant per dynasty)
- Specific variant within rarity: Equal probability
- Example: Viper Common = 10% ÷ 9 variants = 1.11% per specific common

**2. Breeding Outcomes (Controlled Chance):**
- Combine two G0 variants → G1 variant (100% success, dynasty determined by parents)
- Rarity inheritance: Complex formula blending parent rarities
- Generation cap: G3 max (prevents infinite progression)
- Chance element: Which parent's traits dominate

**3. DNA Spawn Location (Environmental Chance):**
- DNA spawns at random grid cells
- Not truly "random" - spawns avoid snake position
- Creates varying difficulty (spawn near = easy, spawn far = risky route)

**4. NO Chance in Core Gameplay:**
- Snake movement: 100% deterministic (player skill only)
- Collision: Exact grid-based (no random dodge)
- Death: Never "unlucky" - always player mistake
- This preserves skill integrity

**Probability Examples:**

**Complete One Dynasty (e.g., All 13 Viper Variants):**
- 9 Commons @ 1.11% each = ~90 pulls average (4,500 DNA)
- 3 Rares @ 0.33% each = ~300 pulls average (15,000 DNA)
- 1 Mythic @ 0.1% = ~1,000 pulls average (50,000 DNA)
- **Duplication Problem:** Later pulls mostly duplicates (breeding fodder)
- **Breeding Shortcut:** Breed commons/rares to bypass some pulls

**Get Any Mythic (Across 3 Dynasties):**
- Per pull: 0.1% × 3 dynasties = 0.3% any mythic
- Expected pulls for first mythic: ~333 pulls (16,650 DNA)
- Much easier than targeting specific mythic (1,000 pulls)

**Skill vs Chance Balance in SupaSnake:**
- **Core gameplay:** 90% skill, 10% chance (DNA spawn positioning)
- **Collection progression:** 20% skill (DNA farming efficiency), 80% chance (gacha RNG)
- **Overall experience:** Hybrid that satisfies both audiences
  - Emma (casual): Loves gacha excitement, collection completion feeling
  - Tyler (hardcore): Masters DNA farming, breeds strategically to minimize gacha dependence

## Modern Mobile Context (2020 Edition)

**Schell's 2020 Updates:** Discusses probability theory's game design origins (Chevalier de Méré's dice problems), expected value calculations for balance
**SupaSnake Specific:** Mobile F2P gacha design must balance excitement (rare drops) with guaranteed progress (breeding, pity systems if added). Chance creates monetization opportunities (buy more pulls) but skill gates baseline DNA earning (can't pay to be better at Snake). This preserves fairness while enabling whales.

## See Also

- **How-To:** @knowledge_base/game_design/how_to/balance_skill_vs_chance.md
- **How-To:** @knowledge_base/game_design/how_to/tune_dna_economy.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/collection_lab.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/breeding_lab.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/economic_balance.md
- **Lens:** Lens #35 (Expected Value), Lens #36 (Chance) from Chapter 12
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_12_mechanics_summary.md
