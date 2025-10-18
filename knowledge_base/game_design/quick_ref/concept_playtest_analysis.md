# Playtest Analysis - Quick Reference

## Core Concept

**Playtest analysis** is the process of turning playtest data into **actionable design changes**. For mobile F2P, this means analyzing retention cohorts, economy balance, and player feedback to identify friction points and iterate rapidly. Data-driven decisions beat intuition.

## Analysis Framework

### 1. Quantitative Analysis (Analytics)

**What:** Numbers-based insights from tracking events

**Sources:**
- Amplitude/Mixpanel dashboards
- TestFlight crash reports
- Server logs (energy usage, IAP attempts)

**Key Analyses:**

**Retention Cohorts:**
```
Cohort: Players who started Oct 1-7

| Day | Players Active | Retention % |
|-----|----------------|-------------|
| 0   | 100            | 100%        |
| 1   | 45             | 45%         |
| 7   | 22             | 22%         |
| 30  | 8              | 8%          |
```

**Insight:** Big drop Day 0→1 (onboarding issue?) and Day 1→7 (no retention hook?)

**Funnel Analysis:**
```
Tutorial Start:     100 players
Tutorial Complete:   85 players (15% drop-off)
First Breed:         70 players (15% more drop-off)
Second Session:      45 players (25% churn after first session)
```

**Insight:** Biggest drop after first session - need stronger Day 1 retention hook

**Economy Balance:**
```
| Day | Avg DNA | DNA Needed for Next Goal | Surplus/Deficit |
|-----|---------|--------------------------|-----------------|
| 3   | 75      | 50 (Gen 2 breed)         | +25 (good)      |
| 7   | 180     | 250 (Dynasty 2)          | -70 (stuck!)    |
| 14  | 320     | 250 (Dynasty 2)          | +70 (unlocked)  |
```

**Insight:** Players stall Day 7-14 waiting for Dynasty 2 - progression too slow

---

### 2. Qualitative Analysis (Feedback)

**What:** Player opinions, feelings, suggestions

**Sources:**
- In-app feedback submissions
- Email survey responses
- Direct observation notes

**Analysis Method: Thematic Coding**

**Raw Feedback:**
- "I don't understand why I can't breed more snakes" (Player 1)
- "Ran out of energy too fast" (Player 2)
- "Not sure what DNA is for" (Player 3)
- "Breeding takes too long, forgot to check back" (Player 4)
- "Energy refills too slowly" (Player 5)

**Themes:**
1. **Energy friction** (Players 2, 5) - 40% of feedback
2. **Onboarding confusion** (Players 1, 3) - 40% of feedback
3. **Breeding timer issues** (Player 4) - 20% of feedback

**Insight:** Top priority = energy system tuning, then onboarding clarity

---

### 3. Observation Analysis (Watching Players)

**What:** Behavioral patterns seen during direct observation

**Method:** Watch 5-10 players (friends/family) play for first 30 minutes

**What to Note:**
- **Hesitation points** (stare at screen, unsure what to do)
- **Repeated taps** (frustration - expected something to happen)
- **Tutorial skipping** (do they read or mash "Next"?)
- **Time to first success** (how long until first dopamine hit?)

**Example Notes:**
```
Player A (Emma persona):
- Completed tutorial in 2 minutes (skipped most text)
- Confused about DNA vs. Energy (tapped DNA counter expecting menu)
- First breed at 8 minutes (felt accomplished)
- Returned next day to collect bred snake (retention hook working!)

Player B (Tyler persona):
- Read tutorial carefully (4 minutes)
- Opened collection book immediately (goal-oriented)
- Frustrated by energy limit (wanted to play 10 games, capped at 3)
- Did NOT return Day 2 (no short-term goals visible?)
```

**Insights:**
- Emma: Onboarding works for casual players (skip-friendly)
- Tyler: Energy too restrictive, needs visible short-term goals

---

## SupaSnake Analysis Checklist

### Retention Analysis

**Questions to Answer:**
- What % return Day 1? Day 7? Day 30? (compare to targets)
- When do players churn? (after tutorial? Day 3? Day 7?)
- What's the last thing they did before churning? (ran out of energy? completed all content?)

**Method:**
1. Pull cohort retention from Amplitude
2. Identify steepest drop-off day
3. Cross-reference with events (what happened that day?)
4. Hypothesis: "Players churn Day 3 because they hit energy wall and have no breeds pending"

**Action:**
- Add daily login reward (give reason to return)
- Reduce breeding time from 24h → 12h (more frequent dopamine hits)

---

### Economy Analysis

**Questions to Answer:**
- Are players earning enough DNA? (compare to progression targets)
- Do they understand what to spend DNA on? (breeding? evolution? unlocks?)
- Are they hitting paywalls? (stuck waiting for DNA with no path forward?)

**Method:**
1. Calculate average DNA at key milestones (Day 1, 3, 7, 14, 30)
2. Compare to costs (Gen 2 breed: 50, Evolution: 150, Dynasty unlock: 250)
3. Identify bottlenecks (where players get stuck)

**SupaSnake Targets:**
```
| Day | Avg DNA Target | Key Unlock        | Status     |
|-----|----------------|-------------------|------------|
| 1   | 30             | Gen 2 breed (50)  | On track   |
| 3   | 75             | Gen 2 breed (50)  | ✅ Surplus |
| 7   | 180            | Dynasty 2 (250)   | ❌ Deficit |
| 14  | 320            | Dynasty 2 (250)   | ✅ Unlocked|
```

