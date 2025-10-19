# Breeding Rules - Quick Reference

## v0.1 MVP: Same Dynasty Only

**Breeding Formula**:
```
Parent 1 (CYBER, Generation 0) + Parent 2 (CYBER, Generation 1)
= Offspring (CYBER, Generation 2)
```

**Dynasty Inheritance**: 100% same dynasty as parents (CYBER + CYBER = CYBER only)

**Generation Progression**: `max(parent1_gen, parent2_gen) + 1`

**DNA Cost Formula**: `200 base + (average_parent_generation × 100)`

**Examples**:
- Gen 0 + Gen 0 = Gen 1 (200 DNA cost)
- Gen 2 + Gen 3 = Gen 4 (450 DNA cost)
- Gen 5 + Gen 5 = Gen 6 (700 DNA cost)

## Stat Scaling

**Base Stats**: Inherited from variant rarity
- Common: Speed 1.0, Size 1.0, DNA Gen 1.0
- Legendary: Speed 1.5, Size 1.5, DNA Gen 1.5

**Generation Bonus**: `base_stats × (1 + generation × 0.05)`

**Example (CYBER OMEGA Legendary)**:
- Generation 0: Speed 1.5 (base)
- Generation 3: Speed 1.5 × 1.15 = 1.725
- Generation 10: Speed 1.5 × 1.50 = 2.25

## Breeding Restrictions

**Same Dynasty Only (v0.1)**: Cannot breed CYBER + PRIMAL
- Simplifies inheritance logic
- Maintains dynasty purity
- Encourages collecting within dynasties

**Future (v0.5+)**: Cross-dynasty breeding
- Unlock via research system
- Hybrid offspring (visual + stat mix)
- Advanced breeding strategies

## Breeding Cooldown

**Per Snake**: 24-hour cooldown after breeding
- Prevents spam breeding
- Balances DNA economy
- Encourages diverse collection

**Global**: No global limit (breed as many pairs as you own)

## See Also

**Complete Breeding Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 8)
**How to Design Breeding**: @knowledge_base/game/how_to/design_breeding.md
