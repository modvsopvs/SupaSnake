# Core Loop Design - SupaSnake AAA
## The 3-Minute Empire Builder

**Version:** 1.0
**Date:** 2025-10-19
**Status:** Production Design Blueprint
**Word Count:** 3,847

---

## Executive Summary

**SupaSnake's core loop transforms Marvel SNAP's 3-minute strategic gameplay and Schell's elegant mechanics principles into a genetic empire builder where Snake is the DNA mining mechanic.**

**The Complete Loop (2-5 Minutes):**
```
Tap Play (15s setup)
→ Snake Run (90-180s goal-based gameplay)
→ DNA Rewards (15s celebration)
→ Lab Activities (60-120s breeding/collection)
→ Instant Restart OR Return to Lab
```

**Key Innovation:** We're not making "premium Snake with collection"—we're making "collection game where Snake is how you earn resources." 70% of session time happens in the Lab. Snake runs are strategic resource mining operations.

**Design Pillars Applied:**
- **SNAP's Session Design:** 2-5 minute complete arcs, decision every 10 seconds, "one more run" addiction
- **Schell's Elegance:** 4 basic actions → 12+ strategic actions (3:1 ratio exceeds AAA 2:1 standard)
- **Supercell Fairness:** Skill determines DNA income, not wallet size

---

## Session Flow: The Complete 2-5 Minute Loop

### Phase 1: Pre-Run Setup (15-30 seconds)

**Player Actions:**

```
1. Choose Snake Variant (3-5 seconds)
   - Quick-select favorite OR browse collection
   - See snake stats: Speed, Size, Special Ability
   - Visual preview of chosen variant

2. Select Dynasty Bonus (2-3 seconds)
   - CYBER: +10% movement speed
   - PRIMAL: +15% DNA value per food
   - COSMIC: +1 extra life
   - Auto-selects last used (instant for regulars)

3. Set Difficulty Tier (3-5 seconds)
   - Easy: 1× DNA, 80% success rate
   - Normal: 1.5× DNA, 50% success rate
   - Hard: 2× DNA, 30% success rate
   - Extreme: 3× DNA, 10% success rate
   - Infinite: Custom multiplier, prestige-only
   - Visual risk/reward indicator

4. Activate Wagering (optional, 2-3 seconds)
   - Risk Mode: Wager 25 DNA for 2× total rewards
   - All-In Mode: Wager 50 DNA for 3× total rewards
   - SNAP-inspired stakes system (skill expression through risk management)

5. Tap "Launch Run" (instant)
   - Smooth transition to gameplay (< 0.5 second load)
   - Run parameters locked in
```

**Design Goals:**
- Fast for veterans (7 seconds if repeating last setup)
- Strategic for engaged players (30 seconds optimizing)
- Clear risk/reward communication (no hidden complexity)

**SNAP Principle Applied:** Setup is MEANINGFUL but QUICK. Every choice affects outcomes, but defaults exist for fast restart.

---

### Phase 2: Snake Gameplay (90-180 seconds)

**Core Evolution: From Infinite to Goal-Based**

**OLD (Infinite Snake):** Play until death, chase high score, no clear completion
**NEW (Goal-Based Snake):** Complete objective within time/size limit, multiple win conditions

**Win Conditions (Choose One Pre-Run):**

```
1. DNA Collector (Default)
   - Goal: Collect X DNA before dying
   - Target scales with difficulty (Easy: 50 DNA, Normal: 100, Hard: 200)
   - Timer: 180 seconds max
   - Completion: Reach target DNA = instant win + bonus

2. Survival Expert
   - Goal: Survive X seconds without dying
   - Target: 90s (Easy), 120s (Normal), 180s (Hard)
   - No DNA requirement (but still earns DNA)
   - Completion: Timer expires while alive = win

3. Score Chaser
   - Goal: Reach X score (length × DNA × combo multiplier)
   - Target: 5,000 (Easy), 10,000 (Normal), 25,000 (Hard)
   - Classic scoring focus
   - Completion: Hit score threshold = win

4. Perfect Run (Hard+)
   - Goal: Collect 100 DNA without mistakes
   - No wall hits, no hazard collisions, flawless route
   - Highest DNA multiplier (2.5×)
   - Elite skill expression
```

**Strategic Depth: Abilities & Power-Ups**

