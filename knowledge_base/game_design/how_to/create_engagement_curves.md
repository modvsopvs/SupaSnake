# How to Create Engagement Curves for SupaSnake

**Schell's Principle:** Interest curves chart player interest over time. Good curve: Hook → Rising interest with rest periods → Grand finale → Leave them wanting more. Interest = Inherent Interest + Poetry of Presentation + Projection. Curves can be fractal (game level, session level, round level).

**SupaSnake Context:** Mobile game needs session-based curves (5-10 min for Emma, 60+ min for Tyler), round-based curves (60-90 sec per round), and long-term curves (days/weeks of collection pursuit). Energy system creates natural pacing gates.

---

## Overview

Engagement curves for mobile games must account for multiple time scales: moment-to-moment gameplay loops (seconds), individual rounds (minutes), play sessions (5-60 minutes), and long-term progression (days to weeks). SupaSnake uses fractal interest curves: each round has hook→climax, each session has hook→climax, overall game has hook→climax.

## Step 1: Identify Key Moments (Lens #68)

**List Top 10 Moments in SupaSnake:**

1. **First DNA collection** (initial satisfaction)
2. **First variant unlock** (reward revelation)
3. **High-speed legendary chase** (peak tension)
4. **Near-miss wall collision** (dramatic close call)
5. **Session high score beat** (personal achievement)
6. **Dynasty completion** (8/8 variants unlocked)
7. **First successful breed** (creation moment)
8. **100% collection progress** (completion milestone)
9. **Energy depletion decision** (continue via ad or stop?)
10. **Returning after refill** (anticipation of next session)

**Prioritize by Power:**
- Most Powerful: Legendary chase (heart-pounding), Dynasty completion (major milestone)
- Medium Power: High score beat, successful breed
- Lower Power: Individual DNA collection (frequent, less impactful)

**Example from SupaSnake:**
```typescript
// Track moments for interest curve analysis
enum GameMoment {
  FIRST_COLLECTION = 'first_dna_collected',
  VARIANT_UNLOCK = 'variant_unlocked',
  NEAR_MISS = 'wall_near_miss',
  HIGH_SCORE = 'session_high_score',
  LEGENDARY_SPAWN = 'legendary_spawned',
  // ... more moments
}

// Log moments during gameplay
const trackMoment = (moment: GameMoment, intensity: number) => {
  analytics.track(moment, {
    intensity, // 1-10 scale
    timestamp: Date.now(),
    roundNumber: currentRound
  });
};
```

## Step 2: Design Round-Level Curves (60-90 seconds)

**Ideal Shape for Single Round:**

```
Interest
   ↑
   │                    ╱╲ (C) Climax: High speed + Legendary spawn
   │                  ╱    ╲
   │                ╱        ╲ (D) Death or round end
   │      (B)    ╱              ╲
   │        ╲  ╱                  ╲
   │          ╲╱                     ╲
   │   (A)                             (E)
   └────────────────────────────────────────→ Time
       0s    15s    30s    45s    60s   75s

(A) Hook: Round starts, first DNA visible
(B) Brief rest: Easy navigation, slow speed
(C) Peak: Speed maxed, rare/legendary spawns
(D) Death: Game over, score shown
(E) Resolution: Restart prompt (if energy remains)
```

**Implementation:**

**Hook (0-15s):**
- Spawn 3-4 Common DNA orbs immediately (Emma sees opportunity)
- Speed: 60% of max (comfortable, safe)
- Music: Upbeat intro loop
- Goal: Quick satisfaction from first collections

**Rising (15-45s):**
- Gradually increase speed (60% → 90%)
- Spawn rate increases (more orbs on screen)
- Rare variants begin appearing (blue orbs)
- Music: Build intensity with percussion

**Climax (45-60s):**
- Speed: 100-120% of base (high tension)
- Legendary spawns (if unlocked): Gold orb appears
- Music: Peak intensity
- Stakes: High score in reach OR high score at risk

**Resolution (60s+):**
- Death OR maximum time reached
- Score display: Immediate feedback
- DNA tally: Show round earnings
- Restart prompt: "Continue? (5/7 energy)"

