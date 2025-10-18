# How to Create Presence in Mobile Games

**Goal**: Build a sense of immersion and "being there" in SupaSnake despite the constraints of 2D mobile interfaces, creating engagement that transcends the small screen.

**Timeline**: Presence is built through iterative polish over weeks/months, not a single implementation

**Prerequisites**: Understanding of mobile UX, performance optimization basics, and SupaSnake's core systems

---

## Overview

Presence—the feeling of inhabiting the game world—is traditionally associated with VR or immersive 3D environments. However, mobile 2D games can create powerful presence through responsiveness, polish, consistent logic, and emotional investment. Players should feel connected to their snake collection, engaged in the Labs, and mentally present in SupaSnake's world, not just mechanically tapping a screen.

**Three Pillars of Mobile Presence:**
1. **Technical Responsiveness**: Instant, smooth feedback
2. **Visual & Audio Polish**: Cohesive, high-quality presentation
3. **Emotional Investment**: Player cares about outcomes

---

## Step 1: Achieve Technical Responsiveness

Presence collapses when there's lag between intention and response. Mobile games must feel instant.

### Target: Sub-50ms Input Latency

**What This Means:**
- Tap to visual response: <50 milliseconds
- Scroll to movement: Immediate (no perceptible delay)
- Animation start: Within 1-2 frames of trigger
- Audio feedback: Synchronized with visual (no drift)

**Implementation:**

**Touch Handling (React Native / TypeScript)**
```typescript
// ❌ BAD: Delayed response
<Pressable onPress={() => handleBreed()}>

// ✅ GOOD: Immediate visual feedback
<Pressable
  onPressIn={() => setPressed(true)}  // Instant visual
  onPress={() => handleBreed()}       // Then action
  onPressOut={() => setPressed(false)}
>
```

**Optimized Event Handling**
- Use `onPressIn` for immediate visual feedback
- Debounce only when necessary (prevent double-tap)
- Don't throttle interactive elements
- Prioritize UI thread (async heavy work)

**Frame Budget Management**
```typescript
// 60fps = 16.67ms per frame
// Budget breakdown for smooth interaction:
const FRAME_BUDGET = {
  input: 2,      // Touch handling
  logic: 5,      // Game logic update
  layout: 4,     // UI recalculation
  render: 5,     // Drawing to screen
  margin: 0.67   // Safety buffer
};

// Anything exceeding budget causes stutter
```

### 60 FPS Everywhere

**Critical Smooth Areas:**
- Collection Lab scrolling (most frequent interaction)
- Breeding Lab preview updates
- Evolution transformation animation
- Classic Mode gameplay (obviously)
- All transitions between screens

**Optimization Techniques:**

**1. Lazy Loading**
```typescript
// Collection Lab: Only render visible cards
<FlatList
  data={snakeCollection}
  renderItem={({item}) => <SnakeCard snake={item} />}
  windowSize={10}  // Render 10 screens worth, not all
  maxToRenderPerBatch={10}
  removeClippedSubviews={true}
  initialNumToRender={6}
/>
```

**2. Memoization**
```typescript
// Prevent unnecessary re-renders
const SnakeCard = React.memo(({snake}) => {
  // Only re-render if snake data changes
}, (prev, next) => prev.snake.id === next.snake.id);
```

**3. Offload Heavy Work**
```typescript
// Compute breeding probabilities asynchronously
useEffect(() => {
  const worker = new Worker('./breedingCalculator');
  worker.postMessage({parent1, parent2});
  worker.onmessage = (result) => setPreview(result);
}, [parent1, parent2]);
```

**4. Asset Optimization**
- Snake sprites: WebP format, <50KB each
- Backgrounds: Compressed, reused across Labs
- Audio: Compressed OGG/AAC, preloaded
- Fonts: Only weights needed, subset for characters used

### Haptic Feedback

