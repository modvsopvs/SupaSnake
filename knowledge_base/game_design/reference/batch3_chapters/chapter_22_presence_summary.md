# Chapter 22: Presence - Summary

**Source**: The Art of Game Design (3rd Edition, 2020) by Jesse Schell
**Chapter Focus**: Creating the feeling of "being there" in game worlds, immersion, and player presence

---

## Core Concept: Presence

**Definition**: Presence is the sensation of actually being in a place, even when you're not physically there. It's the feeling of inhabiting a game world rather than just observing it through a screen.

**Key Distinction**: Presence is not the same as immersion. Immersion is about mental absorption (being focused on the game). Presence is about spatial and embodied feeling (being "there" in the game world).

**Historical Context**: The concept of presence originates from VR research, where researchers studied how to make virtual environments feel real. However, presence can exist without VR—even 2D games on small screens can create powerful presence through different mechanisms.

---

## Types of Presence

Schell identifies three primary types of presence, each achievable through different design approaches:

### 1. Physical Presence

**Definition**: The sense of being physically located in the game space.

**VR/3D Mechanisms**:
- Stereoscopic 3D (depth perception)
- Head tracking (perspective shifts with movement)
- Spatial audio (sound from specific locations)
- Full-body tracking (body maps to avatar)
- Room-scale movement (walking in virtual space)

**2D/Mobile Mechanisms**:
- **Consistent spatial logic**: Spaces behave predictably (back button always returns, navigation follows geography)
- **Spatial audio**: Directional sound cues (even in stereo)
- **Visual depth**: Parallax scrolling, shadows, perspective
- **Camera movement**: Pan, zoom creates sense of looking around
- **Touch directness**: Finger on screen = direct manipulation (more embodied than mouse/controller)

**SupaSnake Application**: While SupaSnake won't have literal physical presence (2D mobile game), spatial consistency matters—each Lab feels like a distinct "place," navigation follows logical geography, transitions imply movement between locations.

### 2. Social Presence

**Definition**: The sense of being with other people or entities, even artificial ones.

**Mechanisms**:
- **Believable NPCs**: Characters that respond naturally, remember interactions
- **Multiplayer**: Real humans in shared space
- **Communication**: Voice, text, emotes that feel genuine
- **Social dynamics**: Cooperation, competition, community
- **Persistent presence**: Others exist even when you're not looking

**SupaSnake Application**:
- **Current**: Snakes as companions (not just data)—visual personality, attachment
- **Future**: Trading, leaderboards, sharing collections (community presence)
- **Design Choice**: Even in single-player, "Your Collection" language creates relationship

### 3. Self Presence

**Definition**: The sense that "this is me" in the game—your identity and agency in the virtual space.

**Mechanisms**:
- **Customization**: Character appearance reflects player choices
- **Personal possessions**: Items that belong to "me"
- **Persistent world state**: My actions have lasting effects
- **Identity investment**: Progression systems, reputation, relationships
- **Embodiment**: Avatar movement feels natural, responsive

**SupaSnake Application**:
- **Strong self presence**: YOUR collection (unique breeding results)
- **Personal journey**: Your dynasty choices, your evolutionary paths
- **Ownership**: Snakes feel like "mine" not generic templates
- **Persistence**: Collection persists, no loss of progress
- **Agency**: Meaningful choices (breed, evolve, collect) shape your game

**Key Insight**: Self presence may be the most powerful type for mobile games. Players invest identity in their collections, creations, and achievements even without literal avatar embodiment.

---

## Creating Presence Without VR

Schell emphasizes that presence doesn't require advanced technology. Games have created powerful presence for decades through:

### Consistency is Key

**The Consistency Principle**: Players accept any reality, no matter how fantastical, as long as it's internally consistent. Inconsistency breaks presence instantly.

**Examples**:
- **Consistent physics**: If gravity works one way, it always works that way
- **Consistent rules**: Game mechanics don't arbitrarily change
- **Consistent geography**: Spaces connect logically, don't teleport unexpectedly
- **Consistent visual style**: Art direction remains unified
- **Consistent tone**: Serious games stay serious, funny games stay funny

**Presence-Breaking Inconsistencies**:
- Tutorial pop-ups that halt action arbitrarily
- UI that doesn't fit world aesthetic (modern menu in medieval game)
- Rules that change without warning
- Technical glitches (clipping, pop-in, crashes)
- Tonal shifts (serious moment interrupted by silly achievement pop)

**SupaSnake Application**: Maintain consistency across all Labs—UI patterns, interaction models, visual style, rule systems. Breeding always costs DNA, evolution requirements don't change, navigation always works the same way.

### Responsiveness Creates Belief

**The Responsiveness Principle**: Instant, appropriate feedback to player actions creates the sense that the world is real and responds to you.

**Mechanisms**:
- **Sub-50ms input latency**: Touch to response feels immediate
- **Visual feedback**: Every action has visible result
- **Audio feedback**: Sound confirms actions
- **Haptic feedback**: Physical confirmation
- **Animation**: Smooth state transitions, not instant jumps

