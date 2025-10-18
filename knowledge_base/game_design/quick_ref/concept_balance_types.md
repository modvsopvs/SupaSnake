# Balance Types - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 13

## Core Concept

Schell identifies twelve common balance types that recur across games. Each represents a dimension that must be tuned to create the intended experience. Understanding these types helps designers identify what needs balancing in their specific game.

## Twelve Balance Types (SupaSnake-Relevant Highlighted)

**1. Fairness** ⭐
- Symmetrical (equal resources) vs Asymmetrical (different resources)
- Players want equal chance to win
- SupaSnake: All players start equal (symmetrical Snake), collection is randomized (fair RNG)

**2. Challenge vs Success** ⭐⭐⭐
- Keep players in flow channel (not bored, not frustrated)
- Difficulty increases with skill growth
- SupaSnake: Snake length increases difficulty gradually, levels get harder, gacha rates challenge long-term

**3. Meaningful Choices** ⭐⭐⭐
- Choices must impact outcome (no dominant strategy)
- Right number of choices for player desires
- SupaSnake: Gacha pull now vs save, breed vs collect more, chase risky DNA vs play safe

**4. Skill vs Chance** ⭐⭐⭐
- Too much skill = stressful test, too much chance = no control
- Alternate skill and chance creates rhythm
- SupaSnake: Snake gameplay is pure skill, collection is pure chance, hybrid experience

**5. Head vs Hands**
- Physical dexterity vs mental puzzle-solving
- SupaSnake: Touch control (hands) + route planning (head) balanced mix

**6. Competition vs Cooperation**
- Solo vs multiplayer, competitive vs cooperative
- SupaSnake v0.1: Pure solo (no competition), v1.0 may add leaderboards

**7. Short vs Long** (Not in original 12, implied)
- Session length vs total completion time
- SupaSnake: 60-90 sec sessions, 60-80 hour total completion

**8. Rewards** (Schell discusses via triangularity)
- Low risk/low reward vs high risk/high reward
- SupaSnake: Safe DNA collection vs risky optimal routes

**9. Punishment**
- Consequence of failure
- SupaSnake: Death resets run but keeps DNA (failure not too punishing)

**10. Freedom vs Controlled Experience**
- Open sandbox vs linear progression
- SupaSnake: Freeform collection order (freedom) within energy gates (controlled)

**11. Simple vs Complex**
- Easy to learn vs depth to master
- SupaSnake: Simple Snake mechanics, complex collection/breeding metagame

**12. Detail vs Imagination**
- Explicit vs implied
- SupaSnake: Clear UI shows collection status, players imagine completing Panini book

## SupaSnake's Critical Balance Types

**Priority 1: Challenge vs Success (Flow Channel)**
- **Problem:** Snake gets harder as it grows - when does it cross from challenging to frustrating?
- **Solution:** Playtest to find exact length where 50% of players fail, tune DNA spawn rates
- **Metric:** Average run duration should be 60-90 seconds

**Priority 2: Meaningful Choices (No Dominant Strategy)**
- **Problem:** Is gacha always better than breeding? Or vice versa?
- **Solution:** Make gacha faster but random, breeding slower but targeted
- **Metric:** 40% of players primarily gacha, 40% primarily breed, 20% mixed

**Priority 3: Skill vs Chance (Hybrid Appeal)**
- **Problem:** Skill players hate RNG, chance players hate skill gates
- **Solution:** Skill determines DNA earning rate (floor), chance determines collection drops (ceiling)
- **Metric:** Emma (casual) and Tyler (hardcore) both rate 4/5 stars

**Priority 4: Fairness (No Pay-to-Win)**
- **Problem:** How to monetize without making whales overpowered?
- **Solution:** Money buys more pulls (speed), not better Snake performance (power)
- **Metric:** Free players complete collection in 80 hours, paid in 40 hours, both require same skill

## Triangularity (Special Balance Pattern)

**Definition:** Player chooses between safe/low-reward and risky/high-reward

**SupaSnake Triangularity Examples:**
- Safe path (collect nearby DNA) vs risky path (navigate tight space for distant DNA)
- Spend DNA immediately (instant gratification) vs save for targeted dynasty (delayed reward)
- Breed duplicates now (guaranteed progress) vs wait for better breeding pairs (optimal outcome)

**Balance Method:** Use expected value
- Safe option: 100% success × 10 DNA = 10 expected DNA
- Risky option: 50% success × 20 DNA = 10 expected DNA
- Equal expected value = balanced choice (personal preference decides)

## Modern Mobile Context (2020 Edition)

**Schell's 2020 Updates:** Discusses Mario Kart's give-losers-a-break system, free-to-play balance challenges, dominant strategy elimination
**SupaSnake Specific:** Mobile F2P inherits all traditional balance types PLUS monetization balance (pay for speed not power), retention balance (energy gates), and live-ops balance (events, limited-time content). More balance dimensions than premium games.

## See Also

- **How-To:** @knowledge_base/game_design/how_to/balance_supasnake_mechanics.md
- **How-To:** @knowledge_base/game_design/how_to/balance_skill_vs_chance.md
- **Lenses:** #37 Fairness, #38 Challenge, #39 Meaningful Choices, #40 Triangularity, #41 Skill vs Chance
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_13_balance_summary.md
