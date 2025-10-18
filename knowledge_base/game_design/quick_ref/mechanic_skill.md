# Skill Mechanic - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 12

## Core Concept

Skill shifts focus from the game to the player - what abilities must players exercise to succeed. Every game requires a blend of physical skills (dexterity, coordination), mental skills (memory, puzzle-solving), and social skills (reading opponents, teamwork). Matching skill requirements to player abilities keeps players in the flow channel. Real skills (player must have) differ from virtual skills (character progression).

## Key Points

**Three Skill Categories:**
- **Physical:** Dexterity, coordination, timing, endurance
- **Mental:** Memory, observation, puzzle-solving, decision-making
- **Social:** Reading opponents, deception, communication, coordination

**Real vs Virtual Skills:**
- **Real Skills:** Player must actually possess (reaction time, pattern recognition)
- **Virtual Skills:** Character progression (level up, skill points, purchased power-ups)
- Best games balance both (real skill gates progress, virtual skills provide power fantasy)

**Skill Enumeration:**
- List all skills required (general or specific)
- Dominant skills define player experience
- Players can improve real skills through practice (mastery)
- Misidentified skills = wrong player expectations

## Application to SupaSnake

**SupaSnake Real Skills Required:**

**Physical Skills:**
- Precise touch control (swipe direction accuracy)
- Timing (direction changes at grid intersections)
- Sustained attention (continuous play for 30-90 seconds)
- Quick reflexes (react to tight spaces as snake grows)

**Mental Skills:**
- Spatial planning (plot safe routes through grid)
- Pattern recognition (optimal DNA collection paths)
- Risk assessment (chase distant DNA vs play safe)
- Resource management (spend DNA now vs save for specific dynasty)
- Probability intuition (gacha odds, breeding outcomes)
- Long-term planning (generation progression strategy)

**Social Skills (minimal in v0.1):**
- None required in single-player mode
- (Future: Leaderboards create implicit competition)

**Dominant Skills:**
1. Spatial planning (40% of success)
2. Timing/dexterity (30% of success)
3. Risk assessment (20% of success)
4. Resource management (10% of success)

**Virtual Skills in SupaSnake:**
- Snake length increases during run (virtual "power" that makes game harder)
- DNA multiplier based on length (virtual "economy boost")
- Variant collection unlocks (virtual "achievement progress")
- Generation tiers G0→G3 (virtual "dynasty power")

Note: Virtual skills provide progression feeling but don't reduce real skill requirements. A G3 mythic snake doesn't make the player better at navigating - it's collection prestige only.

**Skill Mastery Curve:**
- **Hour 1:** Learn basic movement, survive 20 seconds
- **Hour 10:** Consistent 60-second runs, combo chains
- **Hour 50:** Perfect runs (no deaths), optimal DNA farming
- **Hour 100:** Master all three dynasties, G2/G3 breeding strategies

**Skill Accessibility:**
- Entry barrier: LOW (touch controls, simple movement)
- Mastery ceiling: MEDIUM-HIGH (combo optimization, breeding strategy)
- Perfect for mobile casual → core player progression

## Modern Mobile Context (2020 Edition)

**Schell's 2020 Updates:** Discusses camera-based dance games requiring broader physical skills, virtual vs real skill distinction in MMOs with monetization
**SupaSnake Specific:** Mobile F2P must balance skill accessibility (broad appeal) with mastery depth (retention). Classic Snake provides skill floor (easy to learn), collection/breeding provides skill ceiling (hard to optimize). Virtual skills (variants owned) create progression without pay-to-win (real skill still required to collect DNA).

## See Also

- **How-To:** @knowledge_base/game_design/how_to/balance_skill_vs_chance.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/core_snake_game.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/player_journey.md
- **Lens:** Lens #34 (Skill) from Chapter 12
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_12_mechanics_summary.md
