# How to Design for Player Attention (Flow in SupaSnake)

**Schell's Principle:** Flow is the state of complete focus, enjoyment, and timelessness. Games create flow by providing clear goals, no distractions, direct feedback, and continuous appropriate challenge. Players in flow lose track of time and experience pure engagement.

**SupaSnake Context:** Mobile F2P game with two player types (Emma: 5-10 min sessions, Tyler: 30-60 min sessions) requires DIFFERENT flow designs—quick flow entry for Emma, sustained flow duration for Tyler, natural exit points for both.

---

## Overview

Flow is Mihaly Csikszentmihalyi's concept of optimal experience: complete focus + enjoyment + loss of time sense. SupaSnake must:
1. Enable quick flow entry (< 60 seconds on mobile)
2. Sustain flow despite interruptions (texts, doorbells, bosses)
3. Balance challenge between boredom and frustration (the "flow channel")
4. Provide natural exit points (not forced interruptions)
5. Support different flow durations (Emma's 5 min ≠ Tyler's 60 min)

**Key Challenge:** Mobile players have divided attention (multitasking, interruptions). Flow must be quick to enter, easy to resume, and gracefully exitable.

---

## Step 1: Establish Clear Goals

**Flow Requirement #1:** Player always knows what to do next.

**Emma's Goal Hierarchy (Casual):**

**Immediate Goal (This Second):**
- "Collect DNA in this Snake round"
- **Design:** Snake gameplay is INSTANTLY clear (nostalgic familiarity)
- **No tutorial needed:** Brain remembers Nokia Snake from 2000s

**Session Goal (Next 5-10 Minutes):**
- "Spend my energy, unlock new variants, see progress"
- **Design:** Energy counter visible (3/5 sessions remaining)
- **Completion urge:** "Use all my energy before stopping"

**Long-Term Goal (Days/Weeks):**
- "Complete Cyber dynasty section" or "Fill up next Panini page"
- **Design:** Progress bars, completion percentages (visual "almost there")
- **Panini psychology:** Empty slots create "I need to fill these" drive

**Goal Clarity Test:**
- Can Emma answer "What am I trying to do?" at ANY moment?
- **YES:** Energy visible, collection progress shown, Snake objective obvious
- **If NO:** Add goal reminders (e.g., "2 more variants to complete set!")

**Tyler's Goal Hierarchy (Hardcore):**

