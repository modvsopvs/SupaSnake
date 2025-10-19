# Competitive Ladder - Quick Reference

**Source:** design/systems/competitive_systems_v2.md

## Core Concept
MMR-based ranked ladder (Bronze → Grandmaster) with 12-week seasonal resets, monthly tournaments, and professional esports infrastructure culminating in annual World Championship.

## Key Points
- **Ranked Tiers:**
  - **Bronze/Silver/Gold:** Learning tiers (MMR 0-1500)
  - **Platinum/Diamond:** Competitive tiers (MMR 1500-2500)
  - **Master:** Elite tier (MMR 2500-3000, top 5% of players)
  - **Grandmaster:** Professional tier (MMR 3000+, top 500 players globally)
- **Seasonal Structure (12 weeks):**
  - Week 1-10: Ranked climb, earn seasonal cosmetics
  - Week 11-12: Seasonal Championship tournament (top 1000 players)
  - Season end: MMR soft reset (-20%), new seasonal rewards
- **Tournament Ladder:**
  - Weekly community tournaments (open entry, DNA prize pools)
  - Monthly pro tournaments (Grandmaster only, $10k prize pool)
  - Quarterly regional championships (qualification for Worlds)
  - Annual World Championship (128 players, $500k prize pool)

## AAA Standards
- **Fair Matchmaking:** ±100 MMR matching, no pay-to-win advantages
- **Spectator Mode:** Watch any Grandmaster match live, slow-mo replays
- **Anti-Cheat:** Server-authoritative gameplay, input validation, detection systems
- **Esports Production:** Observer UI, tournament brackets, live streaming integration

## Implementation Priority
- **MVP:** Basic Bronze-Gold ladder, simple matchmaking
- **v1.0:** Full tier system, seasonal resets, spectator mode
- **v2.0+:** Pro tournaments, regional leagues, World Championship infrastructure

## See Also
- @design/systems/competitive_systems_v2.md (complete competitive architecture)
- @design/core_loop_aaa.md (skill expression mechanics)
- @vision/vision_statement_aaa.md (esports as long-term vision)

---

*Word Count: 271 words*