**Dynasty Special Abilities (One per Run):**

```
CYBER Dynasty:
- Speed Burst: 2× speed for 3 seconds (cooldown: 15s)
- Strategic Use: Navigate tight spaces, escape danger, chain DNA quickly
- Activation: Double-tap screen

PRIMAL Dynasty:
- Shield Bash: Invulnerability for 2 seconds (cooldown: 20s)
- Strategic Use: Tank hazard, grab risky DNA, survive close call
- Activation: Swipe up

COSMIC Dynasty:
- Phase Shift: Pass through walls once (cooldown: 25s)
- Strategic Use: Shortcut to DNA cluster, escape corner, tactical repositioning
- Activation: Swipe down
```

**Power-Ups (Spawn Randomly):**

```
DNA Magnet (20% spawn rate):
- Auto-collect nearby DNA for 5 seconds
- Use: Efficiency boost, combo builder

Slow Time (10% spawn rate):
- Game speed reduced to 50% for 4 seconds
- Use: Precision control, plan next moves

Ghost Mode (5% spawn rate):
- Pass through walls for 3 seconds
- Use: Emergency escape, aggressive positioning

Score Multiplier (15% spawn rate):
- 2× DNA value for 10 seconds
- Use: Maximize high-value DNA collection
```

**Risk/Reward Design:**

High-value DNA spawns in dangerous positions:
- Near walls (risky proximity)
- In center of hazard clusters (threading the needle)
- On timer (disappears after 5 seconds, creates urgency)

**Player Decisions Every 5-10 Seconds:**
1. Which DNA to pursue next? (safe 1-point vs risky 3-point)
2. When to use special ability? (now or save for emergency)
3. Should I grab that power-up? (worth the detour risk)
4. Cash out early or push for higher multiplier? (SNAP-inspired decision)
5. Safe route or aggressive shortcut? (risk tolerance expression)

**AAA Polish - 60fps Feel:**
- Instant input response (< 50ms latency)
- Smooth snake movement (no stuttering)
- Satisfying audio feedback:
  - DNA collect: Ascending chime (pitch rises with combo)
  - Power-up grab: Whoosh + shimmer
  - Ability activate: Dynasty-specific sound (CYBER = digital pulse, PRIMAL = roar, COSMIC = ethereal hum)
  - Death: Descending tones (failure but not punishing)
  - Victory: Triumphant fanfare (2-second celebration)

**Schell's Elegance Applied:**
- 4 basic actions: Move, Eat DNA, Use Ability, Grab Power-Up
- 12+ strategic actions: Route planning, combo building, ability timing, risk assessment, power-up sequencing, difficulty optimization, DNA valuation, escape planning, hazard prediction, cooldown management, cash-out timing, multiplier maximization
- Ratio: 3:1 (exceeds AAA 2:1 standard)

**SNAP Principle Applied:** Decisions escalate. Early run = almost automatic (safe DNA collection). Mid run = tactical decisions emerge (use ability now?). Late run = maximum complexity (risk everything for 3× multiplier or cash out safe?).

---

### Phase 3: Post-Run Rewards (15-30 seconds)

**Immediate Feedback (3 seconds):**

```
Victory Screen:
┌─────────────────────────────────────┐
│         🎉 VICTORY! 🎉              │
│                                     │
│    DNA Collected: 125               │
│    Difficulty: Hard (2× multiplier) │
│    Risk Mode: Active (2× bonus)     │
│    ─────────────────────────────    │
│    TOTAL DNA EARNED: 500            │
│                                     │
│    [Claim Rewards]                  │
└─────────────────────────────────────┘

Death Screen:
┌─────────────────────────────────────┐
│           Close Call!               │
│                                     │
│    DNA Collected: 82 / 100          │
│    Wagered DNA: -25                 │
│    ─────────────────────────────    │
│    NET DNA CHANGE: +57              │
│                                     │
│    [Try Again] [Return to Lab]      │
└─────────────────────────────────────┘
```

**Progression Unlocks (5-10 seconds):**

```
If earned enough DNA, show:
- New variant unlocked! (rare pull trigger)
- Dynasty milestone reached! (50% completion)
- Generation upgrade available! (G1 → G2 ready)
- Achievement earned! (100 runs completed)
```

