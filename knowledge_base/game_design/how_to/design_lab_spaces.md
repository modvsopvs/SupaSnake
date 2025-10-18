# How to Design Lab Spaces

**Goal**: Create distinct, functional, and emotionally resonant Lab environments in SupaSnake using architectural and spatial design principles.

**Timeline**: Design phase: 2-3 days per Lab; iteration: ongoing based on feedback

**Prerequisites**: Understanding of SupaSnake's core systems, Lab functions, and basic UI/UX principles

---

## Overview

Each Lab in SupaSnake is more than a menu screen—it's an architectural space that communicates purpose, guides player behavior, and creates emotional resonance. This guide applies Christopher Alexander's architectural patterns and Jesse Schell's spatial design principles to mobile UI design.

**The Three Labs:**
- **Collection Lab**: Gallery space (pride, abundance, completeness)
- **Breeding Lab**: Workshop space (creativity, experimentation, anticipation)
- **Evolution Lab**: Transformation chamber (power, achievement, advancement)

---

## Step 1: Define the Spatial Metaphor

Before designing any UI, establish what kind of space the Lab represents.

### Collection Lab: The Gallery

**Spatial Metaphor**: Museum or art gallery
- Purpose: Display and appreciation
- Feeling: Pride, accomplishment, curation
- Reference spaces: Natural history museum, Pokémon storage, trading card album

**Architectural Qualities:**
- **Open**: Easy browsing, no cramped feeling
- **Organized**: Clear categorization (dynasties, variants)
- **Illuminated**: Good visibility, nothing hidden
- **Celebratory**: Achievements highlighted

**Key Pattern (Alexander)**: "Light on Two Sides"
- Visual variety prevents monotony
- Collection cards have depth (shadows, highlights)
- Background has subtle texture, not flat
- Different sections have slight visual distinction

### Breeding Lab: The Workshop

**Spatial Metaphor**: Mad scientist's laboratory or artist's studio
- Purpose: Creation and experimentation
- Feeling: Creativity, possibility, controlled chaos
- Reference spaces: Chemistry lab, art studio, invention workshop

**Architectural Qualities:**
- **Functional**: Clear work areas (input, process, output)
- **Focused**: Attention directed to breeding action
- **Experimental**: Safe to try things
- **Exciting**: Anticipation of results

**Key Pattern (Alexander)**: "Sequence of Sitting Spaces"
- Natural flow: Select parent 1 → Select parent 2 → View combination → Confirm
- Each step is a comfortable "space" with clear purpose
- Transitions between steps feel natural, not jarring
- Return to previous step is easy (back navigation)

### Evolution Lab: The Transformation Chamber

**Spatial Metaphor**: Mystical chamber or high-tech pod
- Purpose: Advancement and transformation
- Feeling: Power, achievement, ritual
- Reference spaces: Pokemon evolution, chrysalis, level-up shrine

**Architectural Qualities:**
- **Intimate**: Single-snake focus, not crowded
- **Dramatic**: Special effects, lighting, ceremony
- **Mysterious**: Hints of power and possibility
- **Exclusive**: Feels advanced, earned access

**Key Pattern (Alexander)**: "Alcove"
- Snake being evolved is in special focal space
- Options surround but don't overwhelm
- Clear before/after comparison area
- Celebration moment has its own "room"

---

## Step 2: Establish Spatial Hierarchy

Organize visual importance to guide player attention.

### Visual Hierarchy Principles

**Primary Elements (First to See)**
- Collection Lab: Featured snake or completion progress
- Breeding Lab: Combination preview area
- Evolution Lab: The snake being evolved

**Secondary Elements (Supporting Info)**
- Collection Lab: Filter/sort controls, dynasty tabs
- Breeding Lab: Parent selection areas, DNA cost
- Evolution Lab: Evolution options, requirements

**Tertiary Elements (Available but Not Intrusive)**
- Collection Lab: Individual snake stats, variant indicators
- Breeding Lab: Success probability, breeding history
- Evolution Lab: Detailed stat comparisons, lore text

### Layout Techniques

**Rule of Thirds (Mobile)**
```
┌─────────────────┐
│ Nav/Context     │ ← Top third: Navigation, title, progress
├─────────────────┤
│                 │
│  Main Content   │ ← Middle third: Primary focus area
│                 │
├─────────────────┤
│ Primary Action  │ ← Bottom third: CTA buttons, key controls
└─────────────────┘
```

