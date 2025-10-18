# Pacing - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 16

## Core Concept

Pacing is the rhythm of rising and falling interest over time. Good pacing includes rest periods between peaks (prevents exhaustion), gradually increases intensity, and provides both short-term and long-term satisfaction. Mobile games need session-based pacing with natural stop points to match real-world usage patterns (commutes, breaks, waiting).

## Pacing Principles

**Rest Periods Matter:** Can't sustain peak interest continuously - valleys let players catch breath
**Gradual Escalation:** Difficulty/speed/stakes increase over time
**Multiple Time Scales:** Moment-to-moment + round-to-round + session-to-session + long-term progression
**Natural Stop Points:** Players need guilt-free exit moments

## Application to SupaSnake

**Moment-to-Moment Pacing:**
- Collect DNA (satisfaction) → Navigate (tension) → Collect DNA (satisfaction)
- Rhythm: Swipe, swipe, collect, swipe, avoid wall, collect
- 2-3 second loops within each round

**Round-to-Round Pacing:**
- Round 1: Slow, easy (warm-up)
- Round 2-4: Moderate speed (build momentum)
- Round 5-7: High speed, rare spawns (climax)
- Death → Brief score screen (rest) → Restart (if energy remains)

**Session Pacing (Energy System):**
- Start: Full energy (5-7 rounds available)
- Middle: Energy depleting (visible countdown creates urgency)
- End: Energy depleted (natural stop point)
- No guilt: "I ran out of energy" (not "I wasted time")

**Long-Term Pacing:**
- Days 1-3: Unlock first dynasty Commons
- Week 1: Complete first dynasty (all 8 variants)
- Weeks 2-4: Unlock dynasties 2-3
- Month+: Breed hybrids, chase 100% completion

## Emma vs Tyler Pacing

**Emma (5-10 min sessions):**
- Needs: Fast ramp to satisfaction, clean exit
- Gets: 5-7 rounds perfectly fill commute
- Energy depletion = "arrived at station" timing
- Returns: Tomorrow's commute (daily habit)

**Tyler (60+ min grinding):**
- Needs: Long-term goals visible, endless pursuit
- Gets: Multiple energy-refill cycles per session
- Ad-watch extends session (optional)
- Collection % provides weeks of chase

## Rest Periods in SupaSnake

**Micro-Rests (seconds):**
- Round end screen (2-3 seconds) before next round
- Variant unlock animation (3 seconds) before gameplay resumes

**Macro-Rests (minutes):**
- Energy depletion forces break (return in 30 min for refill OR watch ad)
- Collection Lab browsing (no-pressure exploration)
- Breeding Lab experimentation (creative, not competitive)

**Prevents Burnout:**
- Can't grind Classic Mode indefinitely (energy gate)
- Switching modes provides mental rest (parallelism from puzzle design)

## Pacing Through Difficulty

**Speed Escalation:**
- Round 1: 60% base speed (comfortable)
- Round 3: 80% speed (engaging)
- Round 5: 100% speed (challenging)
- Round 7: 120% speed (expert only)

**Spawn Rarity Escalation:**
- Early rounds: 70% Common, 25% Rare, 5% Legendary
- Mid rounds: 50% Common, 40% Rare, 10% Legendary
- Late rounds: 20% Common, 50% Rare, 30% Legendary

**Stakes Escalation:**
- Early: Low score, common DNA (low stakes)
- Late: High score at risk, legendary spawn (high stakes)

## Session Length Science

**Ideal Mobile Session:** 5-10 minutes
- Matches: Commute, lunch break, waiting room
- SupaSnake: 5-7 rounds × 60-90 seconds = 5-10.5 minutes

**Energy Refill Time:** 30 minutes
- Not instant (prevents endless grinding)
- Not too long (Emma can play again after work)
- Tyler can watch ad to continue (monetization)

## See Also

- **How-To:** @knowledge_base/game_design/how_to/create_engagement_curves.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/energy_system.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/player_journey.md
- **Lenses:** Lens #69 (Interest Curve)
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_16_interest_summary.md
