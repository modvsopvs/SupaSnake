# How to Design Breeding Mechanics

**Goal**: Create satisfying breeding system that encourages collection, experimentation, and long-term engagement

**Philosophy**: Simple rules, deep strategy. Players understand mechanics immediately but discover optimization over time.

---

## v0.1 MVP: Same Dynasty Only

### Core Rules

**Rule 1: Dynasty Immutability**
```
CYBER + CYBER = CYBER (always)
PRIMAL + PRIMAL = PRIMAL (always)
CYBER + PRIMAL = ERROR (not allowed in v0.1)
```

**Design Rationale**:
- Simplifies inheritance logic (no cross-breeding complexity)
- Maintains dynasty purity (clear visual identity)
- Encourages collecting within dynasties (need 2 CYBER to breed CYBER)
- Reduces combinatorial explosion (3 dynasties = 3 breed types, not 9)

**Rule 2: Generation Progression**
```python
offspring_generation = max(parent1_gen, parent2_gen) + 1

Examples:
Gen 0 + Gen 0 = Gen 1
Gen 2 + Gen 5 = Gen 6  # max(2,5) + 1
Gen 10 + Gen 3 = Gen 11
```

**Design Rationale**:
- Always progresses forward (no generation regression)
- Simple formula (players understand immediately)
- Encourages mixing generations (Gen 0 + Gen 10 = Gen 11 is optimal)
- Infinite scaling (no generation cap)

**Rule 3: Stat Inheritance**
```python
base_stats = parent_variant.rarity_stats  # From variant rarity
generation_multiplier = 1 + (generation * 0.05)
final_stats = base_stats * generation_multiplier

Example (CYBER OMEGA Legendary + CYBER SPARK Common):
Offspring variant: Randomly chosen from CYBER variants (50/50 if 2 owned)
Offspring generation: Gen 1 (Gen 0 + Gen 0)
Offspring stats: Variant base * 1.05
```

**Design Rationale**:
- Stats from variant rarity (Legendary > Common)
- Generation adds multiplier (Gen 10 = +50% stats)
- Offspring variant is random (encourages collecting many variants)
- Parents don't need to be same variant (any CYBER + any CYBER works)

---

## DNA Cost Formula

### Cost Calculation

```python
breeding_cost = 200 + (avg_parent_generation * 100)

Examples:
Gen 0 + Gen 0 = 200 DNA  # avg = 0
Gen 1 + Gen 3 = 400 DNA  # avg = 2
Gen 5 + Gen 5 = 700 DNA  # avg = 5
Gen 10 + Gen 10 = 1200 DNA  # avg = 10
Gen 20 + Gen 0 = 1200 DNA  # avg = 10
```

**Design Rationale**:
- Low entry cost (200 DNA) → encourages experimentation
- Scales with generation → prevents spam breeding
- Averaging rewards mixing generations (Gen 20 + Gen 0 = same cost as Gen 10 + Gen 10)

### Cost Tuning

**If breeding is too expensive** (players not breeding):
- Reduce base cost (200 → 100)
- Reduce multiplier (100 → 50)
- Result: Gen 5 + Gen 5 breeding: 700 DNA → 350 DNA

**If breeding is too cheap** (players breed too much, ignore unlocks):
- Increase base cost (200 → 300)
- Increase multiplier (100 → 150)
- Result: Gen 5 + Gen 5 breeding: 700 DNA → 1050 DNA

**Monitoring Metric**: Breeds per week per player (target: 2-5)

---

## Offspring Variant Selection

### v0.1 MVP: Random from Owned

```python
def select_offspring_variant(parent1_variant, parent2_variant, player_collection):
    # Get all CYBER variants player owns
    owned_cyber_variants = [v for v in player_collection if v.dynasty == 'CYBER']

    # Randomly select one
    offspring_variant = random.choice(owned_cyber_variants)

    return offspring_variant

Example:
Player owns: CYBER SPARK (Common), CYBER OMEGA (Legendary)
Parent 1: CYBER SPARK Gen 0
Parent 2: CYBER OMEGA Gen 0
Offspring: 50% chance CYBER SPARK Gen 1, 50% chance CYBER OMEGA Gen 1
```

**Design Rationale**:
- Encourages collecting many variants (more variants = better odds)
- Creates excitement (will I get Legendary offspring?)
- Simple algorithm (no complex inheritance)

### Future (v0.5+): Weighted by Rarity

```python
def select_offspring_variant_weighted(parent1, parent2, collection):
    rarity_weights = {
        'common': 1.0,
        'uncommon': 0.7,
        'rare': 0.5,
        'epic': 0.3,
        'legendary': 0.1
    }

    # If both parents are same variant, 80% chance offspring is same
    if parent1.variant == parent2.variant:
        if random.random() < 0.8:
            return parent1.variant

    # Otherwise, weighted random from collection
    variants = [(v, rarity_weights[v.rarity]) for v in collection]
    return weighted_random(variants)

Example:
Player owns: 3 Common, 2 Uncommon, 1 Legendary
Breeding: CYBER OMEGA Legendary + CYBER OMEGA Legendary
Offspring: 80% CYBER OMEGA, 20% random (weighted toward Common)
```

**Design Rationale**:
- Rewards breeding matching variants (80% inheritance)
- Legendary breeding isn't guaranteed (maintains rarity)
- Still encourages collecting (more variants = more options)

---

## Breeding Cooldown

### v0.1 MVP: 24-Hour Per Snake

**Rule**: Each snake can breed once per 24 hours

