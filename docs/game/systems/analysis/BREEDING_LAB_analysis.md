# Breeding Lab System: Complete 8-Level Consequence Analysis

**System:** Breeding Lab (Snake Breeding & Genetic Combinations)
**Tier:** Tier 2 (Meta-Game Core)
**Status:** ONE OF THREE META-GAME PILLARS (Collection + Breeding + Evolution)
**Analysis Date:** 2025-10-14
**Word Count:** ~7,800 words

---

## Executive Summary

The Breeding Lab System is one of **three core meta-game pillars** (Collection + Breeding + Evolution) that transform SupaSnake from "a Snake game" into "a genetic empire simulator." Per MVP_VISION.md, players spend 70% of session time in the Snake Lab managing their collection and breeding strategies.

**Core Value Proposition:**
> "What happens if I breed a Gen 5 MECHA snake with a Gen 1 NEBULA snake? Let me find out."
> - PLAYER_JOURNEY.md (Experimenter archetype - loves genetic puzzles)

**Critical Constraint:** Dynasty System is currently **UNDEFINED** but has recommendations from the Dynasty requirements doc. For v0.1, we recommend **same-dynasty breeding only** (MECHA × MECHA = MECHA offspring), with cross-dynasty deferred to v0.5+.

---

## Level 1: Direct Implementation

### 1.1 System Overview

**Purpose:** Combine two parent snakes to create unique offspring with inherited traits, pursuing rare genetic combinations and building breeding strategies over generations.

**Core Mechanics:**
- **Parent Selection:** Choose 2 snakes from Collection
- **DNA Cost:** Breed costs DNA (200-2,000 based on parent generation avg)
- **Breeding Timer:** 1-8 hours scaling by generation (creates return sessions)
- **Offspring Reveal:** New snake created with combined/inherited traits
- **Generation Progression:** offspring_gen = max(parent1_gen, parent2_gen) + 1 (PR-004)

**Design Goals:**
1. **Engagement Loop:** Breeding creates return triggers (timers complete → notifications → return to claim)
2. **Genetic Puzzle:** Deterministic outcomes enable strategy (BA-002: same parents = same offspring)
3. **Collection Expansion:** Primary method for acquiring new variants (70% of collection via breeding)
4. **DNA Sink:** Major economic sink balancing DNA generation (breeding vs shop vs evolution)

### 1.2 Parent Selection UI

**Collection Integration:**
Breeding Lab requires selecting 2 parents from player's Collection:

```
┌──────────────────────────────────────────────┐
│ BREEDING LAB                                  │
│ Select 2 parents to create offspring         │
├──────────────────────────────────────────────┤
│ Parent Slot 1: [Empty]                       │
│ [Select from Collection] button              │
│                                               │
│ Parent Slot 2: [Empty]                       │
│ [Select from Collection] button              │
├──────────────────────────────────────────────┤
│ [Breed] button (disabled until 2 selected)   │
└──────────────────────────────────────────────┘
```

**After Parent 1 Selected:**
```typescript
interface ParentSlot {
  snake: Variant | null;
  thumbnail: string;
  name: string;
  dynasty: Dynasty;
  generation: number;
  rarity: Rarity;
  stats: SnakeStats;
}

// Parent 1 selected: CYBER Starlight Gen 5 Rare
const parent1: ParentSlot = {
  snake: selectedVariant,
  thumbnail: 'cyber_starlight_128x128.png',
  name: 'Cyber Starlight',
  dynasty: Dynasty.CYBER,
  generation: 5,
  rarity: Rarity.RARE,
  stats: { speed: 85, power: 70, size: 60 }
};
```

**Parent Selection Filters (Dynasty Rules):**

Per DYNASTY_SYSTEM_requirements.md recommendations:
- **v0.1:** Same-dynasty breeding only
- **v0.5+:** Cross-dynasty breeding (deferred for complexity)

```typescript
// v0.1 Implementation: Same Dynasty Only
function getValidBreedingPartners(parent1: Variant): Variant[] {
  return userCollection.filter(snake => {
    // Must be same dynasty
    if (snake.dynasty !== parent1.dynasty) return false;

    // Cannot breed snake with itself
    if (snake.id === parent1.id) return false;

    // All generations valid (Gen 1 can breed with Gen 10)
    return true;
  });
}

// Example: Parent 1 = CYBER Gen 5
// Valid partners: All CYBER snakes (Gen 1-10+) EXCEPT the selected snake itself
// Invalid partners: NEBULA, MECHA, etc. (different dynasties)
```

**Parent Slot UI (Filled):**
```
┌──────────────────────────────────────────────┐
│ BREEDING LAB                                  │
├──────────────────────────────────────────────┤
│ Parent Slot 1: [Cyber Starlight]             │
│ ┌────────┐ Gen 5 | Rare | CYBER              │
│ │ 🐍     │ Speed: 85  Power: 70  Size: 60    │
│ │  128px │ [Change] button                    │
│ └────────┘                                    │
│                                               │
│ Parent Slot 2: [Cyber Pulse]                 │
│ ┌────────┐ Gen 3 | Uncommon | CYBER          │
│ │ 🐍     │ Speed: 65  Power: 55  Size: 50    │
│ │  128px │ [Change] button                    │
│ └────────┘                                    │
├──────────────────────────────────────────────┤
│ OFFSPRING PREDICTION                          │
│ Dynasty: CYBER (100% - same dynasty)          │
│ Generation: Gen 6 (max(5,3) + 1 = 6)         │
│ Rarity: 60% Rare, 35% Uncommon, 5% Epic      │
│ Stats: Speed 75±5, Power 62±5, Size 55±5     │
│                                               │
│ DNA Cost: 400 DNA                             │
│ Breeding Time: 2 hours                        │
│                                               │
│ [Breed Now] button (enabled)                 │
└──────────────────────────────────────────────┘
```

### 1.3 Genetic Inheritance System

**CRITICAL DESIGN DECISION: Deterministic vs Random**

Per BA-002 constraint: "Breeding outcomes deterministic (same parents = same offspring)"

**Implication:** Breeding must be **seeded RNG**, not pure random.

```typescript
// Deterministic breeding using parent IDs as seed
function calculateOffspring(parent1: Variant, parent2: Variant): Offspring {
  // Create seed from parent IDs (deterministic)
  const seed = hashString(`${parent1.id}-${parent2.id}`);
  const rng = new SeededRNG(seed);

  // Offspring generation (deterministic formula)
  const generation = Math.max(parent1.generation, parent2.generation) + 1;

  // Offspring dynasty (v0.1: 100% same dynasty as parents)
  const dynasty = parent1.dynasty; // Same dynasty only

  // Offspring rarity (seeded RNG with parent influence)
  const rarity = calculateRarity(parent1.rarity, parent2.rarity, rng);

  // Offspring stats (average of parents ± seeded variance)
  const stats = calculateStats(parent1.stats, parent2.stats, rng);

  return {
    generation,
    dynasty,
    rarity,
    stats,
    parents: [parent1.id, parent2.id]
  };
}

// Seeded RNG class
class SeededRNG {
  private seed: number;

  constructor(seed: number) {
    this.seed = seed;
  }

  // Generate deterministic "random" number
  next(): number {
    this.seed = (this.seed * 9301 + 49297) % 233280;
    return this.seed / 233280;
  }
}

// Hash function for seed creation
function hashString(str: string): number {
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    hash = ((hash << 5) - hash) + str.charCodeAt(i);
    hash |= 0; // Convert to 32bit integer
  }
  return Math.abs(hash);
}
```

**Key Insight:** Using parent IDs as seed ensures:
- Same parents always produce same offspring (deterministic)
- Different parent combinations produce different offspring
- Players can strategize ("I know CYBER Gen 5 + CYBER Gen 3 = this specific offspring")
- Breeding outcomes are learnable (enables strategy)

### 1.4 Rarity Inheritance Formula

**Design Goal:** Offspring rarity based on parents' rarities, with chance for rarity increase.

**Rarity Tiers:**
1. Common (40% of drops)
2. Uncommon (30% of drops)
3. Rare (20% of drops)
4. Epic (8% of drops)
5. Legendary/Mythic (2% of drops)

**Rarity Inheritance Table:**

```typescript
function calculateRarity(
  parent1Rarity: Rarity,
  parent2Rarity: Rarity,
  rng: SeededRNG
): Rarity {
  // Average parent rarity values
  const rarityValue = {
    [Rarity.COMMON]: 1,
    [Rarity.UNCOMMON]: 2,
    [Rarity.RARE]: 3,
    [Rarity.EPIC]: 4,
    [Rarity.LEGENDARY]: 5
  };

  const avgRarity = (rarityValue[parent1Rarity] + rarityValue[parent2Rarity]) / 2;
  const roll = rng.next(); // 0.0-1.0

  // Common × Common (avg = 1.0)
  if (avgRarity <= 1.5) {
    if (roll < 0.70) return Rarity.COMMON;       // 70%
    if (roll < 0.95) return Rarity.UNCOMMON;     // 25%
    return Rarity.RARE;                           // 5%
  }

  // Common × Uncommon OR Uncommon × Uncommon (avg = 1.5-2.5)
  if (avgRarity <= 2.5) {
    if (roll < 0.50) return Rarity.UNCOMMON;     // 50%
    if (roll < 0.85) return Rarity.RARE;         // 35%
    if (roll < 0.98) return Rarity.EPIC;         // 13%
    return Rarity.LEGENDARY;                      // 2%
  }

  // Rare × Rare (avg = 3.0)
  if (avgRarity <= 3.5) {
    if (roll < 0.60) return Rarity.RARE;         // 60%
    if (roll < 0.90) return Rarity.EPIC;         // 30%
    return Rarity.LEGENDARY;                      // 10%
  }

  // Epic × Epic or higher (avg = 4.0+)
  if (roll < 0.50) return Rarity.EPIC;           // 50%
  if (roll < 0.90) return Rarity.LEGENDARY;      // 40%
  return Rarity.LEGENDARY;                        // 10% (guaranteed Legendary)
}
```