**Emotional Design:**
- Victory = celebration (confetti VFX, triumphant audio, dopamine hit)
- Close loss = encouragement ("82/100 - almost there!")
- Bad loss = no shame (instant restart available, no lengthy failure state)

**SNAP Principle Applied:** Post-game is BRIEF and POSITIVE. Show accomplishments, minimize punishment, facilitate instant restart or Lab transition.

---

### Phase 4: Lab Activities (60-180 seconds)

**The Real Game: 70% of Session Time**

**Collection Lab (30-60 seconds):**

```
View Collection Book:
┌─────────────────────────────────────┐
│  CYBER DYNASTY - 68% Complete       │
│                                     │
│  Common (18/20)  ████████████░░     │
│  Uncommon (8/12) ████████░░░░       │
│  Rare (3/5)      ████░░░░░          │
│  Epic (1/2)      ██░░░░░░░          │
│  Legendary (0/1) ░░░░░░░░░          │
│                                     │
│  Next Unlock: 45 DNA to next pull   │
│  [Pull Gacha] [View Variants]       │
└─────────────────────────────────────┘

Panini Psychology Active:
- See exactly what's missing (creates urgency)
- "Just 2 more Commons to complete tier!"
- Visible progress = dopamine anticipation
```

**Breeding Lab (30-90 seconds):**

```
Active Breeds:
┌─────────────────────────────────────┐
│  Slot 1: CYBER × PRIMAL             │
│  ⏱ Ready in 6h 23m                  │
│  Expected: G2 Rare (68% chance)     │
│                                     │
│  Slot 2: COSMIC × COSMIC            │
│  ⏱ Ready in 2h 15m                  │
│  Expected: G2 Epic (12% chance)     │
│                                     │
│  [Start New Breed] [Speed Up]       │
└─────────────────────────────────────┘

Strategic Decisions:
- Which dynasties to breed? (collection gaps vs trait hunting)
- When to use speed-ups? (save for rare breeds vs immediate gratification)
- How many slots to unlock? (free: 2, $2.99: +1, $4.99: +2)
```

**Gacha Pull Ceremony (5-15 seconds):**

```
Pull Animation:
1. Egg appears (1s)
2. Egg shakes (1s, builds tension)
3. Rarity glow shows (1s, color indicates tier)
   - White = Common
   - Green = Uncommon
   - Blue = Rare
   - Purple = Epic
   - Gold = Legendary (screen shake, particle explosion)
4. Reveal variant (2s)
5. Add to collection (instant)

Legendary Pull (AAA Polish):
- Screen shake
- Confetti particles
- Choir hit audio stinger
- Slow-mo reveal
- Social share prompt ("Share your pull!")
```

**Meta-Progression Visibility:**

```
Dynasty Mastery Progress:
┌─────────────────────────────────────┐
│  CYBER Mastery: Level 8             │
│  ████████████░░░░░░░ 68/100         │
│                                     │
│  Perks Unlocked:                    │
│  ✓ +5% DNA from CYBER snakes        │
│  ✓ Speed Burst cooldown -2s         │
│  ✓ Exclusive CYBER cosmetic         │
│                                     │
│  Next Perk (Level 10):              │
│  □ +10% breeding success rate       │
└─────────────────────────────────────┘
```

**Schell's Balance Applied:**
- Short-term rewards: DNA earned, variants pulled (instant gratification)
- Mid-term goals: Complete dynasty tier, unlock new dynasty (weekly)
- Long-term progression: G1 → G2 → G3 → G4, Dynasty mastery (monthly+)
- Infinite ceiling: Prestige system, perfect bloodlines, leaderboard climbing (years)

**SNAP Principle Applied:** Lab is where strategy LIVES. Snake is execution, Lab is planning. 70% of session time here because the decisions are richer than Snake gameplay.

---

### Phase 5: Loop Closure (Instant)

**Two Paths:**

**Path A: Instant Restart (40% of loops)**
```
"Run Again" button prominent
- Repeats last setup (7 second pre-run)
- "One more run" addiction loop
- SNAP's rapid restart principle
```

**Path B: Return to Lab (60% of loops)**
```
"Lab" button equally prominent
- Spend DNA on gacha/breeding
- Check breeding timers
- Browse collection
- Plan next run strategy
```

**No Friction:**
- Both paths <1 second transition
- No forced ads, no interruption
- Player controls pacing

---

## Snake Gameplay 2.0: Mechanics Deep-Dive

