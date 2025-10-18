# Resource Generation - Quick Reference

## Overview

Resource Generation converts Snake gameplay performance into DNA currency - the universal resource for breeding, evolution, and collection expansion. DNA earning rates are carefully balanced to support PR-003 (20+ variants by Day 30) while maintaining F2P viability (BM-001).

## DNA Earning Formula

**Classic Mode Base Formula:**
```typescript
baseDNA = floor(score / 50) * 2
comboBonus = floor(maxCombo / 5) * 5
timeBonus = (duration < 180s) ? 20 : 0
totalDNA = baseDNA + comboBonus + timeBonus
```

**Example Calculations:**
- Beginner run (score 100, 4 min): floor(100/50)*2 + 0 + 20 = **44 DNA**
- Average run (score 250, 5 min): floor(250/50)*2 + 25 + 0 = **35 DNA**
- Expert run (score 500, 3 min): floor(500/50)*2 + 50 + 20 = **90 DNA**

**Combo Multiplier:** Max combo tracked during run (consecutive food collected without hitting walls/self). Every 5 combo = +5 DNA. Combo resets on collision or direction reversal.

**Speed Bonus:** Runs completed under 3 minutes receive +20 DNA (rewards skilled play). Balances against long grindy runs.

## Player Skill Tiers

**Beginner Player** (Week 1-2):
- 95 DNA per run average
- 15 runs daily (F2P energy budget)
- 1,425 DNA daily → 10,000 DNA weekly
- Can afford 3 basic variants per week

**Average Player** (Week 3-8):
- 160 DNA per run average
- 20 runs daily (with clan bonuses)
- 3,200 DNA daily → 22,400 DNA weekly
- Can afford 7 variants per week OR 2 evolutions

**Expert Player** (Week 9+):
- 275 DNA per run average
- 22 runs daily (clan + daily refill optimization)
- 6,050 DNA daily → 42,350 DNA weekly
- Can afford 14 variants per week OR 4 evolutions + breeding

## Progression Support

**PR-003 Compliance (20+ Variants by Day 30):**
- Average player: 22,400 DNA/week × 4 weeks = 89,600 DNA total
- Cost of 20 variants: ~1,000 DNA each = 20,000 DNA
- Surplus: 69,600 DNA for evolutions and breeding
- **Result:** Target achievable with F2P energy budget

**Monthly Earning Targets:**
- Month 1 (Beginner → Average): 60,000-90,000 DNA
- Month 2 (Average → Expert): 120,000-180,000 DNA
- Month 3+ (Expert): 180,000+ DNA monthly

## DNA Sinks

**Breeding:** 500 DNA per breeding attempt (random Gen+1 offspring)
**Evolution:** 2,000 DNA base cost (increases with rarity tier)
**Variant Unlock:** 1,000-3,000 DNA (common to rare variants)
**Lab Upgrades:** 5,000-15,000 DNA (capacity expansion, energy max, breeding slots)

## Balance Verification

**Energy-to-DNA Efficiency:** 1 energy = 50-100 DNA (Classic Mode). Tower Mode offers 80-150% of Classic DNA (higher variance, rare materials bonus). Clan Wars cost 0 energy but reward bonus DNA (social incentive).

**F2P vs Premium:** F2P earns 1,650 DNA daily, Premium earns 2,175 DNA daily (+32% faster). Both achieve same content - Premium saves time not power (BM-001 compliant).

## Cross-References

- @knowledge_base/game/quick_ref/classic_mode.md - Primary DNA farming mode
- @knowledge_base/game/quick_ref/energy_system.md - Daily energy budget
- @knowledge_base/game/quick_ref/core_snake_game.md - Score mechanics
- @knowledge_base/game/how_to/tune_classic_mode.md - DNA earning optimization
- @knowledge_base/game/api/economy.md - DNA transaction endpoints

**Word Count:** 298 words
