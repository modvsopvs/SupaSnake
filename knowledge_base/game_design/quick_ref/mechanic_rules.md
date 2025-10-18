# Rules Mechanic - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 12

## Core Concept

Rules are the most fundamental mechanic - they define space, time, objects, actions, consequences, constraints, and goals. Rules make a game a game by establishing clear objectives and the paths to achieve them. Parlett's taxonomy distinguishes operational rules (how to play), foundational rules (mathematical structure), behavioral rules (sportsmanship), and written rules (documentation).

## Key Points

**Parlett's Rule Types:**
- **Operational:** What players do to play (most important for design)
- **Foundational:** Abstract mathematical structure (state changes, probabilities)
- **Behavioral:** Implicit good sportsmanship (unwritten but understood)
- **Written:** Documentation explaining operational rules
- **Laws:** Tournament clarifications for competitive play
- **House Rules:** Player modifications to improve experience

**Goal Design (Most Important Rule):**
- Goals must be **concrete** (clearly stated)
- Goals must be **achievable** (players believe they can win)
- Goals must be **rewarding** (valuable before and after achievement)
- Balance short-term and long-term goals

**Rules Enforcement:**
- Traditional games: Players or referees enforce
- Videogames: Computer enforces (enables complexity)
- Computer enforcement turns rules into physical constraints

## Application to SupaSnake

**SupaSnake Operational Rules:**

1. **Movement:**
   - Snake moves continuously in current direction
   - Tap/swipe to change direction (up, down, left, right)
   - Cannot reverse 180° directly

2. **Collision:**
   - Hit wall → Death → Restart level
   - Hit self → Death → Restart level
   - Clear level without death → Success

3. **DNA Collection:**
   - Move over DNA → Automatically collect
   - Length multiplier: Longer snake = more DNA per pickup
   - DNA persists across deaths (currency for Collection Lab)

4. **Variants:**
   - Spend DNA in Collection Lab to pull gacha
   - Each pull: 10% common, 1% rare, 0.1% mythic (random)
   - Duplicates can be bred in Breeding Lab

5. **Energy System:**
   - Each game costs 1 energy
   - Energy regenerates over time
   - Limits play sessions (F2P retention gate)

**Goals Hierarchy (Short to Long):**
- **Immediate:** Complete current level without dying (concrete, achievable, rewarding with DNA)
- **Session:** Earn enough DNA for one gacha pull (50-100 DNA target)
- **Daily:** Pull 2-3 variants per day (energy-gated)
- **Weekly:** Complete one dynasty (e.g., collect all Viper variants)
- **Long-term:** Complete Panini book (all dynasties, all rarities, all generations)

**Computer Enforcement Benefits:**
- Collision detection is instant and deterministic
- DNA multiplier calculated automatically (length tracking)
- Gacha RNG is fair and verifiable (no player disputes)
- Collection progress tracked across sessions
- Energy regeneration happens in background

## Modern Mobile Context (2020 Edition)

**Schell's 2020 Updates:** Emphasizes videogames allow complex rules through computer enforcement, interactive tutorials replace written manuals
**SupaSnake Specific:** Mobile F2P rules must be discoverable through play. Tutorial teaches core Snake mechanics (movement, collision) in 30 seconds. Collection/breeding rules learned organically in Lab UI. Energy system communicated via timer UI. No written manual needed - all rules embedded in interface.

## See Also

- **How-To:** @knowledge_base/game_design/how_to/balance_supasnake_mechanics.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/core_snake_game.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/energy_system.md
- **Lens:** Lens #32 (Goals) from Chapter 12
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_12_mechanics_summary.md