**Example Outcomes:**
- Common × Common → 70% Common, 25% Uncommon, 5% Rare
- Uncommon × Uncommon → 50% Uncommon, 35% Rare, 13% Epic, 2% Legendary
- Rare × Rare → 60% Rare, 30% Epic, 10% Legendary
- Epic × Epic → 50% Epic, 50% Legendary

**Key Insight:** Breeding higher rarity parents = better offspring rarity chance. This creates progression goal: "Breed to Legendary."

### 1.5 Stat Inheritance Formula

**Design Goal:** Offspring stats average parents' stats ±10% variance for variety.

```typescript
interface SnakeStats {
  speed: number;    // 0-100
  power: number;    // 0-100
  size: number;     // 0-100
}

function calculateStats(
  parent1Stats: SnakeStats,
  parent2Stats: SnakeStats,
  rng: SeededRNG
): SnakeStats {
  const variance = 0.10; // ±10% variance

  return {
    speed: calculateStat(parent1Stats.speed, parent2Stats.speed, variance, rng),
    power: calculateStat(parent1Stats.power, parent2Stats.power, variance, rng),
    size: calculateStat(parent1Stats.size, parent2Stats.size, variance, rng)
  };
}

function calculateStat(
  parent1Stat: number,
  parent2Stat: number,
  variance: number,
  rng: SeededRNG
): number {
  // Average parent stats
  const avgStat = (parent1Stat + parent2Stat) / 2;

  // Apply ±10% variance (seeded)
  const varianceAmount = avgStat * variance;
  const roll = rng.next(); // 0.0-1.0
  const variedStat = avgStat + (roll - 0.5) * 2 * varianceAmount;

  // Clamp to 0-100 range
  return Math.max(0, Math.min(100, Math.round(variedStat)));
}
```

**Example:**
```
Parent 1: Speed 80, Power 60, Size 40
Parent 2: Speed 60, Power 80, Size 60

Offspring (seeded RNG):
- Speed: avg 70 ± 7 → Result: 68 (specific seed result)
- Power: avg 70 ± 7 → Result: 74
- Size: avg 50 ± 5 → Result: 52
```

**Key Insight:** Same parents always produce same offspring stats (deterministic seed), but different parent combos produce different stats. This enables breeding strategy.

### 1.6 Dynasty Inheritance (v0.1 vs v0.5+)

**v0.1 Recommendation (From DYNASTY_SYSTEM_requirements.md):**

**Same-Dynasty Breeding Only:**
- CYBER + CYBER = CYBER offspring (100% inheritance)
- Cannot breed CYBER × NEBULA (different dynasties blocked in UI)
- Simplest to implement and understand
- Encourages dynasty specialization

```typescript
// v0.1: Same Dynasty Only
function calculateDynasty(parent1: Variant, parent2: Variant): Dynasty {
  // Validation: Parents must be same dynasty
  if (parent1.dynasty !== parent2.dynasty) {
    throw new Error('Cross-dynasty breeding not allowed in v0.1');
  }

  // Offspring inherits parent dynasty (100%)
  return parent1.dynasty;
}
```

**v0.5+ Option (Cross-Dynasty Breeding - Deferred):**

If Dynasty System defines cross-dynasty rules later:

```typescript
// v0.5: Cross-Dynasty Option (80% inheritance from one parent)
function calculateDynasty(
  parent1: Variant,
  parent2: Variant,
  rng: SeededRNG
): Dynasty {
  // If same dynasty, offspring inherits (100%)
  if (parent1.dynasty === parent2.dynasty) {
    return parent1.dynasty;
  }

  // If cross-dynasty, 50/50 chance of either parent's dynasty
  const roll = rng.next();
  return roll < 0.5 ? parent1.dynasty : parent2.dynasty;
}
```

**Recommendation:** Ship v0.1 with **same-dynasty only**, defer cross-dynasty to v0.5+ after Dynasty System is fully specified.

### 1.7 DNA Cost Formula

**Design Goal:** Breeding cost scales with parent generation to create economic progression.

**Cost Formula:**
```typescript
function calculateBreedingCost(parent1: Variant, parent2: Variant): number {
  const avgGeneration = (parent1.generation + parent2.generation) / 2;
  return Math.floor(100 * (avgGeneration + 1));
}
```

**Examples (from Collection Lab analysis):**
```
Gen 1 × Gen 1 → avg 1 → cost = 100 × 2 = 200 DNA
Gen 2 × Gen 2 → avg 2 → cost = 100 × 3 = 300 DNA
Gen 3 × Gen 5 → avg 4 → cost = 100 × 5 = 500 DNA
Gen 5 × Gen 5 → avg 5 → cost = 100 × 6 = 600 DNA
Gen 10 × Gen 10 → avg 10 → cost = 100 × 11 = 1,100 DNA
Gen 20 × Gen 20 → avg 20 → cost = 100 × 21 = 2,100 DNA
```

**Cross-Generation Breeding:**
```
Gen 1 × Gen 10 → avg 5.5 → cost = 100 × 6.5 = 650 DNA
Offspring: Gen 11 (max(1, 10) + 1 = 11)
```

**Economic Impact:**
- Early game (Gen 1-3): 200-400 DNA per breed (affordable)
- Mid game (Gen 4-7): 500-800 DNA per breed (requires planning)
- Late game (Gen 10+): 1,100+ DNA per breed (major investment)

**Balancing Check (from Resource Generation analysis):**
Average player: 800 DNA/day (5 runs × 160 DNA/run)
- Can afford 2-4 early breeds per day (200-400 DNA)
- Can afford 1 mid-game breed per day (500-800 DNA)
- Requires 2-3 days savings for late-game breed (1,100+ DNA)

**Key Validation:** Breeding cost must NOT consume all DNA (player needs DNA for shop, evolution too).

### 1.8 Breeding Timer System

**Design Goal:** Create return sessions without frustration (CE-003 constraint).

**Timer Durations:**
```typescript
function calculateBreedingTime(offspringGeneration: number): number {
  if (offspringGeneration <= 5) return 3600;     // 1 hour (3600s)
  if (offspringGeneration <= 10) return 7200;    // 2 hours
  if (offspringGeneration <= 20) return 14400;   // 4 hours
  return 28800;                                   // 8 hours (Gen 21+)
}
```

**Timer Rationale:**
- **1 hour (Gen 1-5):** Early game, rapid unlocks feel good
- **2 hours (Gen 6-10):** Mid game, creates 2-3 return sessions per day
- **4 hours (Gen 11-20):** Late game, morning/evening check-ins
- **8 hours (Gen 21+):** Endgame, overnight breeding (sleep cycle)

**Return Session Strategy:**
```
Morning (8am): Start 2-hour breed
Mid-day (10am): Claim offspring, start 4-hour breed
Evening (6pm): Claim offspring, start 8-hour breed
Next Morning (8am): Claim offspring, repeat cycle
```

**Multiple Breeding Slots:**

**v0.1 Recommendation:** 3 free breeding slots
- Allows 3 simultaneous breeds (parallel progression)
- No "waiting for breeding to finish" frustration
- Premium expansion: +2 slots for $1.99 (optional, not required)

```typescript
interface BreedingSlot {
  id: number;                    // Slot number (1-3 for free, 4-5 premium)
  status: 'empty' | 'breeding';
  parent1?: Variant;
  parent2?: Variant;
  offspringPreview?: Offspring;
  startTime?: Date;
  completeTime?: Date;
  remainingSeconds?: number;
}

// Example state
const breedingSlots: BreedingSlot[] = [
  {
    id: 1,
    status: 'breeding',
    parent1: cyberGen5,
    parent2: cyberGen3,
    offspringPreview: cyberGen6Offspring,
    startTime: new Date('2025-10-14 10:00:00'),
    completeTime: new Date('2025-10-14 12:00:00'),
    remainingSeconds: 3600 // 1 hour remaining
  },
  {
    id: 2,
    status: 'breeding',
    parent1: nebulaGen4,
    parent2: nebulaGen4,
    offspringPreview: nebulaGen5Offspring,
    startTime: new Date('2025-10-14 09:00:00'),
    completeTime: new Date('2025-10-14 13:00:00'),
    remainingSeconds: 7200 // 2 hours remaining
  },
  {
    id: 3,
    status: 'empty'
  }
];
```

**Breeding UI (Slots):**
```
┌──────────────────────────────────────────────┐
│ BREEDING SLOTS                                │
├──────────────────────────────────────────────┤
│ Slot 1: [Breeding - 1h 23m remaining]        │
│   Cyber Gen 5 × Cyber Gen 3 → Gen 6          │
│   [Claim] button (disabled, timer running)   │
│                                               │
│ Slot 2: [Breeding - 3h 45m remaining]        │
│   Nebula Gen 4 × Nebula Gen 4 → Gen 5        │
│   [Claim] button (disabled, timer running)   │
│                                               │
│ Slot 3: [Empty]                              │
│   [Start New Breed] button                   │
├──────────────────────────────────────────────┤
│ [Unlock 2 More Slots - $1.99] (premium)      │
└──────────────────────────────────────────────┘
```

### 1.9 Offspring Reveal & Claim

**Post-Timer Completion:**

When timer completes:
1. **Push Notification (opt-in):** "Your CYBER Gen 6 snake is ready!"
2. **Breeding slot status changes:** `status: 'complete'`
3. **[Claim] button enabled**

**Claim Flow:**
```
Player taps [Claim] button
    ↓
Loading screen (suspense)
    ↓
Offspring Reveal Animation:
  - Egg cracks open (2-3s animation)
  - Snake emerges with visual effects
  - Stats reveal (one at a time)
  - Rarity badge appears (with sound)
  - "Added to Collection" message
    ↓
Offspring Detail Modal:
  - Full snake visual (256×256)
  - Name: [Auto-generated or player names]
  - Dynasty: CYBER
  - Generation: 6
  - Rarity: Rare
  - Stats: Speed 68, Power 74, Size 52
  - Parents: Cyber Starlight × Cyber Pulse
  - [View in Collection] button
  - [Breed Again] button (repeat with same parents)
    ↓
Return to Breeding Lab
```

