# How to Tune Classic Mode Gameplay

**Goal:** Balance Classic Mode parameters to create a 5-minute, low-risk DNA farming experience that supports PR-003 progression targets (20+ variants by Day 30).

**Timeline:** 2-3 days of iteration (playtesting + data analysis)

**Prerequisites:**
- Core Snake Game implemented (@knowledge_base/game/quick_ref/core_snake_game.md)
- Energy System operational (@knowledge_base/game/quick_ref/energy_system.md)
- Analytics tracking (score, duration, DNA earned)

---

## Overview

Classic Mode is the primary DNA farming mode - a fixed-speed Snake game designed for consistent, reliable DNA generation. Tune 7 key parameters to balance accessibility (beginners earn 50+ DNA), engagement (5-minute duration), and progression (average players earn 160 DNA per run).

**Target Profile:**
- **Duration:** 5 minutes average (3-7 minute range)
- **DNA Earned:** 160 DNA average (50-275 DNA range)
- **Energy Cost:** 1 energy per run
- **Victory Rate:** 60-70% completion rate for average players

---

## Step 1: Set Grid Dimensions

Grid size affects difficulty and game feel. Start with portrait-mode optimized dimensions.

```typescript
const GRID_CONFIG = {
  columns: 20,
  rows: 35,
  cellSize: 16 // pixels, adjust for screen DPI
};
```

**Why 20×35?**
- Portrait mode optimization (9:16 aspect ratio)
- 700 total cells = enough space for 200+ snake length
- 20 columns = comfortable turn radius
- 35 rows = good vertical space

**Testing:** Play 10 runs. If you hit walls >50% of the time, grid is too small. If you never feel cramped, it's too large.

---

## Step 2: Calibrate Snake Speed

Speed is the primary difficulty lever. Classic Mode uses fixed speed (no acceleration) for predictable gameplay.

```typescript
const BASE_SPEED = 6; // cells per second
```

**Why 6 cells/second?**
- **Reaction Time:** 166ms per cell movement (human average: 200-250ms)
- **5-Minute Target:** 6 c/s × 300s = 1,800 cells traveled
- **Turn Precision:** Comfortable turn execution

**Speed Comparison:**
| Speed | Feel | Suitable For |
|-------|------|--------------|
| 4 c/s | Too slow | Absolute beginners |
| 6 c/s | Balanced | Classic Mode (recommended) |
| 8 c/s | Fast | Experienced players |
| 10 c/s | Very fast | Tower Mode floors 3-5 |

**Adjust based on data:**
- Completion rate <50%? → Reduce speed by 1 c/s
- Completion rate >80%? → Increase speed by 1 c/s
- Target: 60-70% completion rate

---

## Step 3: Configure Victory Conditions

Classic Mode uses **hybrid victory** - complete 5 minutes OR reach score threshold.

```typescript
const VICTORY_CONFIG = {
  mode: 'hybrid',
  timeDuration: 300,     // 5 minutes
  scoreThreshold: 200    // score target
};
```

**Why Hybrid?**
- **Skilled Players:** Finish early (3-4 min) by hitting 200 score → Time savings
- **Casual Players:** Full 5 minutes available → Maximize DNA earning
- **Balance:** Rewards skill without punishing slow play

**Tuning Score Threshold:**
Test different thresholds (150, 200, 250, 300). Target: 30-40% of runs end via score threshold, 60-70% end via time completion.

---

## Step 4: Balance DNA Earning Rates

DNA formula must support progression targets while maintaining F2P viability.

```typescript
function calculateDNA(score: number, duration: number, maxCombo: number): number {
  const baseDNA = Math.floor(score / 50) * 2;
  const comboBonus = Math.floor(maxCombo / 5) * 5;
  const speedBonus = (duration < 180) ? 20 : 0; // <3 min
  return baseDNA + comboBonus + speedBonus;
}
```

**Target DNA Ranges:**
- Beginner (score 100): 44 DNA minimum
- Average (score 250): 160 DNA target
- Expert (score 500): 275 DNA maximum

**Progression Check:**
```typescript
// PR-003: 20+ variants by Day 30
const DAILY_ENERGY_F2P = 22;
const AVG_DNA_PER_RUN = 160;
const DAILY_DNA = DAILY_ENERGY_F2P * AVG_DNA_PER_RUN; // 3,520 DNA
const MONTHLY_DNA = DAILY_DNA * 30; // 105,600 DNA

const VARIANTS_AFFORDABLE = Math.floor(MONTHLY_DNA / 1000); // 105 variants
// Result: 105 >> 20 (PR-003 met with 5× margin)
```

