# How to Implement Evolution System

**Goal**: Implement the Evolution system (v0.5+ feature, NOT in v0.1 MVP) that allows players to upgrade individual snakes to higher generations for stat increases and infinite progression.

**Timeline**: 1-2 weeks (after v0.1 MVP complete)

**Prerequisites**:
- v0.1 MVP complete (Collection + Breeding operational)
- Supabase backend configured
- React Native UI framework set up
- Understanding of server-side validation (anti-cheat)

**VERSION NOTE**: Evolution is a **v0.5+ feature**. If you're implementing v0.1 MVP, focus on Collection and Breeding first. Evolution should be deferred until post-launch.

---

## Overview

Evolution is the **third core meta-game pillar** (alongside Collection and Breeding) that enables **infinite progression** (PR-001 constraint). Unlike breeding (which combines two snakes to create offspring), evolution UPGRADES a single existing snake to increase its generation number and stats.

**Critical Distinction:**
- **Breeding**: Parent 1 + Parent 2 → NEW offspring (Gen +1)
- **Evolution**: Single snake → SAME snake upgraded (Gen +1, stats +5%)

**Key Parameters:**
- **DNA Cost**: `generation × 100` (Gen 5 → Gen 6 = 500 DNA)
- **Stat Increase**: +5% per generation (Gen 10 = 1.45× base stats)
- **Evolution Timer**: Instant (no breeding-style wait)
- **Milestones**: Gen 5, 10, 25, 50, 100 (cosmetic unlocks)

---

## Step 1: Set Up Database Schema

**Evolution Log Table (Track History):**

```sql
-- evolution_log: Full lineage tracking (Gen 1 → Gen 2 → ... → Gen 50)
CREATE TABLE evolution_log (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id),
  snake_id UUID NOT NULL REFERENCES user_snakes(id),
  from_generation INTEGER NOT NULL,
  to_generation INTEGER NOT NULL,
  dna_cost INTEGER NOT NULL,
  timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  INDEX idx_snake_history (snake_id, timestamp),
  INDEX idx_user_evolutions (user_id, timestamp)
);

-- Query: Get full evolution lineage
SELECT * FROM evolution_log
WHERE snake_id = $snakeId
ORDER BY timestamp ASC;
```

**Note:** The `user_snakes` table already has a `generation` column (used by breeding), so no new tables needed for the snake itself. Evolution simply increments this column.

---

## Step 2: Implement Server-Side Evolution Logic (Anti-Cheat)

**Critical Rule:** All evolution calculations MUST happen server-side to prevent client manipulation.

**Server Endpoint (Supabase Edge Function or RPC):**

```typescript
// supabase/functions/evolve-snake/index.ts
export async function evolveSnake(req: Request): Promise<Response> {
  const { userId, snakeId } = await req.json();

  // 1. VALIDATE OWNERSHIP (server checks, not client)
  const { data: snake, error: snakeError } = await supabase
    .from('user_snakes')
    .select('*')
    .eq('id', snakeId)
    .eq('user_id', userId)
    .single();

  if (snakeError || !snake) {
    return new Response(
      JSON.stringify({ error: 'Snake not found or not owned' }),
      { status: 403 }
    );
  }

  // 2. CALCULATE COST (server calculates, not client)
  const cost = snake.generation * 100;

  // 3. VALIDATE DNA BALANCE (server checks atomically)
  const { data: user } = await supabase
    .from('users')
    .select('dna')
    .eq('id', userId)
    .single();

  if (!user || user.dna < cost) {
    return new Response(
      JSON.stringify({ error: 'Insufficient DNA', required: cost, current: user?.dna }),
      { status: 400 }
    );
  }

  // 4. EXECUTE EVOLUTION (atomic transaction)
  const { error: txError } = await supabase.rpc('evolve_snake_atomic', {
    p_user_id: userId,
    p_snake_id: snakeId,
    p_dna_cost: cost,
    p_from_gen: snake.generation,
    p_to_gen: snake.generation + 1,
  });

  if (txError) {
    return new Response(
      JSON.stringify({ error: txError.message }),
      { status: 500 }
    );
  }

  return new Response(
    JSON.stringify({ success: true, newGeneration: snake.generation + 1 }),
    { status: 200 }
  );
}
```

**Atomic Transaction Function (PostgreSQL):**