**Database Update:**
```sql
-- Create offspring in user_snakes table
INSERT INTO user_snakes (
  user_id,
  snake_id,
  generation,
  acquired_at,
  acquired_via,
  parent_1_id,
  parent_2_id
) VALUES (
  $userId,
  $snakeVariantId,
  6, -- offspring generation
  NOW(),
  'breed',
  $parent1UserSnakeId,
  $parent2UserSnakeId
);

-- Clear breeding slot
DELETE FROM breeding_queue
WHERE slot_id = $slotId AND user_id = $userId;
```

### 1.10 Backend Schema (Breeding Queue)

Per BACKEND_SUPABASE_analysis recommendations:

```sql
-- Breeding queue (active breeding sessions)
CREATE TABLE breeding_queue (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id),
  slot_id INTEGER NOT NULL, -- 1-5 (3 free, 2 premium)
  parent_1_id UUID NOT NULL REFERENCES user_snakes(id),
  parent_2_id UUID NOT NULL REFERENCES user_snakes(id),
  offspring_seed INTEGER NOT NULL, -- Deterministic seed
  offspring_generation INTEGER NOT NULL,
  offspring_dynasty VARCHAR(50) NOT NULL,
  offspring_rarity VARCHAR(20) NOT NULL,
  offspring_stats JSONB NOT NULL,
  dna_cost INTEGER NOT NULL,
  start_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  complete_time TIMESTAMPTZ NOT NULL,
  claimed BOOLEAN NOT NULL DEFAULT FALSE,

  CONSTRAINT unique_user_slot UNIQUE (user_id, slot_id),
  INDEX idx_user_breeding (user_id),
  INDEX idx_complete_time (complete_time)
);

-- Query: Get active breeding slots for user
SELECT * FROM breeding_queue
WHERE user_id = $userId AND claimed = FALSE
ORDER BY slot_id ASC;

-- Query: Check if breeding complete
SELECT *,
  CASE
    WHEN complete_time <= NOW() THEN TRUE
    ELSE FALSE
  END as is_complete,
  EXTRACT(EPOCH FROM (complete_time - NOW())) as remaining_seconds
FROM breeding_queue
WHERE id = $breedingId;
```

**Server-Side Breeding Calculation (Anti-Cheat):**

```typescript
// Server endpoint: POST /api/breeding/start
export async function startBreeding(
  userId: string,
  slotId: number,
  parent1Id: string,
  parent2Id: string
): Promise<{ success: boolean; breedingId: string }> {
  // Validate ownership
  const [parent1, parent2] = await supabase
    .from('user_snakes')
    .select('*')
    .in('id', [parent1Id, parent2Id])
    .eq('user_id', userId);

  if (!parent1 || !parent2) {
    return { success: false, error: 'Parent snakes not owned' };
  }

  // Validate dynasty rules (v0.1: same dynasty only)
  if (parent1.dynasty !== parent2.dynasty) {
    return { success: false, error: 'Cross-dynasty breeding not allowed' };
  }

  // Calculate offspring (SERVER-SIDE, never trust client)
  const offspring = calculateOffspring(parent1, parent2);
  const dnaCost = calculateBreedingCost(parent1, parent2);
  const breedingTime = calculateBreedingTime(offspring.generation);

  // Deduct DNA
  await supabase.rpc('spend_dna_atomic', {
    user_id: userId,
    amount: dnaCost,
    source: 'breeding'
  });

  // Insert into breeding queue
  const { data } = await supabase
    .from('breeding_queue')
    .insert({
      user_id: userId,
      slot_id: slotId,
      parent_1_id: parent1Id,
      parent_2_id: parent2Id,
      offspring_seed: hashString(`${parent1Id}-${parent2Id}`),
      offspring_generation: offspring.generation,
      offspring_dynasty: offspring.dynasty,
      offspring_rarity: offspring.rarity,
      offspring_stats: offspring.stats,
      dna_cost: dnaCost,
      complete_time: new Date(Date.now() + breedingTime * 1000)
    })
    .select()
    .single();

  return { success: true, breedingId: data.id };
}

// Server endpoint: POST /api/breeding/claim
export async function claimOffspring(
  userId: string,
  breedingId: string
): Promise<{ success: boolean; offspring: Variant }> {
  // Fetch breeding session
  const breeding = await supabase
    .from('breeding_queue')
    .select('*')
    .eq('id', breedingId)
    .eq('user_id', userId)
    .single();

  if (!breeding) {
    return { success: false, error: 'Breeding session not found' };
  }

  // Validate timer complete
  if (new Date() < new Date(breeding.complete_time)) {
    return { success: false, error: 'Breeding not yet complete' };
  }

  // Create offspring snake
  const { data: offspring } = await supabase
    .from('user_snakes')
    .insert({
      user_id: userId,
      snake_id: getSnakeVariantId(breeding.offspring_dynasty, breeding.offspring_rarity),
      generation: breeding.offspring_generation,
      acquired_via: 'breed',
      parent_1_id: breeding.parent_1_id,
      parent_2_id: breeding.parent_2_id
    })
    .select()
    .single();

  // Mark breeding as claimed
  await supabase
    .from('breeding_queue')
    .update({ claimed: true })
    .eq('id', breedingId);

  return { success: true, offspring };
}
```

---

## Level 2: System Effects

### 2.1 Collection Lab Integration

**Breeding Expands Collection (Primary Method):**

Per Collection Lab analysis, **70% of variants acquired via breeding**.

```
Collection Growth:
Day 7: 6-8 variants (mix of breeds and shop purchases)
Day 14: 12-15 variants (increasing breed ratio)
Day 30: 20-25 variants (70% from breeding = 14-17 breeds)

Breeding Frequency:
Week 1: 2-3 breeds
Week 2: 3-5 breeds
Week 3: 4-6 breeds
Week 4: 5-7 breeds
Total: ~15 breeds by Day 30 (70% of collection)
```

**Breeding vs Shop Acquisition:**
```
Breeding advantages:
- Cheaper DNA cost (200-500 vs 300-1,200 DNA shop cost)
- Creates unique combinations
- Inherits favorable stats
- Teaches meta-game strategy

Shop advantages:
- Instant (no timer)
- Guaranteed specific variant
- No parent requirement
- Fills gaps in collection
```

**Parent Selection from Collection:**

Breeding Lab opens Collection in "selection mode":

```typescript
// Collection Lab: Select Parent for Breeding
class CollectionSelectionMode {
  open(context: {
    mode: 'breeding_parent',
    parentNumber: 1 | 2,
    existingParent?: Variant, // If selecting Parent 2, show Parent 1 for context
    filters?: SelectionFilters
  }): Promise<Variant> {
    // Show Collection with filters applied
    const validSnakes = this.applyFilters(userCollection, context.filters);

    // Highlight valid breeding partners
    // Dim invalid partners (wrong dynasty, already selected)

    return selectedSnake;
  }
}
```

**Breeding Creates Collection Expansion Loop:**
```
Play Snake → Earn DNA → Breed 2 Snakes → New Offspring →
Add to Collection → More Breeding Options → Breed Again
```

### 2.2 Resource Generation Integration (DNA Sink)

**Breeding as Major DNA Sink:**

Per Resource Generation analysis:
- Average player: 800 DNA/day (24,000 DNA/month)
- Breeding costs: 200-2,000 DNA per breed
- Target: 15 breeds by Day 30 = ~6,750 DNA spent on breeding

**Economic Balance:**
```
Monthly DNA Budget (Average Player):
Income: 24,000 DNA (from Snake runs)

Spending:
- Breeding: 6,750 DNA (15 breeds × 450 DNA avg)
- Evolution: 3,000 DNA (2 evolutions × 1,500 DNA)
- Shop: 2,000 DNA (misc purchases)
Total Spent: 11,750 DNA

Surplus: 12,250 DNA (51% savings rate) ✓
```

**Breeding Cost Must NOT Consume All DNA:**

Risk: If breeding too expensive, no DNA left for shop/evolution.
Validation: 6,750 DNA breeding / 24,000 DNA income = 28% of income (healthy)

**Cost Scaling Prevents Inflation:**
```
Early game: 200-400 DNA per breed (affordable, rapid collection growth)
Mid game: 500-800 DNA per breed (requires planning)
Late game: 1,100+ DNA per breed (major investment, slows progression naturally)

Result: Later-game breeding costs MORE per action → slows inflation
```

### 2.3 Backend Integration (Breeding Queue)

**Real-Time Timer Sync:**

```typescript
// Client subscribes to breeding queue updates
const subscription = supabase
  .channel(`breeding:${userId}`)
  .on('postgres_changes', {
    event: 'UPDATE',
    schema: 'public',
    table: 'breeding_queue',
    filter: `user_id=eq.${userId}`
  }, (payload) => {
    // Update breeding slot UI
    updateBreedingSlot(payload.new);

    // If timer complete, show notification
    if (payload.new.complete_time <= new Date()) {
      showNotification('Breeding complete!');
    }
  })
  .subscribe();
```

**Offline Timer Progression:**

Per TE-002 (offline capability), breeding timers must progress offline:

```typescript
// On app open (after offline period)
async function checkBreedingProgress(userId: string): void {
  const activeBreeds = await supabase
    .from('breeding_queue')
    .select('*')
    .eq('user_id', userId)
    .eq('claimed', false);

  const completedBreeds = activeBreeds.filter(
    b => new Date(b.complete_time) <= new Date()
  );

  if (completedBreeds.length > 0) {
    showNotification(`${completedBreeds.length} snakes ready to claim!`);
  }
}
```

### 2.4 Push Notifications Integration

**Breeding Complete Notifications:**

Per CE-003 constraint (create return sessions):

```typescript
// Schedule push notification when breeding starts
async function scheduleBreedingNotification(
  userId: string,
  breedingId: string,
  completeTime: Date
): Promise<void> {
  await notifications.schedule({
    user_id: userId,
    title: 'Breeding Complete!',
    body: 'Your new snake is ready to claim.',
    scheduled_time: completeTime,
    deep_link: `supasnake://breeding/${breedingId}`,
    category: 'breeding_complete',
    priority: 'normal'
  });
}
```

**Notification Strategy:**
- **1-2 hour breeds:** Push notification on completion (rapid return)
- **4-8 hour breeds:** Push notification + badge count (evening check-in)
- **Multiple breeds:** "3 snakes ready to claim!" (batch notification)
- **Opt-in only:** Respect notification preferences (not forced)

**Return Session Impact:**
```
Without breeding timers:
- Player plays 5 runs → leaves → returns tomorrow (1 session/day)

