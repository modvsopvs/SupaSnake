# How to Design for Mobile F2P Players

**Schell's Principle:** Understand demographics (age, gender, lifestyle) and design for their specific constraints, preferences, and play patterns. Mobile players in 2025 have different needs than 2008 console gamers.

**SupaSnake Context:** Mobile-first F2P game targeting time-poor adults (25-35) and time-rich collectors (10-18). Must respect mobile constraints while delivering console-quality engagement.

---

## Overview

Designing for mobile F2P requires understanding:
1. **Platform constraints** (mobile devices, interruptions, one-handed play)
2. **F2P psychology** (optional purchases, no pay-to-win, respect time)
3. **2025 audience** (mobile-native, different from 2008 console players)
4. **Demographic needs** (casuals vs hardcore, male vs female, young vs adult)

**Key Challenge:** Mobile F2P has stigma (manipulative, pay-to-win, time-gating). SupaSnake must be F2P done RIGHT (player-first, not extractive).

---

## Mobile Platform Constraints

### Physical Device Realities

**Screen Size:**
- Small (iPhone SE: 4.7") to medium (iPhone 14: 6.1")
- UI must be readable, touchable (44pt minimum touch targets)
- Collection grid: 2-3 columns max (not 5 like desktop)

**Touch Controls:**
- No physical buttons (all swipe/tap)
- Occlusion (finger covers content)
- One-handed play preferred (thumb reach)

**Interruptions:**
- Phone calls, texts, notifications
- Real-world interruptions (boss, doorbell, kids)
- Must pause/resume instantly

**Battery/Heat:**
- Long sessions drain battery (social stigma: "battery killer")
- Intensive graphics = heat (uncomfortable to hold)

**Network:**
- Not always WiFi (cellular data costs)
- Spotty connections (subway, elevator)
- Must handle offline gracefully

### SupaSnake Design Responses

**Screen Optimization:**
- Collection Lab: 3-column grid (readable variants)
- Large touch targets (DNA drops in Snake: 60pt minimum)
- Essential info only on HUD (score, energy, not clutter)

**Touch Controls:**
- Swipe to turn Snake (intuitive, one-handed)
- No complex button combinations (accessibility)
- Virtual joystick option (user preference)

**Interruption Handling:**
- Instant pause (home button, call, notification)
- Snake auto-pauses when app backgrounds
- Resume state preserved (no progress loss)

**Battery Optimization:**
- 60fps Snake (not 120fps, saves power)
- Simplified 3D rendering (efficient variants)
- Dark mode option (OLED battery savings)

**Network Strategy:**
- Offline Snake play (no server required during round)
- Sync collection after round (async, no blocking)
- Queue breeding while offline (sync when connected)

---

## Mobile Play Patterns

### Session Length Reality

**Schell's 2008 Assumption:**
Console sessions = 30-60+ minutes (immersive)

**Mobile 2025 Reality:**
Sessions = 3-5 minutes average (interruptible)

**SupaSnake Design:**
- Snake rounds: 2-3 minutes (perfect mobile session)
- Breeding: 1-hour timer (not 24 hours, fits mobile rhythm)
- Collection browsing: 2 minutes (quick dopamine hit)

**Longer Session Support:**
- Hardcore players CAN play 30+ min (Tyler)
- Energy system supports multiple rounds per session
- Breeding queue (set up 5 breeds, come back later)

### Context of Play

**Where Mobile Players Play:**
- **Commute:** Bus, train, walking (partial attention)
- **Bathroom:** 2-5 minutes (full attention)
- **Waiting:** Line, appointment, before bed (bored)
- **Work breaks:** Lunch, coffee (stolen moments)

**SupaSnake Design Implications:**

**Commute (Partial Attention):**
- Forgiving Snake controls (not pixel-perfect required)
- Visual DNA drops (easy to see while glancing)
- Audio cues (DNA collected sound, even if not looking)

**Bathroom (Full Attention):**
- Ideal Snake session (2-3 min perfect)
- Breeding setup (1 min to queue 3 breeds)

**Waiting (Bored):**
- Collection browsing (2 min dopamine)
- Check breeding results (anticipation payoff)

**Work Breaks (Stolen Moments):**
- "One more round" fits 5-min break
- Energy refresh during work (return at lunch)

### Pickup/Putdown Friction

**Console Game:**
- Boot time: 30-60 seconds (menu → load save → gameplay)
- Acceptable because sessions are long

**Mobile Reality:**
- Boot time tolerance: < 3 seconds (or player quits)
- Sessions short = friction must be zero

**SupaSnake Design:**
- App launch → gameplay: < 2 seconds
- No splash screens, no forced tutorials, no ads blocking
- "Play" button immediately starts Snake round