**Example Spawn Schedule:**
```typescript
const getRoundSpawnConfig = (elapsedSeconds: number) => {
  if (elapsedSeconds < 15) {
    // Hook: Easy, rewarding
    return {
      spawnRate: 1.5, // Orbs per second
      rarityWeights: { common: 0.9, rare: 0.1, legendary: 0.0 },
      speedMultiplier: 0.6
    };
  } else if (elapsedSeconds < 45) {
    // Rising: Gradual increase
    return {
      spawnRate: 2.0,
      rarityWeights: { common: 0.7, rare: 0.25, legendary: 0.05 },
      speedMultiplier: 0.6 + (elapsedSeconds - 15) * 0.01 // 0.6 → 0.9
    };
  } else {
    // Climax: High intensity
    return {
      spawnRate: 2.5,
      rarityWeights: { common: 0.4, rare: 0.4, legendary: 0.2 },
      speedMultiplier: 1.0 + (elapsedSeconds - 45) * 0.02 // 1.0 → 1.3
    };
  }
};
```

## Step 3: Design Session-Level Curves (5-10 min for Emma, 60+ for Tyler)

**Emma's Commute Session (7 rounds, ~8 minutes):**

```
Interest
   ↑
   │                             ╱╲ (F) Finale: Round 7, energy depleted
   │                           ╱    ╲
   │                (D)      ╱        ╲ (G) Resolution: Session stats
   │              ╱╲      ╱              ╲
   │    (B)     ╱  ╲  ╱(E)                 ╲
   │   ╱╲    ╱      ╲╱                       ╲
   │ ╱    ╲╱ (C)                               (H)
   │(A)
   └──────────────────────────────────────────────→ Time
     R1  R2  R3  R4  R5  R6  R7  Stats

(A) Hook: Round 1 easy DNA collection
(B) Small peak: First variant unlock (Round 2)
(C) Rest: Round 3 moderate (catch breath)
(D) Rising: Round 4-5 build momentum
(E) Brief rest: Quick death, restart
(F) Grand finale: Round 6-7 legendary chase
(G) Resolution: Energy depleted
(H) Leave wanting more: "Refills in 25 min"
```

**Implementation:**

**Hook (Round 1):**
- Easy first round: Slow speed, common spawns
- Quick satisfaction: 100-200 DNA earned easily
- Sets expectation: "This is fun and I'm good at it"

**Rising with Rests (Rounds 2-5):**
- Round 2: Slightly harder, unlock first variant (peak)
- Round 3: Moderate difficulty (rest period)
- Round 4: Introduce rare variants (building)
- Round 5: Speed increase (tension rising)

**Grand Finale (Rounds 6-7):**
- Round 6: High speed, legendary spawns enabled
- Round 7: Maximum difficulty, all rarity types
- Emma's best chance at rare variants (high stakes)

**Resolution (Energy Depletion):**
- "Session Complete!" screen
- Stats: Total DNA (2,500), Variants unlocked (3), High score (1,850)
- Call-to-action: "Next energy in 25 min" OR "Watch ad to continue?"

**Tyler's Extended Session (30+ rounds, 60+ minutes):**

Tyler plays multiple energy cycles (refills via ads):

```
Interest
   ↑
   │  ╱╲     ╱╲     ╱╲     ╱╲     ╱╲    ╱╲╲ Grand finale: Dynasty complete!
   │╱    ╲ ╱    ╲ ╱    ╲ ╱    ╲ ╱    ╲╱    ╲
   │       ╲╱      ╲╱      ╲╱      ╲╱          ╲
   └──────────────────────────────────────────────→ Time
     Cycle1  Cycle2  Cycle3  Cycle4  Cycle5  Cycle6

Each cycle = 7 rounds (Emma's session)
Tyler chains cycles via ad-watch
Grand finale: Completes full dynasty (all 8 variants)
```

**Tyler's Extended Curve:**
- Multiple session peaks (each energy cycle)
- Long-term goal visible: Collection progress bar (78% → 92% → 100%)
- Grand finale: Unlock final variant of dynasty (major milestone)

## Step 4: Design Long-Term Curves (Days to Weeks)

**Days 1-3: First Dynasty Hook**

```
Interest
   ↑
   │      ╱╲ (B) First Rare unlocked
   │    ╱    ╲
   │  ╱        ╲ (C) 4/8 Commons complete
   │╱            ╲
   │(A)            ╲
   └──────────────────→ Time
     Day1  Day2  Day3

(A) Hook: First play, unlock 2 Common variants
(B) Peak: First Rare variant unlocked (exciting!)
(C) Plateau: Midpoint of first dynasty
```

