# How to Design Mobile Touch Interface for SupaSnake

**Schell's Principle:** Interface goal is to make players feel in control. Touch interfaces are "primal" (300+ million years of evolution vs 3 million for tool use), making them intuitive. Good interfaces become transparent (invisible with practice), provide juicy feedback (second-order motion), and respond within 0.1 seconds.

**SupaSnake Context:** Mobile-first Snake + collection hybrid needs gesture-based Snake control (swipe), tap-based Collection/Breeding Lab navigation, minimal HUD during gameplay, and maximum juiciness on every interaction.

---

## Overview

Mobile touch interfaces succeed when they leverage primality (direct manipulation feels natural), provide immediate feedback (<0.1s response time), become transparent with practice, and reward players through multiple channels simultaneously (visual + audio + progression). SupaSnake needs gesture control for fast-paced Snake gameplay and tap-based UI for collection browsing.

## Step 1: Map Physical Interface (Touch Gestures)

**Identify Core Actions:**
- Snake movement (constant, high-frequency input)
- Collection browsing (occasional, exploratory)
- Breeding selection (deliberate, creative)
- Mode switching (infrequent transitions)

**Choose Touch Gestures:**

**Snake Control (Classic Mode):**
- **Swipe Up/Down/Left/Right** = Change snake direction
- Why swipe? Primal (direct manipulation), fast (no button hunting), full-screen (no UI clutter)
- Alternative considered: Virtual d-pad (rejected - not primal, obscures screen)
- Alternative considered: Tilt control (rejected - doesn't work on train/bus)

**Collection Lab:**
- **Tap variant card** = View details
- **Swipe left/right on card list** = Browse variants
- Why tap? Universal touch interaction, feels like flipping physical cards
- Why swipe for browsing? Natural page-turning metaphor

**Breeding Lab:**
- **Tap dynasty icon** = Select parent 1
- **Tap second dynasty icon** = Select parent 2
- **Tap "Breed" button** = Combine (costs DNA)
- Why taps? Deliberate actions need confirmation (not accidental swipes)

**Example from SupaSnake:**
```typescript
// Snake gesture recognition (React Native)
const handleSwipe = (direction: 'up' | 'down' | 'left' | 'right') => {
  // Respond within 0.1s (tenth-second rule)
  setSnakeDirection(direction);
  playSwipeSound(); // Audio feedback
  // No animation delay - instant response
};

<GestureRecognizer
  onSwipeUp={() => handleSwipe('up')}
  onSwipeDown={() => handleSwipe('down')}
  onSwipeLeft={() => handleSwipe('left')}
  onSwipeRight={() => handleSwipe('right')}
>
  <SnakeGrid />
</GestureRecognizer>
```

**Primality Check:**
- Can an animal do this? YES (primates can swipe/tap)
- Direct manipulation? YES (finger touches snake grid)
- No tool metaphor? YES (not emulating controller)

## Step 2: Design Virtual Interface (On-Screen UI)

**List & Prioritize Information:**

**Need to see every moment (Classic Mode):**
- Snake position (in game world, not UI)
- DNA orbs to collect (in game world)

**Need to glance at occasionally:**
- Current score (top-left corner)
- Energy remaining (bottom bar)
- DNA collected this round (top-right)

**Need to see only after round:**
- Session stats (end-screen modal)
- Variant unlocks (celebration popup)

**List Channels:**
- Top-left: Score display
- Top-right: DNA counter
- Bottom: Energy bar
- Center (temporary): Variant unlock celebration
- Background: Snake grid (full-screen)

**Map Info to Channels:**

**Classic Mode Dashboard (Minimal):**
```
┌─────────────────────────────┐
│ Score: 1,250    DNA: 850    │ ← Top bar (transparent background)
│                             │
│                             │
│      [Snake Grid]           │ ← Full-screen gameplay
│                             │
│                             │
│ [●●●●●○○] Energy: 5/7       │ ← Bottom bar (energy dots)
└─────────────────────────────┘
```

**Collection Lab (Information-Dense):**
```
┌─────────────────────────────┐
│  Collection Lab   [X Close] │ ← Mode indicator
│  42% Complete               │
│                             │
│  [Dynasty Tabs: 🔥 🌊 ⚡]   │ ← Tab navigation
│                             │
│  [Variant Card]             │ ← Swipeable card stack
│   Common Cobra              │
│   [Visual] [Stats]          │
│   DNA: 50  Gen: 1           │
│                             │
│  [◄ Prev] [Next ►]          │ ← Backup nav (accessibility)
└─────────────────────────────┘
```

**Review Dimensions on Each Channel:**

**DNA Counter Channel:**
- Number (main info): 850
- Color: Changes based on rarity collected (white = common, blue = rare, gold = legendary)
- Size: Increases briefly on large collection (+100 DNA)
- Animation: Number increments smoothly (not instant jump)

**Energy Bar Channel:**
- Dots filled/empty (main info): 5/7 dots filled
- Color: Green (full) → Yellow (half) → Red (1 left)
- Size: Dots pulse when low energy
- Sound: Gentle chime when energy depletes

## Step 3: Create Juicy Feedback Loops

**Apply Tenth-Second Rule (<0.1s):**

**Snake Direction Change:**
- Player swipes → Snake turns within 0.05s
- No wind-up animation (violates tenth-second rule)
- Immediate visual + audio confirmation

**DNA Collection:**
- Snake touches orb → Orb disappears within 0.05s
- Number popup appears instantly
- Sound plays immediately
- Counter increments smoothly (0.2s animation)

**Bad Example to Avoid:**
```typescript
// DON'T: Delayed response
const collectDNA = async (orb) => {
  await playAnimation('snake_eating'); // 0.5s delay!
  orb.remove(); // Too late - player confused
  updateCounter();
};

// DO: Immediate response
const collectDNA = (orb) => {
  orb.remove(); // Instant
  playCollectSound(); // Instant
  showNumberPopup(orb.value); // Instant
  animateCounterIncrement(orb.value); // Smooth increment
};
```

**Create Second-Order Motion (Juiciness):**

**Snake Tail Follow:**
- Player swipes left → Head turns instantly
- Tail segments follow with smooth physics (second-order motion)
- Creates satisfying "whip" effect on sharp turns

**DNA Number Popup:**
- Collection triggers → Number appears at collection point
- Floats upward with easing (second-order motion)
- Fades out gradually (pleasant visual reward)

**Variant Unlock Celebration:**
- Unlock triggers → Card flips from center (second-order motion)
- Particles burst outward (second-order motion)
- "New!" badge bounces (second-order motion)

**Swiffer Lesson Applied:**
- Swiffer base rotates dramatically from small wrist twist
- SupaSnake: Small swipe → Dramatic tail whip, particle bursts, number floats
- Feels juicy and rewarding

## Step 4: Ensure Transparency (Interface Becomes Invisible)

**Practice Makes Invisible:**

**Round 1 (Learning):**
- Emma consciously thinks "swipe left to turn"
- Looks at energy bar to understand system
- Reads DNA counter to see what it means

**Round 5 (Transparent):**
- Emma doesn't think "swipe" - she just moves
- Peripheral vision tracks energy (doesn't look directly)
- Focus entirely on Snake gameplay (immersed)

**Design for Transparency:**

1. **Consistent Mapping:** Swipe left ALWAYS turns left (no mode where it means something else)
2. **Minimal HUD:** Only essential info during gameplay (score, DNA, energy)
3. **Predictable Behavior:** Snake always responds same way to swipes
4. **No Hidden Mechanics:** All rules clear from observation (no surprise deaths)

**Transparency Checklist:**
- [ ] Can Emma play after 3 rounds without thinking about controls?
- [ ] Does HUD fade into background (or stay minimal)?
- [ ] Are there confusing edge cases? (near walls, during speed-up)
- [ ] Can Emma play while distracted (on bus, half-watching)?

## Step 5: Design Mode Changes with Clear Visual Differentiation

**Mode Tip #3: Make Different Modes Look as Different as Possible**

**Classic Mode:**
- Dark background (space/grid theme)
- Neon snake (glowing trail)
- Minimal UI (score + DNA + energy only)
- Fast-paced music

**Collection Lab Mode:**
- Bright background (laboratory/museum aesthetic)
- Panini book visual metaphor (cards, stats)
- Information-rich UI (tabs, details, progress bars)
- Calm ambient music

**Breeding Lab Mode:**
- Lab equipment visuals (beakers, DNA helixes)
- Combination interface (drag-and-drop feel)
- Cost display prominent (DNA required for breed)
- Science-themed sounds

**Mode Transition:**
- Clear "Entering Collection Lab" text overlay
- Screen wipes or fades (not instant cut)
- Music crossfade (signal mode change aurally)
- Different primary color (blue = Classic, gold = Collection, green = Breeding)

## Step 6: Balance Simplicity with Layers

**Layer 1: Core Gameplay (Classic Mode):**
- Minimal: Swipe to move, avoid walls, collect DNA
- HUD: Score, DNA, energy only
- No submenus, no settings during gameplay

**Layer 2: Collection & Progression:**
- Access via "Collection Lab" button after round
- Detailed UI: Tabs, cards, stats, progress bars
- Non-urgent: Browse at leisure, no time pressure

**Layer 3: Breeding & Meta-Game:**
- Access via "Breeding Lab" button from Collection
- Complex: Dynasty selection, cost calculation, generation tracking
- Optional: Tyler engages, Emma might skip

**Balance Achieved:**
- Emma: Stays in Layer 1 (quick sessions, no depth needed)
- Tyler: Explores Layers 2-3 (depth for engagement)
- Both: Clean experience (no forced complexity)

## Step 7: Theme Interface to Game World

**Unification (Lens #11):**

**Classic Mode Theme:** Neon cyberspace Snake
- Grid: Glowing lines (Tron aesthetic)
- Snake: Neon trail effect
- DNA orbs: Glowing particles
- Font: Futuristic, digital

**Collection Lab Theme:** Panini sticker book nostalgia
- Cards: Physical card aesthetic (shadows, borders)
- Layout: Album/binder visual metaphor
- Font: Handwritten for "rarity" labels
- Sounds: Card flip, album page turn

**Breeding Lab Theme:** Scientific laboratory
- Beakers, test tubes, DNA helixes in background
- Combination interface feels like chemistry set
- Font: Scientific, clean
- Sounds: Bubbling, scientific beeps

**Cross-Mode Consistency:**
- Dynasty icons always same across modes (🔥 = Fire, 🌊 = Water, ⚡ = Electric)
- DNA currency uses same visual icon (helix symbol)
- Variant rarity colors consistent (white/blue/gold)

## Step 8: Sound Maps to Touch

**Simulate Tactile Feedback:**

**Snake Swipe:**
- Sound: Soft "swish" on direction change
- Simulates: Physical joystick click
- Feels: Responsive, confirms input received

**DNA Collection:**
- Sound: Pleasant "ting" (like coin pickup)
- Simulates: Picking up physical object
- Feels: Satisfying, rewarding

**Variant Card Tap:**
- Sound: Card flip sound
- Simulates: Physical card being turned over
- Feels: Tactile, like handling collection

**Energy Depletion:**
- Sound: Gentle descending chime
- Simulates: Power-down feeling
- Feels: Session naturally ending (not punishing)

**Volume Mixing:**
- Gameplay sounds: Medium volume (swish, ting)
- Celebration sounds: Louder (variant unlock)
- Ambient music: Quieter (background only)

---

## SupaSnake-Specific Implementation

**Core Snake Gameplay:**
- Swipe gestures: Full-screen detection (React Native PanResponder)
- Response time: <50ms (well under 0.1s rule)
- Feedback: Swish sound + instant turn + tail physics
- Transparency: After 3 rounds, Emma plays without thinking

**Collection Lab:**
- Tap targets: Minimum 44x44pt (Apple HIG recommendation)
- Card swipe: Horizontal pan gesture for browsing
- Variant details: Modal overlay (tap to dismiss OR swipe down)
- Progress bars: Animated fills (second-order motion)

**Energy System:**
- Visual: 7 dots at bottom (filled/empty)
- Color-coded: Green → Yellow → Red as energy depletes
- Sound: Chime on each round completion (tracks energy)
- Feedback: "1 round left!" notification (prevents surprise)

**Dynasty/Breeding:**
- Tap-to-select: Dynasty icons highlight on tap
- Drag-and-drop: Drag dynasty icons to combination slots (optional, could be tap-based)
- Cost preview: DNA cost shown BEFORE breed button enabled (prevents frustration)
- Confirmation: "Breed for 500 DNA?" modal (prevents accidents)

---

## Tips for Success

✅ **DO:**
- Respond within 0.1s to every touch input
- Use full-screen swipe area (no tiny buttons during Snake gameplay)
- Provide multiple feedback types simultaneously (visual + audio + haptic if available)
- Make modes look completely different (color, aesthetic, music)
- Keep HUD minimal during action gameplay
- Test on device with actual touch (not simulator)

❌ **DON'T:**
- Delay response for animations (instant > pretty)
- Clutter screen with unnecessary UI during gameplay
- Use same gesture for different actions in different modes (confusing)
- Forget sound feedback (touch screens need audio compensation)
- Ignore primality (avoid abstract controller metaphors)
- Skip transparency testing (does Emma forget about interface by Round 3?)

---

## Emma vs Tyler Interface Needs

**Emma (Commuter, 5-10 min sessions):**
- Needs: Zero friction, instant play, minimal learning curve
- Interface priorities:
  - Fast launch to gameplay (no splash screens)
  - Clear energy indicator (knows when session will end)
  - Quick round restarts (skip lengthy animations)
  - One-hand playability (holding phone on crowded train)

**Tyler (Grinder, 60+ min sessions):**
- Needs: Depth, stats, progression tracking
- Interface priorities:
  - Detailed Collection Lab (browse variants, compare stats)
  - Breeding Lab access (complex UI okay)
  - Historical data (graphs, trends, achievements)
  - Settings/customization (sound volume, music toggle)

**Design Solution:**
- Layer 1 (simple) satisfies Emma
- Layers 2-3 (complex) satisfy Tyler
- Both get what they need

---

## Testing Checklist

**Tenth-Second Rule:**
- [ ] Snake turns within 0.1s of swipe?
- [ ] DNA orb disappears within 0.1s of collection?
- [ ] Every tap gives visual feedback within 0.1s?

**Transparency:**
- [ ] Can Emma play Round 5 without thinking about controls?
- [ ] Does HUD become peripheral (not focal point)?
- [ ] Are there confusing edge cases?

**Juiciness:**
- [ ] Does every action have second-order motion?
- [ ] Multiple simultaneous rewards (visual + audio + progression)?
- [ ] Does collecting DNA feel satisfying (not dry)?

**Primality:**
- [ ] Touch interactions feel direct (not tool-mediated)?
- [ ] Gestures natural and intuitive?
- [ ] No abstract controller metaphors?

**Modes:**
- [ ] Each mode looks visually distinct?
- [ ] Mode transitions clear (screen wipe, music change)?
- [ ] No overlapping mode controls?

---

## See Also

- **Quick Ref:** @knowledge_base/game_design/quick_ref/concept_interface_design.md
- **Quick Ref:** @knowledge_base/game_design/quick_ref/concept_feedback_loops.md
- **SupaSnake:** @knowledge_base/game/quick_ref/lab_ui.md
- **SupaSnake:** @knowledge_base/game/how_to/create_react_native_screens.md
- **Lenses:** Lens #59 (Control), Lens #60 (Physical Interface), Lens #61 (Virtual Interface), Lens #62 (Transparency), Lens #63 (Feedback), Lens #64 (Juiciness), Lens #65 (Primality), Lens #67 (Modes)