---

## F2P Psychology (Done Right)

### The F2P Stigma Problem

**Common F2P Mistakes:**
- Pay-to-win (fairness broken)
- Aggressive time-gating (24-hour wait unless pay)
- Manipulative pressure (FOMO, time-limited must-haves)
- Grind-or-pay (progression impossible without spending)

**Player Perception:**
"F2P = greedy, manipulative, unfair"

**SupaSnake's Approach:**
F2P as **business model**, not **game design**. Game must be great free, purchases are **optional enhancements**.

### SupaSnake F2P Principles

**Principle 1: 100% Completable Free**
- All 180 variants obtainable without spending
- Breeding accessible to free players
- Leaderboards open to everyone

**Principle 2: Time Invested = Progress**
- Play more = more variants (not pay more)
- Energy refills naturally (not 24-hour gates)
- Skill matters (perfect Snake runs reward skill)

**Principle 3: Purchases Are Convenience/Cosmetic**
- Energy refills (convenience - play more NOW)
- Premium dynasties (cosmetic - cooler snakes)
- Breeding accelerators (convenience - results NOW)
- NOT power (no "better Snake", no "win button")

**Principle 4: Respect Player Time**
- Energy costs tuned for satisfaction (not frustration)
- Breeding timers short (1 hour, not 24 hours)
- No artificial gating (play as much as energy allows)

**Principle 5: Transparency**
- Clear energy costs (no hidden surprise)
- Honest rarity rates (0.1% mythic shown)
- No manipulative dark patterns

### Monetization Design (v1.0+)

**What Players Can Buy:**

**1. Energy Refills ($0.99)**
- Refills energy instantly (play more right now)
- Value: 100 energy = ~5 Snake rounds
- Not required (energy refills naturally)

**2. Premium Dynasties ($4.99)**
- Exclusive visual variants (Mystic, Celestial, etc.)
- Collectible (not competitive advantage)
- Still must play to get variants (purchase unlocks, not grants)

**3. Breeding Accelerators ($1.99)**
- Instant breeding result (skip 1-hour timer)
- OR breeding bundle (5 instant breeds)
- Convenience (free players wait, payers skip wait)

**4. Collection Bundles ($9.99)**
- "Starter Dynasty Pack" (10 random variants from chosen Dynasty)
- Kickstart collection (not complete it)
- Still requires play to complete

**What Players CANNOT Buy:**
- ❌ Better Snake (no advantage)
- ❌ Higher scores (skill-based only)
- ❌ Exclusive variants (all variants earnable)
- ❌ Unfair advantages (no pay-to-win)

### Emma's F2P Experience (Free Player)

**Month 1:**
- Plays daily (3 sessions, 5 min each)
- Spends all energy naturally (no purchases)
- Completes common variant collections
- Tries breeding (free, no cost)
- Result: Satisfied, progressing

**Month 3:**
- 60% collection complete (free progress)
- Considers energy refill ($0.99) for long weekend binge
- Buys ONCE (enhances fun weekend)
- Otherwise still free player

**Month 6:**
- 80% collection complete
- Loves her collection (all earned)
- Considers premium Dynasty ($4.99) because she loves game
- Buys Mystic Dynasty (cosmetic love)
- Still no competitive advantage

**Total Spent: $5.98 over 6 months** (fair, not exploited)

**Player Sentiment:** "This is F2P done right. I never felt forced to pay."

### Tyler's F2P Experience (Optional Spender)

**Month 1:**
- Grinds daily (3+ sessions, 20 min each)
- 100% free (wants to "earn" collection)
- Masters breeding, hunts rares
- Result: Engaged, progressing fast

**Month 2:**
- Buys energy refills ($0.99 × 3 = $2.97) for weekend grinding
- Buys breeding accelerators ($1.99) when impatient for rare result
- Still earns everything (purchases = time savings)

**Month 3:**
- 90% collection complete (mostly free play + some spending)
- Buys premium Dynasty ($4.99) for exclusive variants to hunt
- Loves challenge of collecting new Dynasty

**Total Spent: $9.95 over 3 months** (engaged payer)

**Player Sentiment:** "I spend because I love the game, not because I'm forced to."

---

## 2025 Mobile Audience vs 2008 Console

### Key Demographic Shifts

**2008 Console Gaming:**
- Primarily male (75%+)
- Primarily young (13-24)
- Self-identified "gamers"
- Dedicated gaming time
- Upfront purchase ($60)

**2025 Mobile Gaming:**
- Gender-balanced (50-55% female for casual)
- Broader age range (7-50+)
- Many don't identify as "gamers"
- Fragmented play time
- Free with optional purchases

### Design Implications

