# Classic Mode - Quick Reference

## Overview

Classic Mode is the primary DNA farming mode - a 5-minute fixed-speed Snake game designed for reliable, low-risk currency generation. It serves as the "job" players return to daily, supporting the 30% Snake gameplay component of SupaSnake's 70/30 Lab/Snake time split.

## Core Configuration

**Grid:** 20 columns × 35 rows (portrait mode)
**Speed:** 6 cells/second (fixed, no speed increase)
**Duration:** 5 minutes target (300 seconds)
**Energy Cost:** 1 energy per run (lowest cost mode)
**Food Count:** 1 food item on grid at all times
**Victory Condition:** Hybrid - complete 5 minutes OR reach 200 score (whichever first)

## Victory System (DECISION REQUIRED)

**Hybrid Model (Recommended):**
- **Time Goal:** Survive 5 minutes (300s) → Victory
- **Score Goal:** Reach 200 score → Victory
- **Rationale:** Skilled players finish early (3-4 min), beginners get full 5 min to maximize DNA

**Why Hybrid?** Pure time victory creates boring wait-it-out gameplay. Pure score victory punishes slow play. Hybrid rewards skill (finish early bonus) while supporting casual players (full duration available).

## Energy Cost Decision

**Current Recommendation:** 20 energy per run (not 10)
- 10 energy feels too cheap (devalues runs, encourages spam)
- 20 energy creates meaningful session pacing (5 energy = 2-3 runs before depletion)
- Higher cost increases perceived run value → Better DNA earning satisfaction
- Aligns with recharge rate (20 min per energy = 1 energy per run = natural 1:1 ratio)

**If 10 Energy:** Players burn through energy too fast (5 runs in 25 min), feel restricted. 20 energy creates better pacing.

## DNA Earning

**Average Run Rewards:**
- Beginner (100 score): 44 DNA
- Average (250 score): 160 DNA (target for balance)
- Expert (500 score): 275 DNA

**Target:** 160 DNA per run for average players. This supports PR-003 (20+ variants by Day 30) with F2P energy budget of 22 runs daily = 3,520 DNA daily.

**Score-to-DNA Formula:** `baseDNA = floor(score / 50) * 2` + combo bonuses + speed bonus. See @knowledge_base/game/quick_ref/resource_generation.md for complete formula.

## Session Structure

**Typical Session (F2P Player):**
1. Start with 5 energy (full from recharge)
2. Play 2-3 Classic runs (10-15 min gameplay)
3. Energy depleted → Return to Lab (breed, browse collection)
4. Wait 100 min for full recharge OR use daily refill
5. Repeat 3× daily (morning, lunch, evening)

**Daily Totals:** 15-20 Classic runs = 75-100 minutes Snake gameplay = 2,400-3,200 DNA earned = 30% of total session time (70% spent in Lab).

## Design Philosophy

**"Reliable DNA Mine"** (per MVP_VISION):
- Low risk (no failure penalty beyond lost time)
- Consistent rewards (predictable DNA per score)
- Energy-efficient (1 energy = guaranteed 50+ DNA)
- Ideal for daily grind ("I have 20 minutes, farm DNA")

**Contrast with Tower Mode (v0.5):**
- Tower: 2 energy, 15-45 min, 160-300 DNA, rare materials (high risk/reward)
- Classic: 1 energy, 5 min, 50-100 DNA, no rare materials (low risk/reward)

## Technical Specifications

**Frame Rate:** 60fps target (16.67ms frame budget)
**State Persistence:** Game state saved server-side every 30 seconds (crash recovery)
**API Integration:** POST /api/game/start (deduct energy), POST /api/game/complete (award DNA)

**Configuration Object:**
```typescript
interface ClassicModeConfig {
  gridWidth: 20,
  gridHeight: 35,
  baseSpeed: 6,        // cells/second
  energyCost: 20,      // DECISION: 10 or 20?
  targetDuration: 300, // 5 minutes
  foodCount: 1,
  victoryMode: 'hybrid',
  victoryTarget: 200   // score OR 300s
}
```

## Cross-References

- @knowledge_base/game/quick_ref/energy_system.md - Energy cost and recharge
- @knowledge_base/game/quick_ref/resource_generation.md - DNA earning formulas
- @knowledge_base/game/quick_ref/core_snake_game.md - Core mechanics
- @knowledge_base/game/how_to/tune_classic_mode.md - Balance optimization guide
- @knowledge_base/game/api/game_sessions.md - API endpoints

**Word Count:** 298 words
