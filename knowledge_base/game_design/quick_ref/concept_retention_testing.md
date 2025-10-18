# Retention Testing - Quick Reference

## Core Concept

**Retention testing** measures whether players **return to your game** over time. For mobile F2P, retention is the #1 metric - more important than fun, graphics, or content. If players don't come back, nothing else matters. Test retention early and iterate until you hit targets.

## Key Retention Metrics

**D1 (Day 1 Retention):**
- **Definition**: % of players who return 1 day after first session
- **Target**: 40%+ (good), 50%+ (great), 60%+ (exceptional)
- **What it measures**: Did first session hook them?

**D7 (Day 7 Retention):**
- **Definition**: % of players who return 7 days after first session
- **Target**: 20%+ (good), 30%+ (great), 40%+ (exceptional)
- **What it measures**: Is there sustained engagement?

**D30 (Day 30 Retention):**
- **Definition**: % of players who return 30 days after first session
- **Target**: 10%+ (good), 15%+ (great), 20%+ (exceptional)
- **What it measures**: Long-term habit formation

**Why These Matter:**
- **D1**: Determines if your game is worth marketing (if 90% quit Day 1, don't spend on ads)
- **D7**: Determines if players build habits (daily play patterns)
- **D30**: Determines lifetime value (LTV) - loyal players = revenue

## Mobile F2P Benchmarks

| Game Type | D1 | D7 | D30 |
|-----------|----|----|-----|
| **Hypercasual** (Flappy Bird) | 30-40% | 10-15% | 3-5% |
| **Casual** (Candy Crush) | 40-50% | 25-35% | 12-18% |
| **Mid-core** (Clash Royale) | 50-60% | 30-40% | 15-25% |
| **Hardcore** (PUBG Mobile) | 60-70% | 40-50% | 20-30% |

**SupaSnake Target** (Casual collector):
- D1: 45%+
- D7: 25%+
- D30: 12%+

## What Drives Retention?

### 1. Time-Gated Content

**Examples:**
- Breeding completes in 12 hours → "Come back tomorrow to collect!"
- Energy refills over time → "Check back in 30 minutes"
- Daily login rewards → "Don't miss today's bonus DNA!"

**Why It Works:** Creates anticipation, FOMO (fear of missing out)

**SupaSnake:**
- Breeding timer: 12-24 hours
- Energy regen: 1 per 5 minutes
- Daily DNA reward: +10 DNA if you log in

---

### 2. Short-Term Goals

**Examples:**
- "Collect 5 more variants to complete Dynasty 1"
- "Breed 1 more Gen 2 snake to unlock Evolution Lab"
- "Earn 50 more DNA to unlock Dynasty 2"

**Why It Works:** Always gives player something to work toward (never "done")

**SupaSnake:**
- Next variant is always visible in collection book (empty slot = goal)
- Dynasty unlock progress bar (230/250 DNA - so close!)
- Lab upgrade tiers (3 more breeds to unlock next tier)

---

### 3. Daily Habits

**Examples:**
- Daily login bonus (streak rewards - miss a day, lose streak)
- Daily challenges (3 new tasks every day)
- Limited-time events (Halloween variants available this week only)

**Why It Works:** Builds routine ("I play SupaSnake every morning")

**SupaSnake:**
- Daily DNA reward (+10 DNA, resets at midnight)
- Daily breeding slot (1 free instant breed per day)
- Weekend events (2x DNA from classic games on Saturdays)

---

### 4. Social/Community

**Examples:**
- Leaderboards (see friends' high scores)
- Sharing (post new variant to Instagram)
- Guilds/clans (team-based goals)

**Why It Works:** Social pressure, comparison, showing off

**SupaSnake v0.1:** Skip (too complex for MVP)
**SupaSnake v1.0+:** Add leaderboards, sharing

---

## Retention Testing Process

### Step 1: Cohort Tracking

**Setup Amplitude/Mixpanel:**
- Track `first_session` timestamp for each player
- Track all subsequent `session_start` events
- Amplitude auto-calculates retention cohorts

**View Retention Chart:**
```
Cohort: Oct 1-7 (100 players)

Day 0:  100 players (100%)
Day 1:   45 players (45%)  ← D1 retention
Day 2:   38 players (38%)
Day 3:   32 players (32%)
Day 7:   22 players (22%)  ← D7 retention
Day 14:  15 players (15%)
Day 30:   8 players (8%)   ← D30 retention
```

---

### Step 2: Identify Churn Points

**Question:** When do most players quit?

**Method:** Look for steepest drop-offs in retention curve

**Example:**
```
Day 0 → Day 1: 100 → 45 (55% churn!) ← BIGGEST DROP
Day 1 → Day 2: 45 → 38 (15% churn)
Day 2 → Day 7: 38 → 22 (42% churn) ← Second biggest
```

**Insight:** Most churn happens Day 0→1 (first impression problem) and Days 2-7 (no retention hook)

---

### Step 3: Analyze Churned Players

**Question:** What did churned players do (or not do) before quitting?

**Method:** Segment churned vs. retained players, compare behavior

**Example:**
```
Players who returned Day 1:
- 95% completed tutorial
- 80% bred at least 1 snake
- 60% played 3+ classic games
- 40% viewed collection book

Players who did NOT return Day 1:
- 60% completed tutorial (40% quit during!)
- 30% bred a snake
- 20% played 3+ games
- 10% viewed collection book
```

**Insight:** Breeding a snake strongly correlates with D1 retention (80% vs. 30%)

**Hypothesis:** "If we get more players to breed their first snake, D1 retention will improve"

---

### Step 4: Form Hypotheses

**Format:** "We believe that [change] will increase [metric] from [current] to [target]"

**Examples:**

**Hypothesis 1:**
"We believe that reducing breeding time from 24h → 12h will increase D1 retention from 45% → 55% because players will collect their first bred snake within Day 1 (dopamine hit + reason to return)"

**Hypothesis 2:**
"We believe that adding a daily DNA reward (+10 DNA) will increase D7 retention from 22% → 30% because players will return daily to claim reward (habit formation)"

**Hypothesis 3:**
"We believe that showing collection progress bar will increase D1 retention from 45% → 50% because players will see clear short-term goal (5/27 Dynasty 1 variants)"

---

### Step 5: A/B Test (or Sequential Cohorts)

**A/B Test** (if you have traffic):
- 50% of players get old version (24h breeding)
- 50% get new version (12h breeding)
- Compare D1 retention between groups

**Sequential Cohorts** (for small tests):
- Week 1: Ship with 24h breeding → D1 = 45%
- Week 2: Ship update with 12h breeding → D1 = 53%
- Compare: +8% improvement (hypothesis validated!)

**SupaSnake** (small beta): Use sequential cohorts

---

### Step 6: Iterate Weekly

**Monday:** Review last week's retention data
**Tuesday:** Identify biggest churn point, form hypothesis
**Wednesday:** Implement change, ship TestFlight update
**Thursday-Sunday:** Collect data from new cohort
**Next Monday:** Compare cohorts, decide to keep/revert change

**Repeat until retention targets hit.**

---

## Common Retention Problems

### Problem: Low D1 Retention (<30%)

**Diagnosis:** First session didn't hook players

**Common Causes:**
- Tutorial too long/boring (skip or shorten)
- Core loop not fun (fundamental game design issue)
- No clear goal (player doesn't know what to do next)
- Friction (crashes, bugs, confusing UI)

**SupaSnake Solutions:**
- Tutorial <60 seconds (interactive, skippable)
- Clear first goal: "Breed your first Gen 2 snake!"
- No crashes (TestFlight crash reporting)

---

### Problem: Steep Drop Days 2-7

**Diagnosis:** No retention hook (no reason to return)

**Common Causes:**
- Nothing time-gated (no "come back tomorrow")
- Ran out of short-term goals (completed all content)
- No habit-forming features (daily rewards, streaks)

**SupaSnake Solutions:**
- Breeding timer (12h) → come back to collect
- Daily DNA reward → log in every day
- Collection book goals → always 1 more variant to get

---

### Problem: Long-Term Churn (D7-D30)

**Diagnosis:** Ran out of content or motivation

**Common Causes:**
- Completed all content (need more dynasties, variants)
- Progression too slow (paywall feels insurmountable)
- Repetitive (same activities every day, boring)

**SupaSnake Solutions:**
- 243 variants (takes months to complete)
- Monthly content drops (new dynasty every month)
- Meta-progression (lab upgrades, breeding unlocks)

---

## SupaSnake Retention Strategy

### D1 Hook (First 24 Hours)

**Goals:**
- Player completes tutorial (<60 seconds)
- Player plays 3-5 classic games (learns core loop)
- Player breeds first snake (initiates time-gated content)
- Player sees collection book (understands long-term goal)

**Retention Drivers:**
- **Breeding timer**: Snake ready in 12 hours → "Come back tomorrow!"
- **Energy system**: Runs out after 3-5 games → "Check back in 30 minutes"
- **Collection progress**: 3/27 Dynasty 1 variants → "So close to completing!"

**Target:** 45% D1 retention

---

### D7 Hook (Days 2-7)

**Goals:**
- Player logs in daily (habit formation)
- Player unlocks Gen 2, Gen 3 breeding (progression)
- Player completes 30-50% of Dynasty 1 (visible progress)
- Player feels monetization pressure (wants more energy/DNA)

**Retention Drivers:**
- **Daily DNA reward**: +10 DNA per day (don't miss it!)
- **Breeding cycles**: Multiple snakes breeding (check back regularly)
- **Dynasty 1 completion goal**: 15/27 variants (achievable by Day 7)

**Target:** 25% D7 retention

---

### D30 Hook (Long-Term)

**Goals:**
- Player completes Dynasty 1 (27/27 variants)
- Player unlocks Dynasty 2 (250 DNA saved)
- Player has established daily play habit (routine)
- Player either converts to paying or is loyal F2P (both valuable)

**Retention Drivers:**
- **Dynasty 2 unlock**: New content to explore (keeps fresh)
- **Lab upgrades**: Meta-progression (breeding speed, energy cap)
- **Collection completion**: 60/243 variants (long-term goal visible)
- **Events**: Monthly content drops (new variants, challenges)

**Target:** 12% D30 retention

---

## Testing Checklist

**Before Launch:**
- [ ] Amplitude/Mixpanel integrated (track first_session, session_start)
- [ ] Retention cohorts set up (automatic in Amplitude)
- [ ] Time-gated content implemented (breeding timer, energy regen)
- [ ] Daily rewards live (DNA bonus, login streak)
- [ ] Short-term goals visible (collection book, dynasty progress)

**Week 1 (Friends & Family):**
- [ ] Track D1 retention (target: 40%+)
- [ ] Identify churn points (when do players quit?)
- [ ] Fix critical issues (crashes, confusing tutorial)

**Week 2-4 (Closed Beta):**
- [ ] D1 cohort comparison (is retention improving?)
- [ ] D7 data available (track Days 1-7 behavior)
- [ ] A/B test retention features (daily rewards, breeding time)
- [ ] Iterate weekly until D1 >45%, D7 >25%

**Month 2+ (Soft Launch):**
- [ ] D30 data available (long-term retention)
- [ ] LTV calculations (how much is a retained player worth?)
- [ ] Content roadmap (keep players engaged months 2-6)

---

## Red Flags

🚩 **D1 retention <30%** - fundamental problem (core loop, onboarding, or bugs)
🚩 **No time-gated content** - no reason to return tomorrow
🚩 **Players complete all content Day 1** - not enough depth
🚩 **Retention flat (not improving over weeks)** - not iterating or testing wrong things

---

## Success Criteria

✅ **D1 retention >45%** (players hooked)
✅ **D7 retention >25%** (habit forming)
✅ **D30 retention >12%** (long-term engagement)
✅ **Retention improving week-over-week** (iteration working)
✅ **Churn points identified and addressed** (data-driven fixes)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_mobile_playtesting.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_playtest_analysis.md
- **How-To**: @knowledge_base/game_design/how_to/playtest_mobile_f2p_game.md
- **Complete**: @knowledge_base/game_design/reference/batch4_chapters/chapter_28_playtesting_summary.md