With breeding timers:
- Player plays 2 runs → breeds snake → leaves
- 2 hours later: Notification → returns → claims offspring → plays 2 runs → breeds again
- 4 hours later: Notification → returns → claims offspring → plays 1 run
Result: 3 sessions/day (CE-002 target met)
```

---

## Level 3: Game Balance

### 3.1 Breeding Cost Curve

**Cost Formula Validation:**
```
cost = 100 × (avgParentGen + 1)

Gen 1 × Gen 1 (avg 1): 200 DNA (1.25 runs to afford)
Gen 3 × Gen 3 (avg 3): 400 DNA (2.5 runs)
Gen 5 × Gen 5 (avg 5): 600 DNA (3.75 runs)
Gen 10 × Gen 10 (avg 10): 1,100 DNA (6.9 runs)
Gen 20 × Gen 20 (avg 20): 2,100 DNA (13.1 runs)
```

**Affordability Validation (Average Player: 800 DNA/day):**
```
Early game (Gen 1-3): 200-400 DNA
- Affordable: 2-4 breeds per day
- Feel: "I can breed frequently, rapid collection growth"

Mid game (Gen 4-7): 500-800 DNA
- Affordable: 1-2 breeds per day
- Feel: "I need to plan my breeds carefully"

Late game (Gen 10+): 1,100+ DNA
- Affordable: 1 breed every 2-3 days
- Feel: "Breeding is a major investment, choose parents wisely"
```

**Progression Pacing:**
```
Week 1: 5,600 DNA available → 14-28 early breeds (if spent all on breeding)
Week 2: 5,600 DNA available → 7-14 mid breeds
Week 3: 5,600 DNA available → 5-11 mid-late breeds
Week 4: 5,600 DNA available → 3-7 late breeds

Reality Check: Players also spend on shop (20%) and evolution (10%)
Actual breeding spend: ~70% of DNA = 3,920 DNA/week

Week 1: 3,920 DNA → 9-19 breeds (reality: ~12 breeds)
Week 2: 3,920 DNA → 5-9 breeds (reality: ~7 breeds)
Week 3: 3,920 DNA → 4-7 breeds (reality: ~5 breeds)
Week 4: 3,920 DNA → 2-5 breeds (reality: ~4 breeds)

Total by Day 30: ~28 breeds (but only 15 needed for 20-variant collection)
Surplus: 13 extra breeds available (allows experimentation)
```

**Key Validation:** Breeding is affordable without consuming ALL DNA (healthy economy).

### 3.2 Breeding Timer Balance

**Timer Duration Validation:**

```
Gen 1-5 (1 hour): Encourages rapid early-game breeding
- Player breeds 2-3 snakes in first session
- Returns after 1 hour to claim
- Breeds again
- Creates habit: "Check every hour"

Gen 6-10 (2 hours): Mid-game pacing
- Morning breed → lunch claim → evening breed
- 2-3 return sessions per day (CE-002 target)

Gen 11-20 (4 hours): Late-game pacing
- Morning breed → evening claim
- 1-2 return sessions per day
- Still achievable for working adults

Gen 21+ (8 hours): Endgame overnight breeding
- Evening breed → morning claim
- Fits sleep cycle (8 hours)
- Doesn't require mid-day check-ins
```

**Risk: Timers Too Long?**

If timers feel frustrating:
- Players churn ("I can't progress")
- Premium "speed up" feels mandatory (BM-001 violation)

**Mitigation:**
- Early game timers SHORT (1 hour)
- Multiple slots (3 free) allow parallel progression
- Timers match real-life schedules (work day, sleep cycle)
- No timer exceeds 8 hours (overnight max)

**Monetization: Breeding Accelerator (Optional Premium):**
```
Breeding Accelerator: $0.99
- Reduces breeding timer to instant (single use)
- OR reduces all timers by 50% for 24 hours

Value Proposition:
- "I'm about to hit a breakthrough, speed up this Gen 10 breed"
- Convenience, not power (BM-001 compliant)
- F2P can wait, premium saves time
```

**Validation:**
- Timers create return sessions ✓ (CE-003 constraint)
- Timers don't feel punishing (short early game)
- Premium is optional (not required)

### 3.3 Generation Progression Rate

**Generation Formula:**
```
offspring_gen = max(parent1_gen, parent2_gen) + 1
```

**Progression Path:**
```
Start: Gen 1 snakes (tutorial, shop purchases)

Day 3: Gen 1 × Gen 1 → Gen 2
Day 5: Gen 2 × Gen 2 → Gen 3
Day 8: Gen 3 × Gen 3 → Gen 4
Day 12: Gen 4 × Gen 4 → Gen 5 ✓ (PR-004 target)
Day 17: Gen 5 × Gen 5 → Gen 6
Day 23: Gen 6 × Gen 6 → Gen 7
Day 30: Gen 7 × Gen 7 → Gen 8
```

**Analysis:**
- PR-004 requires Gen 5 achievable by Day 12 ✓
- Breeding progression takes ~5-6 days per generation (early game)
- By Day 30: Gen 8 achievable (7 generations of progression)

**Late-Game Slowdown:**
```
Gen 10+ progression requires:
- Higher DNA costs (1,100+ DNA)
- Longer timers (4-8 hours)
- Strategic parent selection (can't afford mistakes)

Result: Natural slowdown prevents infinite progression
```

**Cross-Generation Breeding Impact:**
```
Scenario: Player has Gen 1 and Gen 10 snakes

Gen 1 × Gen 10 → Gen 11 offspring
Cost: 100 × (10.5 + 1) = 1,150 DNA

Tradeoff:
✓ Skips Gen 2-10 (accelerated progression)
✗ High DNA cost (1,150 vs 200 for Gen 1 × Gen 1)
✗ Requires having Gen 10 parents first

Conclusion: Cross-generation breeding is strategic option (shortcuts vs cost)
```

### 3.4 Rarity Chase

**Rarity as Long-Term Goal:**

Per Collection Lab analysis, rarity distribution:
- Common: 40% of variants
- Uncommon: 30%
- Rare: 20%
- Epic: 8%
- Legendary/Mythic: 2%

**Breeding Path to Legendary:**
```
Start: Common × Common (70% Common, 25% Uncommon, 5% Rare offspring)
Week 2: Uncommon × Uncommon (50% Uncommon, 35% Rare, 13% Epic, 2% Legendary)
Week 3: Rare × Rare (60% Rare, 30% Epic, 10% Legendary)
Week 4: Epic × Epic (50% Epic, 50% Legendary)
```

**Key Insight:** Legendary snakes require breeding **Rare or Epic parents**, which themselves come from breeding. This creates multi-week progression loop.

**Rarity vs Generation Trade-off:**
```
Player Choice:
A) Breed Gen 1 Legendary × Gen 1 Legendary → Gen 2 Legendary (high rarity, low gen)
B) Breed Gen 10 Common × Gen 10 Common → Gen 11 Common (low rarity, high gen)

Both valid strategies:
- Strategy A: Collect rare variants (Collector archetype)
- Strategy B: Push generation ceiling (Experimenter archetype)
```

### 3.5 Stat Variance Impact

**Stat Inheritance: ±10% Variance**

```typescript
Parent 1: Speed 80, Power 60
Parent 2: Speed 60, Power 80

Offspring range:
- Speed: 70 ± 7 → 63-77 (10% variance on avg 70)
- Power: 70 ± 7 → 63-77
```

**Impact on Snake Gameplay:**
```
Speed 70 snake: Moves 7 units/second
Speed 77 snake: Moves 7.7 units/second (+10% faster)

Game balance:
- Noticeable difference (faster snake = easier to control)
- NOT game-breaking (still requires skill)
- Encourages breeding for optimal stats
```

**Stat Min-Maxing Strategy:**
```
Goal: Breed snake with 90+ Speed

Step 1: Acquire high-speed parents (Speed 80+)
Step 2: Breed repeatedly, hope for +10% variance rolls
Step 3: Breed best offspring together
Step 4: Repeat until reaching 90+

Time investment: 3-4 weeks of focused breeding
Payoff: Noticeable gameplay advantage
```

**Validation:** Stat variance creates long-term breeding goal (min-maxing) without being mandatory for progression.

---

## Level 4: Economy

### 4.1 DNA as Universal Currency

**DNA Sources:**
- Snake gameplay: 160 DNA/run × 5 runs/day = 800 DNA/day
- Ads: 50 DNA/ad × 2 ads/day = 100 DNA/day (optional)
- Premium: $0.99 = 500 DNA (IAP)

**DNA Sinks:**
1. **Breeding:** 200-2,000 DNA per breed (28% of monthly spending)
2. **Shop:** 300-1,200 DNA per variant (8% of monthly spending)
3. **Evolution:** 1,500 DNA per evolution (13% of monthly spending)
4. **Consumables:** Power-ups, continues (5% of monthly spending)
5. **Savings:** Reserve for future features (46% unspent)

### 4.2 Breeding Cost Progression vs Income

**Early Game (Week 1):**
```
Daily income: 800 DNA
Daily breeding capacity:
- Gen 1-3 breeds: 200-400 DNA
- Breeds per day: 2-4 breeds (if spending 100% on breeding)
- Reality: 1-2 breeds/day (spending ~60% on breeding, 40% on shop/savings)

Week 1 total:
- Income: 5,600 DNA
- Breeding spend: ~3,360 DNA (60%) = 12 breeds @ 280 DNA avg
- Shop spend: ~1,400 DNA (25%) = 2-4 shop purchases
- Savings: ~840 DNA (15%)
```

**Mid Game (Week 2-3):**
```
Daily income: 800 DNA (same)
Daily breeding capacity:
- Gen 4-7 breeds: 500-800 DNA
- Breeds per day: 1-2 breeds (if spending 100% on breeding)
- Reality: 1 breed/day (spending ~60% on breeding)