**Action:** Day 7 deficit too large - add daily DNA reward (+10/day = +70 over 7 days)

---

### Engagement Analysis

**Questions to Answer:**
- How long are sessions? (target: 3-5 minutes)
- How many games per session? (target: 3-5 classic games)
- Are players using all features? (classic mode, breeding, collection book)

**Method:**
1. Average session length from analytics
2. Distribution chart (what % of sessions are 1min, 3min, 5min, 10min+?)
3. Feature usage rates (what % bred a snake? viewed collection book?)

**Red Flags:**
- Session length <2 minutes (not enough content)
- Session length >10 minutes (players trapped, can't find exit)
- <50% of players ever breed (core loop not understood)

---

### Monetization Analysis

**Questions to Answer:**
- Do players understand IAP value? (what are they buying and why?)
- When do they first feel monetization pressure? (ran out of energy? want to unlock faster?)
- What's the conversion rate? (target: 2-5%)

**Method:**
1. Track `iap_viewed` → `iap_initiated` → `iap_completed` funnel
2. Identify drop-off points (viewed but didn't buy = perceived poor value?)
3. Survey: "Would you spend $5 on this game? What would you buy?"

**SupaSnake IAP Analysis:**
```
IAP: "Energy Pack" ($0.99 for 50 energy)

Funnel:
- 100 players hit energy depletion
- 30 opened shop (30% viewed)
- 5 clicked "buy" (17% of viewers)
- 2 completed purchase (40% conversion of clickers, 2% total)
```

**Insight:** 30% viewing shop = good monetization pressure. But only 17% click buy = perceived poor value or unclear benefit?

**Action:** Add tooltip: "50 energy = 5 more games = ~30 more DNA earned"

---

## Common Patterns

### Pattern: Tutorial Drop-Off

**Data:** 20% of players quit during tutorial

**Diagnosis:** Tutorial too long, boring, or confusing

**Solution:**
- Shorten to <60 seconds
- Make interactive (do, don't read)
- Allow skip with "play tutorial later" option

---

### Pattern: Day 1-2 Churn Spike

**Data:** 50% of players never return after Day 1

**Diagnosis:** No retention hook (no reason to come back)

**Solution:**
- Add time-gated rewards (breeding completes in 12h - come back tomorrow!)
- Daily login bonus (miss it = FOMO)
- Push notification when breeding completes

---

### Pattern: Mid-Game Plateau

**Data:** Players active Days 1-7, then churn Days 8-14

**Diagnosis:** Ran out of short-term goals (completed Dynasty 1, Dynasty 2 too expensive)

**Solution:**
- Add mid-tier goals (collect all Gen 2 variants in Dynasty 1)
- Temporary events (Halloween variants for 1 week)
- Daily challenges (earn bonus DNA)

---

### Pattern: Energy Frustration

**Data:** 40% of feedback mentions "ran out of energy too fast"

**Diagnosis:** Energy too restrictive, or players don't understand regen

**Solution:**
- Show energy regen timer ("Next energy in 4:32")
- Increase regen rate (1 per 5min instead of 10min)
- Give free energy refill daily

---

## Analysis → Action Pipeline

**Step 1: Gather Data**
- Pull analytics (cohort retention, funnels, averages)
- Read feedback (thematic coding)
- Review observation notes

**Step 2: Identify Top Issues**
- Rank by impact (what causes most churn?)
- Rank by effort (what's easiest to fix?)
- Prioritize: high impact + low effort first

**Step 3: Form Hypotheses**
- "We believe that reducing breeding time from 24h → 12h will increase D1 retention from 45% → 55%"
- "We believe that adding daily DNA reward (+10/day) will reduce Day 7-14 churn by 20%"

**Step 4: Implement Changes**
- Ship update to TestFlight
- Track same metrics for new cohort

**Step 5: Compare Cohorts**
```
Cohort A (pre-change): D1 retention = 45%
Cohort B (post-change): D1 retention = 53%
Result: +8% retention (hypothesis validated!)
```

**Step 6: Iterate**
- Keep changes that work
- Revert changes that don't
- Repeat weekly

---

## Tools for Analysis

**Amplitude/Mixpanel:**
- Retention cohorts (automatic)
- Funnels (conversion rates)
- Segmentation (compare Emma vs. Tyler behavior)

**Google Sheets:**
- Economy balance calculations
- Cohort comparison tables
- Prioritization matrix (impact vs. effort)

**Miro/FigJam:**
- Player journey mapping (visualize drop-off points)
- Affinity diagrams (cluster feedback themes)

---

## Red Flags

🚩 **Ignoring data in favor of gut feeling** ("I think it's fine" vs. "D1 retention is 25%")
🚩 **Changing multiple things at once** (can't tell what worked)
🚩 **Not comparing cohorts** (did the change actually help?)
🚩 **Analysis paralysis** (spending weeks analyzing, not shipping)

---

## Success Criteria

✅ **Weekly analysis routine** (review data every Monday)
✅ **Hypotheses documented** (write down what you expect before changing)
✅ **Cohort comparisons run** (A vs. B testing)
✅ **Changes shipped within 1 week of analysis** (fast iteration)
✅ **Metrics improving over time** (retention up, churn down)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_mobile_playtesting.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_retention_testing.md
- **How-To**: @knowledge_base/game_design/how_to/playtest_mobile_f2p_game.md
- **Complete**: @knowledge_base/game_design/reference/batch4_chapters/chapter_28_playtesting_summary.md