```sql
-- Atomic evolution: deduct DNA + increment generation + log
CREATE OR REPLACE FUNCTION evolve_snake_atomic(
  p_user_id UUID,
  p_snake_id UUID,
  p_dna_cost INTEGER,
  p_from_gen INTEGER,
  p_to_gen INTEGER
) RETURNS VOID AS $$
BEGIN
  -- 1. Deduct DNA (atomic check)
  UPDATE users
  SET dna = dna - p_dna_cost
  WHERE id = p_user_id AND dna >= p_dna_cost;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Insufficient DNA';
  END IF;

  -- 2. Increment generation
  UPDATE user_snakes
  SET generation = generation + 1,
      updated_at = NOW()
  WHERE id = p_snake_id;

  -- 3. Log evolution
  INSERT INTO evolution_log (
    user_id,
    snake_id,
    from_generation,
    to_generation,
    dna_cost,
    timestamp
  ) VALUES (
    p_user_id,
    p_snake_id,
    p_from_gen,
    p_to_gen,
    p_dna_cost,
    NOW()
  );
END;
$$ LANGUAGE plpgsql;
```

**Anti-Cheat Measures:**
- Server-side cost calculation (client can't manipulate)
- Atomic transaction (DNA deduction + generation increment together)
- Ownership validation (can't evolve others' snakes)
- Generation verification (can't skip generations)
- Evolution log (audit trail for detecting exploits)

---

## Step 3: Implement Stat Calculation (Client-Side Display)

**Stat Formula: +5% Per Generation**

```typescript
// utils/stats.ts
interface SnakeStats {
  speed: number;    // Base 0-100
  power: number;    // Base 0-100
  size: number;     // Base 0-100
}

export function calculateEvolvedStats(
  baseStats: SnakeStats,
  generation: number
): SnakeStats {
  // Multiplier: Gen 1 = 1.0×, Gen 10 = 1.45×, Gen 25 = 2.20×
  const multiplier = 1 + (generation - 1) * 0.05;

  return {
    speed: Math.round(baseStats.speed * multiplier),
    power: Math.round(baseStats.power * multiplier),
    size: Math.round(baseStats.size * multiplier),
  };
}

// Example usage:
const snake = {
  baseStats: { speed: 80, power: 60, size: 50 },
  generation: 10,
};

const displayStats = calculateEvolvedStats(snake.baseStats, snake.generation);
// Result: { speed: 116, power: 87, size: 73 } (45% increase)
```

**Key Technical Detail:** Base stats stored once in database, display stats calculated dynamically on-demand. This ensures single source of truth and prevents denormalized data issues.

---

## Step 4: Build Evolution Confirmation UI

**Evolution Confirmation Screen (React Native):**

```typescript
// screens/EvolutionConfirmScreen.tsx
export function EvolutionConfirmScreen({ route, navigation }) {
  const { snake } = route.params;
  const { data: user } = useUser();

  const cost = snake.generation * 100;
  const currentStats = calculateEvolvedStats(snake.baseStats, snake.generation);
  const newStats = calculateEvolvedStats(snake.baseStats, snake.generation + 1);

  const canAfford = (user?.dnaBalance || 0) >= cost;

  async function handleEvolve() {
    try {
      // Call server endpoint
      const { data, error } = await supabase.functions.invoke('evolve-snake', {
        body: { userId: user.id, snakeId: snake.id },
      });

      if (error) {
        showError(error.message);
        return;
      }

      // Play evolution animation (5 seconds)
      await playEvolutionAnimation(snake);

      // Navigate back to Collection
      navigation.navigate('Collection', {
        highlightSnake: snake.id,
        showEvolutionSuccess: true,
      });
    } catch (err) {
      showError('Evolution failed. Please try again.');
    }
  }

  return (
    <View style={styles.container}>
      <Text style={styles.header}>Evolution Lab</Text>

      <View style={styles.comparison}>
        {/* Before */}
        <View style={styles.column}>
          <Text style={styles.label}>
            Current (Gen {snake.generation})
          </Text>
          <SnakeImage snake={snake} size={128} />
          <StatsDisplay stats={currentStats} />
        </View>

        {/* Arrow */}
        <Text style={styles.arrow}>→</Text>

        {/* After */}
        <View style={styles.column}>
          <Text style={styles.label}>
            After (Gen {snake.generation + 1})
          </Text>
          <SnakeImage snake={snake} size={128} glowing />
          <StatsDisplay
            stats={newStats}
            highlightChanges
            previousStats={currentStats}
          />
        </View>
      </View>

      <View style={styles.costSection}>
        <Text style={styles.costLabel}>DNA Cost:</Text>
        <Text style={styles.costAmount}>{cost} DNA</Text>
        <Text style={[styles.balance, !canAfford && styles.insufficient]}>
          Your Balance: {user?.dnaBalance || 0} DNA
        </Text>
      </View>

      <Button
        title="Evolve Now"
        onPress={handleEvolve}
        disabled={!canAfford}
        style={styles.evolveButton}
      />

      <Button
        title="Cancel"
        onPress={() => navigation.goBack()}
        variant="secondary"
      />
    </View>
  );
}
```

**Stats Display with Change Highlighting:**

```typescript
// components/StatsDisplay.tsx
export function StatsDisplay({ stats, highlightChanges, previousStats }) {
  return (
    <View style={styles.stats}>
      <StatRow
        label="Speed"
        value={stats.speed}
        change={highlightChanges ? stats.speed - previousStats.speed : undefined}
      />
      <StatRow
        label="Power"
        value={stats.power}
        change={highlightChanges ? stats.power - previousStats.power : undefined}
      />
      <StatRow
        label="Size"
        value={stats.size}
        change={highlightChanges ? stats.size - previousStats.size : undefined}
      />
    </View>
  );
}

function StatRow({ label, value, change }) {
  return (
    <View style={styles.row}>
      <Text style={styles.label}>{label}:</Text>
      <Text style={styles.value}>{value}</Text>
      {change && (
        <Text style={styles.change}>
          (+{change}, +5%)
        </Text>
      )}
    </View>
  );
}
```

---

## Step 5: Implement Evolution Animation

**Evolution Animation Sequence (5 seconds total):**

```typescript
// animations/evolutionAnimation.ts
export async function playEvolutionAnimation(snake: SnakeVariant): Promise<void> {
  // Phase 1: Preparation (1s)
  await showGlowEffect(snake, 1000); // Dynasty-colored aura
  await gatherEnergyParticles(snake, 1000); // Particles swirl

  // Phase 2: Transformation (2s)
  await energySpiralInward(snake, 1000); // Particles spiral
  await pulsatingSnake(snake, 500, 3); // 3 pulses, intensifying
  await screenFlash(500); // Screen-filling flash

  // Phase 3: Emergence (1.5s)
  await showNewGenerationBadge(snake.generation + 1, 500); // Badge appears
  await particleBurst(snake, 500); // Dynasty-colored explosion
  await revealStatsOneByOne(snake, 500); // Stats typing effect

  // Phase 4: Completion (0.5s)
  await showCompletionMessage(500); // "Evolution Complete!"

  // Check for milestone (Gen 5, 10, 25, 50, 100)
  if (isGenerationMilestone(snake.generation + 1)) {
    await playMilestoneAnimation(snake.generation + 1);
  }
}

function isGenerationMilestone(gen: number): boolean {
  return [5, 10, 25, 50, 100].includes(gen);
}

async function playMilestoneAnimation(gen: number): Promise<void> {
  // Unique animation for milestone generations
  await showTitleCard(`Generation ${gen} Milestone!`, 1500);
  await showUnlockedReward(gen); // Cosmetic unlock (variant pattern, title, etc.)
}
```

**Note:** Evolution animations are instant feedback (no waiting timer like breeding). This maintains game flow while celebrating progression.

---

## Tips for Success

1. **Server-Side Validation is Critical**: Never trust client calculations. All DNA costs and generation increments must be server-validated.
2. **Use Atomic Transactions**: DNA deduction and snake updates must happen together or not at all.
3. **Calculate Stats On-Demand**: Store base stats once, calculate display stats dynamically. This prevents data denormalization issues.
4. **Evolution ≠ Breeding**: Clearly communicate the difference - Evolution upgrades one snake, Breeding combines two snakes.
5. **Mark as v0.5+**: This is NOT in v0.1 MVP. Focus on Collection and Breeding first.

---

## Common Mistakes

❌ **Client-Side Cost Calculation**: Allowing client to determine DNA cost enables cheating.
❌ **Non-Atomic Updates**: Deducting DNA without updating snake (or vice versa) leads to inconsistent state.
❌ **Storing Calculated Stats**: Storing `speed: 116` instead of calculating from `baseSpeed: 80, generation: 10` creates denormalized data.
❌ **Implementing Before MVP**: Evolution is a v0.5+ feature. Don't add it to v0.1 MVP scope.

---

## See Also

- @knowledge_base/game/how_to/design_lab_ui.md - Lab UI framework including Evolution screen
- @knowledge_base/game/quick_ref/breeding_rules.md - Breeding vs Evolution comparison
- @knowledge_base/game/quick_ref/economic_balance.md - DNA costs and progression balance
- @knowledge_base/game/how_to/setup_supabase_backend.md - Backend setup for server-side validation
- @docs/game/systems/analysis/EVOLUTION_LAB_analysis.md - Complete Evolution system specification (6,500 words)