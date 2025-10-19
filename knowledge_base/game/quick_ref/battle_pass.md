# Battle Pass - Quick Reference

**Source:** design/monetization_architecture_aaa.md, design/live_ops_framework_aaa.md

## Core Concept
$9.99 seasonal progression system (12 weeks) with free + premium tracks delivering 100 tiers of rewards: exclusive cosmetics, DNA bonuses, and skip tickets - designed for 2-3x value vs direct purchase.

## Key Points
- **Structure:**
  - Duration: 12 weeks (aligns with seasonal story arc)
  - Tiers: 100 total (14 tiers per week, ~2 tiers per day)
  - Tracks: Free track (all players) + Premium track ($9.99)
  - XP sources: Matches (+100 XP per win), daily quests (+500 XP), guild war (+1000 XP)
- **Free Track Rewards (100 tiers):**
  - Common/rare variants (20 total)
  - DNA bonuses (5,000 DNA total across 100 tiers)
  - Profile cosmetics (borders, emotes, titles)
- **Premium Track Rewards (+$9.99):**
  - Exclusive legendary variant (Tier 100 finale reward)
  - Epic variants (10 total)
  - 10,000 bonus DNA (2x F2P DNA weekly income)
  - Skip tickets (20 total - auto-complete daily quests)
  - Guild perks (cosmetic guild banner, exclusive emote pack)
- **Value Proposition:**
  - Premium track value: ~$50 if purchased separately
  - Price: $9.99 (5x value multiplier)
  - Target conversion: 10% of active players purchase (300k buys @ 3M DAU)

## AAA Standards
- **No FOMO Predation:** Free track is generous, premium is upgrade not requirement
- **Completable by Casuals:** 2 hours/day average play completes all 100 tiers
- **Late Joiners:** Can buy pass at any time, keep earned tiers (no retroactive loss)
- **Post-Season Access:** Exclusive cosmetics never return (maintains prestige)

## Implementation Priority
- **MVP:** No battle pass (manual content only)
- **v1.0:** Full 100-tier system, free + premium tracks
- **v2.0+:** Battle Pass Plus ($19.99 - instant tier skip to 25)

## See Also
- @design/monetization_architecture_aaa.md (battle pass revenue model)
- @design/live_ops_framework_aaa.md (seasonal structure integration)
- @vision/supercell_monetization_study.md (battle pass case studies)

---

*Word Count: 296 words*
