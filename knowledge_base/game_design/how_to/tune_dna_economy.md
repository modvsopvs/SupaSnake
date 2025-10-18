# How to Tune the DNA Economy

**Schell's Principle:** Game economies require balancing sources (income), sinks (costs), and progression pacing. Like a real economy, too much inflation (easy earning) or deflation (high costs) breaks player motivation.

**SupaSnake Context:** DNA is SupaSnake's core currency - earned through skill (Snake gameplay), spent on chance (gacha pulls, breeding). Economic balance determines whether collection feels achievable (satisfying) or impossible (frustrating).

---

## Overview

SupaSnake's DNA economy has three interconnected systems:
1. **DNA Sources** - How players earn currency (skill-based gameplay)
2. **DNA Sinks** - How players spend currency (gacha pulls, breeding costs)
3. **Progression Gates** - Energy system limiting earning rate

The tuning challenge: Balance earning vs spending so 80-hour collection completion feels achievable without making early progress trivial.

---

## Step 1: Define Economic Goals

### Target Metrics

**Completion Time Target:**
```
Panini book completion (all variants collected):
- Conservative: 80 hours of playtime
- Aggressive: 40 hours of playtime
- Whale (monetized): 20 hours of playtime

**SupaSnake Target:** 60 hours for engaged F2P player
- 2 hours per day × 30 days = 60 hours (1-month retention)
- Aggressive enough to maintain interest
- Realistic enough to feel achievable
```

**Session Target:**
```
Time per gacha pull (feeling of progress):
- Too fast (<5 min): Trivial, no value
- Too slow (>30 min): Frustrating, demotivating
- Goldilocks: 15-20 min per pull

This means:
- 60-second runs × 15-20 runs = 15-20 min per pull
- 30-40 DNA per run × 15-20 runs = 450-800 DNA per pull
- **Therefore: Target pull cost = 500-600 DNA**
```

**Progression Curve:**
```
Week 1: Pull 10-15 variants (fast early progress, motivation)
Week 2-3: Pull 15-20 more variants (moderate pacing, building collection)
Week 4: Pull remaining 10 variants (slowing down, but visible end)
Total: ~45 variants across 3 dynasties (13 each + extras for breeding)

This feels like: Quick start → Steady middle → Satisfying finish
Not: Slow grind → Impossible wall → Quit
```

---

## Step 2: Calculate DNA Sources (Income)

### Core Gameplay Earning

**Base Formula:**
```
DNA per run = Participation + Time Bonus + Collection Bonus + Length Multiplier

Participation DNA:
- Fixed 10 DNA just for playing
- Ensures skill floor (even immediate death earns something)

Time Bonus:
- 1 DNA per 5 seconds survived (max 18 DNA for 90-second run)
- Rewards survival skill

Collection Bonus:
- Base: 1 DNA per pickup
- Multiplier: (Snake length ÷ 10) × DNA value
  - Length 10: 1× multiplier (1 DNA per pickup)
  - Length 30: 3× multiplier (3 DNA per pickup)
  - Length 50: 5× multiplier (5 DNA per pickup)
- Rewards both collection skill and growth management

Total Examples:
- Beginner (die at 20s, 3 pickups, length 15):
  10 + 4 + (3 × 1.5) = 18.5 DNA
- Average (survive 60s, 12 pickups, length 30):
  10 + 12 + (12 × 3) = 58 DNA
- Expert (survive 90s, 25 pickups, length 50):
  10 + 18 + (25 × 5) = 153 DNA
```

**Earning Rate Validation:**
```
Target: 500 DNA per gacha pull

Beginner path:
- 18.5 DNA per run × 27 runs = 500 DNA
- 60 seconds per run × 27 runs = 27 minutes per pull
- **Verdict:** Too slow, frustrating for beginners

Adjusted beginner (with participation increase):
- Participation: 20 DNA (was 10)
- New total: 28.5 DNA per run × 17.5 runs = 500 DNA
- 17.5 runs × 60s = 17.5 minutes per pull
- **Verdict:** Acceptable!

Average player:
- 58 DNA per run × 8.6 runs = 500 DNA
- 8.6 runs × 60s = 8.6 minutes per pull
- **Verdict:** Perfect! Feels rewarding without being trivial

Expert player:
- 153 DNA per run × 3.3 runs = 500 DNA
- 3.3 runs × 60s = 3.3 minutes per pull
- **Verdict:** Fast but earned through skill mastery
```