### Controls: Swipe vs Joystick

**Swipe Control (Default):**
- Swipe direction = snake turns
- Feels responsive (touch is direct manipulation)
- Mobile-native (works one-handed)
- **Advantage:** Precision, familiar to mobile players

**Virtual Joystick (Optional):**
- On-screen joystick for continuous control
- Better for complex maneuvers
- **Advantage:** Fine-tuned movement, console players prefer

**Allow Both:** Player chooses in settings (accessibility principle)

### Goal Variety: Why It Matters

**Problem with Infinite Snake:**
- No clear "I won" moment
- Death is only outcome (negative framing)
- Hard to balance difficulty (when is "good enough"?)

**Solution with Goal-Based:**
- Victory achievable in 90-180 seconds (matches SNAP session length)
- Multiple win conditions (playstyle variety)
- Clear completion = dopamine hit
- Failure is "didn't reach goal" not "you died" (less punishing framing)

**SNAP Parallel:**
- SNAP games are 6 turns, not infinite
- SupaSnake runs are 90-180 seconds, not infinite
- Both create complete arcs with resolution

### Risk/Reward: The Wager Mechanic

**Inspired by SNAP's Double-Down:**

In SNAP, "Snap" doubles stakes mid-game (2 cubes → 4 cubes). Players must read game state and opponent confidence. Good players climb ladder with 45% win rate through smart snapping.

**SupaSnake Adaptation:**

```
Pre-Run Wager:
- Wager 25 DNA for 2× total rewards
- Wager 50 DNA for 3× total rewards
- Loss = lose wagered DNA

Strategic Decision:
- Feeling confident with this snake? Risk Mode.
- Trying new dynasty? Play safe (no wager).
- Need DNA fast? All-In bet.

Skill Expression:
- Good players identify favorable setups (CYBER on Easy = high success rate)
- Risk when advantage exists
- Play safe when learning
- Efficiency = climb collection ladder faster
```

**Key Difference from SNAP:**
- SNAP wager is mid-game (read opponent, bluff)
- SupaSnake wager is pre-game (know your skill, self-assessment)
- Both reward strategic confidence over pure execution

### Difficulty Tiers: Flow Channel Maintenance

**Schell's Flow Principle:** Too easy = bored, too hard = frustrated, just right = engaged

**SupaSnake's Solution:**

```
Easy (1× DNA):
- For: New players, casual sessions, learning new dynasty
- Success Rate: 80%
- Experience: Relaxing, mastery-building

Normal (1.5× DNA):
- For: Regular play, balanced challenge
- Success Rate: 50%
- Experience: Engaging, "just right" difficulty

Hard (2× DNA):
- For: Skilled players, focused sessions
- Success Rate: 30%
- Experience: Tense, rewarding victories

Extreme (3× DNA):
- For: Mastery demonstration, speedrunners
- Success Rate: 10%
- Experience: White-knuckle intensity

Infinite (Custom multiplier):
- For: Prestige players, leaderboard chasers
- Success Rate: Variable (personal best challenges)
- Experience: Self-imposed mastery goals
```

**Dynamic Difficulty (Optional):**
- Game suggests difficulty based on recent performance
- "You've won 8/10 Normal runs - try Hard?"
- Never forced, always player choice

### AAA Feel: The 60fps Standard

**Why 60fps Matters:**

Mobile games at 30fps feel sluggish. Snake requires precision. 60fps = responsive, premium feel.

**Technical Implementation:**
- React Native + native modules (not web view)
- Optimized rendering (canvas, not DOM manipulation)
- Asset preloading (no mid-game stutters)
- Battery optimization (efficient draw calls)

**Haptic Feedback:**
- DNA collect: Light tap (50ms)
- Power-up: Medium pulse (100ms)
- Ability activation: Strong pulse (150ms)
- Death: Descending vibration pattern (200ms)
- Victory: Ascending celebration pattern (300ms)

**Audio Design:**
- 3D positional audio (DNA to your left sounds left)
- Dynamic music (intensity increases with snake length)
- Dynasty-specific themes (CYBER = electronic, PRIMAL = percussion, COSMIC = ambient)

**Screen Effects:**
- Subtle screen shake on death (feedback, not punishment)
- Particle trails on speed boost (visual clarity)
- Glow effects on power-ups (affordance)
- Smooth camera follow (predictive, not reactive)