**Accessibility (Not Hardcore-Only):**
- Schell's 2008: Assume player is experienced gamer
- SupaSnake 2025: Assume player may be non-gamer

**Tutorial:**
- 2008: Text instructions, complex mechanics taught slowly
- 2025: Minimal tutorial (play immediately), learn by doing

**Complexity:**
- 2008: Deep systems explained over hours
- 2025: Simple surface, optional depth (layers)

**Social:**
- 2008: Solo or couch co-op
- 2025: Asynchronous social (sharing, trading, leaderboards)

### Female Audience Considerations

**Schell's 2008 Observation:**
Early videogames skewed male because:
- No social aspects
- No verbal/emotional content
- Divorced from real world
- Hard to learn

**SupaSnake 2025 Advantages:**
- ✅ Social features (v0.5: sharing, trading)
- ✅ Emotional content (caring for snake lineages)
- ✅ Real-world connection (tangible collection, nostalgia)
- ✅ Easy to learn (it's Snake!)

**Result:** SupaSnake positioned for 50/50 gender balance (unlike 2008 console games).

---

## Demographic-Specific Design

### For 25-35 Adults (Primary Target)

**Their Reality:**
- Time-poor (career, family, responsibilities)
- Mobile is primary gaming platform (no console at home)
- Seek low-stress entertainment (decompress)
- Nostalgia-responsive (Nokia Snake memories)

**SupaSnake Design:**
- **Quick sessions:** 3-5 min Snake rounds (commute-friendly)
- **Low pressure:** No forced competition, collection at own pace
- **Nostalgia:** Snake core familiar, comfortable
- **Progress respect:** Visible advancement even in 5 minutes
- **Pickup/putdown:** Instant pause, resume anytime

**What They DON'T Want:**
- ❌ Hardcore difficulty (stressful)
- ❌ Competitive pressure (not fun for them)
- ❌ Complex systems (mental overhead)
- ❌ Time commitments (can't dedicate hours)

### For 10-18 Collectors (Secondary Target)

**Their Reality:**
- Time-rich (school schedule has breaks)
- Mobile AND console gamers (omnivorous)
- Seek mastery and depth (passion-driven)
- Socially-motivated (friends play too)

**SupaSnake Design:**
- **Deep systems:** Breeding strategy, rare hunting
- **Mastery paths:** Leaderboards, perfect runs, 100% collection
- **Social features:** (v0.5) Trading, sharing, community
- **Discovery:** Hidden combos, secrets to find
- **Respect skill:** Perfect runs rewarded, not just time spent

**What They DON'T Want:**
- ❌ Shallow gameplay (boring quickly)
- ❌ Pay-to-win (unfair)
- ❌ No social (isolated experience)

### Gender-Balanced Design

**Male-Appealing Elements (Both Age Groups):**
- Competition (leaderboards)
- Mastery (perfect runs, breeding optimization)
- Destruction (Snake eating DNA = mild destruction pleasure)
- Spatial challenge (Snake navigation)

**Female-Appealing Elements (Both Age Groups):**
- Collection (Panini book completion)
- Nurturing (breeding snake lineages)
- Accessible (easy to learn)
- Real-world connection (nostalgic Snake, tangible progress)

**Balance Strategy:**
- Core = female-preferred pleasures (broad appeal)
- Optional = male-preferred pleasures (retain hardcore males)
- Neither forced, both supported

---

## Mobile-Specific Lenses

### Lens #18: The Lens of the Mobile Player (New)

**To use this lens, think about the mobile player's reality.**

**Ask yourself:**
1. Can this be played one-handed? (Thumb reach)
2. Can player pause instantly without losing progress? (Interruptions)
3. Does this work in a 3-minute session? (Fragmented time)
4. Is this fun while half-distracted? (Commute context)
5. Does this respect battery life? (Social constraint)

**SupaSnake Application:**
- One-handed: ✅ Swipe controls, thumb-reachable
- Instant pause: ✅ Auto-pause on background
- 3-minute session: ✅ Snake rounds 2-3 min
- Half-distracted: ✅ Forgiving controls, audio cues
- Battery: ✅ 60fps cap, efficient rendering

### Lens #19: The Lens of F2P Respect (New)

**To use this lens, think about player trust and fairness.**

**Ask yourself:**
1. Can a free player complete 100% of content? (No paywalls)
2. Do purchases feel optional or required? (Pressure test)
3. Would I feel good spending money? (Value, not exploitation)
4. Is the game fun without spending? (Core quality)
5. Am I manipulating or enhancing? (Ethics check)

**SupaSnake Application:**
- 100% completable free: ✅ All variants earnable
- Optional purchases: ✅ Convenience/cosmetic only
- Feel good spending: ✅ Supporting game I love (not forced)
- Fun without spending: ✅ Emma plays 6 months, $0 spent, satisfied
- Enhancing: ✅ Energy refills = more fun, not unfair advantage

---

## Common Mobile F2P Pitfalls

### Pitfall #1: Designing Console Game on Mobile

**Symptom:**
- Complex control schemes (virtual d-pad + 6 buttons)
- Long sessions required (30-min missions)
- Requires dedicated attention (can't play while distracted)

**SupaSnake Avoids:**
- Simple swipe controls (mobile-native)
- Short rounds (2-3 min)
- Forgiving gameplay (can glance away briefly)

### Pitfall #2: Aggressive Monetization

**Symptom:**
- Progress impossible without spending
- Constant purchase prompts (annoying)
- Time-gates everywhere (24-hour waits)

**SupaSnake Avoids:**
- 100% completable free
- Purchases offered subtly (not constant nagging)
- Short timers (1 hour breeding, not 24 hours)

### Pitfall #3: Ignoring Platform Constraints

**Symptom:**
- Assumes WiFi always (large downloads mid-game)
- Drains battery (complex graphics)
- Doesn't handle interruptions (loses progress)

**SupaSnake Avoids:**
- Offline Snake play (no connection required)
- Efficient rendering (battery-friendly)
- Instant pause/resume (progress never lost)

### Pitfall #4: Alienating Demographics

**Symptom:**
- Too hardcore (casuals quit)
- Too casual (hardcore bored)
- Male-only appeal (50% market ignored)

**SupaSnake Avoids:**
- Layered engagement (casual surface, hardcore depth)
- Gender-balanced (collection + competition)
- Broad demographic appeal (7-50+ age range)

---

## Validation Through Mobile Playtesting

### Test on Real Devices

**Not Enough:**
- Desktop web browser testing
- iOS simulator on Mac
- High-end devices only

**Required:**
- Real iPhones (iPhone SE, 12, 14)
- Real Android (mid-range Samsung, Pixel)
- Real network conditions (WiFi, LTE, offline)

### Test in Real Contexts

**Lab Testing (Useful):**
- Controlled environment
- Focused attention
- Measure specific metrics

**Real Context Testing (Essential):**
- **Commute test:** Play while walking, on bus (interruptions)
- **Bathroom test:** 2-minute session (pickup/putdown)
- **Work break test:** 5-minute lunch session (stolen moment)
- **Before bed test:** Tired, low attention (accessibility)

**SupaSnake Context Tests:**
- Emma plays during commute → Can she pause instantly for her stop?
- Tyler plays before bed → Is Snake engaging even when tired?
- Jake plays at work → Can he hide game quickly when boss walks by?

### Measure Mobile-Specific Metrics

**Session Length:**
- Target: 5-10 min average (multiple Snake rounds)
- Emma: 3-5 min (casual)
- Tyler: 20-30 min (hardcore)

**Return Rate:**
- Target: 70%+ Day 1, 40%+ Day 7, 20%+ Day 30
- Mobile F2P averages: 40% D1, 20% D7, 10% D30
- SupaSnake target above average (better core loop)

**Energy Spend:**
- Target: 80%+ spend all energy each session
- Signal: Players want more (good)
- If < 50%: Energy costs too high or game not engaging

**Purchase Rate (v1.0+):**
- Target: 5-10% convert to payers (industry standard)
- Average spend: $5-10 per payer per month
- Result: $0.25-1.00 ARPU (average revenue per user)

---

## Tips for Success

✅ **DO:**
- Design for mobile FIRST (not port from console)
- Respect time constraints (3-5 min sessions)
- Handle interruptions gracefully (instant pause)
- Support one-handed play (thumb reach)
- Make F2P fair (100% completable free)
- Test in real contexts (commute, bathroom, work)
- Balance demographics (casual + hardcore, male + female)

❌ **DON'T:**
- Assume long sessions (mobile reality = short)
- Force purchases (optional only)
- Ignore battery drain (social stigma)
- Design only for hardcore (casuals are majority)
- Forget female audience (50% of mobile market)
- Test only in lab (real context matters)
- Copy exploitative F2P (race to bottom)

---

## See Also

- **Quick Refs:**
  - @knowledge_base/game_design/quick_ref/concepts/concept_demographics.md
  - @knowledge_base/game_design/quick_ref/concepts/concept_gender_play_differences.md
  - @knowledge_base/game_design/quick_ref/concepts/concept_psychographics.md
- **SupaSnake:**
  - @knowledge_base/game/quick_ref/player_journey.md
  - @knowledge_base/game/quick_ref/energy_system.md
- **Complete:** @knowledge_base/game_design/reference/batch1_chapters/chapter_08_player_summary.md