**Presence-Breaking Lag**:
- Delayed touch response (player doubts action registered)
- Stuttering animations (breaks reality)
- Audio desync (sound doesn't match visual)
- Loading screens mid-action (reminds player they're in software)

**SupaSnake Application**: 60fps target, <50ms touch latency, haptics on key actions, smooth animations, instant UI feedback. Every tap confirmed immediately.

### Visual and Audio Coherence

**The Coherence Principle**: All sensory inputs should support the same reality.

**Visual Coherence**:
- Unified art direction (style, palette, detail level)
- Consistent lighting (source, color temperature, shadows)
- Appropriate visual effects (particles, glow, motion blur)
- No obvious technical artifacts (aliasing, clipping, pop-in)

**Audio Coherence**:
- Spatial audio matches visual space
- Sound effects fit visual actions
- Music supports emotional tone
- No jarring audio cuts or pops

**Cross-Modal Coherence**:
- Sound synchronized with visuals (no delay)
- Haptics match visual/audio intensity
- All senses tell same story

**SupaSnake Application**: Each Lab has cohesive visual identity (Collection = clean/light, Breeding = creative/purple, Evolution = powerful/gold), audio design matches Lab tone, all feedback modalities synchronized.

### Emotional Investment Creates Presence

**The Investment Principle**: Players feel present in worlds they care about emotionally.

**Mechanisms**:
- **Stakes**: Outcomes matter (rare breeding, collection progress)
- **Ownership**: This is MINE (my collection, my creation)
- **Progress**: Visible advancement (completion meters, achievements)
- **Relationships**: Care about entities (snakes, NPCs)
- **Narrative**: Invested in story (even simple progression narrative)
- **Community**: Part of something larger (leaderboards, sharing)

**Without Emotional Investment**:
Players remain detached observers, not participants. Even perfect technology can't create presence if player doesn't care.

**SupaSnake Application**: Strong ownership (YOUR unique collection), meaningful progress (completionist satisfaction), attachment to snakes (rarity, breeding results), pride in achievements.

---

## Immersion vs Presence

Schell clarifies the distinction:

### Immersion (Mental Absorption)

**Definition**: The state of being completely focused on and absorbed by the game experience.

**Characteristics**:
- Loss of time awareness ("Where did 3 hours go?")
- Reduced awareness of physical surroundings
- Mental flow state (Csikszentmihalyi)
- Deep concentration
- Can exist without spatial presence

**Examples**:
- Absorbed in puzzle game (immersed but not "there")
- Lost in strategy game (mentally engaged, not embodied)
- Reading a gripping book (immersed in story, not physically present)

### Presence (Spatial/Embodied Feeling)

**Definition**: The feeling of being IN a place, occupying space.

**Characteristics**:
- Sense of location ("I am here")
- Spatial awareness (room layout, distances)
- Embodiment (this is my body/avatar)
- Social presence (others are here with me)
- Can exist without full mental immersion

**Examples**:
- VR environment (strong presence even if not deeply engaged)
- 3D world with spatial audio (feel location even while distracted)
- Physical game space (board game, tabletop RPG)

### Relationship

**Overlap**: Strongest experiences combine both—deeply immersed AND feeling present.

**Independence**: Can have one without the other:
- Immersed in abstract puzzle (no spatial presence)
- Present in VR world (but not mentally absorbed)

**SupaSnake Strategy**: Build both:
- **Immersion**: Engaging mechanics, clear goals, flow state
- **Presence**: Consistent Labs, ownership, spatial coherence

---

## Flow State and Presence

Schell references Mihaly Csikszentmihalyi's concept of "flow"—the optimal experience state.

### Flow Conditions

1. **Clear goals**: Obvious what to do next
2. **Immediate feedback**: Instant knowledge of success/failure
3. **Challenge/skill balance**: Not too hard, not too easy
4. **Sense of control**: Player agency over outcomes
5. **Merged action/awareness**: No gap between thought and action
6. **Concentration**: Deep focus on task
7. **Loss of self-consciousness**: Not thinking about self, just doing
8. **Distorted time perception**: Hours feel like minutes

### Flow and Presence Connection

**Strong Overlap**: Flow state often accompanies strong presence—both involve loss of awareness of real world, deep engagement with virtual world.

**Flow Creates Presence**: When in flow, players stop thinking about interface/device and feel present in game world.

**Presence Enables Flow**: When presence is strong (consistent, responsive world), flow state becomes easier to achieve.

**SupaSnake Flow Opportunities**:
- Classic Mode: High-speed action flow (clear goals, immediate feedback)
- Breeding Lab: Creative experimentation flow (low stakes, immediate results)
- Collection Lab: Completionist flow (clear progress, satisfying checkpoints)

---

## Threats to Presence

Schell identifies common presence-breaking elements:

### Technical Disruptions

**Performance Issues**:
- Frame rate drops (stuttering breaks reality)
- Input lag (breaks sense of control)
- Loading screens (reminds player of technology)
- Crashes/bugs (shatters immersion)
- Visual glitches (clipping, pop-in, texture issues)

**Audio Problems**:
- Desync (sound not matching visual)
- Audio pops/clicks (technical artifacts)
- Inappropriate silence (expected sound missing)
- Volume inconsistency (jarring level changes)

### Design Inconsistencies

**Rule Changes**:
- Mechanics behaving differently without explanation
- Inconsistent UI patterns
- Physics changes between areas
- Arbitrary restrictions appearing

**Tonal Breaks**:
- Serious moment interrupted by joke
- Achievement pop-ups during dramatic scenes
- Mismatched music (cheerful music in sad scene)
- UI that doesn't fit world aesthetic

### External Interruptions

**Device/Platform Interruptions**:
- Phone calls, notifications (mobile)
- Pop-up ads (especially intrusive)
- System messages (low battery, connectivity)
- Forced updates mid-session

**Environmental Interruptions**:
- Real-world distractions (mobile gaming in public)
- Social interruptions (someone talking to you)
- Context switches (checking other apps)

**SupaSnake Strategy**: Minimize controllable threats (performance, consistency), design for interruptions inherent to mobile (save state, quick resume).

---

## Mobile-Specific Presence Challenges

While Schell's book addresses presence broadly, mobile games face unique challenges:

### Limitations

**Small Screen**: Reduced field of view, less immersive visually
**Touch Abstraction**: Finger covers content, not as direct as VR
**Public Context**: Often played with divided attention
**Short Sessions**: Presence must build quickly (seconds, not minutes)
**Interruptions**: Constant environmental/social/technical interruptions

### Opportunities

**Directness**: Touch is more direct than mouse/controller
**Portability**: Game world travels with you (persistent accessibility)
**Personal Device**: More intimate than shared console/PC
**Always-On**: Can re-enter world instantly, anywhere
**Haptics**: Physical feedback creates embodiment

### Design Implications for SupaSnake

**Fast Presence Building**:
- Instant resume (no forced splash screens)
- Immediate recognition (clear Lab identity)
- Quick orientation (where was I, what was I doing)
- Rapid engagement (action within seconds)

**Interruption Resilience**:
- Perfect save state (never lose progress)
- Pause anywhere (no forced commitment)
- No punishment for interruption
- Easy re-entry (clear context on return)

**Mobile-Optimized Feedback**:
- Touch responsiveness (<50ms)
- Haptic confirmation (physical presence)
- One-handed comfort (thumb-zone actions)
- Clear visual feedback (finger doesn't obscure)

---

## Lens Applications to SupaSnake

### Lens #80: The Lens of Empathy

Schell asks: What does it really feel like to play my game? Am I designing for imagined players or real players?

**SupaSnake Applications**:
- Test on real mobile devices, not emulators
- Observe fresh players (what's confusing?)
- Play in real contexts (crowded bus, bright sunlight)
- Watch for presence breaks (where do players disengage?)

**Empathy Techniques**:
- Delete save data, experience as new player
- Play with distractions (realistic mobile context)
- Watch non-gamer friends try it
- Note where YOU lose presence despite knowing the game

### Additional Presence Lenses

**Lens of Consistency**: Does the game world follow its own rules?
**Lens of Responsiveness**: Does the world react immediately to player?
**Lens of Ownership**: Does player feel "this is mine"?
**Lens of Belief**: What makes this world feel real vs artificial?

---

## Key Takeaways for SupaSnake

1. **Presence Without VR**: Mobile 2D games create presence through consistency, responsiveness, emotional investment, and coherent design—not advanced technology.

2. **Three Presence Types**:
   - Physical: Labs feel like distinct places (consistent spatial logic)
   - Social: Snakes feel like companions, future community features
   - Self: Strong ownership ("YOUR collection"), meaningful choices

3. **Consistency is Critical**: Internal consistency creates belief—rules stay consistent, UI patterns unified, visual style coherent, navigation predictable.

4. **Responsiveness Creates Reality**: <50ms touch response, 60fps animations, immediate feedback (visual/audio/haptic), smooth transitions.

5. **Emotional Investment Drives Presence**: Players feel present in worlds they care about—ownership (unique breeding), progress (visible advancement), attachment (rare snakes).

6. **Immersion ≠ Presence**: But strongest experiences combine both—deeply engaged mind (immersion) + feeling of being there (presence).

7. **Flow State Connection**: Flow conditions (clear goals, immediate feedback, balanced challenge) overlap with presence conditions—design for both.

8. **Mobile-Specific Strategies**:
   - Fast presence building (instant resume, quick orientation)
   - Interruption resilience (perfect save state, no penalty)
   - Touch-optimized feedback (responsive, haptic, visual)
   - One-handed comfort (thumb-zone actions)

9. **Protect Presence**: Minimize technical disruptions (smooth performance), maintain design consistency (no arbitrary changes), design around external interruptions (mobile reality).

10. **Empathy Testing**: Experience game as real players do—fresh eyes, realistic contexts (distractions, interruptions), real devices, observe where presence breaks.

---

**See Also:**
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_presence.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_immersion.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/lens_80_empathy.md
- **How-To**: @knowledge_base/game_design/how_to/create_presence_in_mobile.md
- **Reference**: @knowledge_base/game_design/reference/batch3_chapters/chapter_21_spaces_summary.md