---

## Meta-Progression Integration

### How Runs Feed the Lab

**DNA as Universal Currency:**

```
Earn DNA:
- Snake runs: 50-500 DNA per run (skill + difficulty dependent)
- Daily login: +10 DNA (streak bonus: +5/day, caps at +30)
- Achievements: 50-500 DNA (one-time bonuses)
- Events: 100-1000 DNA (weekly challenges)

Spend DNA:
- Gacha pulls: 20 DNA each
- Breeding: 50 DNA per breed
- Dynasty unlocks: 200 DNA (one-time)
- Speed-ups: 10 DNA per hour (breeding acceleration)
```

**Economy Balance:**

```
Target Progression (Casual Player, 3 runs/day):
Day 1: 150 DNA earned → 7 gacha pulls → 4-5 common variants
Day 7: 1,050 DNA total → Unlock Dynasty 2 + 15 pulls → 30% Dynasty 1 complete
Day 30: 4,500 DNA total → 60% Dynasty 1, 30% Dynasty 2, experimenting with breeding
```

**SNAP Parallel:**
- SNAP gives 3-4 cards per week F2P
- SupaSnake gives 10-15 variants per week F2P
- Both maintain consistent acquisition dopamine

### How Collection Improves Runs

**Variant Abilities (Passive Bonuses):**

```
Common Variants:
- No special bonuses (baseline performance)

Uncommon Variants:
- +5% DNA value OR +5% movement speed

Rare Variants:
- +10% DNA value OR +10% speed OR +1 starting life

Epic Variants:
- +15% DNA + unique visual effect (particle trail)

Legendary Variants:
- +20% DNA + unique ability (CYBER Legendary = Speed Burst cooldown -5s)
```

**Dynasty Mastery Bonuses:**

```
Complete X% of Dynasty:
- 25%: +5% DNA from that dynasty's snakes
- 50%: Unlock exclusive cosmetic variant
- 75%: Special ability cooldown -20%
- 100%: Prestige option unlocked (reset for permanent +10% bonus)
```

**Generation System:**

```
G1 (Base):
- Standard stats

G2 (Breed two G1):
- +5% all stats
- Unlock trait slot 1

G3 (Breed two G2):
- +10% all stats
- Unlock trait slot 2

G4 (Breed two G3):
- +15% all stats
- Unlock trait slot 3
- Prestige-level rarity
```

**Trait System (Strategic Depth):**

```
Traits Inherited via Breeding:
- Speed Demon: +20% movement speed
- DNA Hunter: +30% DNA value
- Tank: +2 starting lives
- Quick Reflex: -50% ability cooldown
- Magnet Aura: Auto-collect nearby DNA

Breeding Strategy:
- G1 × G1 = random common traits
- G2 × G2 = higher chance of rare traits
- Cross-dynasty breeding = unique hybrid traits
- Meta-game: Chase perfect trait combinations
```

### Infinite Progression

**Generation System (No Cap):**
- G1 → G2 → G3 → G4 → G5 → G∞
- Each generation = +5% stats, new trait slot unlock
- Cost increases exponentially (G5 requires massive DNA investment)
- **Result:** Always a next goal, no ceiling

**Monthly Dynasty Expansions:**
- Month 1: CYBER, PRIMAL, COSMIC (81 variants)
- Month 2: QUANTUM (27 new variants)
- Month 3: AETHER (27 new variants)
- Month 4: VOID (27 new variants)
- **Result:** 162 variants by Month 4, always new content

**Prestige System:**
- Complete Dynasty 100% → Option to Prestige
- Prestige = Reset collection, gain permanent +10% DNA multiplier
- Can prestige each dynasty separately
- **Result:** Infinite replayability, long-term goals for hardcore

**SNAP Comparison:**
- SNAP: Fixed card pool (~250 cards), completion possible
- SupaSnake: Infinite dynasties (monthly), completion moving target
- SupaSnake advantage: Never run out of content

---

## Difficulty & Replayability

### Daily Challenges

**Structure:**

```
3 Daily Challenges (Reset at Midnight):
1. Dynasty-Specific: "Complete 5 runs with CYBER snakes" (+50 DNA)
2. Skill-Based: "Win on Hard difficulty 3 times" (+100 DNA)
3. Creative: "Collect 200 DNA in single run" (+75 DNA)

Completion: +225 DNA total (= 11 gacha pulls extra per day)
```