Week 2-3 total (per week):
- Income: 5,600 DNA
- Breeding spend: ~3,360 DNA (60%) = 5-7 breeds @ 550 DNA avg
- Shop spend: ~1,000 DNA (18%) = 1-2 shop purchases
- Savings: ~1,240 DNA (22%)
```

**Late Game (Week 4+):**
```
Daily income: 800 DNA (same)
Daily breeding capacity:
- Gen 10+ breeds: 1,100-2,000 DNA
- Breeds per day: 0.5-1 breed (requires 2-3 days savings)
- Reality: 1 breed every 2 days

Week 4 total:
- Income: 5,600 DNA
- Breeding spend: ~3,000 DNA (54%) = 2-3 breeds @ 1,200 DNA avg
- Evolution spend: ~1,500 DNA (27%) = 1 evolution
- Savings: ~1,100 DNA (19%)
```

**Key Balance Insight:** Breeding cost scales UP while income stays FLAT → natural progression slowdown → prevents infinite exponential growth.

### 4.3 Breeding vs Shop vs Evolution

**DNA Spending Decision Matrix:**

| Goal | Best Option | DNA Cost | Time Cost |
|------|-------------|----------|-----------|
| Expand collection quickly | Breeding | 200-600 DNA | 1-4 hours (timer) |
| Get specific variant NOW | Shop | 300-1,200 DNA | Instant |
| Unlock abilities/cosmetics | Evolution | 1,500 DNA | Instant |
| Get rare offspring | Breeding (high-rarity parents) | 500-800 DNA | 2-4 hours |

**Breeding Advantages:**
- Cheaper than shop (200-600 vs 300-1,200 DNA)
- Creates unique stat combinations
- Inherits favorable traits
- Progresses generation (Gen +1)
- Teaches meta-game strategy

**Shop Advantages:**
- Instant (no waiting)
- Guaranteed specific variant (no RNG)
- Fills gaps in collection (missing dynasties)
- No parent requirement

**Evolution Advantages:**
- Unlocks abilities (gameplay power)
- Unlocks cosmetics (prestige)
- Permanent unlock (not per-snake)

**Economic Balance Validation:**
```
Month 1 DNA allocation (average player):
Income: 24,000 DNA

Spending:
- Breeding: 6,750 DNA (28%) = 15 breeds
- Shop: 2,000 DNA (8%) = 2-4 purchases
- Evolution: 3,000 DNA (13%) = 2 evolutions
- Consumables: 1,250 DNA (5%) = misc power-ups
Total: 13,000 DNA (54% of income)

Surplus: 11,000 DNA (46% unspent)

Conclusion: Breeding doesn't monopolize DNA ✓
Players have DNA for all three progression paths ✓
```

### 4.4 Premium vs F2P Breeding

**F2P Breeding Experience:**
- 3 free breeding slots ✓
- 800 DNA/day income (5 runs) ✓
- Can afford 1-2 breeds/day (early game) ✓
- Gen 5 by Day 12 (PR-004 target) ✓
- 15-20 breeds by Day 30 ✓
- No paywalls blocking progression ✓

**Premium Breeding Advantages (Optional):**
1. **+2 Breeding Slots ($1.99 one-time):**
   - 5 total slots (vs 3 free)
   - More parallel breeding (convenience)
   - Does NOT increase progression speed (still limited by DNA)
   - Value: Convenience, not power (BM-001 compliant)

2. **Breeding Accelerator ($0.99 consumable):**
   - Instant timer completion (single use)
   - OR 50% timer reduction for 24 hours
   - Value: Save time when impatient
   - F2P alternative: Just wait (no power loss)

3. **DNA Pack ($0.99 = 500 DNA):**
   - Equivalent to 3 extra runs
   - Allows 1 extra breed per purchase
   - Value: Progress slightly faster
   - F2P catches up (daily DNA generation)

**Key Validation:** Premium ACCELERATES but doesn't UNLOCK (BM-001 constraint met).

### 4.5 Long-Term Economic Sustainability

**Breeding Inflation Risk:**

Problem: If breeding is only source of collection growth, economy inflates exponentially:
```
Month 1: 15 breeds → 15 new snakes
Month 2: 30 breeds → 30 new snakes (collection doubled)
Month 3: 60 breeds → 60 new snakes (collection doubled again)
```

**Mitigation Mechanisms:**

1. **Cost Scaling:** Later-gen breeds cost MORE (1,100+ DNA)
   - Slows breed frequency naturally
   - Self-limiting progression

2. **Diminishing Returns:** Breeding same parents = same offspring (deterministic)
   - Can't infinitely breed Gen 1 × Gen 1 for different outcomes
   - Must progress to new generation combos

3. **Collection Cap:** Max useful collection size ~30-40 variants
   - Beyond this, duplicates don't add value
   - Players focus on quality (rarity, stats) not quantity

4. **Evolution Sink:** Converting DNA to evolutions (permanent unlocks)
   - Alternative progression path
   - Doesn't create inflation (abilities, not snakes)

**Result:** Economy stabilizes after Month 2-3 (natural equilibrium).

---

## Level 5: Social

### 5.1 Breeding Strategy Sharing

**Community Strategy Guides:**
```
Forum post: "Best Gen 5 Breeding Combos"
Author: ProBreeder99

CYBER Dynasty:
- Cyber Starlight (Gen 5 Rare, Speed 85) × Cyber Pulse (Gen 5 Uncommon, Speed 78)
- Offspring: Gen 6 Rare, Speed 81-82, Power 70-72
- DNA Cost: 600
- Best for: Fast snakes (competitive runs)

NEBULA Dynasty:
- Nebula Void (Gen 5 Epic, Power 92) × Nebula Dawn (Gen 4 Rare, Power 85)
- Offspring: Gen 6 Epic, Power 88-90, Speed 62-65
- DNA Cost: 550
- Best for: Tanky snakes (survival runs)

Comments:
- "Tried this, got Gen 6 Epic with 90 Power! Worth it."
- "I prefer breeding for Speed, got 85+ Speed Gen 7 today."
- "Anyone got strategies for Legendary breeding?"
```

**Why This Matters:**
- Breeding is DETERMINISTIC (BA-002) → outcomes are learnable
- Players share "recipes" (which parents = which offspring)
- Creates community knowledge base
- Encourages experimentation (finding new combos)

### 5.2 Offspring Showcasing

**Social Feature: Breeding Achievement Posts**

```
In-game social feed:

[Player Avatar] ProBreeder99
"Just bred my first Legendary snake! 🐍✨"
[Screenshot: Legendary CYBER Gen 8, Speed 95, Power 88]
Parents: Epic Gen 7 × Epic Gen 7
DNA Cost: 800
Timer: 4 hours

[Like] 47 likes
[Comment] 12 comments
  - "That's insane stats! What's your breeding path?"
  - "Gen 8 Legendary = goals"
  - "How did you get both parents to Epic?"

[Share to Discord]
[Share to Reddit]
```

**Why This Matters:**
- Creates social pressure (FOMO)
- Players want to show off rare offspring
- Drives engagement (checking feed = return sessions)
- Inspires long-term goals ("I want Legendary too")

### 5.3 Clan Breeding Events

**Future Feature (v0.5+): Clan Cooperative Breeding**

```
Event: "Dynasty Championship"
Duration: 7 days
Goal: Clan breeds highest-generation CYBER snakes

Clan Leaderboard:
1. EliteBreedersClan: Gen 15 CYBER (250 total breeds)
2. SnakeEmpire: Gen 14 CYBER (220 breeds)
3. GeneticElites: Gen 14 CYBER (215 breeds)

Rewards:
- Top 3 clans: Exclusive cosmetic (CYBER Throne skin)
- Top 10 clans: 5,000 DNA bonus per member
- All participants: "Dynasty Champion" badge

Clan Strategy:
- Members breed CYBER snakes only (focus on one dynasty)
- Share optimal breeding combos in clan chat
- Coordinate DNA donations (premium feature?)
- Race to Gen 15+ in 7 days
```

**Why This Matters:**
- Creates clan cohesion (cooperative goal)
- Drives daily engagement (contributing to clan event)
- Encourages premium spending (DNA packs to help clan win)
- Fits Experimenter archetype (competitive breeding)

### 5.4 Leaderboards (Breeding-Specific)

**Global Leaderboard: Breeding Mastery**

```
Top Breeders This Month:

Rank | Player | Total Breeds | Highest Gen | Legendaries Bred | Breeding Score
1    | GeneticKing | 142 breeds | Gen 18 | 8 Legendaries | 12,450 pts
2    | BreedMaster | 138 breeds | Gen 17 | 12 Legendaries | 12,200 pts
3    | DNAWizard | 125 breeds | Gen 16 | 6 Legendaries | 10,800 pts
...

Scoring Formula:
- +50 pts per breed
- +200 pts per generation milestone (Gen 10, 15, 20, etc.)
- +500 pts per Legendary offspring
```

**Dynasty-Specific Leaderboards:**
```
CYBER Dynasty Leaderboard:
1. CyberBreeder42: Gen 16 CYBER
2. NeonSnake: Gen 15 CYBER
3. TechBreeder: Gen 14 CYBER

NEBULA Dynasty Leaderboard:
1. StarBreeder: Gen 17 NEBULA
2. CosmicGenes: Gen 15 NEBULA
3. VoidMaster: Gen 14 NEBULA
```

**Why This Matters:**
- Gives competitive players goals (Competitor archetype)
- Rewards consistent breeding (not just lucky drops)
- Creates prestige (top breeders are admired)
- Drives retention (checking rank = daily habit)

### 5.5 Trading (Deferred to v1.0+)

**Future Feature: Snake Trading**

**Concept:**
- Players trade bred offspring with each other
- Enables cross-dynasty breeding without cross-dynasty breeding (trade CYBER for NEBULA)
- Creates player-driven economy

**Design Considerations:**
```
Trade Flow:
Player A offers: Gen 5 CYBER Rare
Player B offers: Gen 5 NEBULA Rare

Both accept → Trade completes
Both players get new snake (expands collection)

