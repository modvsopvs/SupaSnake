# Core Loop - Quick Reference

**Source:** design/core_loop_aaa.md

## Core Concept
Goal-based Snake gameplay in 3-minute skill-based matches where players wager DNA (earned or purchased) to breed better snakes, competing across 4 win conditions in dynamic arenas with power-up strategy.

## Key Points
- **Core Loop:** Play Matches → Earn DNA → Breed Snakes → Unlock Variants → Climb Ladder
- **4 Win Conditions (Match Goals):**
  1. **Last Snake Standing:** Classic survival (most skill-testing)
  2. **Food Race:** First to 50 food pellets (aggressive tempo)
  3. **Territory Control:** Dominate marked zones (strategic positioning)
  4. **Score Attack:** Highest score in 3 minutes (point optimization)
- **Skill Expression:**
  - Cut-off maneuvers (trap opponents with your body)
  - Boost management (limited speed bursts)
  - Power-up timing (random spawns: shields, magnets, shrink)
  - Map knowledge (terrain hazards, choke points)
- **DNA Wagering:** Risk/reward - wager more DNA for bigger breeding rewards

## AAA Standards
- **60fps Gameplay:** Smooth responsive controls, sub-100ms input latency
- **Spectator-Ready:** Clean visual clarity for esports, slow-mo replays
- **Matchmaking:** MMR-based for fair matches, no pay-to-win power gaps
- **Session Length:** 3-minute matches fit mobile play patterns

## Implementation Priority
- **MVP:** Last Snake Standing mode, basic controls, matchmaking
- **v1.0:** All 4 win conditions, power-ups, DNA wagering, spectator mode
- **v2.0+:** Advanced tactics (team modes), seasonal map rotations

## See Also
- @design/core_loop_aaa.md (4,600 words - complete gameplay mechanics)
- @design/competitive_systems_v2.md (ranked ladder, MMR, tournaments)
- @knowledge_base/game_archive_v1_solo_dev/classic_mode.md (v1.0 comparison)

---

*Word Count: 269 words*
