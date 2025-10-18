# Breeding Lab - Quick Reference

The Breeding Lab combines two parent snakes to create offspring with inherited traits, serving as the primary collection expansion method (70% of variants acquired via breeding).

## Key Features

- **Parent Selection**: Choose 2 snakes from Collection with dynasty filtering
- **Deterministic Outcomes**: Same parents always produce same offspring (BA-002 constraint)
- **Generation Progression**: offspring_gen = max(parent1_gen, parent2_gen) + 1
- **Breeding Timers**: 1-8 hours scaling by generation, creating return sessions (CE-003)
- **Multiple Slots**: 3 free breeding slots allow parallel progression
- **Offspring Preview**: See predicted dynasty, generation, rarity, and stats before breeding

## v0.1 Breeding Rules

**Dynasty Inheritance**: Same-dynasty only (CYBER + CYBER = CYBER offspring)
- Cross-dynasty breeding deferred to v0.5+

**DNA Cost Formula**: `cost = 100 × (avgParentGen + 1)`
- Gen 1 × Gen 1 → 200 DNA
- Gen 5 × Gen 5 → 600 DNA
- Gen 10 × Gen 10 → 1,100 DNA

**Breeding Timers**:
- Gen 1-5 offspring: 1 hour
- Gen 6-10: 2 hours
- Gen 11-20: 4 hours
- Gen 21+: 8 hours (overnight)

## Rarity Inheritance

| Parent Combination | Offspring Rarity Distribution |
|-------------------|-------------------------------|
| Common × Common | 70% Common, 25% Uncommon, 5% Rare |
| Uncommon × Uncommon | 50% Uncommon, 35% Rare, 13% Epic, 2% Legendary |
| Rare × Rare | 60% Rare, 30% Epic, 10% Legendary |
| Epic × Epic | 50% Epic, 50% Legendary |

## Quick Facts

- **Breeding Frequency**: 1-2 breeds per day (average player with 800 DNA/day)
- **Collection Impact**: 14 of 20 variants by Day 30 acquired via breeding
- **Economic Balance**: Breeding costs 28% of monthly DNA income (6,750 of 24,000 DNA)
- **Seeded RNG**: Deterministic outcomes using parent IDs as seed enable strategy
- **Server Validation**: All breeding calculations server-side for anti-cheat

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/collection_lab.md - Collection system
- **Quick Ref**: @knowledge_base/game/quick_ref/dynasties.md - Dynasty rules
- **Quick Ref**: @knowledge_base/game/quick_ref/economic_balance.md - DNA economy
- **Complete Spec**: @docs/game/systems/analysis/BREEDING_LAB_analysis.md - Full breeding mechanics
- **How-To**: @knowledge_base/game/how_to/design_lab_ui.md - Breeding UI design patterns