Trade Restrictions:
- Can only trade bred snakes (not shop-purchased)
- Must be same generation tier (Gen 5 ↔ Gen 5, not Gen 1 ↔ Gen 10)
- Max 5 trades per week (prevents market abuse)
```

**Why Deferred:**
- Requires backend infrastructure (trade escrow, verification)
- Risk of exploitation (duplicate accounts, RMT)
- Needs careful economic balancing
- v0.1 focus on core breeding, add trading later

---

## Level 6: Technical

### 6.1 Deterministic Breeding Algorithm

**Critical Technical Constraint: BA-002 (Same Parents = Same Offspring)**

**Implementation: Seeded RNG**

```typescript
class BreedingEngine {
  // Deterministic offspring calculation
  static calculateOffspring(parent1: Variant, parent2: Variant): Offspring {
    // Create deterministic seed from parent IDs
    const seed = this.createSeed(parent1.id, parent2.id);
    const rng = new SeededRNG(seed);

    // All calculations use seeded RNG (deterministic)
    const generation = Math.max(parent1.generation, parent2.generation) + 1;
    const dynasty = this.calculateDynasty(parent1, parent2);
    const rarity = this.calculateRarity(parent1.rarity, parent2.rarity, rng);
    const stats = this.calculateStats(parent1.stats, parent2.stats, rng);

    return { generation, dynasty, rarity, stats, seed };
  }

  // Seed creation (deterministic hash)
  private static createSeed(parentId1: string, parentId2: string): number {
    // Sort parent IDs to ensure order doesn't matter
    const [id1, id2] = [parentId1, parentId2].sort();
    const combinedId = `${id1}-${id2}`;
    return hashString(combinedId);
  }
}

// Seeded RNG (Linear Congruential Generator)
class SeededRNG {
  private state: number;

  constructor(seed: number) {
    this.state = seed;
  }

  next(): number {
    this.state = (this.state * 9301 + 49297) % 233280;
    return this.state / 233280; // Returns 0.0-1.0
  }
}

// Hash function (DJB2 algorithm)
function hashString(str: string): number {
  let hash = 5381;
  for (let i = 0; i < str.length; i++) {
    hash = ((hash << 5) + hash) + str.charCodeAt(i); // hash * 33 + char
  }
  return Math.abs(hash);
}
```

**Why This Works:**
1. **Same parents → Same seed:** Parent IDs hashed to create seed
2. **Same seed → Same RNG sequence:** Linear congruential generator is deterministic
3. **Same RNG → Same offspring:** All calculations use seeded RNG
4. **Client & Server Match:** Both use same algorithm → anti-cheat validation

**Testing Determinism:**
```typescript
test('Breeding determinism', () => {
  const parent1 = createVariant({ id: 'cyber-gen5-001', generation: 5 });
  const parent2 = createVariant({ id: 'cyber-gen3-002', generation: 3 });

  // Breed 10 times with same parents
  const offspring1 = calculateOffspring(parent1, parent2);
  const offspring2 = calculateOffspring(parent1, parent2);
  const offspring3 = calculateOffspring(parent1, parent2);
  // ... repeat 7 more times

  // All offspring must be identical
  expect(offspring1).toEqual(offspring2);
  expect(offspring2).toEqual(offspring3);
  // ... all 10 must match

  // Offspring stats, rarity, generation all identical
  expect(offspring1.stats.speed).toBe(offspring2.stats.speed);
  expect(offspring1.rarity).toBe(offspring2.rarity);
});
```

### 6.2 Breeding Queue Management

**Real-Time Timer Sync Challenge:**

Problem: Breeding timers must tick down in real-time, even when player offline.

**Solution: Server-Side Timer Tracking**

```typescript
// Backend: Breeding Queue Table
interface BreedingSession {
  id: string;
  user_id: string;
  slot_id: number;
  parent_1_id: string;
  parent_2_id: string;
  offspring_seed: number;
  offspring_generation: number;
  offspring_dynasty: string;
  offspring_rarity: string;
  offspring_stats: SnakeStats;
  dna_cost: number;
  start_time: Date;
  complete_time: Date; // Absolute timestamp (not relative)
  claimed: boolean;
}

// Client: Query remaining time
async function getBreedingProgress(userId: string): Promise<BreedingSlot[]> {
  const sessions = await supabase
    .from('breeding_queue')
    .select('*')
    .eq('user_id', userId)
    .eq('claimed', false);

  return sessions.map(session => {
    const now = new Date();
    const completeTime = new Date(session.complete_time);
    const remainingMs = Math.max(0, completeTime.getTime() - now.getTime());
    const isComplete = remainingMs === 0;

    return {
      slot_id: session.slot_id,
      parent1: session.parent_1_id,
      parent2: session.parent_2_id,
      offspring: {
        generation: session.offspring_generation,
        dynasty: session.offspring_dynasty,
        rarity: session.offspring_rarity,
        stats: session.offspring_stats
      },
      remainingSeconds: Math.floor(remainingMs / 1000),
      isComplete,
      canClaim: isComplete
    };
  });
}
```

**Key Technical Details:**
1. **Absolute Timestamps:** Store `complete_time` as absolute timestamp (not relative "2 hours")
2. **Server Time Authority:** Backend calculates remaining time (client doesn't control time)
3. **Offline Progression:** Timer progresses even when app closed (server tracks time)
4. **Real-Time Subscription:** Client subscribes to breeding_queue updates (Supabase Realtime)

### 6.3 Server-Side Breeding Validation (Anti-Cheat)

**Security Risk: Client-Side Breeding Manipulation**

If breeding calculated client-side:
- Attacker modifies client code
- Forces offspring to be Legendary with 100 stats
- Bypasses DNA cost

**Mitigation: Server-Side Calculation**

```typescript
// Server endpoint: POST /api/breeding/start
export async function startBreeding(req: Request): Promise<Response> {
  const { userId, slotId, parent1Id, parent2Id } = req.body;

  // 1. Validate ownership (SERVER checks, not client)
  const [parent1, parent2] = await db.query(
    'SELECT * FROM user_snakes WHERE id IN (?, ?) AND user_id = ?',
    [parent1Id, parent2Id, userId]
  );

  if (!parent1 || !parent2) {
    return { error: 'Parents not owned', status: 403 };
  }

  // 2. Validate dynasty rules (SERVER enforces, not client)
  if (parent1.dynasty !== parent2.dynasty) {
    return { error: 'Cross-dynasty breeding not allowed', status: 400 };
  }

  // 3. Calculate offspring (SERVER calculates, not client)
  const offspring = BreedingEngine.calculateOffspring(parent1, parent2);
  const dnaCost = calculateBreedingCost(parent1, parent2);
  const timerDuration = calculateBreedingTime(offspring.generation);

  // 4. Validate DNA balance (SERVER checks atomically)
  const userDNA = await db.query('SELECT dna FROM users WHERE id = ?', [userId]);
  if (userDNA.dna < dnaCost) {
    return { error: 'Insufficient DNA', status: 400 };
  }

  // 5. Deduct DNA atomically (prevent race conditions)
  await db.transaction(async (tx) => {
    await tx.query(
      'UPDATE users SET dna = dna - ? WHERE id = ? AND dna >= ?',
      [dnaCost, userId, dnaCost]
    );

    await tx.query(
      'INSERT INTO breeding_queue (user_id, slot_id, parent_1_id, parent_2_id, offspring_seed, offspring_generation, offspring_dynasty, offspring_rarity, offspring_stats, dna_cost, complete_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        userId,
        slotId,
        parent1Id,
        parent2Id,
        offspring.seed,
        offspring.generation,
        offspring.dynasty,
        offspring.rarity,
        JSON.stringify(offspring.stats),
        dnaCost,
        new Date(Date.now() + timerDuration * 1000)
      ]
    );
  });

  return { success: true, breedingId: session.id };
}

// Server endpoint: POST /api/breeding/claim
export async function claimOffspring(req: Request): Promise<Response> {
  const { userId, breedingId } = req.body;

  // 1. Fetch breeding session (SERVER validates timer)
  const session = await db.query(
    'SELECT * FROM breeding_queue WHERE id = ? AND user_id = ?',
    [breedingId, userId]
  );

  if (!session) {
    return { error: 'Breeding session not found', status: 404 };
  }

  // 2. Validate timer complete (SERVER checks time, not client)
  const now = new Date();
  if (now < new Date(session.complete_time)) {
    return { error: 'Breeding not yet complete', status: 400 };
  }

  // 3. Create offspring (SERVER creates, not client)
  const offspring = await db.query(
    'INSERT INTO user_snakes (user_id, snake_id, generation, acquired_via, parent_1_id, parent_2_id) VALUES (?, ?, ?, ?, ?, ?) RETURNING *',
    [
      userId,
      getSnakeVariantId(session.offspring_dynasty, session.offspring_rarity),
      session.offspring_generation,
      'breed',
      session.parent_1_id,
      session.parent_2_id
    ]
  );

  // 4. Mark breeding as claimed
  await db.query(
    'UPDATE breeding_queue SET claimed = true WHERE id = ?',
    [breedingId]
  );

  return { success: true, offspring };
}
```

**Anti-Cheat Measures:**
1. **Server Authority:** All calculations happen server-side
2. **Atomic Transactions:** DNA deduction and breeding creation are atomic (prevents exploits)
3. **Deterministic Validation:** Server and client must agree on offspring (seed-based)
4. **Timer Validation:** Server checks complete_time (client can't skip ahead)

### 6.4 Offline Breeding Progression

**Technical Challenge:** Player starts breed, closes app, opens app 3 hours later → timer must have progressed.

**Solution: Server-Side Absolute Timestamps**

```typescript
// When player opens app after being offline
async function syncBreedingAfterOffline(userId: string): void {
  const now = new Date();

  // Fetch all active breeding sessions
  const sessions = await supabase
    .from('breeding_queue')
    .select('*')
    .eq('user_id', userId)
    .eq('claimed', false);

  // Check which are complete
  const completedBreeds = sessions.filter(
    s => new Date(s.complete_time) <= now
  );

  if (completedBreeds.length > 0) {
    // Show notification: "3 snakes ready to claim!"
    showNotification({
      title: 'Breeding Complete!',
      body: `${completedBreeds.length} snake(s) ready to claim.`,
      deepLink: 'supasnake://breeding'
    });
  }

  // Update UI with correct timer states
  updateBreedingUI(sessions);
}

