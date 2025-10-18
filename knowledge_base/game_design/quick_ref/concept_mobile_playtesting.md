# Mobile Playtesting - Quick Reference

## Core Concept

**Mobile playtesting** for F2P games focuses on **retention, monetization, and session design** - not just "is it fun?" You're testing whether players come back daily, understand the progression, and see value in IAPs. Use **TestFlight, analytics, and targeted feedback** to iterate rapidly.

## Mobile vs. PC/Console Playtesting

**PC/Console Focus:**
- "Is it fun?" (core loop engagement)
- Can players complete levels? (difficulty)
- Controls intuitive? (input mapping)

**Mobile F2P Focus:**
- **Retention**: Do players return tomorrow? Next week? (D1/D7/D30)
- **Monetization**: Do players understand IAP value? Convert?
- **Session design**: Are sessions 3-5 minutes? (mobile context)
- **Progression**: Do players hit paywall? Feel rewarded?
- **Onboarding**: Do new players understand systems in 60 seconds?

## Key Mobile Metrics

**Retention (Most Critical):**
- **D1** (Day 1): 40%+ (good), 50%+ (great)
- **D7** (Day 7): 20%+ (good), 30%+ (great)
- **D30** (Day 30): 10%+ (good), 15%+ (great)

**Session Metrics:**
- **Session length**: 3-5 minutes (mobile sweet spot)
- **Sessions per day**: 2-4 (healthy engagement)
- **Time to first session end**: <5 minutes (don't trap players)

**Monetization:**
- **Conversion rate**: 2-5% (percent who spend anything)
- **ARPU** (Average Revenue Per User): $0.50-2.00 first month
- **Time to first purchase**: 3-7 days (not Day 1 - trust building)

**Progression:**
- **Collection completion**: 30% of Dynasty 1 by Day 7
- **Paywall hits**: Players shouldn't hit hard paywall before Day 14
- **Energy depletion**: 60% of sessions end with energy = 0 (good monetization pressure)

## SupaSnake Playtest Goals

**Retention Testing:**
- Do Emma players return daily to check breeding results?
- Do Tyler players stay engaged optimizing collections?
- What causes churn? (too slow progression? ran out of goals?)

**Economy Testing:**
- Is DNA income vs. cost balanced? (should unlock Dynasty 2 by Day 14)
- Does energy system feel restrictive or fair?
- Are IAP prices perceived as good value?

**Engagement Testing:**
- Are classic games fun enough to play 3-5 per session?
- Is breeding exciting or tedious? (waiting 24 hours - does it work?)
- Does collection book feel rewarding? (Panini book dopamine hit?)

**Monetization Testing:**
- Do players understand what they're buying? (energy vs. DNA vs. unlocks)
- Does $4.99 "Dynasty Unlock" feel fair?
- When do players first feel "I wish I had more energy"? (monetization moment)

## Playtest Phases

### Phase 1: Friends & Family (5-10 people)

**Goal:** Basic viability - is the game comprehensible?

**Duration:** 3-7 days

**Methods:**
- **TestFlight** (iOS) or **internal testing** (Android)
- **Play alongside them** (watch over shoulder if possible)
- **Short feedback form** (5 questions max)

**Key Questions:**
- Did you understand how to breed snakes?
- Did you come back the next day? Why/why not?
- What was confusing?
- Would you recommend this to a friend? (NPS proxy)

**SupaSnake Focus:**
- Can players complete first breeding cycle?
- Do they understand DNA economy?
- Is onboarding clear? (60-second tutorial effective?)

---

### Phase 2: Closed Beta (30-50 people)

**Goal:** Retention and economy validation

**Duration:** 14-30 days (need D7/D14 data)

**Methods:**
- **TestFlight** (iOS, 100-user limit)
- **Analytics** (Amplitude/Mixpanel integrated)
- **In-app feedback** button
- **Weekly check-ins** (email survey)

**Key Metrics:**
- D1/D7/D14 retention (cohort analysis)
- Average DNA at Day 7 (should be ~300 for Dynasty 2 unlock)
- Session length (target: 3-5 minutes)
- Collection completion (should have 10-15 variants by Day 7)

**SupaSnake Focus:**
- Are players hitting Dynasty 2 unlock around Day 14?
- Do they understand breeding combinations?
- Is energy depletion causing churn or driving engagement?

---

### Phase 3: Soft Launch (1,000+ people)

**Goal:** Monetization validation, scale testing

**Duration:** 30-60 days

**Methods:**
- **Regional App Store launch** (Philippines, Canada - smaller markets)
- **Paid UA** (small budget - $500-1,000 to test ad performance)
- **A/B testing** (different IAP prices, offers)

**Key Metrics:**
- **LTV** (Lifetime Value) - how much each player is worth
- **CPI** (Cost Per Install) - how much UA costs
- **LTV:CPI ratio** (need 3:1+ to be profitable)
- Conversion rate (2-5% target)

**Not Applicable for SupaSnake v0.1:** (skip soft launch until v1.0+)

---

## TestFlight Best Practices

**Setup:**
1. Create **Internal Testing** group (first 25 testers, no review)
2. Create **External Testing** group (up to 10,000, requires Apple review)
3. Write clear **"What to Test"** notes for each build

**Tester Communication:**
```
Build 1.0.5 - October 18, 2025

New in this build:
- Dynasty 2 (Sly) unlockable at 250 DNA
- Energy regens 1 per 5 minutes (was 10 minutes)
- Daily DNA reward added (10 DNA)

What to test:
- Can you unlock Dynasty 2 within 2 weeks of play?
- Does energy regen feel better?
- Does daily reward motivate you to return?

Feedback: Tap "Send Feedback" button in Settings
```

**Crash Reporting:**
- TestFlight provides crash logs automatically
- Check crashes daily, fix critical bugs within 24 hours

---

## Analytics Integration

**Essential Events to Track:**

**Session Events:**
- `app_open` (every launch)
- `session_start`, `session_end` (with duration)

**Progression Events:**
- `classic_game_played` (with score, DNA earned)
- `snake_bred` (with generation, DNA cost)
- `snake_evolved` (with DNA cost)
- `dynasty_unlocked` (which dynasty)
- `variant_collected` (which variant)

**Economy Events:**
- `dna_earned` (source: classic game, daily reward, IAP)
- `dna_spent` (category: breeding, evolution, unlocks)
- `energy_depleted` (ran out of energy)
- `energy_purchased` (IAP)

**Monetization Events:**
- `iap_viewed` (opened shop)
- `iap_initiated` (clicked "buy")
- `iap_completed` (successful purchase)
- `iap_failed` (why: cancelled, payment failed)

**Amplitude/Mixpanel Setup:**
```typescript
// Example event
analytics.track('snake_bred', {
  generation: 2,
  dna_cost: 50,
  dna_balance_after: 25,
  time_since_last_breed: 86400 // seconds
});
```

---

## Feedback Collection Methods

### 1. In-App Feedback Button

**Implementation:**
- "Send Feedback" button in settings
- Opens form: "What can we improve?" (open-ended)
- Auto-includes: user_id, build version, device

**Pros:** Easy, contextual (players give feedback while playing)
**Cons:** Self-selected (only motivated players respond)

---

### 2. Post-Session Survey (Conditional)

**Trigger:** After 5th session, ask one question

**Example:**
```
"What almost made you quit playing?"
- [ ] Too confusing
- [ ] Ran out of things to do
- [ ] Progression too slow
- [ ] Not interested in collecting
```

**Pros:** Targets potential churn
**Cons:** Can be annoying (show sparingly)

---

### 3. Email Check-Ins (Beta Only)

**Day 1:** "Thanks for testing! Did you complete the tutorial?"
**Day 7:** "You've been playing a week - what's your favorite feature?"
**Day 14:** "Would you spend $5 on this game? What would you buy?"

**Pros:** Direct, qualitative feedback
**Cons:** Low response rate (10-20%)

---

### 4. Direct Observation (Friends & Family)

**Method:** Watch over their shoulder (remote: Zoom screen share)

**What to watch:**
- Where do they hesitate? (confusing UI)
- Do they read tutorials? (or skip immediately)
- What do they tap repeatedly? (frustrated / doesn't work as expected)

**Pros:** Richest data (see what they can't articulate)
**Cons:** Not scalable (only works for 5-10 people)

---

## Common Mobile Playtest Findings

**Onboarding Issues:**
- Players skip tutorial text (make it interactive, not text walls)
- First session too long (>10 minutes = players drop off)
- Don't understand core loop (show, don't tell)

**Retention Issues:**
- No reason to return tomorrow (add daily rewards, time-gated content)
- Hit content wall (ran out of things to do by Day 3)
- Lost interest (core loop not compelling)

**Monetization Issues:**
- Don't understand IAP value ("Why would I buy energy?")
- Prices feel unfair (too expensive for perceived value)
- No urgency (never felt "I wish I could do more now")

**SupaSnake Specific:**
- Breeding timer too long (24 hours → players forget to check back)
- DNA costs unclear (don't know how much they need to save)
- Collection book not rewarding (need better visual feedback)

---

## Iteration Cycle

**Week 1:** Launch TestFlight → watch analytics daily
**Week 2:** Identify drop-off points → hypothesis ("energy too restrictive?")
**Week 3:** Ship update (energy 1 per 5min, not 10min) → re-test
**Week 4:** Compare cohorts (did D7 retention improve?)

**Repeat weekly until retention targets hit.**

---

## Red Flags

🚩 **D1 retention <30%** - core loop not engaging, onboarding broken
🚩 **Average session <2 minutes** - not enough content, boring
🚩 **95% of players never open game Day 2** - missing retention hook
🚩 **Zero IAP interest** - no monetization pressure, or prices too high
🚩 **Players complete all content Day 1** - not enough progression depth

---

## Success Criteria

✅ **D1 retention >40%** (players like it enough to return)
✅ **D7 retention >25%** (sustainable engagement)
✅ **Session length 3-5 minutes** (mobile-appropriate)
✅ **2-3 sessions per day** (healthy cadence)
✅ **2-5% conversion** (monetization viable)
✅ **Players complete Dynasty 1 by Day 7** (progression pacing good)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_playtest_analysis.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_retention_testing.md
- **How-To**: @knowledge_base/game_design/how_to/playtest_mobile_f2p_game.md
- **Complete**: @knowledge_base/game_design/reference/batch4_chapters/chapter_28_playtesting_summary.md
