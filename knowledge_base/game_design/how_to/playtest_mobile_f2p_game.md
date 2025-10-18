# How to Playtest a Mobile F2P Game

**Goal:** Test retention, monetization, and balance for SupaSnake using TestFlight, analytics, and targeted feedback to iterate toward launch readiness.

**Timeline:** 4-8 weeks (Friends & Family → Closed Beta → iteration)

**Prerequisites:**
- Working prototype (core loop playable)
- TestFlight setup (iOS developer account)
- Analytics integrated (Amplitude/Mixpanel)

---

## Why Mobile F2P Playtesting is Different

**PC/Console Testing:**
- Focus: "Is it fun?"
- Duration: 1-2 hour sessions
- Metric: Completion rate, fun score

**Mobile F2P Testing:**
- Focus: "Do players return daily?"
- Duration: 3-5 minute sessions, multiple days
- Metrics: D1/D7/D30 retention, conversion, ARPU

**Key Difference:** You're testing **habit formation** and **monetization psychology**, not just fun.

---

## Phase 1: Friends & Family (Week 1-2)

**Goal:** Validate basic viability - can humans understand this game?

**Testers:** 5-10 people you know personally

**Duration:** 7 days minimum (need D1/D7 data)

---

### Step 1: Recruit Testers

**Who to Recruit:**
- **Emma types**: Casual mobile gamers (Candy Crush, mobile puzzles)
- **Tyler types**: Gamers who optimize (play gachas, idle games)
- **Non-gamers**: Your mom, partner (brutal honesty about confusion)

**How to Recruit:**
```
"Hey! I'm making a mobile game and need honest feedback.
Takes 5-10 minutes to try, then I'd love to hear what you think.
Can I add you to TestFlight?"
```

**Incentive:** Promise early access, thank you in credits, or $10 coffee gift card

---

### Step 2: Set Up TestFlight

**iOS Setup:**

1. **Add Internal Testers** (first 25, no Apple review):
   - App Store Connect → TestFlight → Internal Testing
   - Add tester emails
   - Upload build (Xcode → Archive → Distribute)

2. **Create External Group** (if >25 testers):
   - TestFlight → External Testing → Create Group
   - Submit for App Review (24-48 hours, only once)

3. **Write "What to Test" Notes:**
   ```
   Build 1.0.1 - October 18, 2025

   First playable build! 🐍

   Features:
   - Classic Snake gameplay
   - Dynasty 1 (Clever) with 9 starter variants
   - Breeding system (Gen 1 → Gen 2)
   - Collection book

   What to test:
   - Can you complete the tutorial?
   - Can you breed your first Gen 2 snake?
   - Does the collection book make sense?

   Known issues:
   - No sound yet
   - Dynasty 2/3 not implemented

   Feedback: Tap "Send Feedback" button in Settings, or email me!
   ```

4. **Send Invites:**
   - Testers get email with TestFlight link
   - They install TestFlight app → install your game

**Android (Google Play Internal Testing):**
- Similar process via Google Play Console
- Create closed testing track
- Add tester emails

---

### Step 3: Integrate Analytics

**Install Amplitude or Mixpanel:**

```typescript
// Example: Amplitude setup (React Native)
import amplitude from '@amplitude/analytics-react-native';

// Initialize
amplitude.init('YOUR_API_KEY');

// Track events
amplitude.track('app_open');
amplitude.track('tutorial_complete');
amplitude.track('snake_bred', {
  generation: 2,
  dna_cost: 50,
  dna_balance_after: 25
});
```

**Essential Events to Track:**

**Session Events:**
```typescript
track('app_open');
track('session_start', { session_id });
track('session_end', { duration_seconds });
```

**Tutorial Events:**
```typescript
track('tutorial_start');
track('tutorial_step_complete', { step: 1 });
track('tutorial_complete', { duration_seconds });
track('tutorial_skipped');
```

**Gameplay Events:**
```typescript
track('classic_game_start');
track('classic_game_end', {
  score,
  dna_earned,
  energy_remaining
});
```

**Progression Events:**
```typescript
track('snake_bred', { generation, dna_cost });
track('snake_evolved', { from_tier, to_tier });
track('dynasty_unlocked', { dynasty_id });
track('variant_collected', { variant_id, rarity });
```

**Economy Events:**
```typescript
track('dna_earned', { source: 'classic_game', amount });
track('dna_spent', { category: 'breeding', amount });
track('energy_depleted'); // ran out
```

**Monetization Events:**
```typescript
track('shop_opened');
track('iap_viewed', { product_id });
track('iap_purchase_start', { product_id, price });
track('iap_purchase_complete', { product_id, price });
track('iap_purchase_failed', { reason });
```