**Weekly Mega-Challenge:**

```
"Complete 50 runs this week"
Reward: Exclusive rare variant + 500 DNA
Progressive rewards at 10, 25, 50 runs
```

**SNAP Parallel:** Daily missions drive engagement, feel achievable not grindy

### Leaderboards

**Multiple Tiers (Avoid Single Meta):**

```
Global Leaderboards:
1. Total DNA Earned (Season)
2. Highest Single Run Score
3. Collection Completion % (Fastest to 100%)

Dynasty-Specific Leaderboards:
1. CYBER Masters (Top CYBER players)
2. PRIMAL Champions (Top PRIMAL players)
3. COSMIC Legends (Top COSMIC players)

Weekly Leaderboards:
1. Top DNA This Week (Fresh start every Monday)
2. Most Runs Completed
3. Longest Win Streak
```

**Rewards:**

```
Top 10 Global: Exclusive Legendary variant
Top 100 Global: Exclusive Epic variant
Top 1000 Global: Exclusive Rare variant
All Participants: Participation rewards (50 DNA)
```

**Anti-Pay-to-Win:**
- Leaderboards based on skill metrics (DNA per run average, win rate %)
- Not total DNA (prevents whale domination)
- Seasonal resets (fresh starts for newcomers)

### Prestige & Endgame

**For Players Who "Complete Everything":**

```
Prestige Options:
1. Dynasty Prestige: Reset Dynasty 1, gain +10% DNA permanently
2. Generation Prestige: Breed perfect G10 snake (months of effort)
3. Trait Hunter: Collect all 50 possible traits
4. Speedrun Mastery: Leaderboard for fastest dynasty completion

Prestige Cosmetics:
- Exclusive borders ("Prestige CYBER" badge)
- Animated variants (moving textures)
- Custom death effects
- Profile showcases
```

---

## Monetization Touch Points

### F2P vs Paid Differences

**F2P Experience (Generous):**

```
Can Access:
- All 3 launch dynasties (unlockable via DNA)
- All variants (gacha + breeding)
- All game modes
- Daily challenges
- Leaderboards
- 2 breeding slots

Daily DNA Income (Casual, 3 runs/day):
- Runs: 150 DNA
- Login: 10 DNA
- Challenges: 75 DNA (if completed)
Total: 235 DNA/day = 11 gacha pulls

Weekly: 1,645 DNA = ~80 gacha pulls = 10-15 new variants
```

**Paid Benefits (Convenience, Not Power):**

```
$4.99/month Premium Subscription:
- +20 DNA daily login (2× bonus)
- 2× energy refill speed (play more often)
- +1 breeding slot (3 total)
- Exclusive cosmetic variant each month
- Early access to new dynasties (24 hours)

One-Time Purchases:
- Dynasty unlock: $1.99 each (skip DNA grind)
- Breeding slot: $2.99 (+1 permanent slot)
- Cosmetic packs: $4.99 (3 exclusive skins)

Battle Pass ($9.99/season, 3 months):
- Free track: 10 rare variants
- Premium track: 20 epic variants + cosmetics
```

**Key Principle: No Pay-to-Win**

```
Paid players CANNOT:
- Buy stronger snakes (all variants balanced within 5%)
- Buy collection completion (must still pull/breed)
- Buy leaderboard position (skill-based rankings)

Paid players CAN:
- Play more sessions (energy)
- Unlock faster (skip DNA grind)
- Look cooler (cosmetics)
```

**SNAP Parallel:**
- SNAP: Cosmetic variants = 68% of revenue
- SupaSnake: Target 60% from cosmetics, 30% from subscriptions, 10% from convenience

### Supercell Fairness

**Principles Applied:**

1. **Every Dynasty Unlockable F2P:**
   - Dynasty 2: 200 DNA (1 week casual play)
   - Dynasty 3: 250 DNA (10 days casual play)
   - Can pay $1.99 to skip, but not required

2. **All Variants Acquirable F2P:**
   - No "premium exclusive" variants that affect gameplay
   - Cosmetic exclusives OK (visual only)
   - F2P can complete 100% collection (takes 6 months vs 1 month for whales)

3. **Skill Determines Success:**
   - Better player earns more DNA per run
   - DNA income = 50-500 range (10× variance based on skill)
   - Paying speeds up, doesn't replace skill