**When to Use:**
- Important actions (breeding, evolution)
- Success moments (rare variant revealed)
- Error prevention (can't afford this)
- Satisfying interactions (card flip, selection)

**Implementation:**
```typescript
import * as Haptics from 'expo-haptics';

// Light tap for normal interactions
const onCardSelect = () => {
  Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light);
  selectSnake(snake);
};

// Medium impact for confirmations
const onBreedConfirm = () => {
  Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Medium);
  performBreeding();
};

// Heavy for major moments
const onRareVariantRevealed = () => {
  Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Heavy);
  Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success);
};
```

**Don't Overuse:**
- Not every tap needs haptics (fatigue)
- Provide settings toggle (some users dislike)
- Battery consideration (haptics drain power)

---

## Step 2: Create Visual & Audio Polish

Cohesive, high-quality presentation maintains the reality of the game world.

### Consistent Art Direction

**Visual Coherence Checklist:**
- [ ] Unified color palette across all Labs
- [ ] Consistent line weight / stroke style
- [ ] Harmonious typography (2-3 fonts max)
- [ ] Lighting direction consistent per Lab
- [ ] Shadow style matches (soft vs hard, color)
- [ ] Button/UI element style unified
- [ ] Animation easing curves standardized

**SupaSnake Visual Identity:**
```
Color System:
  Primary Blue: #4A90E2 (Collection)
  Primary Purple: #9B59B6 (Breeding)
  Primary Gold: #F39C12 (Evolution)

  Neutrals:
    White: #FFFFFF
    Light Gray: #ECF0F1
    Medium Gray: #95A5A6
    Dark Gray: #34495E

  Feedback:
    Success: #2ECC71 (green)
    Error: #E74C3C (red)
    Warning: #F39C12 (orange)
    Info: #3498DB (blue)

Typography:
  Display: Fredoka One (fun, game-like)
  UI: Inter (clean, readable)
  Body: Inter (consistent with UI)

  Sizes:
    H1: 32px (Lab titles)
    H2: 24px (Section headers)
    Body: 16px (Descriptions)
    Small: 14px (Details, stats)
    Tiny: 12px (Metadata)
```

### Micro-Animations

Small animations create life and feedback.

**Examples:**

**Card Selection (Collection Lab)**
```typescript
// Animated scale on select
<Animated.View style={{
  transform: [{
    scale: isSelected
      ? springAnimation.interpolate({
          inputRange: [0, 1],
          outputRange: [1.0, 1.05]
        })
      : 1.0
  }],
  borderWidth: isSelected ? 3 : 1,
  borderColor: isSelected ? COLORS.primary : COLORS.gray
}}>
  <SnakeCard />
</Animated.View>
```

**Button Press (Any Lab)**
```typescript
// Subtle scale down on press
<Pressable
  style={({pressed}) => ({
    transform: [{ scale: pressed ? 0.95 : 1.0 }],
    opacity: pressed ? 0.9 : 1.0
  })}
>
```

**Loading Indicator (Breeding Preview)**
```typescript
// Pulsing glow while computing
<Animated.View style={{
  opacity: pulseAnimation.interpolate({
    inputRange: [0, 1],
    outputRange: [0.5, 1.0]
  }),
  shadowRadius: pulseAnimation.interpolate({
    inputRange: [0, 1],
    outputRange: [5, 15]
  })
}}>
  <Text>Computing...</Text>
</Animated.View>
```

**Principle:** Every interaction deserves acknowledgment (visual or haptic).

### Audio Design

**Sound Categories:**

**UI Sounds (Short, Clear)**
- Tap: Soft click (50-100ms)
- Select: Slightly pitched click (100ms)
- Confirm: Satisfying "thunk" (150ms)
- Cancel/Back: Softer reverse sound (100ms)
- Error: Gentle "nope" tone (200ms)

**Feedback Sounds (Emotional)**
- Success (Common): Cheerful ding (300ms)
- Success (Rare): Fanfare (1-2s)
- Level Up: Achievement chord (500ms)
- Unlock: Mystery reveal (700ms)

**Ambient Sounds (Optional, Per Lab)**
- Collection Lab: Quiet, occasional bird chirps
- Breeding Lab: Bubbling, experiment sounds
- Evolution Lab: Mystical hum, energy sounds
- Classic Mode: Retro game music

**Implementation:**
```typescript
import { Audio } from 'expo-av';

// Preload sounds at app start
const sounds = {
  tap: await Audio.Sound.createAsync(require('./tap.mp3')),
  success: await Audio.Sound.createAsync(require('./success.mp3')),
  rare: await Audio.Sound.createAsync(require('./rare.mp3')),
};

// Play with volume control
const playSound = async (soundName, volume = 1.0) => {
  if (settings.soundEnabled) {
    await sounds[soundName].replayAsync();
    await sounds[soundName].setVolumeAsync(volume);
  }
};
```

**Audio Best Practices:**
- Keep files small (<100KB each for UI sounds)
- Provide volume slider in settings
- Mute option (respect player context)
- No audio required for playability (accessibility)
- Preload all sounds (no loading delays)

### Particle Effects

**When to Use:**
- Major moments (rare breeding reveal, evolution completion)
- Success celebrations (collection milestone)
- Special power-ups (Classic Mode)
- Transitions between states (Lab unlock)

**Example: Rare Variant Reveal**
```typescript
import ParticleEmitter from './ParticleEmitter';

<ParticleEmitter
  particleCount={50}
  colors={['#FFD700', '#FFA500', '#FF6347']}
  emitterPosition={{x: centerX, y: centerY}}
  duration={2000}
  spread={360}
  velocity={{min: 100, max: 300}}
  gravity={200}
/>
```

**Don't Overuse:**
- Reserve for genuinely special moments
- Skippable after first viewing
- Performance budget (particles are expensive)
- Settings toggle for low-end devices

---

## Step 3: Build Emotional Investment

Players must care about outcomes for presence to matter.

### Ownership & Personalization

**"This is MINE"**

**Techniques:**
- Language: "Your Collection" not "The Collection"
- Unique results: Breeding creates YOUR snakes, not generic templates
- History: Track YOUR breeding experiments, evolutions
- Statistics: YOUR achievements, YOUR progress
- Future: Custom names, favorites, organization

**Implementation:**
```typescript
// Personalized language throughout
<Text>Your {dynasty} Collection</Text>
<Text>You've bred {breedCount} snakes</Text>
<Text>Your rarest: {rarest.name}</Text>

// User-generated content
<Input
  placeholder="Name your snake..."
  value={customName}
  onChange={setCustomName}
/>
```

### Meaningful Progression

**Every action advances something:**

**Short-Term (Session Goals)**
- Breed 3 snakes → Get closer to variant completion
- Play Classic Mode → Earn DNA for next breeding
- Evolve snake → Immediately see stat improvement

**Medium-Term (Weekly Goals)**
- Complete a dynasty → Unlock new breeding options
- Reach DNA milestone → Access Evolution Lab
- Collect all variants → Dynasty mastery achievement

**Long-Term (Monthly+ Goals)**
- Complete all dynasties → True mastery
- Collect every variant → Completionist achievement
- Max evolve signature snakes → Ultimate power

**Visible Progress:**
```typescript
// Collection Lab
<ProgressBar
  current={variantsCollected}
  total={variantsAvailable}
  label="Viper Dynasty: 8/12"
/>

// Profile/Stats
<StatDisplay>
  Total Breeds: {totalBreeds}
  Rarest Found: {rarestRarity}
  Dynasties Mastered: {masterCount}/3
  Evolution Tier: {maxTier}
</StatDisplay>
```

### Emotional Moments

**Design for Memorable Peaks:**

**Joy (Success Moments)**
- Rare variant revealed: Special animation, fanfare
- Collection completed: Celebration screen, achievement
- Evolution maxed: Transformation spectacular
- High score beaten: Confetti, leaderboard update

**Anticipation (Building Tension)**
- Breeding egg shaking before reveal
- Evolution progress bar filling
- Collection meter approaching 100%
- DNA count approaching goal

**Pride (Accomplishment)**
- Showcase YOUR collection (visual gallery)
- Compare before/after evolution
- Achievement gallery
- Statistics summary

**Curiosity (Discovery)**
- Hints of unrevealed content (silhouettes)
- Mysterious locked variants
- Evolution paths to explore
- Breeding combination experiments

**Implementation Example: Rare Breeding Reveal**
```typescript
const RevealAnimation = () => {
  // 1. Build tension
  await animateEggShaking(2000);

  // 2. Moment of reveal
  await animateEggCrack(500);
  Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Heavy);

  // 3. Celebrate (if rare)
  if (result.rarity === 'Legendary') {
    playSound('rare');
    showParticleEffect();
    await animateSnakeSparkle(1500);
  } else {
    playSound('success');
  }

  // 4. Display result
  await fadeInSnakeCard(500);

  // 5. Allow savoring
  // Don't auto-dismiss - player controls when to continue
};
```

---

## Step 4: Maintain Consistent Game Logic

Presence breaks when the world doesn't make sense.

### Establish Clear Rules

**Breeding Rules:**
- Same dynasty only (biological logic)
- Variant inheritance follows genetics
- Rarity determined by parent rarity
- DNA cost scales with rarity

**Evolution Rules:**
- Unlocked at specific level/achievement
- Requires specific snake type
- Stat increases are predictable
- Non-reversible (make clear upfront)

**Collection Rules:**
- Variants discovered through breeding
- No duplicate removal (show count)
- Permanent (never lose collected snakes)
- Visible progress tracking

**Economy Rules:**
- DNA earned through Classic Mode
- Breeding costs DNA
- No real money to DNA (fair progression)
- No energy/timer systems (play freely)

### Never Break Established Rules

**Consistency Checklist:**
- [ ] Breeding always costs DNA (no surprise free breeds)
- [ ] Evolution requirements don't change unexpectedly
- [ ] Rarity system stable (legendary stays legendary)
- [ ] UI behavior predictable (back button always works same way)
- [ ] Visual language consistent (locked icon always means same thing)

**Example: DNA Display**
```typescript
// Always show DNA in same location (top right)
<View style={styles.currencyDisplay}>
  <Icon name="dna" />
  <Text>{dnaAmount}</Text>
</View>

// Consistent across ALL screens
// Players develop spatial memory
```

### Transparent Costs & Consequences

**Before Player Commits:**

**Breeding Confirmation**
```typescript
<ConfirmationModal>
  <Text>Breed {parent1.name} + {parent2.name}?</Text>
  <Text>Cost: {breedCost} DNA</Text>
  <Text>Your DNA: {currentDNA}</Text>
  <Text>Remaining: {currentDNA - breedCost}</Text>

  <Button>Confirm</Button>
  <Button>Cancel</Button>
</ConfirmationModal>
```

**Evolution Warning**
```typescript
<EvolutionModal>
  <Text>Evolve {snake.name}?</Text>
  <ComparisonView before={currentStats} after={evolvedStats} />
  <Warning>Evolution is permanent and cannot be undone</Warning>

  <Button>Evolve</Button>
  <Button>Cancel</Button>
</EvolutionModal>
```

**No Hidden Surprises:**
- Show all costs upfront
- Preview results when possible
- Warn about irreversible actions
- Confirm before destructive operations

---

## Step 5: Respect Mobile Context

Mobile games exist in interrupted, varied contexts. Presence must accommodate this.

### Interruptibility Without Penalty

**Save State Perfectly:**
```typescript
// Save on every significant action
const saveGameState = async () => {
  await AsyncStorage.setItem('gameState', JSON.stringify({
    collection: snakeCollection,
    dna: currentDNA,
    achievements: achievements,
    currentLab: activeLab,
    breedingProgress: breedingState,
    // ... everything needed to resume exactly
  }));
};

// Trigger saves:
useEffect(() => {
  AppState.addEventListener('change', (state) => {
    if (state === 'background' || state === 'inactive') {
      saveGameState();
    }
  });
}, []);
```

**Resume Exactly Where Left Off:**
```typescript
// On app launch
const restoreGameState = async () => {
  const saved = await AsyncStorage.getItem('gameState');
  if (saved) {
    const state = JSON.parse(saved);

    // Restore everything
    setSnakeCollection(state.collection);
    setCurrentDNA(state.dna);
    setAchievements(state.achievements);

    // Return to exact screen
    navigation.navigate(state.currentLab);

    // Restore in-progress actions
    if (state.breedingProgress) {
      restoreBreedingState(state.breedingProgress);
    }
  }
};
```

**No Punishment for Interruption:**
- Phone call during Classic Mode? Pause automatically
- App backgrounded during breeding? Save progress
- Battery dies? Resume exactly where stopped
- Days away? Welcome back, no penalty

### Flexible Session Length

**Quick Sessions (30 seconds - 2 minutes)**
- Check collection progress
- Quick breed or two
- View new unlocks
- Check achievements

**Medium Sessions (5-10 minutes)**
- Focused breeding experiments
- Classic Mode runs
- Evolution planning
- Collection organization

**Long Sessions (20+ minutes)**
- Complete dynasty collection push
- Multiple evolutions
- Extended Classic Mode
- Experimentation and exploration

**Design Implication:**
Every Lab should be satisfying in 30-second bursts AND extended sessions.

### One-Handed Comfort

**Thumb-Friendly Layouts:**
```
Critical Interaction Zones (Portrait):
┌──────────────────┐
│                  │ ← Reach zone (awkward, info only)
│     CONTENT      │
│                  │
│                  │ ← Sweet spot (main content)
│   [Primary CTA]  │ ← Thumb zone (actions here)
└──────────────────┘
```

**Test on Real Devices:**
- Can you tap everything with one hand?
- Are buttons large enough? (minimum 44x44 points)
- Is primary action in comfortable zone?
- Can you play on a crowded bus? (test in real context)

### Environmental Flexibility

**Readable in Sunlight:**
- High contrast UI elements
- No subtle gray-on-gray
- Dark mode option (future)
- No reliance on color alone

**Playable Without Audio:**
- Visual feedback for all audio cues
- Captions for important sounds
- No audio-dependent gameplay
- Full experience in silent mode

**Works on Lower-End Devices:**
- Graceful degradation (reduce particles if slow)
- 30 FPS acceptable on old devices (vs 60 on modern)
- Low power mode (reduce animations)
- Performance settings toggle

---

## Step 6: Test and Iterate Presence

Presence is felt, not measured—but you can observe indicators.

### Qualitative Playtesting

**Watch for:**
- **Engagement**: Do players lean in or lean back?
- **Emotional reactions**: Smiles, fist pumps, sighs?
- **Time awareness**: Do they check the clock or lose track?
- **Interruption resistance**: Annoyed when interrupted?
- **Spontaneous commentary**: "Yes!" or "Come on..."?
- **Return intent**: "Can I play more?"

**Interview Questions:**
- "How did that feel?" (after key moments)
- "What were you thinking when...?"
- "Did you feel like you were just tapping, or...?"
- "What would you change?"
- "On a scale of 1-10, how absorbed were you?"

### Quantitative Metrics

**Session Metrics:**
- Average session length (target: 5-10 minutes)
- Sessions per day (target: 2-4)
- Return rate (target: 60%+ day 1, 40%+ day 7)
- Time to first action (faster = better engagement)

**Engagement Depth:**
- Actions per session (more = deeper engagement)
- Feature usage (do they explore all Labs?)
- Completion rates (achievements, collections)
- Sharing rate (proud moments worth sharing?)

**Technical Performance:**
- Frame rate consistency (>95% frames at target)
- Crash rate (target: <0.1% of sessions)
- Input latency (target: <50ms)
- Load times (target: <2 seconds to playable)

### A/B Testing Presence Elements

**Testable Variables:**

**Animation Duration**
- A: Breeding reveal 3 seconds
- B: Breeding reveal 1.5 seconds
- Measure: Skip rate, satisfaction surveys

**Haptic Intensity**
- A: Haptics on all interactions
- B: Haptics on major moments only
- Measure: Settings toggle rate, engagement

**Visual Polish Level**
- A: Full particle effects, shadows, animations
- B: Simplified visuals (performance gain)
- Measure: Session length, return rate, by device type

**Audio Presence**
- A: Ambient sound + UI sound + music
- B: UI sounds only
- C: No audio
- Measure: Immersion ratings, session length

---

## Common Presence-Breaking Mistakes

**❌ Lag and Stutter**
- Touch input delay
- Inconsistent frame rate
- Loading screens mid-flow
- Audio desync

**✅ Fix**: Profile performance, optimize rendering, preload assets, test on low-end devices

**❌ Inconsistent Feedback**
- Some taps have response, others don't
- Animations sometimes play, sometimes skip
- Sounds play intermittently
- Haptics work randomly

**✅ Fix**: Ensure EVERY interaction has feedback, test exhaustively, handle edge cases

**❌ Confusing Navigation**
- Back button behavior unpredictable
- Transitions disorient (wrong direction)
- Modal vs screen confusion
- Getting lost in menus

**✅ Fix**: Consistent navigation patterns, spatial logic, clear breadcrumbs, easy escape

**❌ Arbitrary Limitations**
- Unexplained locks
- Confusing resource costs
- Rules that don't make sense
- Inconsistent systems

**✅ Fix**: Transparent requirements, logical rules, consistent systems, clear explanations

**❌ Disrespecting Time**
- Forced waits (artificial timers)
- Unskippable animations (after first view)
- Convoluted multi-step actions
- Lost progress from interruptions

**✅ Fix**: Respect player time, make actions efficient, save everything, skip options

---

## Checklist: Presence Quality Audit

Before launch and quarterly:

**Technical Foundation**
- [ ] Touch response <50ms on target devices
- [ ] 60 FPS maintained in all critical interactions
- [ ] No crashes in 100+ session test
- [ ] Smooth animations (no visible stutter)
- [ ] Audio synchronized with visual
- [ ] Haptic feedback working on supported devices

**Visual & Audio Polish**
- [ ] Consistent art style (no obvious mismatches)
- [ ] UI elements have hover/press states
- [ ] All interactions have visual feedback
- [ ] Sound effects for key actions
- [ ] Loading states always visible (no dead air)
- [ ] Particle effects for special moments

**Emotional Design**
- [ ] Celebration for achievements
- [ ] Anticipation build-up for reveals
- [ ] Clear progress visualization
- [ ] Personal language ("Your Collection")
- [ ] Memorable peak moments designed
- [ ] Emotional variety (joy, curiosity, pride)

**Logical Consistency**
- [ ] Game rules clearly explained
- [ ] No arbitrary rule changes
- [ ] Costs transparent before commitment
- [ ] Reversible vs irreversible clearly marked
- [ ] Consistent UI patterns throughout

**Mobile Optimization**
- [ ] One-handed playability
- [ ] Save/resume works perfectly
- [ ] Interruptible without penalty
- [ ] Readable in bright light
- [ ] Playable without audio
- [ ] Performance settings for low-end devices

**Playtesting Validation**
- [ ] 5+ fresh users tested
- [ ] Observed engagement indicators
- [ ] Interviewed for emotional response
- [ ] Measured session length and return rate
- [ ] Fixed critical confusion points

---

**See Also:**
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_presence.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_immersion.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/lens_80_empathy.md
- **How-To**: @knowledge_base/game_design/how_to/design_lab_spaces.md
- **Reference**: @knowledge_base/game_design/reference/batch3_chapters/chapter_22_presence_summary.md
- **Game Docs**: @knowledge_base/game/quick_ref/ui_framework.md