// Real-time timer countdown in UI
function startTimerCountdown(session: BreedingSession): void {
  const updateTimer = () => {
    const now = new Date();
    const completeTime = new Date(session.complete_time);
    const remainingMs = Math.max(0, completeTime.getTime() - now.getTime());

    if (remainingMs === 0) {
      // Timer complete
      showClaimButton(session.slot_id);
      playNotificationSound();
      clearInterval(intervalId);
    } else {
      // Update timer display
      const remainingSeconds = Math.floor(remainingMs / 1000);
      updateTimerDisplay(session.slot_id, formatTime(remainingSeconds));
    }
  };

  // Update every second
  const intervalId = setInterval(updateTimer, 1000);
  updateTimer(); // Initial update
}
```

**Key Technical Details:**
- Server stores absolute `complete_time` timestamp
- Client calculates remaining time: `complete_time - now`
- Timer ticks down in real-time (1-second intervals)
- If player offline, timer still progresses (server-side timestamp)
- When player returns, client queries server for current state

### 6.5 Push Notification Scheduling

**Technical Integration: Schedule Notification When Breeding Starts**

```typescript
// When breeding starts, schedule push notification
async function scheduleBreedingNotification(
  userId: string,
  breedingId: string,
  completeTime: Date
): Promise<void> {
  // Get user's notification token (FCM/APNS)
  const user = await supabase
    .from('users')
    .select('notification_token, notifications_enabled')
    .eq('id', userId)
    .single();

  if (!user.notifications_enabled || !user.notification_token) {
    return; // User opted out of notifications
  }

  // Schedule notification via backend service
  await notificationService.schedule({
    user_id: userId,
    token: user.notification_token,
    title: 'Breeding Complete!',
    body: 'Your new snake is ready to claim.',
    scheduled_time: completeTime,
    deep_link: `supasnake://breeding/${breedingId}`,
    category: 'breeding_complete',
    priority: 'normal',
    sound: 'default'
  });
}

// Backend cron job: Send scheduled notifications
// Runs every minute, checks for notifications due to send
async function sendDueNotifications(): Promise<void> {
  const now = new Date();

  const dueNotifications = await db.query(
    'SELECT * FROM scheduled_notifications WHERE scheduled_time <= ? AND sent = false',
    [now]
  );

  for (const notif of dueNotifications) {
    // Send via FCM (Android) or APNS (iOS)
    await pushService.send({
      token: notif.token,
      title: notif.title,
      body: notif.body,
      data: {
        deep_link: notif.deep_link,
        category: notif.category
      }
    });

    // Mark as sent
    await db.query(
      'UPDATE scheduled_notifications SET sent = true WHERE id = ?',
      [notif.id]
    );
  }
}
```

**Key Technical Details:**
- Notification scheduled when breeding starts (not when timer completes)
- Backend cron job checks for due notifications every minute
- Handles timezone differences (all timestamps UTC)
- Respects user opt-out preferences
- Deep link opens directly to breeding lab

---

## Level 7: Content

### 7.1 Breeding Lab UI/UX

**Screen Flow:**
```
Main Menu → [Breeding Lab] button
    ↓
Breeding Lab Home:
  - 3 breeding slots (visual)
  - Each slot shows: Empty / Breeding / Complete
  - [Start New Breed] button (if empty slots)
  - [View Collection] button (quick access)
    ↓
Select Parent 1:
  - Opens Collection in selection mode
  - Filters: All dynasties, all generations
  - Highlights: Valid breeding candidates
  - Tapping snake → Select as Parent 1
    ↓
Select Parent 2:
  - Opens Collection in selection mode
  - Filters: Same dynasty only (v0.1)
  - Highlights: Valid breeding candidates (excludes Parent 1)
  - Tapping snake → Select as Parent 2
    ↓
Breeding Confirmation:
  - Shows both parents (128×128 thumbnails)
  - Offspring prediction (dynasty, gen, rarity range, stats range)
  - DNA cost (red text if insufficient)
  - Timer duration
  - [Breed Now] button (or [Get DNA] if insufficient)
    ↓
Breeding Initiated:
  - Parents placed in slot
  - Timer starts counting down (real-time)
  - Egg animation (pulsing, glowing)
  - [Cancel] button (refunds 50% DNA)
    ↓
Breeding Complete:
  - Notification sent (if opted in)
  - Egg cracks animation (ready to claim)
  - [Claim] button enabled (glowing, pulsing)
    ↓
Claim Offspring:
  - Loading screen (suspense)
  - Egg hatching animation (2-3 seconds)
  - Snake emerges (particle effects)
  - Stats reveal (one at a time)
  - Rarity badge appears (with sound)
  - "Added to Collection" message
    ↓
Offspring Detail Modal:
  - Full snake visual (256×256)
  - Name, dynasty, generation, rarity, stats
  - Parents shown (64×64 thumbnails)
  - [View in Collection] button
  - [Breed Again] button (repeats with same parents)
    ↓
Return to Breeding Lab
```

### 7.2 Visual Design Elements

**Breeding Slot States:**

**Empty Slot:**
```
┌──────────────────────────────────────────────┐
│   SLOT 1                                      │
│                                               │
│       [+]                                     │
│   Empty Slot                                  │
│   [Start Breeding]                            │
│                                               │
└──────────────────────────────────────────────┘
```

**Breeding Active:**
```
┌──────────────────────────────────────────────┐
│   SLOT 1                     [Timer: 1h 23m] │
│                                               │
│   Parent 1     +     Parent 2                 │
│   [Cyber 🐍]        [Cyber 🐍]               │
│   Gen 5 Rare        Gen 3 Uncommon            │
│                                               │
│   [Egg Pulsing Animation]                     │
│   Offspring: Gen 6 CYBER                      │
│   [Cancel] (refund 300 DNA)                   │
│                                               │
└──────────────────────────────────────────────┘
```

**Breeding Complete:**
```
┌──────────────────────────────────────────────┐
│   SLOT 1                       [READY! ✨]    │
│                                               │
│   [Egg Cracking Animation - Glowing]         │
│                                               │
│   [CLAIM OFFSPRING] button (glowing, pulsing) │
│                                               │
└──────────────────────────────────────────────┘
```

### 7.3 Animations & VFX

**Egg Animation (Breeding Active):**
- Subtle pulsing (0.8s cycle)
- Glow effect (dynasty-colored: CYBER = cyan, NEBULA = purple)
- Particle sparkles around egg (5-10 particles)
- Audio: Ambient hum (low-frequency, soothing)

**Egg Cracking Animation (Breeding Complete):**
- Cracks appear (0.5s)
- Egg shakes (0.3s, 3 shakes)
- Egg explodes (0.5s, particle burst)
- Snake emerges (1s, slides out with trail effect)
- Stats reveal (0.3s per stat, typing effect)
- Rarity badge appears (0.5s, scale-in animation)
- Audio: Cracking sound → explosion → triumphant fanfare

**Breeding Initiation Animation:**
- Parent 1 flies into slot (0.5s, arc motion)
- Parent 2 flies into slot (0.5s, arc motion, delayed 0.2s)
- Parents merge/swirl (0.8s, spiral particle effect)
- Egg appears (0.5s, scale-in with glow)
- Timer starts (0.3s, number count-up effect)
- Audio: Whoosh → merge sound → magical chime

### 7.4 Sound Design

**Breeding Lab Ambience:**
- Background: Soft electronic hum (sci-fi lab vibe)
- Egg pulse: Subtle heartbeat sound (every 2 seconds)

**Sound Effects:**
- **Select parent:** Click/tap sound
- **Confirm breeding:** Confirmation chime (higher pitch)
- **Breeding start:** Magical swirl sound (2s)
- **Timer tick:** Subtle tick (every second, optional)
- **Breeding complete:** Notification chime (alert)
- **Claim tap:** Button press sound
- **Egg crack:** Cracking sound effect (realistic)
- **Offspring reveal:** Triumphant fanfare (3s, celebratory)
- **Legendary reveal:** Epic fanfare (5s, more dramatic)

### 7.5 Accessibility

**Breeding Lab Accessibility Features:**

1. **Colorblind Mode:**
   - Dynasty colors use patterns (not just color)
   - Rarity badges use text + icon (not just color)

2. **Screen Reader:**
   - All UI elements have labels ("Select Parent 1 button")
   - Timer announces remaining time every 30 seconds
   - Offspring stats read aloud on reveal

3. **Font Size:**
   - Large text mode (stats, timers readable at distance)
   - High contrast mode (white text on dark backgrounds)

4. **Motor Accessibility:**
   - Large tap targets (buttons minimum 44×44 points)
   - No rapid tapping required
   - [Claim] button requires single tap (no hold or double-tap)

---

## Level 8: Meta-Game & Retention

### 8.1 Breeding as Core Engagement Loop

**Breeding Creates Return Sessions (CE-003 Constraint):**

```
Session 1 (Morning, 8am):
- Player plays 2 Snake runs → earns 320 DNA
- Breeds Gen 5 × Gen 5 → Gen 6 offspring (2-hour timer)
- Closes app

Session 2 (Mid-day, 10am - 2 hours later):
- Push notification: "Breeding complete!"
- Player returns to app
- Claims Gen 6 offspring (dopamine hit)
- Views offspring stats (exciting reveal)
- Plays 1 Snake run → earns 160 DNA
- Breeds Gen 6 × Gen 5 → Gen 7 offspring (4-hour timer)
- Closes app

Session 3 (Evening, 6pm - 4 hours later):
- Push notification: "Breeding complete!"
- Player returns to app
- Claims Gen 7 offspring (dopamine hit)
- Plays 2 Snake runs → earns 320 DNA
- Breeds Gen 7 × Gen 7 → Gen 8 offspring (8-hour timer, overnight)
- Closes app

Session 4 (Next Morning, 8am - 8 hours later):
- Push notification: "Breeding complete!"
- Player returns to app
- Claims Gen 8 offspring (dopamine hit)
- Cycle repeats