**Focal Point Creation**
- Use whitespace to isolate important elements
- Scale: Bigger = more important
- Color: Brighter or contrasting = draws attention
- Motion: Subtle animation on key element
- Position: Center or golden ratio points

**Example: Breeding Lab**
```
┌──────────────────────────┐
│ [Back] Breeding Lab [DNA]│ ← Context bar
├──────────────────────────┤
│  ┌────────┐  ┌────────┐  │
│  │Parent 1│  │Parent 2│  │ ← Parent selection (symmetrical)
│  └────────┘  └────────┘  │
│                          │
│      ┌──────────┐        │ ← Combination preview (focal point)
│      │   ???    │        │   Larger, centered, animated
│      └──────────┘        │
│                          │
│  DNA Cost: 50            │ ← Cost display (clear but not primary)
├──────────────────────────┤
│  [BREED] ← 100 DNA       │ ← Primary action (bottom, accessible)
└──────────────────────────┘
```

---

## Step 3: Design Navigation Flow

Create intuitive movement through and between Labs.

### Hub-and-Spoke Model

**Main Menu = Hub**
```
Main Menu
├── Collection Lab
├── Breeding Lab
├── Evolution Lab
└── Classic Mode
```

**Flow Principles:**
- Any Lab → Main Menu (always one tap away)
- Collection Lab → Snake Detail → Evolve (direct to Evolution Lab with snake selected)
- Main Menu → Classic Mode → Results → Collection Lab (natural loop)
- No more than 3 taps to reach any destination

### Within-Lab Navigation