**Set User Properties:**
```typescript
identify({
  user_id,
  install_date,
  persona_type: 'emma' // or 'tyler', based on behavior
});
```

---

### Step 4: Direct Observation (First 3 Testers)

**Goal:** Watch them play (over shoulder or Zoom screen share)

**Method:**

1. **Schedule 30-minute session:**
   - "Can I watch you try the game? I won't help unless you're totally stuck."

2. **Give them device/share screen:**
   - Don't say anything - just watch

3. **Note everything:**
   - Where do they hesitate? (confusing)
   - What do they tap repeatedly? (expected something to happen)
   - Do they read tutorials or skip? (text walls don't work)
   - When do they smile/frown? (fun/frustration moments)

4. **Ask questions after:**
   - "What was confusing?"
   - "Would you open this again tomorrow? Why/why not?"
   - "What would you spend $5 on in this game?"

**Example Notes:**
```
Player A (Emma type):
- Skipped tutorial text (just tapped "Next" repeatedly)
- Confused by DNA vs. Energy (tried to spend energy on breeding)
- First breeding at 8 minutes (seemed excited)
- Said: "I like collecting, but I don't get why I need DNA"
- Would return: "Maybe, if breeding doesn't take too long"

Insight: Need better DNA/Energy differentiation (icons? colors?)
Insight: Tutorial too text-heavy - make it interactive
```

---

### Step 5: Async Feedback Collection

**In-App Feedback Button:**

```typescript
// Simple feedback form
<Button onPress={openFeedbackForm}>
  Send Feedback
</Button>

function openFeedbackForm() {
  // Open modal with:
  // - "What can we improve?" (text input)
  // - Auto-includes: user_id, build_version, device_info
  // - Sends to Typeform/Google Forms/Email
}
```

**Post-Tutorial Survey (One Question):**

After tutorial completes:
```
"Did the tutorial make sense?"
[ ] Yes, I get it
[ ] Mostly, but [_____] was confusing
[ ] No, I'm lost
```

**Day 1 Email:**
```
Subject: Thanks for trying SupaSnake! 🐍

Hey [Name],

Thanks for testing SupaSnake yesterday!

Quick question: Did you come back to the game today?
[ ] Yes → What brought you back?
[ ] No → What would make you want to return?

Reply to this email or hit the Feedback button in-game.

- Josef
```

---

### Step 6: Analyze Week 1 Data

**Monday (Day 8):**

**Check Retention (Amplitude Dashboard):**
```
Cohort: Friends & Family (10 players, Oct 10-16)

Day 0: 10 players (100%)
Day 1:  6 players (60%) ← D1 retention
Day 7:  3 players (30%) ← D7 retention
```

**Target:** D1 >40%, D7 >20%

**If Below Target:**
- Read crash reports (did they crash during tutorial?)
- Check funnel: Tutorial start → complete (did they finish?)
- Review feedback: Common complaints?

**Check Funnels:**
```
Tutorial Funnel:
- Start: 10 players
- Complete: 8 players (80%) ← 20% dropped during tutorial!
- First breed: 6 players (60% of completers)
- Second session: 6 players (100% who bred came back!)
```

**Insight:** Breeding strongly correlates with retention (6/6 who bred returned, 0/2 who didn't breed returned)

**Check Economy:**
```
Average DNA by Day:
- Day 1: 65 DNA (target: 50-75) ✅
- Day 3: 140 DNA (target: 150) ⚠️ Slightly low
- Day 7: 200 DNA (target: 250 for Dynasty 2) ❌ Too low
```

**Insight:** Players won't unlock Dynasty 2 until Day 10-12 (too slow? test in Phase 2)

**Read Feedback:**
```
5 feedback submissions:
- "Tutorial too long" (2 mentions)
- "Ran out of energy too fast" (2 mentions)
- "Love the collecting!" (1 mention)
```

**Themes:** Tutorial and energy system need work

---

### Step 7: Iterate (Week 2)

**Based on Week 1 Data:**

**Problem 1:** 20% drop during tutorial
**Fix:** Shorten tutorial from 3 minutes → 60 seconds, make interactive

**Problem 2:** Players at Day 7 have 200 DNA, need 250 for Dynasty 2
**Fix:** Add daily DNA reward (+10/day = +70 over 7 days)

**Problem 3:** Energy frustration
**Fix:** Show timer ("Next energy in 4:32"), increase regen rate test

**Ship Build 1.0.2:**
```
Build 1.0.2 - October 25, 2025

Changes:
✅ Tutorial shortened to <60 seconds
✅ Daily DNA reward added (+10 DNA per day)
✅ Energy timer now visible
✅ Energy regen increased: 1 per 5 min (was 10 min)

What to test:
- Is tutorial better?
- Does daily reward motivate you to log in?
- Does energy feel less restrictive?
```

**Invite 5 New Testers:**
- Compare Week 1 cohort vs. Week 2 cohort (did changes help?)

---

## Phase 2: Closed Beta (Week 3-6)

**Goal:** Validate retention and monetization at small scale

**Testers:** 30-50 people (TestFlight limit: 100 external)

**Duration:** 14-30 days (need D7/D14/D30 data)

---

### Step 1: Recruit Beta Testers

**Where to Find Testers:**

1. **Friends of friends:**
   - Ask current testers: "Know anyone who plays mobile games?"

2. **Reddit:**
   - r/AndroidGaming, r/iOSGaming (be respectful, offer value)
   - Post: "Looking for beta testers for Snake + Pokémon breeding game"

3. **Discord communities:**
   - Mobile gaming servers
   - Indie game dev servers (offer to test theirs too)

4. **Twitter/X:**
   - Tweet: "Looking for 30 testers for SupaSnake (mobile Snake + collecting). DM for TestFlight link!"

**Screening (Optional):**
- Ask: "Do you play mobile games daily?" (want engaged players)
- Ask: "Emma or Tyler?" (show personas, see which they identify with)

---

### Step 2: Onboarding Message

**TestFlight Welcome Message:**
```
Welcome to SupaSnake Beta! 🐍

You're testing an early version of a game that combines:
- Classic Snake gameplay
- Pokémon-style breeding
- Panini sticker book collecting

Your mission:
✅ Play for at least 7 days (we're testing retention!)
✅ Try breeding snakes (tap Breeding Lab)
✅ Explore the Collection Book
✅ Give honest feedback (brutal honesty = most helpful)

What works:
- Dynasty 1 (Clever) with 27 variants
- Classic Snake mode
- Breeding (Gen 1 → Gen 2 → Gen 3)
- Energy system

What's coming:
- Dynasty 2 & 3 (locked for now)
- Sound/music
- More polish

Feedback:
- In-app: Tap Settings → Send Feedback
- Email: josef@supasnake.com
- Discord: [invite link]

Thank you for helping make this game great!
```

---

### Step 3: Daily Monitoring (First Week)

**Check Daily:**

1. **Crash Reports** (TestFlight → Crashes):
   - Fix critical crashes within 24 hours

2. **Retention Dashboard** (Amplitude):
   - D1 retention trending up or down?
   - Identify churn spikes (what happened that day?)

3. **Feedback Submissions**:
   - Read all feedback daily
   - Reply to testers (builds trust, encourages more feedback)

**Example Response:**
```
Thanks for the feedback on energy! We're testing different regen rates.
Current: 1 per 5 min (12/hour). Does that feel better than before?

Also testing a daily free energy refill - would that help?
```

---

### Step 4: Weekly Check-Ins

**Every Monday:**

**Send Email Survey:**
```
Subject: Week [X] Beta Check-In

Hey beta testers!

Quick 2-minute survey:

1. How many days this week did you play?
   [ ] 0-1  [ ] 2-3  [ ] 4-5  [ ] 6-7

2. What's your main goal right now?
   [ ] Complete Dynasty 1
   [ ] Unlock Dynasty 2
   [ ] Breed rare variants
   [ ] Just playing for fun

3. If SupaSnake cost $4.99 upfront, would you buy it?
   [ ] Yes, definitely
   [ ] Maybe
   [ ] No

4. What almost made you quit? (open-ended)

Thanks! Next build ships Friday with your feedback.
```

**Response Rate:** Expect 20-30% (10-15 responses from 50 testers)

---

### Step 5: Cohort Analysis (Week 4)

**Pull Retention Data:**

```
Cohort A (Week 1, Tutorial v1): 10 players
D1: 60%  D7: 30%  D14: 20%

Cohort B (Week 2, Tutorial v2): 15 players
D1: 67%  D7: 33%  D14: 27%

Cohort C (Week 3, Daily Rewards added): 25 players
D1: 72%  D7: 44%  D14: 36%
```

**Insight:** Daily rewards significantly improved D7 (33%→44%) and D14 (27%→36%)

**Decision:** Keep daily rewards, make them more prominent (notification)

---

### Step 6: Economy Analysis

**Average DNA by Milestone:**

```
| Day | Target DNA | Cohort A (no daily) | Cohort C (with daily) |
|-----|------------|---------------------|-----------------------|
| 1   | 50-75      | 62 ✅               | 68 ✅                 |
| 3   | 150        | 135 ⚠️              | 165 ✅                |
| 7   | 250        | 190 ❌              | 280 ✅                |
| 14  | 400        | 310 ⚠️              | 520 ✅                |
```

**Insight:** Daily rewards fixed DNA deficit at Day 7 (280 vs. target 250)

**New Problem:** Day 14 surplus too high (520 vs. 400 target)
**Hypothesis:** Players unlocking Dynasty 2 too early (Day 10 vs. target Day 14)
**Action:** Increase Dynasty 2 cost from 250→300 DNA (test in Week 5)

---

### Step 7: Monetization Testing (Week 5-6)

**Enable IAPs in TestFlight:**

1. **Set Up In-App Purchases** (App Store Connect):
   - Energy Pack Small: $0.99 → 50 energy
   - Energy Pack Large: $2.99 → 200 energy
   - Dynasty 2 Unlock: $4.99 → instant unlock (skip DNA cost)
   - DNA Booster: $1.99 → 100 DNA

2. **Sandbox Testing:**
   - Create test Apple IDs (no real charges)
   - Give test credentials to 5-10 testers

**Track Monetization Funnel:**

```
100 players hit energy depletion:
→ 35 opened shop (35% viewed)
→ 8 clicked "Buy" on $0.99 pack (23% of viewers)
→ 3 completed purchase (37% conversion, 3% total)
```

**Insights:**
- Good: 35% opening shop (monetization pressure working)
- Okay: 23% clicking buy (some interest)
- Low: 37% completing purchase (friction? price too high?)

**Test Different Prices:**
- Week 5: $0.99 pack → 3% conversion
- Week 6: $0.49 pack (A/B test) → 5% conversion (+67%!)

**Qualitative Feedback:**
- "I'd buy energy, but $0.99 for 5 games feels expensive"
- "I like that I can play F2P, don't feel forced to pay"
- "Would pay $5 to unlock all dynasties at once"

**Decision:**
- Lower energy pack to $0.49 (higher volume)
- Add "Dynasty Bundle" $9.99 (unlock all 3)

---

### Step 8: Retention Feature Testing

**Hypothesis:** Push notifications increase D1 retention

**Week 6 Test:**
- Enable push permission request (after first session)
- Send notification when breeding completes: "Your snake is ready! 🐍"
- Send daily reminder (9 AM): "Claim your daily DNA!"

**Results:**
```
Cohort D (no push): D1 60%
Cohort E (with push): D1 74% (+14 percentage points!)
```

**Insight:** Push notifications massively improve D1 retention

**Next Test:** Optimal notification timing
- 9 AM vs. 6 PM for daily reminder
- Immediate vs. 1 hour before breeding completes

---

## Phase 3: Iteration Sprint (Week 7-8)

**Goal:** Rapidly fix issues, polish to launch quality

---

### Step 1: Prioritize Issues

**Spreadsheet: "Beta Issues Tracker"**

| Issue | Impact | Effort | Priority | Status |
|-------|--------|--------|----------|--------|
| Tutorial confusing | High | Low | P0 | Done ✅ |
| Energy too restrictive | High | Medium | P0 | Testing |
| No sound | Medium | High | P1 | Planned |
| DNA economy unbalanced | High | Low | P0 | Done ✅ |
| Collection book laggy | Low | Medium | P2 | Backlog |

**Priority Formula:** Impact / Effort
- P0 (Critical): High impact, low-medium effort → fix immediately
- P1 (Important): High impact, high effort OR medium impact, low effort → next sprint
- P2 (Nice to have): Low impact → post-launch

---

### Step 2: Ship Daily Builds (If Possible)

**Aggressive Iteration:**
- Monday: Fix tutorial (based on Week 6 feedback)
- Tuesday: Ship build 1.0.8 → test with 10 users
- Wednesday: Review data (did tutorial fix help?)
- Thursday: Adjust energy costs
- Friday: Ship build 1.0.9 → weekend testing

**Track Improvements:**
```
Build 1.0.7 (Week 6): D1 74%, D7 44%
Build 1.0.8 (tutorial fix): D1 78%, D7 44%
Build 1.0.9 (energy tweak): D1 78%, D7 48%
```

---

### Step 3: Launch Readiness Checklist

**Before Soft Launch / Public Beta:**

**Retention:**
- [ ] D1 >40% (target: 45%)
- [ ] D7 >20% (target: 25%)
- [ ] D14 >15% (target: 20%)
- [ ] Session length 3-5 minutes
- [ ] 60%+ of players complete tutorial

**Economy:**
- [ ] DNA income vs. costs balanced (players unlock Dynasty 2 by Day 14)
- [ ] Energy system feels fair (60% of feedback neutral-positive)
- [ ] No hard paywalls (F2P can progress)

**Monetization:**
- [ ] IAPs functional (no payment failures)
- [ ] 2-5% conversion rate (beta)
- [ ] Price testing complete (optimal price points found)
- [ ] Value perception positive (feedback: "fair prices")

**Technical:**
- [ ] Crash rate <1% (TestFlight analytics)
- [ ] No critical bugs (game-breaking issues)
- [ ] Performance smooth (60fps on iPhone 8+)
- [ ] Data persistence working (progress saves)

**Content:**
- [ ] Dynasty 1 complete (27 variants)
- [ ] Dynasty 2 complete (27 variants)
- [ ] Dynasty 3 playable (at least 9 variants)
- [ ] All art final (no placeholder assets)

**Polish:**
- [ ] Sound effects + music
- [ ] Animations smooth
- [ ] UI readable (accessibility tested)
- [ ] Onboarding clear (>80% tutorial completion)

---

## Common Playtesting Pitfalls

### Pitfall 1: Testing Too Late

**Mistake:** Wait until game is "done" to test
**Result:** Major issues found, too late to fix (launch delayed)

**Solution:** Test early (even ugly prototype)
- Week 1: Core loop playable → friends & family
- Week 3: Basic features → closed beta
- Week 6: Polish → soft launch

---

### Pitfall 2: Ignoring Retention Data

**Mistake:** Focus on fun, ignore retention metrics
**Result:** "Everyone says it's fun!" but D1 retention = 25% (too low)

**Solution:** Data > opinions
- Track retention from Day 1
- If D1 <40%, something is wrong (even if feedback is positive)

---

### Pitfall 3: Changing Too Much at Once

**Mistake:** Ship update with 10 changes
**Result:** Retention improves, but you don't know which change worked

**Solution:** A/B test or sequential cohorts
- Change one major thing per week
- Compare cohorts to isolate effect

---

### Pitfall 4: Not Enough Testers

**Mistake:** Test with 5 friends
**Result:** Can't see patterns (not statistically significant)

**Solution:** Minimum tester counts
- Friends & family: 10+ (validate basics)
- Closed beta: 30-50 (validate retention)
- Soft launch: 1,000+ (validate monetization at scale)

---

### Pitfall 5: Listening to Wrong Feedback

**Mistake:** Tyler says "add PvP leaderboards!" (would take 2 months)
**Result:** Delay launch, add feature no one else wants

**Solution:** Weight feedback by:
- **Frequency:** 1 person or 20 people saying it?
- **Persona alignment:** Is this Emma or Tyler feedback? (build for Emma first)
- **Data validation:** Do analytics support this? (or just one loud voice?)

---

## SupaSnake Playtest Timeline

**Week 1-2: Friends & Family**
- 10 testers
- Test: Can players complete tutorial and breed?
- Iterate on: Tutorial clarity, core loop fun

**Week 3-4: Closed Beta Wave 1**
- 30 testers
- Test: D1/D7 retention, economy balance
- Iterate on: Daily rewards, energy system

**Week 5-6: Closed Beta Wave 2**
- 50 testers
- Test: D14 retention, monetization
- Iterate on: IAP pricing, retention features

**Week 7-8: Polish Sprint**
- Same 50 testers
- Test: Launch readiness
- Iterate on: Bug fixes, final balance tweaks

**Week 9+: Soft Launch (Optional)**
- 1,000+ testers (regional app store launch)
- Test: LTV, CPI, ad performance
- Iterate on: Monetization optimization

**Target:** v0.1 launch-ready by Week 8

---

## Tools Summary

**TestFlight/Google Play:** Beta distribution
**Amplitude/Mixpanel:** Analytics (retention, funnels, cohorts)
**Typeform/Google Forms:** Surveys
**Discord/Email:** Direct communication with testers
**Figma:** Share UI mockups for feedback
**Spreadsheets:** Track issues, prioritize fixes

---

## Success Criteria

✅ **D1 retention >45%** (players hooked)
✅ **D7 retention >25%** (habit forming)
✅ **D14 retention >20%** (long-term viability)
✅ **Tutorial completion >80%** (onboarding works)
✅ **Conversion rate 2-5%** (monetization viable)
✅ **Feedback mostly positive** (fun + fair)
✅ **Crash rate <1%** (stable)
✅ **Iterated 5+ times** (data-driven improvements)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_mobile_playtesting.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_playtest_analysis.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_retention_testing.md
- **Complete**: @knowledge_base/game_design/reference/batch4_chapters/chapter_28_playtesting_summary.md