Result: 4 sessions in 24 hours (CE-002 target met)
```

**Key Retention Mechanism:**
- Timers create anticipation ("What will my offspring look like?")
- Notifications trigger return ("Breeding complete = open app")
- Claiming offspring feels rewarding (variable reward schedule)
- Breeding again continues loop (habit formation)

### 8.2 Long-Term Goals (30+ Days)

**Week 1-2 Goal: Collection Expansion**
- Breed Gen 1-5 snakes rapidly (1-hour timers)
- Expand collection to 12-15 variants
- Feel: "I'm building my snake empire"

**Week 3-4 Goal: Rarity Chase**
- Breed for Rare/Epic offspring (targeting specific parents)
- Push to Gen 7-8 (generation progression)
- Feel: "I'm getting closer to Legendary"

**Week 5-8 Goal: Legendary Breeding**
- Acquire Epic parents (through repeated breeding or shop)
- Breed Epic × Epic → 50% Legendary offspring
- Feel: "I'm going for the ultimate snake"

**Week 9-12 Goal: Stat Min-Maxing**
- Breed for optimal stats (90+ Speed, 95+ Power)
- Utilize ±10% variance strategically
- Feel: "I'm perfecting my breeding strategy"

**Month 3+ Goal: Dynasty Mastery**
- Complete all 10 dynasties (collect Gen 10+ in each)
- Achieve Legendary in all dynasties
- Feel: "I've mastered the breeding system"

### 8.3 Breeding as Puzzle-Solving (Experimenter Archetype)

**From PLAYER_JOURNEY.md:**
> "What happens if I breed a Gen 5 MECHA snake with a Gen 1 NEBULA snake? Let me find out."
> - Experimenter archetype (loves genetic puzzles)

**Why Breeding Satisfies Experimenters:**

1. **Deterministic Outcomes = Learnable System**
   - Same parents always produce same offspring (BA-002)
   - Players can learn "breeding recipes"
   - Creates knowledge mastery ("I know how to get Epic CYBER Gen 7")

2. **Strategic Parent Selection**
   - Choosing parents = puzzle ("Which combo gets highest Speed?")
   - Multiple valid strategies (rarity focus vs gen focus vs stats focus)
   - No single "correct" answer (encourages experimentation)

3. **Collection Synergy**
   - Breeding requires Collection (parents must be owned)
   - Collection grows through breeding (positive feedback loop)
   - Creates interconnected systems (not isolated mechanics)

4. **Long-Term Mastery**
   - Week 1: Learning basics (which parents = which offspring)
   - Week 4: Understanding rarity inheritance (Rare × Rare = Epic chance)
   - Week 8: Mastering stat optimization (breeding for 90+ Speed)
   - Week 12: Dynasty specialization (Gen 10+ in all dynasties)

**Result:** Breeding is favorite part for Experimenter archetype (primary target player).

### 8.4 Monetization (Premium Breeding Features)

**Free-to-Play Experience (No Paywalls):**
- 3 free breeding slots ✓
- 800 DNA/day income (5 runs) ✓
- Can afford 1-2 breeds/day ✓
- Gen 5 by Day 12 (PR-004 target) ✓
- 15-20 breeds by Day 30 ✓
- Legendary achievable (Epic × Epic breeding) ✓

**Premium Options (Optional Convenience, Not Power):**

1. **Extra Breeding Slots ($1.99 one-time purchase):**
   - Unlock 2 additional slots (3 → 5 total)
   - Value: Breed 5 snakes in parallel (vs 3 free)
   - Benefit: Convenience (more breeding happening simultaneously)
   - Limitation: Still limited by DNA (can't breed more frequently)
   - BM-001 Compliant: F2P can achieve same outcomes, just takes longer

2. **Breeding Accelerator ($0.99 consumable):**
   - **Option A:** Instant breed (single use, skip one timer)
   - **Option B:** 50% faster timers for 24 hours (all slots)
   - Value: "I want my Gen 10 offspring NOW"
   - Benefit: Saves time (doesn't unlock new content)
   - Limitation: DNA cost still applies (not bypassed)
   - BM-001 Compliant: F2P just waits (no power difference)

3. **DNA Pack ($0.99 = 500 DNA):**
   - Equivalent to ~3 extra Snake runs
   - Allows 1 extra mid-game breed (500 DNA)
   - Value: "I'm short 100 DNA for this breed"
   - Benefit: Slight progression acceleration
   - Limitation: F2P catches up (daily DNA generation)
   - BM-001 Compliant: Premium accelerates, doesn't unlock

**Monetization Validation:**
- F2P can achieve 100% of content ✓
- Premium saves time, doesn't grant power ✓
- No breeding content locked behind paywall ✓
- BM-001 constraint met ✓

### 8.5 Retention Metrics

**Target Retention (from CE-002 constraint):**
- Day 1: 100% (all new players)
- Day 7: 40%+ (40% of players return after 7 days)
- Day 30: 20%+ (20% of players still active after 30 days)

**Breeding's Impact on Retention:**

**Day 1 Retention:**
- Tutorial teaches breeding (immediate engagement)
- First breed takes 1 hour (short timer = quick return)
- Claiming offspring feels rewarding (dopamine hit)
- Result: Player experiences full breeding loop on Day 1

**Day 7 Retention:**
- By Day 7, player has bred 5-10 snakes
- Collection has expanded (visible progress)
- Generation progression (Gen 3-4 achieved)
- Player has active breeds in queue (sunk cost = return)
- Result: Breeding creates habit ("Check my breeds")

**Day 30 Retention:**
- By Day 30, player has bred 15-20 snakes
- Collection has 20+ variants (70% from breeding)
- Generation progression (Gen 7-8 achieved)
- Long-term goals visible (Legendary breeding)
- Player invested in breeding strategy (mastery)
- Result: Breeding creates long-term engagement

**Churn Risk Mitigation:**
- **Week 1 Churn:** Timers too long → MITIGATED (early timers 1 hour)
- **Week 2 Churn:** DNA shortage → MITIGATED (breeding affordable)
- **Week 3 Churn:** Lack of goals → MITIGATED (rarity chase, generation progression)
- **Week 4 Churn:** Repetitive → MITIGATED (deterministic system = strategy depth)

**Breeding as Retention Driver:**
- Creates return sessions (timers + notifications)
- Provides long-term goals (Legendary breeding, Gen 20+)
- Encourages mastery (learning breeding strategies)
- Interconnects with Collection and Evolution (system synergy)

---

## Summary & Validation

### Core System Validation

**Does Breeding Lab meet all constraints?**

✅ **PR-004 (Generation Progression):** Gen 5 achievable by Day 12
- Formula: `offspring_gen = max(parent_gen) + 1`
- Progression path: Gen 1 → Gen 2 (Day 3) → Gen 3 (Day 5) → Gen 4 (Day 8) → Gen 5 (Day 12)

✅ **BA-002 (Deterministic Breeding):** Same parents = same offspring
- Implementation: Seeded RNG using parent IDs
- Validation: Server and client calculations match

✅ **CE-003 (Return Sessions):** Timers create return triggers
- 1-8 hour timers based on generation
- Push notifications on completion
- Target: 2-3 sessions/day achieved

✅ **BM-001 (Fair F2P):** Breeding accessible without payment
- 3 free slots sufficient
- 800 DNA/day covers 1-2 breeds
- Premium is convenience, not power

### Economic Validation

**DNA Balance:**
- Monthly income: 24,000 DNA (average player)
- Breeding spend: 6,750 DNA (28% of income)
- Surplus: 11,000 DNA (46% unspent)
- Result: Healthy economy ✓

**Breeding Affordability:**
- Early game (Gen 1-3): 200-400 DNA (2-4 breeds/day possible)
- Mid game (Gen 4-7): 500-800 DNA (1-2 breeds/day)
- Late game (Gen 10+): 1,100+ DNA (1 breed every 2-3 days)
- Result: Progression pacing feels good ✓

### Player Experience Validation

**Experimenter Archetype (Primary Target):**
- Breeding as genetic puzzle ✓ (deterministic = learnable)
- Strategic parent selection ✓ (multiple valid strategies)
- Long-term mastery ✓ (breeding recipes, stat optimization)
- Favorite system ✓ (per PLAYER_JOURNEY.md)

**Retention Impact:**
- Day 1: Breeding loop experienced (tutorial)
- Day 7: 5-10 breeds completed (habit formed)
- Day 30: 15-20 breeds completed (long-term goals visible)
- Result: Breeding drives retention ✓

### Technical Validation

**Deterministic Breeding:**
- Seeded RNG implementation ✓
- Server-side validation ✓
- Anti-cheat measures ✓
- Offline progression ✓

**Real-Time Timers:**
- Server-side absolute timestamps ✓
- Client-side countdown sync ✓
- Push notification integration ✓
- Offline timer progression ✓

### Content Validation

**UI/UX:**
- 3-screen flow (select parents → confirm → claim) ✓
- Visual feedback (egg animations, timers) ✓
- Accessibility features ✓
- Sound design ✓

**Animations:**
- Egg pulsing (breeding active) ✓
- Egg cracking (breeding complete) ✓
- Offspring reveal (stat animations) ✓
- Celebration effects (rarity badges) ✓

### Meta-Game Validation

**Long-Term Goals:**
- Week 1-2: Collection expansion ✓
- Week 3-4: Rarity chase ✓
- Week 5-8: Legendary breeding ✓
- Week 9-12: Stat min-maxing ✓
- Month 3+: Dynasty mastery ✓

**Engagement Loop:**
- Play Snake → Earn DNA → Breed Snakes → Wait for Timer → Return to Claim → Repeat ✓
- Result: Breeding creates habit-forming loop ✓

### Recommendation: APPROVE FOR v0.1

**Breeding Lab System is PRODUCTION-READY with:**
- Same-dynasty breeding only (defer cross-dynasty to v0.5+)
- 3 free breeding slots (premium +2 slots optional)
- Deterministic breeding (seeded RNG, BA-002 compliant)
- 1-8 hour timers scaling by generation (CE-003 compliant)
- DNA cost formula: `100 × (avgParentGen + 1)` (economic balance validated)
- Server-side calculation and validation (anti-cheat)
- Real-time timer sync with push notifications
- Offline progression support

**Deferred to v0.5+:**
- Cross-dynasty breeding (awaiting Dynasty System specification)
- Snake trading (requires market infrastructure)
- Clan breeding events (requires clan system)

**Total Word Count: ~7,800 words**

**Analysis Complete.**