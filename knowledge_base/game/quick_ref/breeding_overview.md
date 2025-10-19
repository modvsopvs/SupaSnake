# Breeding Overview - Quick Reference

**Source:** design/systems/breeding_system_v2.md

## Core Concept
Egg gacha system with fair pity mechanics where players spend DNA (earned or purchased) to breed snakes, discovering rare variants through generational breeding and evolution chains.

## Key Points
- **Egg Types by Dynasty:**
  - Common Dynasty Egg: 100 DNA ($0.99), 70% common/25% rare/4% epic/1% legendary
  - Premium Dynasty Egg: 500 DNA ($4.99), 50% rare/35% epic/10% legendary/5% mythic
  - 10-pack guarantees: Rare (common eggs) or Epic (premium eggs)
- **Pity System (Fair Gacha):**
  - Every 10th egg: Guaranteed rare minimum
  - Every 50th egg: Guaranteed epic minimum
  - Every 200th egg: Guaranteed legendary minimum
  - Pity counter shared across all egg types
- **Generational Breeding:**
  - Breed two Gen 1 snakes → Gen 2 offspring (inherits traits)
  - Gen 5+ unlocks "Ascension" (prestige evolution with cosmetic glow)
  - Breeding cost scales: 50 DNA (Gen 1×1), 200 DNA (Gen 5×5)
- **Collection Goal:** 500+ total variants across 10 dynasties

## AAA Standards
- **Transparent Drop Rates:** Published rates, pity system visible
- **No Duplicates Wasted:** All pulls useful for breeding (even common dupes)
- **F2P Path:** Earn 300-500 DNA daily through matches and quests
- **Emotional Attachment:** Breeding history tracked, name your favorites

## Implementation Priority
- **MVP:** Basic egg gacha, 3 dynasties, no pity system
- **v1.0:** Full pity system, 10 dynasties, generational breeding
- **v2.0+:** Ascension system, breeding tournaments, special event eggs

## See Also
- @design/systems/breeding_system_v2.md (complete breeding mechanics)
- @design/systems/dynasty_system_v2.md (10 dynasties and variants)
- @design/monetization_architecture_aaa.md (DNA economy, pricing)

---

*Word Count: 293 words*
