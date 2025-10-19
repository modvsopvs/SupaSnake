# Evolution Lab - Quick Reference

**VERSION**: v0.5+ Feature (NOT in v0.1 MVP)

The Evolution Lab transforms individual snakes to higher generations with stat increases, providing an alternative progression path to breeding. This system unlocks in v0.5 update (Weeks 11-15).

## Key Features

- **Generation Increase**: Transform snake from Gen N to Gen N+1
- **Stat Scaling**: +5% to all stats per generation evolved
- **Linear DNA Cost**: `cost = generation × 100` (Gen 5 → Gen 6 costs 500 DNA)
- **Instant Transformation**: No breeding timer, immediate result
- **Visual Progression**: Snake sprite updates with glow effects and size increase
- **Generation Milestones**: Unlock cosmetic variants at Gen 5, 10, 25, 50, 100

## Evolution Mechanics

**DNA Cost Formula**: `cost = currentGeneration × 100`
- Gen 1 → Gen 2: 100 DNA
- Gen 5 → Gen 6: 500 DNA
- Gen 10 → Gen 11: 1,000 DNA
- Gen 20 → Gen 21: 2,000 DNA

**Stat Increase**: `newStat = baseStat × (1 + (generation - 1) × 0.05)`
- Gen 1: 1.00× base stats
- Gen 5: 1.20× base stats
- Gen 10: 1.45× base stats
- Gen 20: 1.95× base stats

## Evolution vs Breeding

| Feature | Evolution | Breeding |
|---------|-----------|----------|
| Purpose | Improve existing snake | Create new snake |
| Cost | 100-2,000 DNA | 200-2,100 DNA |
| Time | Instant | 1-8 hours |
| Result | Same snake, Gen +1 | New offspring |
| Collection Impact | No new variant | Adds to collection |
| Use Case | Stat optimization | Collection expansion |

## Generation Milestones

- **Gen 5**: Bronze glow effect, +20% stats
- **Gen 10**: Silver glow effect, +45% stats, Uncommon cosmetic unlock
- **Gen 25**: Gold glow effect, +120% stats, Rare cosmetic unlock
- **Gen 50**: Platinum particle effects, +245% stats, Epic cosmetic unlock
- **Gen 100**: Diamond aura, +495% stats, Legendary cosmetic unlock

## Quick Facts

- **Unlock Requirement**: v0.5 update (NOT available in v0.1 MVP)
- **Economic Impact**: 3,000 DNA per month on evolution (13% of income)
- **Progression Path**: Infinite - no generation cap (PR-001 constraint)
- **Server Validation**: Evolution costs and ownership verified server-side
- **Visual Feedback**: Particle effects and size scaling show generation progress

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/breeding_lab.md - Breeding alternative
- **Quick Ref**: @knowledge_base/game/quick_ref/mvp_scope.md - v0.5 timeline
- **How-To**: @knowledge_base/game/how_to/implement_evolution.md - Evolution implementation guide
- **Complete Spec**: @docs/game/systems/analysis/EVOLUTION_LAB_analysis.md - Full evolution mechanics
- **Quick Ref**: @knowledge_base/game/quick_ref/economic_balance.md - DNA allocation