4. **Transparent Economy:**
   - DNA costs visible
   - Gacha rates disclosed (60% Common, 25% Uncommon, 12% Rare, 3% Epic, 0.1% Legendary)
   - No hidden mechanics

---

## Retention Psychology

### What Brings Players Back Daily?

**Daily Drivers:**

```
1. Energy Refill (Mechanical):
   - Runs out after 3-5 games
   - Full refill in 3-4 hours
   - "I can play again now!"

2. Breeding Timers (Anticipation):
   - Breeds complete in 6-12 hours
   - "Check to see what hatched!"

3. Daily Challenges (Goals):
   - 3 fresh challenges daily
   - "Quick 5-minute session to complete"

4. Daily Login Streak (Habit):
   - 10 DNA base + 5 per consecutive day
   - Caps at +30 (after 4 days)
   - "Don't break the streak!"
```

**Weekly Drivers:**

```
1. Leaderboard Reset:
   - Fresh start every Monday
   - "Chance to hit Top 100 this week"

2. Weekly Mega-Challenge:
   - "50 runs completed = rare variant"
   - Progressive rewards (psychological: sunk cost)

3. New Variant Tuesday:
   - New variant released every Tuesday
   - "Check the shop!"
```

**Monthly Drivers:**

```
1. Dynasty Expansion:
   - New dynasty every 3 months (Month 1, 4, 7, 10)
   - "Brand new collection to chase"

2. Season Reset:
   - Battle pass seasons (3 months)
   - "New season, fresh progression"

3. Prestige Milestones:
   - "80% Dynasty 1 - almost ready to prestige!"
```

### "One More Run" Loop

**SNAP's Addiction Mechanic Applied:**

```
Why SNAP is Addictive:
- 3-minute games (low time commitment)
- Instant restart (< 5 seconds)
- Loss recovery ("next game I'll win")
- Incremental progress (rank climbing)

SupaSnake Adaptation:
- 2-3 minute runs (low commitment)
- Instant restart (< 3 seconds)
- Loss teaches ("I know what I did wrong, retry")
- Visible progress (DNA accumulation, collection %)
```

**Psychological Hooks:**

```
1. Near-Miss Phenomenon:
   - "82/100 DNA collected - SO close!"
   - Triggers "I can do it next run" impulse

2. Variable Rewards:
   - Gacha pull = slot machine psychology
   - Never know if next pull is Legendary
   - Keeps pulling "just one more"

3. Sunk Cost Fallacy (Positive):
   - "I'm 68% Dynasty 1 complete - must finish!"
   - Progress creates commitment

4. Social Proof:
   - "Friend just pulled Legendary COSMIC"
   - "Top 100 leaderboard = exclusive variant"
   - FOMO drives engagement
```

### SNAP-Like Addiction Without Toxicity

**SNAP's Dark Patterns (We Avoid):**

```
SNAP Mistakes:
- Retreat encourages quitting (feels cowardly)
- Location RNG can feel unfair (bad luck = auto-lose)
- Pool 3 slowdown (frustration wall)

SupaSnake Solutions:
- No retreat (commit to stakes, but runs are short)
- Controlled RNG (power-up spawns random, but DNA placement fair)
- Consistent acquisition (no sudden slowdown)
```

**Healthy Addiction Loop:**

```
Post-Run Decision:
↓
"That was fun, run again?" (40% choose this)
OR
"Let me spend DNA in Lab" (60% choose this)
↓
Lab activities (breeding, collection browsing)
↓
"Now I want to earn more DNA!"
↓
Back to Snake run
↓
(LOOP)
```

