# How to Balance SupaSnake Mechanics

**Schell's Principle:** Game mechanics (Space, Objects, Actions, Rules, Skill, Chance) must work in harmony to create the intended player experience. Balance emerges from understanding relationships between mechanics and adjusting them iteratively.

**SupaSnake Context:** SupaSnake combines skill-based Snake gameplay with chance-based collection mechanics. These opposing forces must be balanced to satisfy both casual collectors (Emma) and hardcore skill players (Tyler).

---

## Overview

SupaSnake has two distinct mechanical systems that must be balanced independently AND in relation to each other:

1. **Core Snake Game** - Discrete 2D space, real-time action, deterministic rules, pure skill
2. **Collection Metagame** - Objects (variants), chance (gacha), long-term goals, mixed skill/chance

The challenge: Create a unified experience where skill mastery enables collection progress, but collection excitement motivates skill improvement.

---

## Step 1: Balance Core Snake Mechanics (Skill System)

### Space + Movement (Physical Skill)

**Mechanic Interaction:**
- Discrete 2D grid (15×20) + continuous time movement
- Four-direction control + instant turn response
- Grid boundaries + collision detection

**Balance Considerations:**

**Grid Size:**
- Too small (10×15) = Cramped, frustrating for beginners
- Too large (20×30) = Too easy, boring for experts
- **Current: 15×20** = Goldilocks zone for mobile portrait

**Movement Speed:**
- Too slow = Tedious, player impatience
- Too fast = Impossible control, unfair deaths
- **Target:** 2-3 cells per second (allows planning, rewards reflexes)

**Testing Method:**
```
1. Prototype three speeds: Slow (1.5 cells/sec), Medium (2.5), Fast (4)
2. Playtest with 10 players per speed
3. Measure: Average run duration, death causes, player preference
4. Choose speed where:
   - 50% of players reach 30+ seconds consistently
   - Deaths feel fair ("my fault") not cheap ("too fast to react")
   - Pace feels engaging not tedious
```

### Objects + Growth (Difficulty Ramping)

**Mechanic Interaction:**
- Snake object has length attribute
- Length increases with DNA pickups
- Longer length = more constraint on movement space

**Balance Challenge:**
- Growth rate too fast = Instant death spiral
- Growth rate too slow = No difficulty progression

**Formula Development:**
```
Option A: Fixed growth (1 segment per DNA)
  - Simple, predictable
  - Can become impossibly long

Option B: Capped growth (max 50 segments)
  - Prevents impossible states
  - Stops difficulty progression

Option C: Percentage growth (10% of current length per DNA, min 1)
  - Early: Grows slowly (length 10 → +1 segment)
  - Late: Grows quickly (length 50 → +5 segments)
  - Creates exponential difficulty ramp

**SupaSnake Choice:** Test Option A first (simple), Option C if too easy
```

**Testing Method:**
```
Track per playtest session:
- Length at death (average, median, max)
- Time survived (average, median, max)
- Player feeling: "Unfair" vs "My fault" deaths

Goal: Average death length = 40-60 segments (challenging but achievable)
```

### Actions + Emergence (Strategic Depth)

**Basic Actions:** Move (4 directions), Eat (automatic)

**Strategic Actions to Encourage:**
1. **Route planning** - Plot efficient DNA collection paths
2. **Combo chaining** - Collect multiple DNA without pausing
3. **Safe vs greedy** - Chase distant DNA vs stay in safe zone
4. **Growth management** - Recognize when snake is becoming too long

**Emergence Testing:**
```
Interview playtesters after 10 sessions:
"What strategies did you develop?"

Good signs:
- "I learned to collect DNA in a spiral pattern"
- "I avoid the edges when I'm long"
- "I deliberately skip some DNA if it's too risky"

Bad signs:
- "I just moved randomly"
- "There's no strategy, just luck"
- "I do the same thing every time"

Goal: 4+ distinct strategies described by 70% of players
```

---

## Step 2: Balance Collection Mechanics (Chance System)

### Objects + Chance (Gacha Tuning)

**Mechanic Interaction:**
- Variant objects have rarity attribute (Common/Rare/Mythic)
- Gacha action uses random number generator
- Probability determines distribution

**Current Model:**
- 10% Common (90/1000 pulls)
- 1% Rare (10/1000 pulls)
- 0.1% Mythic (1/1000 pulls)

**Balance Testing:**
```
Simulation (run 10,000 virtual players):
1. How many pulls to complete one dynasty (13 variants)?
2. What % reach first mythic by pull 100? 500? 1000?
3. What's the duplicate rate at 50 pulls? 100? 200?

Expected results (current rates):
- First mythic: 50% of players by pull 693
- Complete commons: 90% by pull 150
- Complete rares: 90% by pull 900
- Complete dynasty: 90% by pull 1500+

Is this acceptable?
- If completion feels too far: Increase rates or add pity system
- If completion feels too easy: Lower rates (but risk frustration)
```

