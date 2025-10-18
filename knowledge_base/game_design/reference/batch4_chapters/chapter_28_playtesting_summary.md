# Chapter 28: The Team Gets Valuable Feedback From Playtesting - Summary

**Source:** Jesse Schell, *The Art of Game Design: A Book of Lenses* (3rd Edition, 2020), Chapter 28

**Adaptation Focus:** Mobile F2P playtesting (retention, monetization, balance testing)

---

## Core Concepts

### 1. Why Playtesting is Essential

**Schell's Principle:** You **cannot** design a great game without playtesting. Your assumptions about what's fun, clear, or balanced are often wrong - only real players reveal the truth.

**Key Insights:**

**You Are Not Your Player:**
- You know every system intimately (players don't)
- You've played 1,000+ hours (players play 5 minutes)
- You understand your intentions (players only see what's visible)

**Players Reveal Gaps:**
- What you think is clear → actually confusing
- What you think is balanced → actually broken
- What you think is fun → actually boring

**Mobile F2P Adaptation:**

Traditional playtesting asks: **"Is it fun?"**

Mobile F2P playtesting asks:
- **"Do players return tomorrow?"** (D1 retention)
- **"Do players return next week?"** (D7 retention)
- **"Do players understand what to spend money on?"** (monetization)
- **"Is the economy balanced?"** (DNA income vs. costs)

**SupaSnake Testing Priorities:**
1. **Retention:** Do Emma/Tyler return daily to check breeding results?
2. **Economy:** Is DNA income balanced with costs (Dynasty unlock by Day 14?)
3. **Engagement:** Are classic games fun enough to play 3-5 per session?
4. **Monetization:** Do players understand IAP value (energy packs, dynasty unlocks)?

---

### 2. Types of Playtesting

**Schell's Categories:**

#### A. Internal Playtesting (Team)
**Who:** Development team
**When:** Daily/weekly during development
**Purpose:** Catch obvious bugs, test new features
**Format:** Quick 15-30 minute sessions

**Solo Dev Adaptation:**
- **You play your own game daily** (dogfooding)
- Invite friends/family weekly (fresh eyes)
- Focus on: "Does this make sense to someone who didn't build it?"

**SupaSnake:**
- Solo dev plays daily (test builds, catch crashes)
- 3-5 friends test weekly (validate clarity, fun)

---

#### B. Closed Testing (Select Group)
**Who:** 30-100 trusted testers (NDA, private access)
**When:** Alpha/Beta (mostly feature-complete)
**Purpose:** Validate design, find bugs, test balance
**Format:** 1-4 weeks of play, feedback surveys

**Mobile F2P Adaptation:**
- **TestFlight** (iOS, up to 10,000 external testers)
- **Google Play Internal Testing** (Android)
- Focus on: **Retention metrics** (D1/D7/D30), economy balance, monetization conversion

**SupaSnake:**
- Week 1-2: Friends & family (5-10 people) - basic validation
- Week 3-6: Closed beta (30-50 people) - retention & economy testing
- Track: D1/D7 retention, DNA balance, session length

---

#### C. Open Testing (Public)
**Who:** Thousands of random players
**When:** Late beta, soft launch
**Purpose:** Stress test, gather broad feedback, validate monetization at scale
**Format:** Regional app store launch or open beta

**Mobile F2P Adaptation:**
- **Soft launch** in smaller markets (Philippines, Canada)
- Test user acquisition (UA) cost vs. lifetime value (LTV)
- A/B test monetization (different IAP prices, offers)

**SupaSnake:**
- Not applicable for v0.1 (too early)
- Soft launch for v1.0+ (after core loop proven in closed beta)

---

### 3. What to Test For

**Schell's Testing Dimensions:**

#### A. Fun (Is it enjoyable?)
**Questions:**
- Do players smile/laugh/show excitement?
- Do they want to play again?
- Do they recommend it to friends?

**Mobile F2P Adaptation:**
- **Fun is necessary but not sufficient** (many fun mobile games fail due to poor retention)
- Test: "Would you open this again tomorrow?" (retention predictor)
- Metric: Session length (3-5 min = engaged, <2 min = bored, >10 min = trapped)

**SupaSnake:**
- Observe: Do players smile when rare variant appears? (dopamine hit)
- Ask: "Would you play this during your commute?" (mobile context)
- Track: Average session length (target: 3-5 minutes)

---

#### B. Clarity (Do players understand?)
**Questions:**
- Can players explain how the game works?
- Do they understand goals and mechanics?
- What percentage complete tutorial vs. quit?

**Mobile F2P Adaptation:**
- **Onboarding clarity is critical** (most players quit during tutorial if confused)
- Test: Tutorial completion rate (target: >80%)
- Test: Can player explain DNA vs. Energy after tutorial? (economy understanding)

**SupaSnake:**
- Observe: Do players hesitate before breeding? (unclear UI?)
- Ask: "What is DNA used for?" (economy clarity)
- Track: Tutorial completion funnel (Start → Step 1 → Step 2 → Complete)

---

#### C. Balance (Is difficulty/economy right?)
**Questions:**
- Is the game too easy or too hard?
- Are resources balanced (income vs. costs)?
- Is progression paced correctly?

**Mobile F2P Adaptation:**
- **Economy balance is critical** (too stingy = churn, too generous = no monetization)
- Test: Average DNA at Day 1/7/14 vs. unlock costs (spreadsheet targets)
- Test: Do players hit "paywall" (can't progress without paying)?

**SupaSnake:**
- Track: Average DNA at Day 7 (target: 250 for Dynasty 2 unlock)
- Analyze: Are players completing Dynasty 1 by Day 7? (progression speed)
- Survey: "Does progression feel too slow/too fast/just right?"

---

#### D. Interest Curve (Does engagement sustain?)
**Questions:**
- Do players stay engaged over time?
- When do they quit? (churn points)
- What motivates them to continue?

**Mobile F2P Adaptation:**
- **Retention IS the interest curve** (visualized as D1/D7/D30 retention chart)
- Test: When do most players churn? (Day 1? Day 3? Day 7?)
- Test: What's the last thing they did before churning? (ran out of energy? completed all content?)

**SupaSnake:**
- Cohort analysis: Retention curve over 30 days (where are the drop-offs?)
- Segment: Churned vs. retained players (what did retained players do differently?)
- Hypothesis: "Players who breed in first session have 80% D1 retention vs. 30% for non-breeders"

---

### 4. Playtesting Methods

**Schell's Methods:**

#### A. Direct Observation (Watch Players Play)
**Method:** Sit next to player (or Zoom screen share), watch silently
**Pros:** Richest data (see what they can't articulate)
**Cons:** Not scalable (only works for 5-10 people)

**What to Watch:**
- **Hesitation:** Stare at screen unsure what to do (confusing UI)
- **Repeated taps:** Click same button 3 times (expected something to happen)
- **Facial expressions:** Smile (fun), frown (frustration), blank (bored)
- **Body language:** Lean forward (engaged), lean back (disengaged), check phone (bored)

**Mobile F2P Best Practices:**
- **First 5 testers:** Watch over shoulder or screen share
- **Focus on first session:** Do they understand tutorial? Complete first breed?
- **Don't help unless totally stuck:** Let them struggle (reveals UX problems)

**SupaSnake:**
- Watch 3-5 friends play first session (30 minutes each)
- Note: Where do they get confused? (breeding UI? DNA vs. Energy?)
- Note: When do they smile? (collect rare variant = dopamine hit working)

**Example Notes:**
```
Player A (Emma type):
- Skipped tutorial text (just tapped Next repeatedly)
- Confused by DNA counter (tried to tap it, expected menu)
- First breed at 8 minutes (seemed excited by egg animation)
- Returned next day to collect (retention hook working!)
```

---

#### B. Metrics / Analytics (Data-Driven Testing)
**Method:** Track player behavior automatically (Amplitude, Mixpanel)
**Pros:** Scalable (track 1,000+ players), objective, always-on
**Cons:** Doesn't capture "why" (need qualitative feedback too)

**What to Track:**
- **Retention:** D1/D7/D30 (percentage who return)
- **Funnels:** Tutorial start → complete (where do players drop off?)
- **Session data:** Length, frequency, time of day
- **Economy:** Average DNA at Day 1/7/14, income vs. spend
- **Monetization:** IAP views → clicks → purchases (conversion funnel)

**Mobile F2P Best Practices:**
- **Integrate analytics Day 1** (Amplitude/Mixpanel, not Google Analytics)
- **Track every meaningful event** (app open, snake bred, DNA earned/spent)
- **Cohort analysis:** Compare Week 1 vs. Week 2 players (did changes improve retention?)

**SupaSnake Events:**
```typescript
// Session
track('app_open');
track('session_end', { duration_seconds });

// Progression
track('snake_bred', { generation, dna_cost });
track('dynasty_unlocked', { dynasty_id });

// Economy
track('dna_earned', { source, amount });
track('dna_spent', { category, amount });

// Monetization
track('iap_purchase_complete', { product_id, price });
```

---

#### C. Surveys / Interviews (Ask Players)
**Method:** Post-session questionnaire or 1-on-1 interview
**Pros:** Captures opinions, motivations, suggestions
**Cons:** What players say ≠ what they do (self-reporting bias)

**What to Ask:**

**Good Questions:**
- "What almost made you quit?" (reveals friction)
- "What would you change?" (design blind spots)
- "Would you recommend this to a friend?" (NPS - Net Promoter Score)

**Bad Questions:**
- "Did you have fun?" (too vague, players lie to be nice)
- "What do you like?" (biased toward positivity)

**Mobile F2P Best Practices:**
- **Keep surveys short** (5 questions max, mobile attention spans)
- **Ask specific questions** ("Was tutorial too long?" not "How was tutorial?")
- **Weight data over opinions** (if 80% say "tutorial is fine" but 50% quit during it, trust data)

**SupaSnake Survey:**
```
Post-Session Survey (after 1 hour of play):

1. Did you understand how to breed snakes?
   [ ] Yes, totally clear
   [ ] Mostly, but [_____] was confusing
   [ ] No, I'm lost

2. Would you open this game tomorrow?
   [ ] Yes, definitely
   [ ] Maybe
   [ ] No

3. If this cost $4.99, would you buy it?
   [ ] Yes
   [ ] No

4. What almost made you quit? (open-ended)

5. Email (optional, for follow-up):
```

---

#### D. Think-Aloud Protocol
**Method:** Ask player to narrate thoughts while playing ("I'm clicking this because...")
**Pros:** Reveals thought process, uncovers assumptions
**Cons:** Unnatural (talking changes behavior), exhausting for player

**When to Use:**
- Early prototypes (validate clarity)
- Usability testing (UI flow optimization)

**Mobile F2P Adaptation:**
- Use sparingly (interrupts natural play)
- Better: **Retrospective interview** (play session, then ask "What were you thinking at 3:42 when you tapped that?")

**SupaSnake:**
- First 3-5 testers: Think-aloud during tutorial (validate onboarding)
- Later testers: Silent observation + retrospective questions

---

### 5. Who to Test With

**Schell's Tester Categories:**

#### A. Yourself (Developer)
**When:** Daily (during development)
**Purpose:** Catch obvious bugs, test new features
**Limitation:** You're too familiar (can't see with fresh eyes)

**Solo Dev:**
- Play your own game every build (dogfooding)
- Track your own metrics (if you get bored, players will too)
- **Warning:** You'll miss UX issues (you know how it's supposed to work)

---

#### B. Team Members
**When:** Weekly (internal playtests)
**Purpose:** Validate new features before external testing
**Limitation:** Still too close to the project

**Solo Dev:**
- Skip (no team) or invite developer friends
- Useful for technical feedback ("This UI is laggy on iPhone 8")

---

#### C. Friends & Family
**When:** Early prototypes, before closed beta
**Purpose:** First "outsider" validation (do normal humans understand this?)
**Limitation:** May be too nice (won't brutally criticize)

**Best Practices:**
- Choose **honest** friends (not yes-men)
- Ask for **brutal honesty** ("I need you to tell me what sucks")
- Mix demographics (casual gamers, non-gamers, hardcore gamers)

**SupaSnake:**
- 5-10 friends/family in Week 1-2
- Mix: Emma types (casual mobile players) + Tyler types (optimizers)
- Observe first session (watch them play)

---

#### D. Target Audience (Strangers)
**When:** Closed beta, soft launch
**Purpose:** Real validation (these are actual potential customers)
**Limitation:** Harder to recruit, may ghost (stop testing)

**How to Recruit:**
- Reddit (r/AndroidGaming, r/iOSGaming)
- Discord (mobile gaming communities)
- Twitter/X (indie game communities)
- Paid testers (UserTesting.com, PlaytestCloud)

**SupaSnake:**
- 30-50 strangers in Week 3-6 (closed beta)
- Target: Mobile gamers who play collectors (Pokémon GO, Marvel Snap)
- Incentive: Early access, thank you in credits, $10 coffee card

---

#### E. Non-Gamers (Outsiders)
**When:** Testing accessibility, casual appeal
**Purpose:** Would your mom understand this?
**Limitation:** May not be target audience (but reveals clarity issues)

**SupaSnake:**
- Test with 1-2 non-gamers (Emma persona edge case)
- If even they understand breeding, it's clear enough

---

### 6. When to Test

**Schell's Testing Cadence:**

#### A. Continuous (Every Build)
**Frequency:** Daily/weekly (during development)
**Method:** Internal team playtests
**Focus:** Catch regressions, validate new features

**Solo Dev:**
- Test every major change yourself (before pushing)
- Weekly friends & family tests (if available)

---

#### B. Milestones (Major Builds)
**Frequency:** Every 2-4 weeks (sprint end)
**Method:** Closed beta testers
**Focus:** Validate feature completeness, gather feedback

**SupaSnake:**
- Week 2, 4, 6: Ship TestFlight builds to beta testers
- Each build: "What to Test" notes, feedback survey

---

#### C. Pre-Launch (Final Validation)
**Frequency:** 2-4 weeks before release
**Method:** Larger beta (100-1,000 testers)
**Focus:** Polish, stress test, final balance tweaks

**SupaSnake:**
- Week 7-8: Polish sprint based on beta feedback
- Larger TestFlight group (50-100 testers)
- Validate launch readiness checklist

---

### 7. Analyzing Playtest Data

**Schell's Analysis Framework:**

#### A. Quantitative Analysis (Numbers)
**Data Sources:**
- Retention cohorts (D1/D7/D30)
- Funnels (Tutorial start → complete)
- Averages (session length, DNA at Day 7)

**Method:**
1. **Compare to targets** (D1: 45% vs. target 40% = good)
2. **Identify outliers** (Why did 5% play 50 sessions in Week 1?)
3. **Segment users** (Emma types vs. Tyler types - different behavior?)
4. **Cohort comparison** (Did Week 2 changes improve Week 1 metrics?)

**SupaSnake Example:**
```
Week 1 Cohort (10 players, no daily rewards):
D1: 60%  D7: 30%  Avg DNA Day 7: 190

Week 2 Cohort (15 players, daily +10 DNA reward added):
D1: 67%  D7: 44%  Avg DNA Day 7: 280

Insight: Daily rewards improved D7 retention by +14 points (30%→44%)
```

---

#### B. Qualitative Analysis (Feedback)
**Data Sources:**
- Survey responses (open-ended questions)
- In-app feedback submissions
- Email replies
- Observation notes

**Method: Thematic Coding**
1. **Read all feedback** (every submission)
2. **Identify themes** (common complaints/praises)
3. **Count mentions** (how many people said X?)
4. **Prioritize** (high-frequency issues = top priority)

**SupaSnake Example:**
```
Beta Feedback (30 submissions):
- "Tutorial too long" (12 mentions, 40%) ← Top issue
- "Ran out of energy too fast" (9 mentions, 30%)
- "Love the collecting!" (8 mentions, 27%)
- "Breeding timer too long" (6 mentions, 20%)
- "Need more content" (3 mentions, 10%)

Action: Fix tutorial first (highest frequency), then energy balance
```

---

#### C. Behavioral Analysis (Observation)
**Data Sources:**
- Screen recordings (if allowed)
- Live observation notes
- Session replays (tools like FullStory)

**What to Look For:**
- **Confusion points:** Where do players hesitate?
- **Drop-off points:** Where do players quit?
- **Aha moments:** When do players "get it"? (smile, lean forward)

**SupaSnake Example:**
```
Observed: 8/10 players tapped DNA counter expecting menu (it's just a label)

Hypothesis: Players expect DNA counter to be interactive

Action: Add "Info" button next to DNA counter explaining what it's for
```

---

### 8. Common Playtesting Pitfalls

**Schell's Warnings:**

#### Pitfall 1: Testing Too Late
**Mistake:** Wait until game is "done" to test
**Result:** Major problems found, too expensive to fix

**Solution:** Test early (even ugly prototypes)
- Week 1: Core loop prototype (just Snake + DNA rewards)
- Week 3: Basic breeding (test mechanic before polish)
- Week 6: Full beta (validate complete experience)

---

#### Pitfall 2: Ignoring Negative Feedback
**Mistake:** "They just don't get it" (dismissing criticism)
**Result:** Ship game with obvious flaws, poor reviews

**Solution:** **If 3+ people say same thing, it's real**
- 1 person says tutorial is confusing = maybe outlier
- 5 people say tutorial is confusing = it's confusing

---

#### Pitfall 3: Listening to Wrong Feedback
**Mistake:** Implement every suggestion (lose vision)
**Result:** Frankenstein game designed by committee

**Solution: Weight Feedback**
- **Frequency:** 1 person or 20 people?
- **Persona fit:** Is this Emma feedback or Tyler feedback? (build for Emma first)
- **Data validation:** Do metrics support this? (5 people say "add PvP" but retention is already good)

**SupaSnake Example:**
```
Tyler tester: "Add leaderboards for high scores!"
Data: D1 retention 74%, D7 retention 44% (above target)
Decision: Backlog (nice-to-have, not critical for retention)

Emma tester: "Breeding timer too long, I forgot to check back"
Data: 40% of players who breed don't return Day 2 to collect
Decision: High priority (reduce timer from 24h → 12h)
```

---

#### Pitfall 4: Testing with Wrong People
**Mistake:** Test casual mobile game with hardcore PC gamers
**Result:** "This is too simple, add 20 more systems!" (wrong audience)

**Solution: Test with Target Audience**
- SupaSnake = casual mobile collectors (Emma) + progression optimizers (Tyler)
- Not: Hardcore PC gamers, non-mobile players, people who hate collecting

**Recruitment Screen:**
- "Do you play mobile games daily?" (Yes = good tester)
- "Do you like Pokémon or collecting games?" (Yes = Emma/Tyler match)

---

#### Pitfall 5: Changing Too Much at Once
**Mistake:** Ship update with 10 changes (new tutorial + energy system + economy rebalance)
**Result:** Retention improves, but don't know which change worked

**Solution: A/B Testing or Sequential Cohorts**
- Week 1: Test baseline (D1: 60%)
- Week 2: Change only tutorial (D1: 67%) → Tutorial helped (+7 points)
- Week 3: Add daily rewards (D1: 74%) → Rewards helped (+7 more)

**SupaSnake Best Practice:**
- Change one major thing per week
- Compare cohorts to isolate effect

---

#### Pitfall 6: Not Enough Testers
**Mistake:** Test with 3 friends, assume it's validated
**Result:** 3 people loved it, 97% of real players quit Day 1

**Solution: Minimum Sample Sizes**
- Friends & family: 10+ (basic validation)
- Closed beta: 30-50 (retention trends visible)
- Soft launch: 1,000+ (statistically significant)

---

### 9. Iteration Based on Playtesting

**Schell's Iteration Loop:**

```
1. Build → 2. Test → 3. Analyze → 4. Iterate → (Repeat)
```

**Mobile F2P Iteration Cycle:**

**Week 1: Build & Ship**
- Implement feature (e.g., daily DNA reward)
- Ship to TestFlight

**Week 2: Test & Gather Data**
- Testers play for 7 days
- Analytics track retention, economy

**Week 3: Analyze**
- Pull cohort data (D1/D7 retention)
- Read feedback (survey responses)
- Identify top issues (tutorial, energy, balance)

**Week 4: Iterate**
- Fix top issue (shorten tutorial from 3min → 60sec)
- Ship new build
- Repeat cycle

**SupaSnake Timeline:**
```
Week 1-2: Friends & Family (validate basics)
Week 3-4: Closed Beta Wave 1 (test retention)
Week 5-6: Closed Beta Wave 2 (test monetization)
Week 7-8: Polish Sprint (fix top issues)
Week 9: Launch v0.1
```

---

## Mobile F2P Specific Testing

### Retention Testing

**Goal:** Validate players return daily/weekly

**Metrics:**
- **D1 (Day 1):** 40%+ (do they come back tomorrow?)
- **D7 (Day 7):** 25%+ (do they build a habit?)
- **D30 (Day 30):** 12%+ (do they stick long-term?)

**Methods:**
- Amplitude cohort analysis (automatic retention tracking)
- Compare cohorts (did changes improve retention?)
- Identify churn points (when do most players quit?)

**SupaSnake Retention Drivers to Test:**
- Breeding timer (does 12h vs. 24h affect D1 retention?)
- Daily DNA reward (does +10/day increase D7 retention?)
- Collection progress (does visible goal improve retention?)

**Hypothesis Testing:**
```
Hypothesis: "Reducing breeding time from 24h → 12h will increase D1 retention from 60% → 70%"

Test:
- Week 1 Cohort: 24h timer → D1: 60%
- Week 2 Cohort: 12h timer → D1: 74%
- Result: +14 points (hypothesis validated!)
```

---

### Monetization Testing

**Goal:** Validate players understand IAP value and convert

**Metrics:**
- **Conversion rate:** 2-5% (percentage who spend anything)
- **ARPU:** $0.50-2.00 first month (average revenue per user)
- **Time to first purchase:** 3-7 days (not Day 1 - trust building)

**Methods:**
- Funnel analysis (shop viewed → IAP clicked → purchase completed)
- Survey: "Would you spend $5 on this? What would you buy?"
- A/B test prices ($0.99 vs. $0.49 energy pack)

**SupaSnake IAP Tests:**

**Test 1: Price Sensitivity**
```
Week 5: Energy Pack $0.99 → 3% conversion
Week 6: Energy Pack $0.49 → 5% conversion (+67% revenue despite lower price)
Decision: Use $0.49 (higher volume)
```

**Test 2: Value Perception**
```
Survey: "Why didn't you buy energy pack?"
- 60%: "Too expensive for what you get"
- 30%: "Don't need it yet"
- 10%: "Don't spend on mobile games"

Action: Add tooltip showing value: "50 energy = 5 games = ~30 DNA earned"
```

---

### Economy Testing

**Goal:** Validate DNA income vs. costs balanced (progression feels fair)

**Metrics:**
- Average DNA at Day 1/7/14/30
- % of players who unlock Dynasty 2 by Day 14
- % of players who hit "paywall" (can't progress without paying)

**Methods:**
- Spreadsheet targets vs. actual averages (from analytics)
- Funnel: DNA earned → DNA spent → progression milestones
- Feedback: "Does progression feel too slow/too fast/just right?"

**SupaSnake Economy Test:**
```
Target: Players should have 250 DNA by Day 7 (unlock Dynasty 2 by Day 14)

Week 1 Data:
- Average DNA Day 7: 190 (60 short of target)
- Only 30% unlock Dynasty 2 by Day 14

Hypothesis: "Adding daily +10 DNA reward will fix deficit"

Week 2 Data (after daily reward):
- Average DNA Day 7: 280 (30 over target) ✅
- 75% unlock Dynasty 2 by Day 14 ✅

Result: Economy balanced, progression feels fair
```

---

## Lenses from Chapter 28

### Lens #89: The Lens of Playtesting

**Use this lens to improve your playtesting process.**

**Questions to Ask:**

**Who should test?**
- **Target audience:** Emma (casual collectors), Tyler (optimizers)
- **Mix:** Friends (honest feedback) + strangers (real players)
- **Diversity:** Different skill levels, demographics

**What should I test?**
- **Fun:** Do players smile? Want to play again?
- **Clarity:** Do they understand systems? (Tutorial completion rate)
- **Balance:** Is economy fair? (DNA income vs. costs)
- **Retention:** Do they return tomorrow? (D1 metric)

**When should I test?**
- **Early:** Ugly prototype (validate core loop)
- **Often:** Weekly builds (continuous feedback)
- **Pre-launch:** Final validation (polish)

**How should I test?**
- **Observation:** Watch first 5 testers play (rich qualitative data)
- **Analytics:** Track all testers (quantitative data)
- **Surveys:** Ask specific questions (motivation, friction points)

**What should I do with feedback?**
- **Thematic coding:** Identify patterns (what 5+ people say)
- **Prioritize:** High-frequency issues first
- **Validate with data:** Does feedback match metrics?
- **Iterate:** Fix, ship, re-test (weekly cycle)

**SupaSnake Application:**
- Test with 5 Emmas, 5 Tylers (30 min observation each)
- Track D1/D7 retention from Day 1 (Amplitude)
- Survey after 7 days: "What almost made you quit?"
- Iterate weekly: Fix top issue, compare cohorts

---

## Key Takeaways for SupaSnake

**1. Test Early and Often:**
- Week 1: Friends & family (5-10 people) - validate basics
- Week 3-6: Closed beta (30-50 people) - validate retention
- Week 7-8: Polish sprint - fix top issues

**2. Mobile F2P Testing is Different:**
- Not just "Is it fun?" but "Do they return tomorrow?"
- Retention metrics (D1/D7/D30) are #1 priority
- Monetization testing (conversion, ARPU, IAP value)

**3. Use Multiple Methods:**
- **Observation:** Watch 5 testers play first session (qualitative)
- **Analytics:** Track all testers (Amplitude - quantitative)
- **Surveys:** Ask specific questions (motivation, friction)

**4. Analyze and Iterate:**
- **Weekly cycle:** Ship build → test 7 days → analyze data → iterate
- **Cohort comparison:** Week 1 vs. Week 2 (did changes help?)
- **Prioritize:** Fix high-frequency issues first

**5. Test with Right People:**
- Target audience: Casual mobile players (Emma), optimizers (Tyler)
- Not: Hardcore PC gamers, people who hate mobile games

**6. Data Over Opinions:**
- If retention is low, feedback "it's fun" doesn't matter
- Weight feedback: 5+ people saying same thing = real issue
- Validate with metrics: Does feedback match data?

**7. Iterate Fast:**
- Change one major thing per week (isolate effect)
- A/B test when possible (compare versions)
- Ship weekly (rapid iteration beats perfection)

---

## SupaSnake Playtesting Checklist

**Week 1-2: Friends & Family**
- [ ] Recruit 5-10 friends (mix of Emma/Tyler types)
- [ ] Observe 3-5 first sessions (over shoulder or Zoom)
- [ ] Track: Tutorial completion, first breed, session length
- [ ] Gather feedback: In-app form + email survey
- [ ] Identify top 3 issues (confusing tutorial, energy, etc.)

**Week 3-4: Closed Beta Wave 1**
- [ ] Recruit 30 testers (Reddit, Discord, Twitter)
- [ ] TestFlight setup with "What to Test" notes
- [ ] Track: D1/D7 retention, DNA balance, session metrics
- [ ] Weekly survey: "How many days did you play?"
- [ ] Analyze: Cohort retention, economy spreadsheet vs. actuals

**Week 5-6: Closed Beta Wave 2**
- [ ] Add 20 more testers (50 total)
- [ ] Enable IAPs (sandbox testing)
- [ ] Track: Monetization funnel (shop → buy → complete)
- [ ] Test: A/B pricing ($0.99 vs. $0.49)
- [ ] Survey: "Would you spend $5? What would you buy?"

**Week 7-8: Polish Sprint**
- [ ] Prioritize issues (impact vs. effort matrix)
- [ ] Fix top 5 issues from beta feedback
- [ ] Ship daily builds (if possible)
- [ ] Validate: Retention targets met (D1 >45%, D7 >25%)
- [ ] Launch readiness checklist (retention, economy, technical)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_mobile_playtesting.md (300 words)
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_playtest_analysis.md (250 words)
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_retention_testing.md (280 words)
- **How-To**: @knowledge_base/game_design/how_to/playtest_mobile_f2p_game.md (1,200 words step-by-step)
- **Book**: Jesse Schell, *The Art of Game Design* (3rd ed.), Chapter 28 (full text)