**Adjustments:**
- DNA too low? → Increase baseDNA multiplier to *3 (was *2)
- DNA too high? → Reduce combo bonus divisor to /10 (was /5)

---

## Step 5: Test Food Spawn Mechanics

Food spawn affects pacing. Classic Mode uses single food spawn for predictable gameplay.

```typescript
const FOOD_CONFIG = {
  maxFoodCount: 1,
  respawnDelay: 0,
  spawnMethod: 'random',
  avoidSnakeRadius: 3 // don't spawn within 3 cells of head
};

function spawnFood(snake: Position[], grid: Grid): Position {
  const emptyCells = grid.getEmptyCells();

  // Filter cells too close to snake head
  const safeCells = emptyCells.filter(cell => {
    const distance = Math.abs(cell.x - snake[0].x) + Math.abs(cell.y - snake[0].y);
    return distance > 3;
  });

  return safeCells[Math.floor(Math.random() * safeCells.length)];
}
```

**Why Single Food?**
- Predictable pacing (player always knows next target)
- Strategic depth (planning optimal path)
- Low cognitive load (no decision paralysis)

**Why Spawn Protection?** Prevents unfair spawns directly in front of snake (causes unavoidable collisions).

---

## Step 6: Difficulty Curve (None for Classic)

Classic Mode intentionally has **no difficulty progression** - speed stays constant for entire 5 minutes.

**Why No Difficulty Increase?**
- **Predictability:** Players know exactly what they're getting
- **Accessibility:** Beginners can complete full duration
- **DNA Farming:** Consistent difficulty = consistent earning

**Contrast with Tower Mode (v0.5):**
```typescript
const TOWER_DIFFICULTY = {
  floor1: { speed: 6, duration: 300 },
  floor2: { speed: 7, duration: 240 },
  floor3: { speed: 8, duration: 180 }
};
```

**Decision Point:** If Classic feels too repetitive after 50+ runs, consider adding difficulty variants (Easy/Normal/Hard modes).

---

## Step 7: Iterate with Analytics

Use in-game analytics to guide tuning decisions.

**Key Metrics:**
```typescript
interface ClassicModeMetrics {
  totalRuns: number;
  completionRate: number;        // % of runs completed
  avgDuration: number;            // seconds per run
  avgScore: number;               // score per run
  avgDNAEarned: number;           // DNA per run
  scoreDistribution: {
    p10: number,
    p50: number,
    p90: number
  };
  victoryMethod: {
    timeVictories: number,
    scoreVictories: number
  };
}
```

**Analysis Example:**
```typescript
// Week 1 metrics (100 players, 2,000 runs)
const metrics = {
  completionRate: 0.65,    // 65% complete
  avgDuration: 285,        // 4:45 average
  avgScore: 175,           // below 200 target
  avgDNAEarned: 145,       // below 160 target
  victoryMethod: {
    timeVictories: 1300,   // 65%
    scoreVictories: 700    // 35%
  }
};

// Decision: DNA earning 10% below target
// Fix: Increase baseDNA multiplier OR reduce variant costs by 10%
```

---

## Tips for Success

✅ **DO:**
- Start with recommended parameters, iterate based on data
- Playtest with different skill levels
- Track completion rate, average DNA, player feedback
- Use hybrid victory (time + score) for best balance
- Keep speed constant (no difficulty ramp)

❌ **DON'T:**
- Tune without data (trust analytics over intuition)
- Change multiple parameters at once (A/B test)
- Ignore outliers (check p10 and p90)
- Optimize for skilled players only
- Add unnecessary complexity

---

## Common Mistakes

**Mistake:** Making Classic Mode too difficult (completion rate <50%).
**Fix:** Reduce speed by 1 c/s OR increase grid size.

**Mistake:** DNA earning too low (average <120 DNA).
**Fix:** Increase baseDNA multiplier or add guaranteed floor (min 50 DNA).

**Mistake:** Victory conditions misaligned (nobody hits score threshold).
**Fix:** Lower score threshold OR increase snake speed.

---

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/classic_mode.md (mode overview)
- **Quick Ref**: @knowledge_base/game/quick_ref/resource_generation.md (DNA formulas)
- **Quick Ref**: @knowledge_base/game/quick_ref/core_snake_game.md (base mechanics)
- **How-To**: @knowledge_base/game/how_to/implement_energy_system.md (energy costs)
- **Quick Ref**: @knowledge_base/game/quick_ref/energy_system.md (energy parameters)