**Week 1: Dynasty Completion**

```
Interest
   ↑
   │                    ╱╲ (E) Dynasty complete!
   │                  ╱    ╲
   │         (D)    ╱        ╲
   │        ╱╲    ╱            ╲
   │      ╱    ╲╱                ╲
   │    ╱                          ╲
   │  ╱                              ╲
   │╱                                  ╲
   └──────────────────────────────────────→ Time
     D1  D2  D3  D4  D5  D6  D7  D8-14

(D) Mini-peak: First Legendary unlocked
(E) Grand finale: All 8 variants of Fire Dynasty
```

**Weeks 2-4: Unlock All Dynasties**

```
Interest
   ↑
   │                                      ╱╲ (H) All 3 dynasties!
   │           ╱╲              ╱╲        ╱  ╲
   │         ╱    ╲          ╱    ╲    ╱      ╲
   │       ╱        ╲      ╱        ╲╱          ╲
   │     ╱            ╲  ╱                        ╲
   │   ╱                ╲╱
   │ ╱(F)                (G)
   │╱
   └─────────────────────────────────────────────→ Time
     W1   W2   W3   W4   W5   W6   W7   W8

(F) Fire complete
(G) Water complete
(H) Electric complete → Unlock Breeding Lab!
```

**Month+: Breeding & 100% Pursuit**

Emma: Stays satisfied with partial collection
Tyler: Pursues 100% completion (all base variants + all hybrids)

## Step 5: Balance Interest Factors

**Inherent Interest:**
- Risk: High-speed Snake gameplay (one mistake = death)
- Unusual: Collecting DNA to unlock snake variants (novel)
- Dramatic change: Legendary spawn changes round dynamics

**Poetry of Presentation:**
- Visuals: Neon Snake aesthetic, particle effects
- Audio: Satisfying collection sounds, building music
- Animation: Smooth snake movement, juicy feedback

**Projection:**
- Empathy: "That's MY collection" (Panini psychology)
- Imagination: "I'm building a dynasty of snakes"
- Immersion: Flow state during high-speed rounds

**Balance Example (Round 6 Climax):**
```
Inherent Interest: 9/10 (high speed, legendary spawn, high score at risk)
Poetry: 7/10 (neon visuals, intense music, smooth animations)
Projection: 8/10 (Emma's high score record at stake, collection goal visible)

Total Interest: Very High (peak of session)
```

**Balance Example (Round 3 Rest):**
```
Inherent Interest: 5/10 (moderate speed, common spawns)
Poetry: 7/10 (still looks/sounds good)
Projection: 6/10 (progress visible but not critical moment)

Total Interest: Moderate (intentional rest period)
```

## Step 6: Add Rest Periods

**Why Rest Periods:**
- Can't sustain peak interest continuously (exhausting)
- Valleys make peaks feel higher (contrast effect)
- Gives player time to catch breath, process progress

**Micro-Rests (Within Round):**
- After collecting cluster of DNA: 2-3 seconds of calm navigation
- After near-miss: Moment of relief before next challenge

**Mid-Rests (Between Rounds):**
- Round end screen: 3 seconds of stats (no pressure)
- Variant unlock animation: 5 seconds of celebration (pause)

**Macro-Rests (Between Sessions):**
- Energy depletion: Natural stop point
- Collection Lab browsing: No time pressure, exploratory
- Breeding Lab: Creative, not competitive

**Example Rest Implementation:**
```typescript
const getRestPeriod = (roundNumber: number) => {
  // Every 3rd round = rest period
  if (roundNumber % 3 === 0) {
    return {
      speedMultiplier: 0.7, // Slower than previous rounds
      spawnRate: 1.2, // Fewer orbs (less pressure)
      music: 'calm_loop.mp3' // Gentle music
    };
  }
  return normalDifficulty();
};
```

## Step 7: Create Fractal Structure

**Three Levels of Curves:**

**Level 1: Overall Game (Weeks)**
- Hook: First variant unlock
- Rising: Complete first dynasty
- Climax: Unlock all 3 dynasties + Breeding Lab
- Resolution: Pursue 100% collection

**Level 2: Each Session (Minutes)**
- Hook: Round 1 easy DNA
- Rising: Rounds 2-6 build difficulty
- Climax: Round 7 legendary chase
- Resolution: Energy depleted