**Collection Lab: Free Exploration**
- Grid or carousel layout (player choice via settings)
- Infinite scroll or pagination
- Filter/sort always accessible
- Snake detail: modal overlay (doesn't feel like leaving Lab)
- Back = return to exact scroll position

**Breeding Lab: Linear Workflow**
```
Entry → Select Parent 1 → Select Parent 2 → Preview → Confirm → Reveal → Return
         ↑_______________|__________________|         |          ↓
                        Back navigation              Success → Collection
```

**Evolution Lab: Focused Interaction**
```
Entry (select snake) → View options → Choose path → Confirm → Transform → Celebrate → Return
```

### Transition Design

**Between Labs (Hub-Spoke)**
- Slide transition (implies spatial relationship)
- 200-300ms duration (feels responsive, not rushed)
- Preserve main menu state (same scroll position on return)

**Within Lab Sections**
- Fade for modal overlays (detail views)
- Slide for sequential steps (breeding workflow)
- Zoom for focus changes (card to detail)
- No transition for instant updates (filter application)

---

## Step 4: Apply Architectural Patterns

Use Christopher Alexander's pattern language for harmonious design.

### Pattern: Entrance Transition

**Principle**: Create a boundary experience when entering a new space.

**Application:**
- Collection Lab: Quick fade-in of gallery, cards populate with stagger
- Breeding Lab: Curtain-rise effect revealing workspace
- Evolution Lab: Dramatic door-opening animation (first time only)
- Subsequent visits: Faster, subtle transition (respect player time)

### Pattern: Light on Two Sides

**Principle**: Rooms feel better with light/visual interest from multiple directions.

**Application:**
- Don't use flat single-color backgrounds
- Collection Lab: Gradient background, cards have depth (shadow)
- Breeding Lab: Different visual treatments for parent areas vs preview area
- Evolution Lab: Lighting effects from multiple angles (top glow, bottom reflection)
- Avoid visual monotony: Vary texture, color, depth across screen

### Pattern: Alcove

**Principle**: Special places for focused activity within larger space.

**Application:**
- Collection Lab: Featured snake alcove (highlighted card at top)
- Breeding Lab: Combination preview alcove (central focus area)
- Evolution Lab: Snake transformation alcove (isolated focus)
- Achievement celebrations: Temporary alcove (modal with special background)

### Pattern: Sequence of Sitting Spaces

**Principle**: Comfortable flow through series of spaces, each with purpose.

**Application to Breeding Workflow:**
1. **Arrival Space**: Lab overview, invite to start
2. **Selection Space 1**: Choose first parent comfortably
3. **Selection Space 2**: Choose second parent
4. **Preview Space**: Review combination before commitment
5. **Confirmation Space**: Moment of decision
6. **Reveal Space**: Celebration/result
7. **Departure Space**: Return or continue

Each "space" feels complete—player can pause, think, then proceed.

### Pattern: Things from Your Life

**Principle**: Personalization creates ownership and connection.

**Application:**
- Collection Lab: "YOUR Collection" language
- Breeding Lab: History of YOUR breeding experiments
- Evolution Lab: YOUR evolved snakes (before/after gallery)
- Statistics: YOUR achievements, YOUR progress
- Future: Custom naming, favorites, organization

---

## Step 5: Create Emotional Resonance

Design spaces that evoke appropriate feelings.

### Color Psychology

**Collection Lab (Pride & Completeness)**
- Primary: Light blue (#4A90E2) - trust, calm, collection
- Accent: Gold (#FFD700) - achievement, value
- Background: White to light gray - clean, gallery-like
- Rare variants: Purple highlights - special, prestigious

**Breeding Lab (Creativity & Anticipation)**
- Primary: Purple (#9B59B6) - creativity, mystery
- Accent: Green (#2ECC71) - growth, success
- Background: Medium gray with purple tint - workshop feel
- Preview area: Glowing effect - magical possibility

**Evolution Lab (Power & Transformation)**
- Primary: Gold (#F39C12) - achievement, power
- Accent: Electric blue (#3498DB) - energy, transformation
- Background: Dark with gradients - mysterious, advanced
- Effects: Particle systems, light rays - dramatic

### Scale and Proportion

**Collection Lab: Abundance**
- Many visible snakes (6-9 per screen)
- Cards relatively small but clear
- Lots of visible content = satisfying fullness
- Scrolling reveals more = endless discovery

**Breeding Lab: Focused Work**
- Fewer elements on screen (3-5 max)
- Larger tap targets (comfortable interaction)
- Generous whitespace (room to think)
- Preview area dominates (45% of screen)

**Evolution Lab: Singular Focus**
- Single snake dominates (60% of screen)
- Options compact but clear (bottom third)
- Minimal distractions (just essentials)
- Dramatic scale changes (pre/post evolution)

### Sound and Motion

**Collection Lab**
- Ambient: Quiet, occasional subtle chimes
- Interaction: Soft tap sounds, card whoosh on scroll
- Achievement: Fanfare when collection milestone reached
- Mood: Calm, appreciative, organized

**Breeding Lab**
- Ambient: Bubbling, experimental sounds
- Interaction: Click, shuffle, combine sounds
- Process: Building anticipation (egg shaking, glowing)
- Reveal: Excitement burst (success) or sympathetic tone (common result)
- Mood: Creative, experimental, exciting

**Evolution Lab**
- Ambient: Low hum, mystical tones
- Interaction: Precise, powerful clicks
- Process: Dramatic transformation sounds (energy, magic)
- Completion: Triumphant music, celebration
- Mood: Powerful, transformative, earned

---

## Step 6: Optimize for Mobile Context

Adapt architectural principles to mobile constraints and affordances.

### Thumb Zone Design

**Primary Actions (Bottom Third)**
- Collection Lab: Filter/sort toggle, breed button
- Breeding Lab: Breed confirmation, DNA display
- Evolution Lab: Evolution button, option selection
- All Labs: Primary CTA in thumb reach

**Secondary Info (Top Third)**
- Navigation (back button)
- Context (Lab name, currency)
- Progress indicators
- Settings/help

**Content (Middle Third)**
- Main display area
- Cards, previews, focal content
- Scrollable regions
- Detail information

### One-Handed Optimization

**Right-Handed Layout (Default)**
```
┌──────────────────────┐
│ [≡]  Lab Name   [?]  │ ← Left menu, right help
│                      │
│                      │
│   Main Content       │
│                      │
│                      │
│              [Action]│ ← Right thumb action
└──────────────────────┘
```

**Left-Handed Option (Settings)**
- Mirror layout horizontally
- Actions on left side
- Menu on right

### Performance Optimization

**60 FPS Target**
- Smooth scrolling (Collection Lab critical)
- Fluid animations (Breeding reveal, Evolution transformation)
- No frame drops during transitions
- Lazy loading (load cards as scrolled into view)

**Memory Efficiency**
- Unload off-screen content
- Reuse card components (object pooling)
- Compress images appropriately
- Cache frequently accessed data

**Battery Consideration**
- Disable animations when battery <20% (optional)
- Reduce particle effects in power save mode
- Minimize background processes
- Efficient rendering (no unnecessary redraws)

---

## Step 7: Test Spatial Design

Validate that spaces work as intended.

### Usability Testing Questions

**Collection Lab**
- Can players find specific snakes quickly?
- Is filtering/sorting intuitive?
- Do rare snakes feel special?
- Is progression visible and satisfying?
- Does space feel organized or chaotic?

**Breeding Lab**
- Is workflow clear without explanation?
- Do players understand DNA cost before committing?
- Is success/failure emotionally appropriate?
- Can players experiment comfortably?
- Does space feel creative and fun?

**Evolution Lab**
- Is transformation dramatic enough?
- Are options clear and comparable?
- Does space feel advanced/earned?
- Is before/after comparison satisfying?
- Does ritual feel special?

### A/B Testing Opportunities

**Collection Lab Layout**
- Grid vs Carousel
- 6 cards vs 9 cards per screen
- Horizontal vs Vertical scrolling
- List view vs Card view

**Breeding Lab Flow**
- Simultaneous selection vs Sequential
- Preview size (large vs medium)
- Confirmation required vs Direct action
- Success animation duration

**Evolution Lab Presentation**
- Vertical layout vs Horizontal comparison
- Options as list vs Radial menu
- Transformation animation style
- Celebration duration and skippability

### Metrics to Track

**Engagement Indicators**
- Time spent per Lab (appropriate to function)
- Actions per session (breeding attempts, evolutions)
- Return rate (do players come back?)
- Completion rates (collections finished)

**Usability Indicators**
- Navigation errors (wrong tap, back-tracking)
- Help button usage (confusion points)
- Drop-off points (where do players abandon?)
- Misclick rate (affordance clarity)

**Emotional Indicators** (Qualitative)
- Playtest observations (facial expressions, body language)
- Interview feedback ("How did that feel?")
- Social sharing (proud moments shared?)
- Review sentiment (App Store feedback)

---

## Common Mistakes to Avoid

**❌ Inconsistent Spatial Logic**
- Navigation that works differently between Labs
- Unpredictable transitions
- Inconsistent button placement
- Breaking established metaphors

**✅ Fix**: Establish UI patterns document, consistent navigation bar, unified interaction model

**❌ Overcrowded Spaces**
- Too many elements competing for attention
- No focal point (everything equally weighted)
- Insufficient whitespace
- Visual clutter

**✅ Fix**: Ruthless prioritization, clear hierarchy, generous margins, hidden detail in modals

**❌ Unclear Affordances**
- Not obvious what's tappable
- Interactive elements look decorative
- Decorative elements look interactive
- Inconsistent interaction patterns

**✅ Fix**: Clear visual states (normal/pressed/disabled), consistent interactive styling, tap highlights

**❌ Ignoring Mobile Context**
- Actions outside thumb reach
- Text too small for glancing
- Animations too long (impatient context)
- No orientation support

**✅ Fix**: Thumb-zone testing, minimum font sizes, skippable animations, responsive layouts

**❌ Breaking Presence**
- Jarring transitions
- Performance issues (lag, stutter)
- Inconsistent visual style
- Technical glitches visible

**✅ Fix**: Polish pass, performance optimization, art direction consistency, QA testing

---

## Iteration and Polish

### Launch vs Iteration

**MVP (Launch Version)**
- Core spatial metaphors established
- Basic navigation working smoothly
- Clear visual hierarchy
- Essential animations only
- Functional but not fancy

**V1.1 (First Polish Pass)**
- Enhanced transitions
- Particle effects
- Improved lighting/shadows
- Sound design
- Micro-animations

**V1.2+ (Ongoing Refinement)**
- A/B test results implemented
- User feedback incorporated
- Performance optimizations
- Accessibility improvements
- Platform-specific features

### Continuous Improvement

**Monthly Review Questions**
- Which Lab has highest engagement? Why?
- Where do players struggle? (analytics + feedback)
- What moments delight? (amplify these)
- What feels dated? (refresh opportunities)
- What new patterns have emerged? (in other successful games)

**See Also:**
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_space_design.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_architectural_design.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/lens_78_moments.md
- **How-To**: @knowledge_base/game_design/how_to/create_presence_in_mobile.md
- **Reference**: @knowledge_base/game_design/reference/batch3_chapters/chapter_21_spaces_summary.md
- **Game Docs**: @knowledge_base/game/quick_ref/lab_ui.md
- **Game Docs**: @knowledge_base/game/how_to/design_lab_ui.md