**Excitement Calibration:**
```
Track emotional responses during playtesting:
- Mythic pull reaction: Record on video, rate excitement 1-10
- 50th common duplicate: Rate frustration 1-10

Goal:
- Mythic excitement: Average 8+/10 (memorable moment)
- Duplicate frustration: Average <4/10 (annoying but tolerable)

If frustration too high: Add duplicate-to-DNA conversion system
```

### Rules + Meaningful Choice (No Dominant Strategy)

**Choice Point:** Gacha vs Breeding

**Gacha Path:**
- Cost: 50 DNA per pull
- Speed: Fast (earn 30-40 DNA per run = 1.5 runs per pull)
- Control: None (random variant)
- Excitement: High (surprise factor)

**Breeding Path:**
- Cost: TBD DNA + 2 variants consumed
- Speed: Slow (need duplicates first)
- Control: High (target specific generation/dynasty)
- Excitement: Medium (guaranteed outcome)

**Balance Formula:**
```
Expected Value Calculation:

Gacha:
- 13 variants in dynasty
- Pull any variant: 1/13 ≈ 7.7% chance per pull
- Expected pulls for specific variant: 13 pulls × 50 DNA = 650 DNA

Breeding:
- Need 2 duplicates of related variant
- Breed cost: X DNA
- Guaranteed specific outcome
- Total cost: (2 gacha pulls to get duplicates) + X DNA

Balance condition: X should make total ~= 650 DNA
- If X = 200 DNA: Total = 300 DNA (gacha + breed) - TOO CHEAP
- If X = 350 DNA: Total = 450 DNA - Still cheaper, but requires strategy
- If X = 500 DNA: Total = 600 DNA - Nearly equal (slight breed advantage)

**Recommendation:** X = 300-400 DNA (breeding is cheaper but requires planning)
```

---

## Step 3: Balance Skill-Chance Interaction (Hybrid System)

**Core Tension:** Skill earns DNA (deterministic), Chance consumes DNA (random)

### Skill Floor (Minimum DNA Earning)

**Problem:** Bad players earn so little DNA that collection becomes impossible

**Solution:** Implement DNA floor per run

**Formula:**
```
Minimum DNA per run (even if player dies immediately):
- Participation DNA: 5 DNA (just for trying)
- Time bonus: 1 DNA per 10 seconds survived (max 9 DNA for 90 sec)
- Collection bonus: 1 DNA per pickup

Worst case (die in 5 seconds, 0 pickups): 5 DNA
Average case (survive 45 seconds, 10 pickups): 5 + 4.5 + 10 = 19.5 DNA
Expert case (survive 90 seconds, 30 pickups): 5 + 9 + 30 = 44 DNA

**Balance check:**
- Worst player needs 10 runs per gacha pull (5 min of play)
- Average player needs 2.6 runs per gacha pull (2-3 min of play)
- Expert player needs 1.1 runs per gacha pull (90 sec of play)

Is this acceptable?
- Emma (casual): 5 min per pull feels achievable, not grindy
- Tyler (hardcore): Skill advantage = 5× faster progress (satisfying mastery)
```

### Skill Ceiling (Maximum DNA Earning)

**Problem:** Expert players earn DNA so fast collection becomes trivial

**Solution:** Soft caps and diminishing returns

**Formula:**
```
Cap snake length at 50 segments (prevents impossibly long runs)
Cap DNA pickups at 40 per run (spawn rate limits)
Cap run duration at 120 seconds (energy efficiency)

Maximum possible DNA per run:
- Participation: 5 DNA
- Time (120 sec): 12 DNA
- Pickups (40): 40 DNA
- Length multiplier: ???

**Multiplier design:**
Length 10: 1× multiplier (40 DNA from pickups)
Length 30: 1.5× multiplier (60 DNA from pickups)
Length 50: 2× multiplier (80 DNA from pickups)

Absolute max: 5 + 12 + 80 = 97 DNA per run

This gives experts ~2× advantage over average (44 vs 97), which feels fair.
Too large gap (5× or more) makes skill progression feel broken.
```

---

## Step 4: Create Progression Curve (Challenge vs Success Balance)

**Goal:** Keep all players in flow channel across their entire play journey

### Difficulty Curve Design

**Hour 1 (Tutorial):**
- Grid: 15×20 (normal size)
- Snake start length: 3 segments (safe)
- DNA spawn rate: High (1 per 2 seconds)
- Max difficulty: 20 segments before getting hard
- **Goal:** 90% of new players survive 30+ seconds

**Hour 10 (Skill Building):**
- Grid: 15×20 (unchanged)
- Snake start length: 5 segments (slightly harder)
- DNA spawn rate: Medium (1 per 3 seconds)
- Max difficulty: 40 segments achievable
- **Goal:** Average players reach consistent 60-second runs

