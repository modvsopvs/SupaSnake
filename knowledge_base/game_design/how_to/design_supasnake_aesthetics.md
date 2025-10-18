# How to Design SupaSnake Aesthetics

**Goal:** Create cohesive visual and audio design that supports SupaSnake's collection experience, communicates dynasty identity clearly, and works beautifully on mobile devices.

**Timeline:** Ongoing throughout development, with major decisions in pre-production

**Prerequisites:**
- Understanding of SupaSnake's three dynasties (CYBER, PRIMAL, COSMIC)
- Mobile design constraints
- Collection/breeding game mechanics
- @knowledge_base/game/quick_ref/art_pipeline.md

---

## Step 1: Define Dynasty Visual Languages

Each dynasty needs a distinct, memorable visual identity that players recognize instantly.

### CYBER Dynasty Visual Design

**Color Palette**
- Primary: Electric blue (#00D9FF)
- Secondary: Neon magenta (#FF00DC)
- Accent: Bright cyan (#00FFAA)
- Background: Dark metallic (#1A1A2E)
- Highlights: White/chrome for UI elements

**Shape Language**
- Angular forms (triangles, hexagons)
- Hard edges, no organic curves
- Circuit board patterns
- Geometric precision
- Grid-based compositions

**Texture & Materials**
- Metallic surfaces with reflections
- Glowing neon edges
- Digital scanlines
- Holographic effects
- Chrome and brushed metal

**Motion Style**
- Stutter-step animations (digital feel)
- Glitch effects on transitions
- Precise, robotic movements
- Electronic particle effects

**Example CYBER Common Snake:**
```
Base: Dark metallic scales (#2A2A3E)
Pattern: Simple circuit lines in cyan
Eyes: Bright blue glow
Special: Subtle neon edge lighting
Animation: Smooth digital movement
```

**Example CYBER Legendary Snake:**
```
Base: Chrome metallic with reflections
Pattern: Complex animated circuit patterns
Eyes: Bright magenta with electric arc
Special: Holographic shimmer, neon trails
Animation: Glitch effects, digital particles
```

### PRIMAL Dynasty Visual Design

**Color Palette**
- Primary: Moss green (#4A7C59)
- Secondary: Stone gray (#5C5C5C)
- Accent: Earth brown (#8B4513)
- Background: Deep forest (#1A2F1A)
- Highlights: Bone white for UI elements

**Shape Language**
- Organic, flowing curves
- Natural asymmetry
- Scale patterns
- Rough, unrefined edges
- Inspired by nature

**Texture & Materials**
- Rough scales and skin
- Stone and rock textures
- Wood grain and bark
- Natural wear and weathering
- Organic materials

**Motion Style**
- Fluid, organic movements
- Breathing/pulsing animations
- Natural flow like water or wind
- Dust and leaf particles

**Example PRIMAL Common Snake:**
```
Base: Simple green scales
Pattern: Basic striping (moss/brown)
Eyes: Yellow-green, reptilian
Special: Subtle breathing animation
Animation: Natural slithering motion
```

**Example PRIMAL Legendary Snake:**
```
Base: Ancient stone-like scales
Pattern: Complex tribal markings
Eyes: Glowing amber with depth
Special: Pulsing energy aura, leaf particles
Animation: Powerful coiling, earthquake effects
```

### COSMIC Dynasty Visual Design

**Color Palette**
- Primary: Deep purple (#6A0DAD)
- Secondary: Star white (#F0F0FF)
- Accent: Nebula pink (#FF69B4)
- Background: Space black (#0A0A1A)
- Highlights: Ethereal blue for UI elements

**Shape Language**
- Flowing, spiral forms
- Ethereal, translucent edges
- Cosmic patterns (stars, nebulae)
- Gentle curves
- Inspired by space and galaxies

**Texture & Materials**
- Translucent, glowing surfaces
- Starfield patterns
- Nebula cloud effects
- Ethereal light wisps
- Semi-transparent materials

**Motion Style**
- Slow, floating drift
- Particle trail effects
- Gentle rotation
- Cosmic dust swirls
- Gravity-defying movement

**Example COSMIC Common Snake:**
```
Base: Dark purple with subtle starfield
Pattern: Simple constellation dots
Eyes: White glow, mysterious
Special: Faint particle trail
Animation: Gentle floating motion
```

**Example COSMIC Legendary Snake:**
```
Base: Translucent nebula effect (animated)
Pattern: Complex galaxy swirl
Eyes: Bright cosmic energy
Special: Full particle system, ethereal aura
Animation: Majestic drift, star explosions
```

---

## Step 2: Design Rarity Visual Progression

Rarity must be **instantly visible** through escalating visual effects, while maintaining dynasty identity.

### Universal Rarity Rules

Applied consistently across all three dynasties:

**Common (60% saturation)**
- Single-color accent
- Simple patterns
- Minimal glow/effects
- Basic animation

**Uncommon (75% saturation)**
- Dual-color scheme
- More complex patterns
- Subtle glow on edges
- Enhanced animation

**Rare (90% saturation)**
- Tri-color combinations
- Intricate patterns
- Noticeable glow/aura
- Particle effects begin

**Epic (100% saturation + bloom)**
- Full color spectrum of dynasty
- Complex animated patterns
- Strong glow with bloom
- Active particle systems

**Legendary (Animated effects)**
- Shifting/animated colors
- Extremely detailed patterns
- Screen-filling aura effects
- Rich particle systems
- Special screen effects on appearance

### Example: CYBER Rarity Progression

```
Common CYBER Snake:
- Dark blue base, simple circuit
- No glow effects
- Basic slither animation

Uncommon CYBER Snake:
- Blue/cyan dual-tone
- Circuit patterns on sides
- Faint edge glow
- Digital pulse animation

Rare CYBER Snake:
- Blue/cyan/magenta tri-tone
- Complex circuit overlay
- Bright neon edge glow
- Glitch effect particles

Epic CYBER Snake:
- Full neon spectrum
- Animated circuit patterns
- Strong holographic aura
- Digital particle trail
- Screen bloom effect

Legendary CYBER Snake:
- Shifting chrome/rainbow effect
- Animated holographic patterns
- Massive electric aura
- Screen-wide glitch on reveal
- Thunder sound + strong haptic
```

### Mobile Rarity Visibility

Test at actual mobile size (5-7 inches):
- **From 3 feet away**: Legendary vs Common clear
- **From 1 foot away**: All five rarities distinguishable
- **In bright sunlight**: High contrast maintained
- **Quick glance**: Rarity evident in <1 second

---

## Step 3: Create Audio Design Language

Audio must reinforce visual dynasty identity and work perfectly on mobile devices.

### CYBER Dynasty Audio

**Sound Design Principles**
- Synthesized, electronic tones
- Digital beeps and boops
- Modulated frequencies
- Glitch/static effects
- Precise, sharp sounds

**Key Sounds**

Pull/Reveal (Common):
```
Duration: 300ms
Sound: Digital "power on" beep
Pitch: Mid-range (440Hz base)
Effects: Light modulation
Haptic: Single pulse (10ms)
```

Pull/Reveal (Legendary):
```
Duration: 2000ms
Sound: Synthesizer crescendo
Pitch: Rising sweep (200Hz → 1000Hz)
Effects: Glitch breakdown, electric arc
Haptic: Rising pattern (4 pulses)
```

Breeding Hatch:
```
Duration: 1200ms
Sound: "Digital birth" sequence
Parts: Power up (400ms) → stabilize (400ms) → confirm (400ms)
Effects: Glitch transition between parts
Haptic: Triple pulse pattern
```

### PRIMAL Dynasty Audio

**Sound Design Principles**
- Organic, natural sounds
- Percussion-based
- Animal calls/roars
- Resonant, deep tones
- Rough, textured sounds

**Key Sounds**

Pull/Reveal (Common):
```
Duration: 300ms
Sound: Soft drum hit
Pitch: Low (80Hz base)
Effects: Natural reverb
Haptic: Single rumble (20ms)
```

Pull/Reveal (Legendary):
```
Duration: 2000ms
Sound: Epic drum sequence + roar
Pitch: Deep rumble (40Hz → 200Hz)
Effects: Echo, natural reverb tail
Haptic: Rumbling earthquake pattern
```

Breeding Hatch:
```
Duration: 1200ms
Sound: Egg crack → creature emergence
Parts: Crack (200ms) → emergence (600ms) → roar (400ms)
Effects: Natural acoustic space
Haptic: Crack pulse → rumble → strong pulse
```

### COSMIC Dynasty Audio

**Sound Design Principles**
- Ethereal, choir-like
- Bell tones and chimes
- Reverb-heavy (space feeling)
- Mysterious, otherworldly
- Gentle, flowing sounds

**Key Sounds**

Pull/Reveal (Common):
```
Duration: 300ms
Sound: Soft bell chime
Pitch: High (880Hz base)
Effects: Long reverb tail (2s)
Haptic: Gentle wave pulse
```

Pull/Reveal (Legendary):
```
Duration: 2000ms
Sound: Choir swell + bell cascade
Pitch: Harmonic layers (multiple frequencies)
Effects: Cathedral reverb, shimmer
Haptic: Gentle wave pattern (6 pulses)
```

Breeding Hatch:
```
Duration: 1200ms
Sound: Cosmic "birth" sequence
Parts: Shimmer (400ms) → choir swell (600ms) → bell (200ms)
Effects: Heavy reverb, ethereal echoes
Haptic: Wave pattern → gentle pulse
```

### Mobile Audio Constraints

**Technical Requirements**
- File size: <50KB per sound effect
- Format: AAC (128kbps) for music, WAV (44.1kHz) for SFX
- Ducking: Lower music 50% during SFX
- Battery: Minimal processing (pre-rendered effects)

**Testing Checklist**
- [ ] Works with phone speakers (not just headphones)
- [ ] Clear in noisy environments
- [ ] Not annoying after 100+ plays
- [ ] Silent mode fully supported
- [ ] Haptics provide full feedback alone
- [ ] No audio clipping/distortion
- [ ] Respects system volume settings

---

## Step 4: Design for Mobile-First

All aesthetic decisions must work perfectly on mobile devices.

### Screen Size Constraints

**Minimum Readable Size**
- Snake detail visible at 5" screen diagonal
- Touch targets minimum 44pt (Apple) / 48dp (Android)
- Text minimum 14pt for body, 18pt for important info
- Icons minimum 24x24pt

**Visual Hierarchy on Small Screens**
1. Snake (hero) - Largest, most detailed
2. Rarity indicator - Very clear, high contrast
3. Dynasty identity - Color-coded, obvious
4. UI controls - Standard sizes, familiar placement
5. Background - Minimal, supports hierarchy

### High Contrast for Outdoor Play

**Contrast Ratios (WCAG AA minimum)**
- Text on background: 4.5:1 minimum
- Important UI: 7:1 ideal
- Dynasty colors on dark backgrounds: Very high contrast
- Rarity glow visible in sunlight

**Testing**
- View in direct sunlight (peak brightness)
- Test with sunglasses on
- Check color-blind accessibility (Deuteranopia simulator)
- Verify at arm's length (typical mobile viewing distance)

### Battery & Performance Constraints

**Visual Effects Budget**
- Common: <5% GPU usage
- Uncommon: <8% GPU usage
- Rare: <12% GPU usage
- Epic: <18% GPU usage
- Legendary: <25% GPU usage (brief, on reveal only)

**Audio Processing Budget**
- SFX: Minimal CPU (pre-rendered)
- Music: <3% CPU (streaming)
- Haptics: <1% (system-level)

**Optimization Rules**
- Use sprite sheets (not individual images)
- Particle count scaled to device tier
- Effects LOD (reduce on lower-end devices)
- 60fps target, 30fps acceptable minimum

---

## Step 5: Ensure Aesthetic Coherence

All elements must feel unified within each dynasty while maintaining clear differences between dynasties.

### Coherence Checklist

**Within Each Dynasty**
- [ ] Visual shapes match audio style (CYBER: angular + digital)
- [ ] Colors consistent across all dynasty content
- [ ] Motion style reinforces identity (PRIMAL: organic flow)
- [ ] Haptics match visual/audio intensity
- [ ] UI elements use dynasty theming appropriately
- [ ] All touchpoints (menu, gameplay, breeding) consistent

**Across All Dynasties**
- [ ] Rarity progression uses same structure
- [ ] Mobile UX rules applied universally
- [ ] Core UI patterns identical (only themed differently)
- [ ] Touch targets, text sizes standard
- [ ] Accessibility features universal

**The 3-Second Test**

Show any screenshot to someone for 3 seconds, then hide it:
- Can they identify the dynasty? (CYBER/PRIMAL/COSMIC)
- Can they estimate rarity? (Common vs Legendary)
- Do they understand what action is available? (Pull, Breed, View)

If yes to all three → Aesthetic coherence achieved
If no to any → Redesign that element

---

## Step 6: Create Asset Production Pipeline

Establish efficient workflow for producing aesthetically consistent content.

### Visual Asset Pipeline

**Per Snake Variant (12 per dynasty, 36 total MVP)**

1. **Concept Art** (Midjourney AI)
   - Generate base concept using dynasty prompt
   - Iterate on rarity visual treatment
   - Finalize approved concept art

2. **3D Model** (Blender)
   - Model snake based on concept
   - Apply dynasty materials (CYBER: metallic, PRIMAL: organic, COSMIC: ethereal)
   - Rig for animation
   - Create rarity variations (Common → Legendary)

3. **Animation**
   - Idle loop (2-4 seconds)
   - Reveal animation (1-2 seconds)
   - Rarity-specific effects

4. **Export**
   - Render to sprite sheets (mobile-optimized)
   - Multiple resolutions (@1x, @2x, @3x)
   - Optimize file size (<100KB per sheet)

**See:** @knowledge_base/game/quick_ref/art_pipeline.md for complete technical details

### Audio Asset Pipeline

**Per Dynasty Sound Set**

1. **Sound Design**
   - Create base dynasty sound palette
   - Record/synthesize source audio
   - Process for dynasty character (CYBER: modulate, PRIMAL: add reverb, COSMIC: add shimmer)

2. **Rarity Variations**
   - Common: Simple, short (300ms)
   - Uncommon: Enhanced (500ms)
   - Rare: Exciting (800ms)
   - Epic: Dramatic (1200ms)
   - Legendary: Epic (2000ms)

3. **Mobile Optimization**
   - Compress to AAC (128kbps)
   - Normalize levels
   - Test on actual devices
   - Ensure <50KB per file

4. **Haptic Pairing**
   - Design matching haptic patterns
   - Test with audio on/off
   - Ensure haptics convey rarity alone

---

## Step 7: Test Aesthetic Quality

Validate that aesthetics enhance gameplay and work on real devices.

### Playtesting Focus

**Visual Communication Test**
- Show players dynasties without labels: Do they understand differences?
- Show rarity variants: Can they rank Common → Legendary correctly?
- Glance test: From 3 feet away, is dynasty/rarity clear?

**Emotional Resonance Test**
- Legendary pull: Does it feel exciting, memorable?
- CYBER aesthetic: Does it feel technological, precise?
- PRIMAL aesthetic: Does it feel powerful, ancient?
- COSMIC aesthetic: Does it feel mysterious, vast?

**Mobile Usability Test**
- Outdoor sunlight: Can they see everything?
- One-handed play: Touch targets comfortable?
- Interruption: Pause/resume works seamlessly?
- Battery: 60+ minutes play acceptable?

### Technical Validation

**Performance Benchmarks**
- Maintain 60fps on iPhone 12 / Galaxy S21
- Acceptable 30fps on iPhone X / Galaxy S10
- GPU usage <30% on Legendary reveal
- Memory usage <200MB
- Battery drain <15% per hour

**Audio Quality**
- Sounds clear on phone speakers
- No distortion at max volume
- Works perfectly in silent mode (haptics)
- Mixing priorities respected (SFX > music)

**Accessibility**
- Color-blind modes available
- Haptic feedback sufficient without audio
- Text readable for low vision
- High contrast mode option

---

## Tips for Success

✅ **DO:**
- Test on actual mobile devices early and often
- Maintain dynasty purity (no mixing CYBER with PRIMAL)
- Use rarity visual language consistently
- Make audio/haptics work independently
- Optimize for battery life from the start
- Get feedback from mobile gamers

❌ **DON'T:**
- Design on desktop and hope it works on mobile
- Mix dynasty visual languages
- Make effects that annoy after 10 minutes
- Require sound for gameplay clarity
- Create touch targets smaller than 44pt
- Ignore battery/performance constraints

---

## Common Mistakes

**Mistake 1: Desktop-First Design**
- **Problem**: Looks great on 27" monitor, illegible on 6" phone
- **Fix**: Design at actual mobile size from day one
- **Test**: View all work at 100% on mobile device

**Mistake 2: Inconsistent Rarity Signals**
- **Problem**: Epic snakes less impressive than Rare
- **Fix**: Strict rarity progression rules applied universally
- **Test**: Line up all rarities, verify clear escalation

**Mistake 3: Dynasty Identity Blur**
- **Problem**: CYBER snake with organic curves, PRIMAL with digital sounds
- **Fix**: Maintain strict dynasty language rules
- **Test**: 3-second test—dynasty identity must be instant

**Mistake 4: Audio-Dependent Gameplay**
- **Problem**: Players can't play in silent mode effectively
- **Fix**: Haptics must convey all information
- **Test**: Play entire session with sound off

**Mistake 5: Effect Overload**
- **Problem**: Too many particles cause frame drops, battery drain
- **Fix**: Performance budget strictly enforced
- **Test**: Profile on mid-range device (iPhone 12, Galaxy S21)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_art_direction.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_visual_language.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_audio_design.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_aesthetic_coherence.md
- **Lens**: @knowledge_base/game_design/quick_ref/lens_77_art.md
- **Lens**: @knowledge_base/game_design/quick_ref/lens_78_audio.md
- **Game Spec**: @knowledge_base/game/quick_ref/art_pipeline.md
- **Game Spec**: @knowledge_base/game/quick_ref/dynasties.md