### Additional DNA Sources (Optional)

**Daily Login Bonus:**
```
Day 1: 50 DNA
Day 2: 75 DNA
Day 3: 100 DNA
Day 4-7: 150 DNA each
Total week 1: 1,025 DNA = 2 free pulls

Purpose: Retention incentive, doesn't break economy
Effect: Reduces first-week grind from 10 hours → 8 hours (welcome gift)
```

**Achievement Bonuses:**
```
First mythic pull: 500 DNA bonus
Complete one dynasty: 1,000 DNA bonus
Perfect run (90s, no deaths): 200 DNA bonus

Purpose: Celebrate milestones, doesn't break core loop
Effect: Adds ~2,000 DNA across lifetime (~4 extra pulls = 3% faster completion)
```

---

## Step 3: Calculate DNA Sinks (Spending)

### Gacha Pull Costs

**Single Pull (Current):**
```
Cost: 500 DNA
Outcome: 1 random variant from selected dynasty
- 10% common, 1% rare, 0.1% mythic
- Specific variant probability: 1/13 = 7.7% per pull

Expected pulls to complete one dynasty:
- Mathematical: ~130 pulls (coupon collector problem with duplication)
- With breeding shortcuts: ~100 pulls
- Target: 100 pulls × 500 DNA = 50,000 DNA per dynasty

Time to complete one dynasty:
- Beginner: 50,000 DNA ÷ 28.5 DNA/run = 1,754 runs = 29 hours
- Average: 50,000 DNA ÷ 58 DNA/run = 862 runs = 14 hours
- Expert: 50,000 DNA ÷ 153 DNA/run = 327 runs = 5.5 hours

Total completion (3 dynasties):
- Beginner: 87 hours (too slow!)
- Average: 42 hours (good!)
- Expert: 16.5 hours (fast but earned)
```

**Adjusted for Beginner Pacing:**
```
Option A: Reduce pull cost to 400 DNA
- Beginner: 50,000 ÷ 28.5 = 1,754 runs, but pulls cost 400 not 500
- New pulls needed: 50,000 ÷ 400 = 125 pulls
- New DNA needed: 125 × 400 = 50,000 (same, but less runs)
- Wait, this doesn't help!

Option B: Increase participation DNA to 25 (from 20)
- Beginner: 33.5 DNA per run × 15 runs = 500 DNA per pull
- 15 runs × 60s = 15 minutes per pull
- 125 pulls × 15 min = 31 hours per dynasty → 93 hours total (still too slow)

Option C: Add first-time bonuses
- First 10 pulls in each dynasty cost 300 DNA (40% discount)
- Remaining pulls cost 500 DNA (normal)
- Early pulls: 10 × 300 = 3,000 DNA saved per dynasty = 9,000 DNA total
- Effective total: (50,000 - 3,000) × 3 = 141,000 DNA needed
- Beginner: 141,000 ÷ 28.5 = 4,947 runs = 82 hours
- **Verdict:** Close to 80-hour target!

**Choose Option C:** New player friendly without breaking long-term economy
```

### Breeding Costs

**Breeding Formula:**
```
Combine 2 variants → 1 new variant

Cost Structure:
- Base cost: 300 DNA
- Rarity multiplier:
  - Common + Common = 300 DNA → Common result
  - Common + Rare = 500 DNA → Rare result
  - Rare + Rare = 800 DNA → Guaranteed Rare or chance of Mythic
  - Rare + Mythic = 1,500 DNA → Mythic result

Generation advancement:
- G0 + G0 = G1 (costs 300 DNA, same rarity)
- G1 + G1 = G2 (costs 600 DNA, same rarity)
- G2 + G2 = G3 (costs 1,200 DNA, max generation)
```

**Economic Purpose:**
```
Breeding is:
1. Guaranteed outcome (vs gacha randomness) → Appeals to control players
2. DNA sink for duplicates (vs worthless duplicates) → Feels good to pull dupes
3. Slower but strategic (requires planning) → Depth for engaged players
4. Slightly cheaper than equivalent gacha (300-800 vs 500 per pull) → Rewards collection

Is breeding balanced vs gacha?

Path 1 (Pure Gacha):
- 100 pulls × 500 DNA = 50,000 DNA per dynasty
- Time: 14 hours (average player)

Path 2 (Gacha + Breeding):
- 60 pulls for baseline (get some of each variant)
- Breed duplicates to fill gaps
- Gacha: 60 × 500 = 30,000 DNA
- Breeding: 30 × 400 (average breed cost) = 12,000 DNA
- Total: 42,000 DNA per dynasty
- Time: 12 hours (average player)
- **Savings: 2 hours per dynasty, 6 hours total**

Verdict: Breeding is 15-20% more efficient than pure gacha, rewarding engaged players without breaking economy
```