**Hour 50 (Mastery):**
- Grid: 15×20 (unchanged)
- Snake start length: 5 segments (unchanged)
- DNA spawn rate: Medium (unchanged)
- Difficulty comes from player's own skill expectations
- **Goal:** Experts chase 90+ second perfect runs

**Key Insight:** Difficulty doesn't need artificial increases. Snake's inherent growth mechanic creates natural difficulty ramp. Keep parameters constant, let player skill drive progression.

### Testing the Curve

**Metrics to Track:**
```
New players (< 5 sessions):
- Survival time: Should increase from 15s → 30s → 45s
- DNA per run: Should increase from 8 → 15 → 25
- Retention: 60% return Day 2, 40% return Day 7

Engaged players (5-20 sessions):
- Survival time: 60s average, 90s ceiling
- DNA per run: 30-40 average
- Retention: 50% return Day 7, 30% return Day 30

Expert players (20+ sessions):
- Survival time: 75s average, 120s ceiling
- DNA per run: 40-60 average
- Retention: 70% return Day 7, 50% return Day 30
- Motivation: Collection completion, not just gameplay
```

---

## Step 5: Iteration Process

**Month 1-2: Build Minimum Viable Balance**
```
1. Implement baseline values (grid size, speed, gacha rates)
2. Ensure all systems functional
3. Internal team testing only (5-10 people)
4. Fix obvious problems (game too easy/hard, rates nonsensical)
```

**Month 3-4: Gather Data**
```
1. Closed beta (50 players, mix of skill levels)
2. Instrument everything:
   - Run duration, DNA earned, gacha pulls
   - Death causes, longest run, average length at death
   - Session frequency, retention, completion rates
3. Identify outliers:
   - Players completing too fast (game too easy)
   - Players quitting early (game too hard or frustrating)
   - Broken strategies (dominant strategies)
```

**Month 5-6: Refinement**
```
1. Adjust ONE variable at a time
2. Retest with same cohort
3. Compare before/after metrics
4. Iterate weekly based on data

Example iteration:
- Week 1: DNA earn rate feels low, increase by 20%
- Week 2: Retest, now feels better, keep change
- Week 3: Gacha rates feel stingy, add pity system (guaranteed rare every 50 pulls)
- Week 4: Retest, now feels fair, keep change
```

**Launch: Final Polish**
```
1. Run extended playtest (100+ players, 2 weeks)
2. Validate all metrics are in target ranges
3. Make minor tweaks (<10% adjustments)
4. Lock balance for launch
5. Plan post-launch live-ops adjustments based on actual player behavior
```

---

## Tips for Success

**DO:**
- Track metrics obsessively (can't balance what you don't measure)
- Change one variable at a time (isolate cause-effect)
- Playtest with diverse skill levels (experts + novices)
- Accept that first balance attempt will be wrong (iteration is expected)
- Use expected value math to check fairness (risk = reward)
- Build spreadsheet models before implementing (cheap to test)

**DON'T:**
- Balance purely by feel (feelings lie, data clarifies)
- Make huge changes (10× adjustments cause chaos)
- Forget about Emma while optimizing for Tyler (serve both audiences)
- Ship unbalanced game ("we'll patch it later" rarely happens)
- Ignore negative feedback ("git gud" is not balance strategy)
- Let sunk cost bias prevent cuts (kill mechanics that don't work)

---

## Common Pitfalls

**Pitfall 1: Forgetting the Floor**
- Expert players earn 60 DNA/run, novices earn 5 DNA/run
- Novices need 10 runs per pull (frustrating), experts need 1 run (trivial)
- **Solution:** Add participation DNA floor (minimum 15 DNA per run regardless of performance)

**Pitfall 2: Too Many Variables**
- Change speed + grid size + DNA rate + gacha rates simultaneously
- Can't tell which change caused improvement/degradation
- **Solution:** Freeze all but one variable, test, then move to next variable

**Pitfall 3: Balancing for Yourself**
- Designer plays 500 hours, thinks game is too easy
- New players play 5 minutes, think game is too hard
- **Solution:** Playtest with actual target audience (Emma, Tyler), not dev team

**Pitfall 4: Ignoring Emergent Strategies**
- Players discover "DNA farming exploit" (idle in corner, wait for spawns)
- Designers patch it instead of understanding why it emerged
- **Solution:** Exploitation means legitimate path is too hard, fix root cause

---

## See Also

- **Quick Refs:** @knowledge_base/game_design/quick_ref/mechanic_space.md through mechanic_chance.md
- **Quick Refs:** @knowledge_base/game_design/quick_ref/concept_balance_types.md
- **SupaSnake Balance:** @knowledge_base/game/quick_ref/economic_balance.md
- **SupaSnake Progression:** @knowledge_base/game/how_to/balance_progression.md
- **Chapter Summary:** @knowledge_base/game_design/reference/batch2_chapters/chapter_12_mechanics_summary.md