**Level 3: Each Round (Seconds)**
- Hook: First DNA orbs visible
- Rising: Speed increases
- Climax: High-speed legendary spawn
- Resolution: Death/completion

**Each level follows same shape:**
```
   ╱╲    ← Climax
 ╱    ╲
╱      ╲ ← Resolution
```

**Benefits of Fractal:**
- Consistency: Players learn pattern
- Scalability: Works at any time scale
- Predictability: Players anticipate climaxes

---

## SupaSnake-Specific Implementation

**Core Snake Gameplay:**
- Round curve: 60-90 seconds from hook to climax
- Speed ramp: 60% → 120% over round duration
- Spawn rate: Increases with time
- Music: Builds intensity

**Collection Lab:**
- No pressure curve (exploration, not competition)
- Discovery moments: "Oh, there's a Legendary variant I haven't seen!"
- Progress satisfaction: "67% complete"

**Energy System:**
- Creates session curve: 7 rounds = 1 session ≈ 8 minutes
- Natural pacing: Can't grind indefinitely
- Prevents burnout: Forced rest every 30 minutes

**Dynasty/Breeding:**
- Long-term curve: Days/weeks to complete
- Milestone moments: Dynasty completion = peak
- Breeding unlocks: New layer of progression (second wind for Tyler)

---

## Tips for Success

✅ **DO:**
- Chart expected interest curve before implementing
- Playtest and compare observed interest to expected
- Use telemetry to track moment-by-moment engagement
- Add rest periods intentionally (not just filler)
- Make grand finale significantly more interesting than everything else
- Leave Emma wanting more (energy depletes at session peak, not trough)

❌ **DON'T:**
- Peak too early (save best for last)
- Sustain high intensity too long (exhausting)
- Forget hook (grab attention immediately)
- Let middle sag (flat interest = player quits)
- Ignore long-term curve (Emma plays for weeks, not just one session)
- Make every round identical (no variety = boring)

---

## Emma vs Tyler Curve Differences

**Emma (Short Sessions):**
- Steep curve: 0 → Peak in 8 minutes
- Clear endpoint: Energy depletion signals "good stopping point"
- Daily habit: Returns tomorrow (long-term curve via repetition)
- Needs: Fast hook, quick climax, clean resolution

**Tyler (Long Sessions):**
- Multi-cycle curve: Chains multiple energy refills
- Long-term visible: Collection progress (75% → 100%)
- Deeper engagement: Breeding Lab, stats tracking
- Needs: Extended pursuit, visible long-term goals

**Design Solution:**
- Energy system satisfies both (gates Emma, refillable for Tyler)
- Collection % visible (Tyler's long-term goal)
- Breeding unlocks late (Tyler's reward for persistence)

---

## Testing Checklist

**Hook:**
- [ ] Does Round 1 grab attention within 15 seconds?
- [ ] First DNA collection within 10 seconds?
- [ ] Clear goal immediately (survive + collect)?

**Rising Interest:**
- [ ] Does difficulty gradually increase (not sudden spike)?
- [ ] Peaks and valleys visible in playtest data?
- [ ] Rest periods feel intentional (not boring filler)?

**Grand Finale:**
- [ ] Round 7 noticeably harder/more exciting than Round 1?
- [ ] Legendary spawn creates peak tension?
- [ ] Session end feels climactic (not random)?

**Resolution:**
- [ ] Energy depletion feels natural (not punishing)?
- [ ] Stats screen provides satisfaction?
- [ ] "Wanting more" feeling (not "glad that's over")?

**Fractal:**
- [ ] Round curve mirrors session curve?
- [ ] Session curve mirrors long-term curve?
- [ ] Consistent shape at all time scales?

---

## See Also

- **Quick Ref:** @knowledge_base/game_design/quick_ref/concept_interest_curves.md
- **Quick Ref:** @knowledge_base/game_design/quick_ref/concept_pacing.md
- **SupaSnake:** @knowledge_base/game/quick_ref/player_journey.md
- **SupaSnake:** @knowledge_base/game/quick_ref/energy_system.md
- **Lenses:** Lens #68 (Moments), Lens #69 (Interest Curve), Lens #70 (Inherent Interest), Lens #71 (Beauty), Lens #72 (Projection)