---

## Step 4: Balance Energy Gates (Earning Rate Limiter)

### Energy System Design

**Energy Parameters:**
```
Max energy: 10
Energy cost per run: 1
Energy regen rate: 1 per 8 minutes (7.5 per hour)

Implications:
- 10 runs per full tank
- Full tank → empty in 10 minutes (continuous play)
- Empty → full in 80 minutes (wait time)
```

**Session Length Analysis:**
```
Typical player behavior:

Emma (Casual, 2-3 sessions/day):
- Session 1 (morning): 5 runs (6 energy left)
- Wait 6 hours (45 energy regenerated, capped at 10)
- Session 2 (evening): 5 runs (5 energy left)
- Overnight: Regenerates to 10
- **Daily runs:** 10 runs = 580 DNA (average) = 1.16 pulls/day

Tyler (Hardcore, 5+ sessions/day):
- Session 1: 10 runs (0 energy left)
- Wait 80 min (10 energy regenerated)
- Session 2: 10 runs (0 energy left)
- Wait 80 min (10 energy regenerated)
- Session 3: 10 runs (0 energy left)
- ... continues all day
- **Daily runs:** ~75 runs (limited by real-world time) = 4,350 DNA = 8.7 pulls/day

Is this fair?
- Emma progresses at comfortable pace (35 pulls/month = dynasty complete in ~3 months)
- Tyler progresses 7.5× faster (260 pulls/month = all dynasties in 1.5 months)
- Both earn through skill, energy just limits session frequency
- **Verdict:** Tyler's advantage is time investment, not unfair mechanic
```

### Energy Tuning Levers

**If completion is too slow (players quit):**
```
Option A: Increase regen rate
- From: 1 per 8 min (7.5/hour)
- To: 1 per 6 min (10/hour)
- Effect: 33% more runs per day, 33% faster completion
- Risk: Hardcore players finish too fast, churn early

Option B: Decrease energy cost
- From: 1 energy per run
- To: 1 energy per 2 runs (halve cost)
- Effect: 2× more runs per tank, 2× faster completion
- Risk: Major economic shift, requires re-balancing ALL DNA values

Option C: Increase max energy cap
- From: 10 max
- To: 15 max
- Effect: Casual players waste less (longer regeneration buffer)
- Hardcore players unaffected (still gated by regen rate)
- **Recommended:** Helps casuals without breaking hardcore balance

Option D: Add energy refill options
- Daily free refill (full 10 energy)
- Watch ad for 5 energy
- Monetization: $0.99 for full refill
- Effect: Doesn't change base economy, adds flexibility
- **Recommended:** Feels generous without forcing monetization
```

---

## Step 5: Create Economic Spreadsheet Model

### Tracking Matrix

**Build This Spreadsheet:**
```
Columns:
- Player Type (Beginner/Average/Expert)
- DNA per Run (formula)
- Runs per Pull (500 DNA ÷ DNA per run)
- Time per Pull (Runs × 60 seconds)
- Pulls per Dynasty (100 target)
- Hours per Dynasty (Time per pull × Pulls per dynasty)
- Total Hours (Hours per dynasty × 3)

Example Row (Average Player):
- DNA per Run: 58 DNA
- Runs per Pull: 8.6 runs
- Time per Pull: 8.6 minutes
- Pulls per Dynasty: 100 pulls
- Hours per Dynasty: 14.3 hours
- Total Hours: 42.9 hours
```

**Sensitivity Analysis:**
```
What if we change DNA per run by 10%?

DNA per Run: 58 → 63.8 (+10%)
Total Hours: 42.9 → 39 hours (-9%)

DNA per Run: 58 → 52.2 (-10%)
Total Hours: 42.9 → 47.7 hours (+11%)

Insight: Economy is roughly linear - 10% income change = ~10% time change
This means small tweaks have predictable effects (good for balancing)
```