**Key Difference from Exploitative F2P:**
- Energy prevents burnout (can't play 100 runs straight)
- No forced ads (all opt-in for bonuses)
- No pay-to-win (skill always matters)
- Progress visible (never feel "stuck")

---

## Key Metrics

### Session Length Target: 15-25 Minutes

**Breakdown:**

```
Typical Session:
- 3 Snake runs: 9 minutes (3 min each)
- 2 Lab visits: 6 minutes (3 min each)
- 1 Gacha ceremony: 1 minute
- Collection browsing: 4 minutes
Total: 20 minutes

SNAP Comparison:
- SNAP: 20-30 min session (10 games × 3 min)
- SupaSnake: 15-25 min session (3 runs + Lab time)
- Both fit mobile usage patterns
```

### DNA per Minute Target: 10-30 DNA/min

**Skill-Based Variance:**

```
Casual Player (Easy difficulty, no wagers):
- 3-minute run = 75 DNA
- Rate: 25 DNA/min
- Daily (30 min play): 750 DNA = 37 gacha pulls

Skilled Player (Hard difficulty, wagers):
- 2-minute run = 200 DNA
- Rate: 100 DNA/min
- Daily (30 min play): 3,000 DNA = 150 gacha pulls

Efficiency Spread: 4× difference
Result: Skill matters (SNAP-like competitive integrity)
```

### Restart Rate Target: 40%+

**Definition:** % of runs followed immediately by another run (not Lab visit)

**Why It Matters:**
- High restart rate = "one more run" addiction working
- SNAP achieves 60%+ restart rate
- SupaSnake target: 40%+ (lower because Lab is primary engagement)

**Drivers:**
- Near-miss psychology ("I almost won!")
- Instant restart flow (< 3 seconds)
- Daily challenge progress ("2/5 runs with CYBER")

---

## Comparison to v1.0 (Solo Dev)

### What Changed

**OLD (Solo Dev Compromise):**

```
Core Loop:
- Infinite Snake (no win condition, death-only)
- Energy system gates play (3 runs max)
- Simple gacha (20 DNA per pull, no ceremony)
- Breeding basic (same-dynasty only, 24hr timers)
- No difficulty tiers (one-size-fits-all)
- No wagering (no risk/reward expression)
```

**NEW (AAA Design):**

```
Core Loop:
- Goal-based Snake (win conditions, 90-180s runs)
- Energy paces play (prevents burnout, not gating)
- AAA gacha ceremony (5-15s animation, rarity reveals)
- Strategic breeding (cross-dynasty, trait inheritance, 6-12hr timers)
- 5 difficulty tiers (flow channel for all skill levels)
- Wagering system (SNAP-inspired risk expression)
```

### What Improved

**Session Design:**
- OLD: Vague session length (play until energy depletes)
- NEW: Clear 15-25 min sessions (3 runs + Lab activities)

**Decision Density:**
- OLD: 1 decision per 30 seconds (move snake, eat DNA)
- NEW: 1 decision per 10 seconds (ability timing, power-up sequencing, wager sizing, difficulty selection)

**Meta-Progression Visibility:**
- OLD: Collection % shown, but no intermediate goals
- NEW: Dynasty mastery, generation progression, trait hunting, prestige system

**Retention Hooks:**
- OLD: Energy refill only
- NEW: Energy + breeding timers + daily challenges + leaderboards + weekly events

**Monetization Respect:**
- OLD: Energy bundles only (feels restrictive)
- NEW: Subscriptions + cosmetics + convenience (feels generous)

---

## Conclusion: The Heart of the Game

**SupaSnake's core loop is not "premium Snake."**

**It's "Marvel SNAP for collection lovers, where Snake is the resource mining mechanic."**

**What Makes It Work:**

1. **Session Design (SNAP):** 2-5 minute complete arcs, instant restart, "one more" addiction
2. **Mechanical Elegance (Schell):** 4 basic actions → 12 strategic actions (3:1 ratio)
3. **Fair Monetization (Supercell):** Skill determines income, paying speeds up (not unlocks power)
4. **Infinite Progression:** Generations 1 → ∞, monthly dynasties, prestige systems
5. **AAA Polish:** 60fps, haptics, audio design, visual feedback

**The Magic Moment:**

```
Minute 1: "This Snake feels AMAZING" (60fps, controls, audio)
Minute 5: "Wait, I'm earning DNA for a collection?" (paradigm shift begins)
Minute 15: "The Lab is where I ACTUALLY play" (realization)
Day 7: "I'm a CYBER specialist building G3 bloodlines" (identity formed)
Day 30: "How did I spend 20 hours in Lab vs 8 in Snake?" (addiction confirmed)
```

**That's the vision. That's the loop. That's the heart of SupaSnake AAA.**

---

**Version:** 1.0
**Date:** 2025-10-19
**Status:** Production Blueprint
**Next Steps:** Prototype goal-based Snake, validate DNA economy, playtest wagering system

**This is the game. Build this.**