**Immediate Goal:**
- "Get perfect run for rare variant chance" or "Test breeding combination #7"
- **Design:** Leaderboard ranking shown, breeding log accessible
- **Self-set goals:** Tyler creates own challenges (game enables, doesn't force)

**Session Goal:**
- "Breed Gen 5 legendary using optimal combo" or "Climb to top 100 leaderboard"
- **Design:** Clear tracking (generation progress, rank position)
- **Complexity embraced:** Tyler WANTS multi-step goals

**Long-Term Goal:**
- "100% collection" or "Top 10 global leaderboard"
- **Design:** Collection completion %, leaderboard tiers
- **Achievement obsession:** "Age of obsession" (10-18) drives this

**Goal Clarity Test:**
- Can Tyler identify his self-chosen goal hierarchy?
- **YES:** Leaderboards, collection %, breeding logs provide goal tracking
- **If NO:** Add achievement system, milestone markers

**SupaSnake Implementation:**

**Visual Goal Reminders:**
- Top UI bar: Energy (3/5), DNA (1,250), collection progress (27/100)
- Collection Lab: Progress bars per dynasty, set completion indicators
- Breeding Lab: Generation tracker, parent stats (planning enabler)

**No Goal Confusion:**
- Snake: Collect DNA (obvious from gameplay)
- Collection: Fill slots (Panini book metaphor)
- Breeding: Unlock rares (timer + outcome)

---

## Step 2: Eliminate Distractions

**Flow Requirement #2:** Game engages both mind and hands—no mental wandering, no fidgeting.

**Emma's Distraction Profile (Mobile Casual):**

**External Distractions (Can't Control):**
- Bus announcement, doorbell, text message, boss calling
- **Design Response:** Pause anytime, resume instantly (no penalty)

**Internal Distractions (Design Controls):**
- Mind wanders if hands idle (waiting, loading)
- Hands fidget if mind unchallenged (mindless tapping)
- **Design Response:** Quick rounds (2-3 min), active engagement (Snake requires focus)

**Anti-Distraction Design:**

**1. Quick Rounds = No Mind Wandering:**
- Snake rounds: 2-3 minutes (Emma's attention span on bus)
- **Why:** Before mind wanders, round ends → new goal → focus renewed

**2. Active Gameplay = No Fidgeting:**
- Snake requires constant directional input (hands engaged)
- DNA collection has tactile feedback (haptics, sound)
- **Why:** Hands busy → brain doesn't seek other stimulus

**3. Clean UI = No Visual Distraction:**
- No flashing ads during gameplay
- No pop-ups mid-round
- Energy depletion message AFTER round ends (not mid-Snake)
- **Why:** Visual clutter breaks focus

**4. Pause Resilience:**
- Text arrives mid-Snake → can pause without losing progress
- Resume exactly where left off (no "start over" frustration)
- **Why:** External interruptions don't break flow permanently

**Tyler's Distraction Profile (Long Sessions):**

**External Distractions:**
- Less frequent (Saturday afternoon, focused 30-60 min sessions)
- **Design Response:** Flow can sustain longer without interruption support

**Internal Distractions:**
- Mind wanders if challenge too easy (boredom)
- Hands fidget if waiting too long (breeding timers)
- **Design Response:** Layered engagement (breed while playing Snake, check leaderboard between rounds)

**Anti-Distraction Design:**

**1. Layered Activities = No Waiting:**
- Breeding happens passively (no staring at timer)
- Can play Snake while breeding cooks (hands + mind engaged)
- Check leaderboard between rounds (goal-relevant micro-breaks)
- **Why:** Always something to do (flow sustains across activities)

**2. Strategic Depth = No Boredom:**
- Breeding formulas to discover (mental challenge)
- Perfect run optimization (skill challenge)
- Collection planning (strategic challenge)
- **Why:** Brain has endless optimization space (doesn't wander)

**3. Skill Ceiling = No Mastery Plateau:**
- Perfect Snake runs (score ceiling)
- 0.1% legendary hunts (RNG ceiling)
- Top 10 leaderboard (competitive ceiling)
- **Why:** Tyler never "finishes"—always next challenge

---

## Step 3: Provide Direct Feedback

**Flow Requirement #3:** Immediate response to actions (no waiting to see results).

**Emma's Feedback Needs (Instant Gratification):**

**Snake Gameplay:**
- Eat DNA → **Instant:** Visual grow, sound effect, +10 DNA counter
- Hit wall → **Instant:** Shake animation, game over screen, round summary
- **No delay:** Feedback within 100ms of action

**Collection Unlocks:**
- Spend DNA → **Instant:** Celebration animation, variant reveal, slot fills
- Complete set → **Instant:** Set bonus pop-up, special animation, stat boost
- **No suspense:** Emma wants immediate payoff (no 24-hour unlock timers)

**Progress Tracking:**
- DNA collected → **Real-time:** Counter updates during Snake round
- Energy spent → **Real-time:** Energy bar depletes, sessions remaining shown
- Collection % → **Real-time:** Progress bar fills as variants unlock
- **Always visible:** No "check menu to see progress" delays

**SupaSnake Implementation:**

**Micro-Feedback (Every Action):**
- Swipe Snake → direction change < 50ms (buttery smooth)
- Collect DNA → particle effect + sound + haptic + counter increment
- Unlock variant → 3-second celebration (long enough to savor, short enough to not bore)

**Macro-Feedback (Session Progress):**
- Round ends → "You collected 150 DNA! 3/5 energy used."
- Session ends → "Amazing! You unlocked 2 new variants today."
- **Positive framing:** Celebrate accomplishment, not "out of energy" negativity

**Tyler's Feedback Needs (Strategic Information):**

**Snake Mastery:**
- Perfect run → **Instant:** Score multiplier, "PERFECT" banner, leaderboard update
- Personal best → **Instant:** "New high score!" + ranking change
- **Competitive validation:** Immediate feedback on skill improvement

**Breeding Experiments:**
- Breed parents → **Delayed:** 2-24 hour timer (strategic planning phase)
- Timer ends → **Instant:** Notification + reveal animation + result logged
- **Discovery tracking:** Breeding log shows all combinations tried (pattern emergence)

**Collection Milestones:**
- 25% dynasty complete → **Instant:** Achievement unlock, badge earned
- 100% collection → **Instant:** Legendary celebration, global announcement
- **Pride payoff:** Big accomplishments get big feedback

**SupaSnake Implementation:**

**Skill Feedback:**
- High score tracker: "Your best: 2,450" (always visible during Snake)
- Leaderboard: "Rank #47 → #42" (position change instant)
- Perfect run: Special particle effects, unique sound, bonus DNA

**Discovery Feedback:**
- Breeding log: All combinations tried, results recorded
- Pattern hints: "Gen 3 + Gen 3 = ???" (suggestion, not spoiler)
- Rare unlock: "LEGENDARY! Only 0.1% drop rate!" (validates perseverance)

---

## Step 4: Balance Challenge (The Flow Channel)

**Flow Requirement #4:** Continuous challenge that's not-too-easy, not-too-hard, adapting to improving skill.

**The Flow Channel:**
```
Skill Level
    ↑
    │         [ANXIETY ZONE]
    │              Too Hard
    │                ↑
    │    ╔══════════════════════╗
    │    ║   FLOW CHANNEL      ║ ← Sweet spot
    │    ╚══════════════════════╝
    │                ↓
    │         [BOREDOM ZONE]
    │              Too Easy
    │
    └────────────────────────→ Challenge Level
```

**Emma's Flow Channel (Narrow, Stable):**

**Week 1: Learning Phase**
- Challenge: Basic Snake (easy)
- Skill: Beginner (low)
- **Result:** FLOW (challenge matches skill)

**Week 2-4: Comfortable Mastery**
- Challenge: SAME Snake difficulty (easy)
- Skill: Improved (medium)
- **Risk:** Boredom (too easy now)
- **Solution:** Variety, not difficulty increase

**Emma's Challenge Progression (NOT Snake Difficulty):**

**Progression comes from collection, not Snake skill:**
- Week 1: Common variants (easy to unlock)
- Week 2: Uncommon variants (slightly harder)
- Week 3+: Rare variants (hunt challenge)

**Snake difficulty stays CONSTANT (Emma's comfort zone):**
- Never increases speed
- Never adds obstacles
- Always feels "like Nokia Snake" (nostalgic comfort)

**Why This Works for Emma:**
- Snake is RELAXATION (not challenge)
- Challenge comes from COLLECTION (hunt for rares)
- Flow maintained through variety, not difficulty

**Tyler's Flow Channel (Wide, Ascending):**

**Week 1: Learning Phase**
- Challenge: Basic Snake + discover breeding (medium)
- Skill: Beginner → Intermediate (rapid growth)
- **Result:** FLOW (learning curve engaging)

**Week 2-4: Skill Development**
- Challenge: Perfect runs + rare breeding (hard)
- Skill: Intermediate → Advanced
- **Result:** FLOW (challenge scaled with skill)

**Month 2+: Mastery Phase**
- Challenge: Leaderboard top 10 + 0.1% legendary hunts (very hard)
- Skill: Advanced → Expert
- **Result:** FLOW (endless skill ceiling)

**Tyler's Challenge Progression (Multiple Vectors):**

**1. Snake Skill Ceiling:**
- Beginner: Complete rounds
- Intermediate: High scores
- Advanced: Perfect runs (zero mistakes)
- Expert: Leaderboard top 10

**2. Collection Completeness:**
- Beginner: Common variants (100+ available)
- Intermediate: Uncommon/Rare (harder to find)
- Advanced: Epic variants (strategic breeding required)
- Expert: 0.1% Legendary (hunt for weeks)

**3. Breeding Mastery:**
- Beginner: Discover breeding exists
- Intermediate: Understand generation mechanics
- Advanced: Discover hidden formulas
- Expert: Optimize breeding for specific rares

**Why This Works for Tyler:**
- ENDLESS challenge vectors (never "finishes")
- Skill ceiling unreachable (always room to improve)
- Self-directed goals (Tyler sets own challenges)

**Tense-Release Pattern (Both Players):**

**Better Than Linear Difficulty:**
```
Linear:     Easy → Medium → Hard → Very Hard → [Burnout]
Tense-Release: Easy → Hard → REWARD (power boost) → Easy → Harder → REWARD...
```

**SupaSnake Implementation:**

**Tense Phase (Challenge Increase):**
- Hunting for rare variant (many failed attempts)
- Trying to beat personal best (frustration building)
- Nearing set completion (one variant missing)

**Release Phase (Reward Relief):**
- RARE UNLOCKED! (celebration, dopamine hit)
- Set bonus activated (sudden power increase)
- Next few Snake rounds feel EASIER (set bonus buff)

**Renewed Tense:**
- Set bonus wears off OR new rarity tier begins
- Challenge ramps up again
- Cycle continues

**Why Oscillation Works:**
- Pure tension = burnout
- Pure relaxation = boredom
- Alternating = excitement + relief + anticipation

---

## Step 5: Support Mobile-Specific Flow Patterns

**Mobile Challenges to Flow:**

**1. Short Sessions (Emma: 5-10 min):**
- **Problem:** Not enough time for traditional flow build-up
- **Solution:** INSTANT flow entry (< 60 seconds)

**2. Frequent Interruptions:**
- **Problem:** Doorbell, text, boss = flow broken
- **Solution:** Pause resilience + quick re-entry

**3. Divided Attention:**
- **Problem:** Bus, bathroom, waiting room = half-focused
- **Solution:** Engaging but not demanding (can play while distracted)

**4. Small Screens:**
- **Problem:** Visual clutter breaks focus
- **Solution:** Minimal UI, large touch targets, clear hierarchy

**Emma's Flow Design (Quick Entry, Quick Exit):**

**Flow Timeline:**
```
0:00 - Opens app
0:10 - Sees energy available (3/5 sessions)
0:15 - Taps "Play Snake"
0:20 - Round starts (instant flow entry)
0:30 - IN FLOW (focused on Snake, collecting DNA)
5:00 - Round ends, unlocks variant (celebration)
5:15 - Starts new round (flow continues)
10:00 - Energy depleted (3/3 sessions used)
10:05 - "Great session! Energy refills in 20 min" (natural exit)
```

**Flow Entry: 20 seconds**
- Sees goal (energy sessions available)
- Knows what to do (play Snake)
- Starts playing (instant familiarity)

**Flow Duration: 5-10 minutes**
- Sustained by quick rounds (2-3 min each)
- Broken by energy depletion (natural, not frustrating)

**Flow Exit: Clean**
- Accomplishment celebrated ("You collected 200 DNA!")
- Next goal set ("Check back in 20 min for energy")
- Anticipation created (something to look forward to)

**Tyler's Flow Design (Sustained Depth):**

**Flow Timeline:**
```
0:00 - Opens app
0:30 - Checks breeding results (2 legendaries cooking)
1:00 - Reviews leaderboard (rank #52, wants #50)
2:00 - Sets session goal: "Get to rank #50 today"
3:00 - IN FLOW (deep focus, perfect run attempts)
30:00 - Still in flow (layered activities: Snake + breeding checks + leaderboard monitoring)
60:00 - Achieves goal OR energy depleted (natural exit)
```

**Flow Entry: 2-3 minutes**
- Checks multiple systems (breeding, leaderboard, collection)
- Formulates session goal (self-directed challenge)
- Begins focused activity

**Flow Duration: 30-60 minutes**
- Sustained by layered engagement (multiple simultaneous goals)
- NOT broken by breeding timers (passive background)
- Broken by goal achievement OR energy depletion

**Flow Exit: Satisfied**
- Goal achieved ("Rank #50! YES!")
- OR meaningful progress ("Rank #53, close...")
- Next session anticipated ("I'll get #50 tomorrow")

**Interruption Resilience (Both Players):**

**Graceful Pause:**
- Mid-Snake → Text arrives → Pause button OR auto-pause
- Resume: Exact same state, no penalty, instant re-entry

**Context Preservation:**
- Session goal remembered (energy count, current variant hunt)
- No "what was I doing?" confusion
- Quick re-engagement (< 10 seconds back in flow)

---

## Step 6: Create Natural Exit Points

**Anti-Pattern:** Forced interruptions (pop-up ads, mandatory social sharing, "rate us now").

**SupaSnake Pattern:** Natural stopping points that feel like accomplishments, not barriers.

**Energy Depletion (Primary Exit Point):**

**Emma's Experience:**
```
Energy: 3/5 → Play round → 2/5 → Play round → 1/5 → Play round → 0/5
Message: "Great session! You collected 250 DNA and unlocked 2 variants! Energy refills in 20 minutes."
Feeling: ACCOMPLISHMENT (not frustration)
Mental State: "I did something meaningful" + "I'll check back soon"
```

**Why This Works:**
- **Completion:** Used all sessions (goal achieved)
- **Progress:** DNA earned, variants unlocked (visible advancement)
- **Anticipation:** Energy refills (something to look forward to)
- **No guilt:** Natural stopping point (not "I'm wasting time")

**Tyler's Experience:**
```
Energy: 5/5 → Long session → 0/5 OR goal achieved (rank #50)
Message: "Amazing! 60 min session, rank #52 → #50! Energy refills in 20 minutes."
Feeling: TRIUMPH (goal achieved) OR SATISFIED PROGRESS (closer to goal)
Mental State: "I accomplished my goal" + "Next session I'll push further"
```

**Why This Works:**
- **Achievement:** Goal-oriented session completed
- **Skill validation:** Progress measurable (rank, collection, breeding)
- **No forced stop:** Could continue if energy remains (player-controlled)

**Secondary Exit Points:**

**1. Set Completion:**
- Unlocks final variant in dynasty set
- Celebration animation (3-5 seconds)
- Set bonus activated (power reward)
- **Natural pause:** "I did it! I'll come back to enjoy set bonus later"

**2. Breeding Timer Completion:**
- Notification: "Your legendary snake is ready!"
- **Return trigger:** "I want to see what I got!"
- **Next session starts** with exciting reveal

**3. Daily Login Reward:**
- First login of day → Bonus DNA
- **Encourages:** Daily habit (retention)
- **Doesn't force:** Extended session (respect time)

---

## Step 7: Test for Flow

**Flow is Hard to Test:**
- Requires 10+ minute observations (not 2-minute usability tests)
- Player may be quiet, withdrawn (looks "not engaged" but is deeply focused)
- Must watch for subtle cues

**Emma Flow Indicators:**

**✅ IN FLOW:**
- Quiet focus (not talking)
- Rhythmic swiping (Snake mastery engaged)
- Smiles at variant unlocks (pleasure moments)
- Sighs contentedly when energy depletes (satisfied completion)
- Says "I'll check back in 20 minutes" (anticipation set)

**❌ FLOW BROKEN:**
- Checks phone notifications mid-round (distraction)
- Fidgets, looks away (mind wandering = too easy)
- Frustrated sighs at energy depletion (barrier, not natural stop)
- Quits mid-session without using all energy (frustration or boredom)
- Says "This is boring" or "Why can't I play more?" (negative exit)

**Tyler Flow Indicators:**

**✅ IN FLOW:**
- Deep focus (slow to respond to questions)
- Muttering strategy ("If I breed these two...")
- Pumps fist at rare unlock ("YES!")
- Checks leaderboard between rounds (goal tracking)
- Plays for 30+ minutes without checking time (time disappears)

**❌ FLOW BROKEN:**
- Stops after 5 minutes ("Nothing to do")
- Says "This is too easy" or "I figured it out already" (boredom)
- Frustrated at RNG ("This is just random" = no discovery)
- Quits before goal achieved without satisfaction (frustration)

**Critical Moment to Watch:**

**When does flow break?**
- Emma: Round 3? Round 5? Energy depletion? Why?
- Tyler: 10 minutes in? 30 minutes? What caused exit?

**Fix flow-breaking moments:**
- If Emma fidgets Round 2: Rounds too long (shorten to 2 min)
- If Tyler quits at 15 min: Not enough depth (add breeding complexity)
- If Emma frustrated at energy: Messaging wrong (reframe as accomplishment)

---

## SupaSnake-Specific Implementation

**Core Snake Gameplay:**
- **Emma Flow:** Instant entry (nostalgic), 2-3 min rounds (no mind wander), clear goal (collect DNA)
- **Tyler Flow:** Skill ceiling (perfect runs), score tracking (competitive), leaderboard (social proof)

**Collection Lab:**
- **Emma Flow:** Panini completion (clear progress), set milestones (mini-goals), visual satisfaction
- **Tyler Flow:** 100% completion (long-term goal), rarity hunt (challenge), strategic planning

**Energy System:**
- **Emma Flow:** Natural sessions (3-5 min per energy), clean exit (accomplishment messaging), anticipation (refills)
- **Tyler Flow:** Resource management (optimize sessions), long sessions (5+ energy), strategic timing

**Breeding Lab:**
- **Emma Flow:** Optional (doesn't break her flow), simple if engaged (nurturing narrative)
- **Tyler Flow:** Core activity (discovery pleasure), strategic depth (optimization), layered engagement (breed while playing)

---

## Tips for Success

✅ **DO:**
- Enable sub-60-second flow entry (mobile attention spans)
- Support pause/resume (interruption resilience)
- Provide natural exit points (energy, goals achieved)
- Use tense-release pattern (not linear difficulty)
- Test with 10+ minute observations (flow takes time)
- Celebrate exits (accomplishment, not frustration)
- Support different flow durations (Emma 5 min, Tyler 60 min)

❌ **DON'T:**
- Force interruptions (pop-ups, ads, mandatory social)
- Assume one flow pattern fits all (Emma ≠ Tyler)
- Ignore mobile context (small screens, divided attention)
- Use linear difficulty (causes burnout)
- Test too briefly (flow requires sustained observation)
- Punish natural stops (energy as paywall = frustration)

---

## See Also

- **Quick Ref:** @knowledge_base/game_design/quick_ref/concept_focus_attention.md
- **Quick Ref:** @knowledge_base/game_design/quick_ref/lens_21_flow.md
- **SupaSnake:** @knowledge_base/game/quick_ref/energy_system.md (flow pacing gates)
- **SupaSnake:** @knowledge_base/game/quick_ref/player_journey.md (flow across player lifecycle)
- **Complete:** Mihaly Csikszentmihalyi, "Flow: The Psychology of Optimal Experience"
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_10_mind_summary.md