**Implementation**:
```sql
CREATE TABLE breeding_history (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  parent1_id UUID REFERENCES player_collection(id),
  parent2_id UUID REFERENCES player_collection(id),
  offspring_id UUID REFERENCES player_collection(id),
  bred_at TIMESTAMP DEFAULT NOW()
);

-- Check cooldown
SELECT bred_at FROM breeding_history
WHERE (parent1_id = ? OR parent2_id = ?)
AND bred_at > NOW() - INTERVAL '24 hours';
```

**Design Rationale**:
- Prevents spam breeding (can't breed same pair 100 times)
- Encourages diverse collection (breed multiple pairs daily)
- Balances DNA economy (can't convert DNA → infinite snakes)
- No global cooldown (can breed as many pairs as you own)

### Alternative: Global Daily Limit

**Rule**: Max 3 breeds per day (across all snakes)

**Pros**:
- Simpler to understand
- Limits whale advantage (can't breed 100 pairs/day)

**Cons**:
- Feels restrictive (why can't I breed more if I have snakes?)
- Discourages large collections

**Recommendation**: Use per-snake cooldown (MVP approach)

---

## Breeding UI/UX Design

### Step 1: Parent Selection

**Flow**:
1. Player opens "Breeding Lab"
2. Sees "Select Parent 1" (grid of owned snakes, grouped by dynasty)
3. Filter: Same dynasty only (CYBER + PRIMAL grayed out)
4. Player selects CYBER SPARK Gen 0
5. Sees "Select Parent 2" (only CYBER variants shown, cooldown snakes grayed out)
6. Player selects CYBER OMEGA Gen 2
7. Preview screen shows:
   - Parent 1: CYBER SPARK Gen 0
   - Parent 2: CYBER OMEGA Gen 2
   - Cost: 300 DNA (avg gen 1 × 100 + 200)
   - Offspring gen: Gen 3 (max(0,2) + 1)
   - Possible variants: CYBER SPARK or CYBER OMEGA (50/50)

### Step 2: Breeding Animation

**Sequence**:
1. Player confirms (DNA deducted)
2. Animation: Parents circle each other, sparks/energy effects
3. Egg appears (3 seconds)
4. Egg hatches
5. Offspring revealed with fanfare
6. Stats displayed: Gen 3, variant (CYBER OMEGA!), stats

**Design Principles**:
- Visual excitement (animations, particle effects)
- Suspense (which variant will it be?)
- Celebration (offspring reveal feels rewarding)

### Step 3: Breeding History

**UI Element**: "Lineage Tree" view

**Example**:
```
Gen 0: CYBER SPARK (starter)
Gen 0: CYBER OMEGA (unlocked)
  ↓ ↓
Gen 3: CYBER OMEGA (bred from above)
Gen 1: CYBER SPARK (unlocked)
  ↓ ↓
Gen 4: CYBER SPARK (bred from above)
```

**Design Rationale**:
- Shows breeding progression (pride in lineage)
- Helps plan future breeding (which snakes to use)
- Collectible aspect (rare lineages)

---

## Future Expansion: Cross-Dynasty Breeding (v0.5+)

### Hybrid Offspring

**Example**:
```
CYBER (cyan/magenta) + PRIMAL (green/brown)
= TECHNO-ORGANIC HYBRID

Visual: 50/50 mix (cyan circuits + green vines)
Stats: Average of parents (2.5% speed + 2.5% DNA gen)
Rarity: Inherits rarer parent
```

**Unlock Mechanic**:
- "Research Lab" building (cost: 10k DNA)
- Research "Cross-Dynasty Breeding" (cost: 5k DNA, 7 days)
- Unlocks permanently

**Design Rationale**:
- Late-game content (requires significant investment)
- New visual variants (expand collection beyond 30 → 90+ hybrids)
- Strategic depth (optimize stat combinations)
- Doesn't invalidate pure dynasties (set bonuses still require 10 pure variants)

---

## Testing Breeding Balance

### Metrics to Track

**Breeding Frequency**:
- Breeds per week per player (target: 2-5)
- If <2: Breeding too expensive or unrewarding
- If >10: Breeding too cheap

**DNA Sink**:
- DNA spent on breeding vs unlocks (target: 30-40% on breeding)
- If <20%: Players ignoring breeding
- If >60%: Players only breeding (unlocks too expensive)

**Generation Distribution**:
- Average generation (target: Gen 3-5 by Month 1)
- Max generation (target: Gen 10-15 by Month 1)
- If too low: Breeding too expensive
- If too high: Breeding too cheap

### A/B Tests

**Test 1: Breeding Cost**
- Group A: 200 + (gen × 100) [current]
- Group B: 100 + (gen × 50) [50% cheaper]
- Measure: Breeds per week, DNA sink ratio

**Test 2: Offspring Variant**
- Group A: Random 50/50 [current]
- Group B: Weighted by rarity [future]
- Measure: Player satisfaction, breeding frequency

---

## Summary

**v0.1 MVP Breeding Rules**:
- Same dynasty only (CYBER + CYBER only)
- Generation: max(p1, p2) + 1
- Cost: 200 + (avg_gen × 100) DNA
- Variant: Random from owned
- Cooldown: 24 hours per snake

**Design Goals**:
- Encourage collection (need variants to breed)
- Simple rules (understand immediately)
- Deep strategy (optimize generations, variants)
- Long-term engagement (infinite generations)

**Future Expansion**: Cross-dynasty hybrids (v0.5+)

---

## See Also

**Breeding Rules**: @knowledge_base/game/quick_ref/breeding_rules.md
**Balance Progression**: @knowledge_base/game/how_to/balance_progression.md
**Dynasty Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md