**Breeding Impact Model:**
```
What % of pulls can be replaced by breeding?

Scenario A (No Breeding):
- 100% gacha
- 100 pulls × 500 DNA = 50,000 DNA
- 14.3 hours

Scenario B (Light Breeding - 20% replacement):
- 80 gacha pulls × 500 DNA = 40,000 DNA
- 20 breeding × 400 DNA = 8,000 DNA
- Total: 48,000 DNA = 13.7 hours

Scenario C (Heavy Breeding - 40% replacement):
- 60 gacha pulls × 500 DNA = 30,000 DNA
- 40 breeding × 400 DNA = 16,000 DNA
- Total: 46,000 DNA = 13.2 hours

Insight: Breeding can save 10-15% completion time for engaged players
This is healthy - rewards strategic play without breaking core loop
```

---

## Step 6: Playtesting & Iteration

### Test Protocol

**Week 1: Baseline Collection**
```
30 playtesters, play naturally for 7 days
Track:
- DNA earned per session (avg, min, max)
- Gacha pulls performed (total, per dynasty)
- Breeding events (frequency, costs)
- Session frequency (how often they play)
- Retention (did they return Day 2? Day 7?)

Expected results:
- Average player: 1-2 pulls per day (session DNA 500-1,000)
- Engaged player: 3-5 pulls per day (session DNA 1,500-2,500)
- Hardcore player: 8+ pulls per day (all-day grinding)
```

**Week 2: Survey Perception**
```
Ask playtesters:
1. "Does DNA earning feel too slow, too fast, or just right?" (1-5 scale)
2. "Does gacha cost feel too expensive, too cheap, or fair?" (1-5 scale)
3. "Do you feel like you're making progress toward collection?" (yes/no)
4. "How many more hours until you complete collection?" (open response)

Red flags:
- >50% say earning is "too slow" → Increase income or decrease costs
- >50% say gacha is "too expensive" → Reduce pull cost or add bonuses
- >50% say "no progress" → Progression curve is broken
- Estimates >100 hours → Economy is too tight
```

**Week 3-4: Targeted Adjustments**
```
Based on feedback, make ONE change:
- If earning too slow: Increase participation DNA by 5
- If pulls too expensive: Reduce cost by 50 DNA
- If breeding unused: Reduce breeding costs by 20%
- If completion too fast: Reduce DNA per run by 10%

Retest with same cohort
Compare before/after metrics
Iterate until 70%+ players rate economy as "just right"
```

---

## Tips for Success

**DO:**
- Start conservative (slower economy), speed up if needed
- Track everything (can't tune without data)
- Test with real players, not dev team (devs play too much)
- Build spreadsheet model first (cheaper to iterate in Excel than code)
- Expect 3-5 iterations before balance feels right
- Plan post-launch economy events (2× DNA weekends, free pull days)

**DON'T:**
- Launch without playtesting (player behavior surprises you)
- Change multiple variables simultaneously (can't isolate cause)
- Ignore outlier players (whales and casuals both matter)
- Forget about duplicate problem (late-game pulls feel wasteful)
- Make completion impossible (frustration → quit)
- Make completion trivial (no sense of achievement)

---

## Common Economic Problems

**Problem 1: Late-Game Slowdown**
- Early pulls exciting (new variants)
- Late pulls frustrating (50% duplicates)
- **Solution:** Add duplicate conversion (10 dupes → 1 guaranteed new) or pity system

**Problem 2: Beginner Wall**
- First hour feels slow (learning curve + low DNA earning)
- Players quit before seeing collection appeal
- **Solution:** Front-load rewards (first 10 pulls discounted, daily login bonus Week 1)

**Problem 3: No Strategic Depth**
- All players just gacha spam, ignore breeding
- **Solution:** Make breeding meaningfully cheaper or faster for specific use cases

**Problem 4: Energy Frustration**
- Players want to keep playing but energy empty
- **Solution:** Add alternative modes (practice mode, challenges) that don't cost energy

---

## See Also

- **Quick Ref:** @knowledge_base/game_design/quick_ref/mechanic_chance.md
- **Quick Ref:** @knowledge_base/game_design/quick_ref/concept_balance_types.md
- **SupaSnake Economy:** @knowledge_base/game/quick_ref/economic_balance.md
- **SupaSnake Progression:** @knowledge_base/game/how_to/balance_progression.md
- **Chapter Summary:** @knowledge_base/game_design/reference/batch2_chapters/chapter_13_balance_summary.md
