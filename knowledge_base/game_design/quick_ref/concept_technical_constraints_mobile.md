# Technical Constraints for Mobile Games - Quick Reference

**Source**: Schell Ch. 29 "The Medium is the Message"

## Core Principle

**Mobile constraints shape design.** Don't fight device limitations—embrace them as creative constraints that differentiate mobile games from console/PC experiences.

## Mobile-Specific Constraints

### 1. Performance Constraints

**Frame Budget**
- **Target**: 60fps = 16.67ms per frame
- **Reality**: Android fragmentation = design for worst-case device (3-year-old mid-range)
- **SupaSnake approach**: Optimize for iPhone 11 / Samsung Galaxy S10 (2019 devices)

**Memory Limits**
- **Mobile RAM**: 2-4GB total, ~500MB-1GB available to app
- **SupaSnake constraint**: 3 dynasties × 5 variants × 4 generations = 60 snake models max in memory
- **Solution**: Asset streaming (load on-demand), texture atlases, model reuse

**Battery Life**
- **Drain sources**: GPU (3D rendering), network (constant syncing), wake locks
- **SupaSnake approach**:
  - Pause rendering when app backgrounded
  - Batch network requests (save every 30s, not every action)
  - No always-on features (no real-time multiplayer)

### 2. Input Constraints

**Touch = Imprecise**
- **Fat finger problem**: 44pt minimum touch target (Apple HIG)
- **SupaSnake design**: Large snake head hitbox, forgiving collision
- **Wrong for mobile**: Tiny buttons, precise dragging, hover states

**No Physical Controls**
- **No tactile feedback**: Virtual joysticks feel mushy
- **SupaSnake choice**: Swipe controls (natural touch gesture) > virtual D-pad
- **Schell advice**: "Design FOR touch, not AROUND lack of controller"

**Interruption Model**
- **Phone calls, texts, low battery = instant exit**
- **SupaSnake requirement**:
  - Auto-save every 10 seconds
  - Pause on background (no death while interrupted)
  - Resume state perfectly (mid-game, mid-breeding)

### 3. Screen Constraints

**Screen Real Estate**
- **Mobile**: 5-7 inch diagonal, high PPI (326+)
- **SupaSnake implication**:
  - UI elements 48x48pt minimum (fingertip-sized)
  - Text 12pt minimum (readable at arm's length)
  - 3-4 main UI elements per screen max (not cluttered)

**Aspect Ratio Variance**
- **iPhone**: 19.5:9 (tall), iPad: 4:3 (square)
- **Android**: 16:9, 18:9, 20:9, 21:9 (wild variance)
- **SupaSnake solution**:
  - Safe area layout (avoid notches, home indicators)
  - Flexible canvas (game board scales, UI anchored)

**Orientation Locking**
- **Choice**: Portrait only, landscape only, or both?
- **SupaSnake**: Portrait-only (simpler, one-handed play, matches Duolingo/Candy Crush)
- **Trade-off**: Landscape wider FOV, but requires two hands

### 4. Network Constraints

**Unreliable Connectivity**
- **Mobile reality**: WiFi ↔ 4G ↔ 3G ↔ offline constantly
- **SupaSnake approach**:
  - Offline-first (play without connection)
  - Background sync when connected
  - Conflict resolution (last-write-wins for single-player)

**Data Costs**
- **User anxiety**: "Is this game eating my data?"
- **SupaSnake constraint**:
  - Minimal asset downloads (< 50MB initial)
  - Optional high-res variant downloads (WiFi-only prompt)
  - No video ads on cellular (battery + data drain)

### 5. Storage Constraints

**App Size Limits**
- **iOS**: 200MB over-the-air download limit (WiFi required above)
- **Android**: 150MB recommended max (user drop-off above)
- **SupaSnake strategy**:
  - Initial download: ~40MB (core game + 3 dynasties)
  - Asset packs: Downloadable variants (future expansion)

**User Storage Anxiety**
- **"My phone is full" problem**: Apps get deleted first
- **SupaSnake approach**:
  - Cache management (auto-delete old assets)
  - User control (settings to reduce quality/storage)

## Constraint-Driven Design Patterns

### Pattern 1: Sessions, Not Marathons

**Constraint**: Interruptions are constant (calls, texts, low battery)

**Design Response**:
- **Session length**: 2-5 minutes (SupaSnake: 1-2 classic games or 1 breeding session)
- **Save frequency**: Every 10 seconds automatically
- **Pause tolerance**: Instant pause on background, resume perfectly

**Anti-pattern**: 20-minute uninterruptible levels (console design)

### Pattern 2: One-Handed Play

**Constraint**: Users hold phone in one hand, thumb controls only

**Design Response**:
- **Control zone**: Bottom third of screen (thumb reach)
- **SupaSnake**: Swipe anywhere on screen (no fixed buttons)
- **UI**: Top third = read-only info (score, timer), bottom third = controls

**Anti-pattern**: Buttons in top corners (requires two hands or thumb gymnastics)

### Pattern 3: Glanceable State

**Constraint**: Mobile play = distracted (commute, waiting in line, bathroom)

**Design Response**:
- **State visibility**: Instant read of "where am I?" (progress bars, clear goals)
- **SupaSnake**:
  - Energy meter (top-left, always visible)
  - Collection progress (X/Y snakes, visual completion)
  - Next unlock preview (clear goal)

**Anti-pattern**: Hidden menus, complex stats screens (requires focus)

### Pattern 4: Asynchronous Everything

**Constraint**: Network unreliable, can drop any moment

**Design Response**:
- **Offline-first**: All core gameplay works offline
- **Background sync**: Queue actions, sync when connected
- **SupaSnake**:
  - Breed offline, sync genetics to cloud later
  - Earn DNA offline, update leaderboard when connected
  - Download variants in background (progressive enhancement)

**Anti-pattern**: Always-online requirement (Diablo Immortal launch disaster)

## SupaSnake Constraint Examples

### Constraint: React Native 60fps Ceiling

**Impact**: Can't render 1000 particle effects like Unity AAA game

**Design Response**:
- Stylized, low-poly snake models (200-500 triangles vs. 5000+)
- Particle budgets (20-30 particles max for speed boost trail)
- Strategic effects (quality over quantity)

**Outcome**: Distinctive art style (limitation becomes aesthetic)

### Constraint: 500MB Supabase Free Storage

**Impact**: Can't store hi-res textures for all 60 snake variants

**Design Response**:
- Procedural textures (shaders generate patterns)
- Texture atlases (combine multiple textures)
- Downloadable asset packs (future monetization)

**Outcome**: Forced prioritization (MVP = 3 dynasties only)

### Constraint: Touch Imprecision

**Impact**: Can't do pixel-perfect platforming controls

**Design Response**:
- Forgiving collision (snake head hitbox 1.5x visual size)
- Swipe gestures (direction matters, not precision)
- Auto-correction (slight curve toward food)

**Outcome**: Accessible to casual players (design FOR mobile, not despite it)

## Schell's Key Insight

**"Embrace constraints as creative opportunities."**

Mobile limitations force DIFFERENT design, not WORSE design:
- Touch = gesture-based gameplay (Fruit Ninja)
- Small screen = focused, clear goals (Angry Birds)
- Interruptions = short sessions (Candy Crush)
- Battery = idle mechanics (Adventure Capitalist)

SupaSnake's constraints (solo dev, mobile, F2P) forced:
- Simple core loop (Classic Snake, not complex RPG)
- Meta-progression (breeding, collection)
- Energy system (pacing, monetization)
- Offline-first (solo dev can't run live servers)

**These aren't compromises—they're the game's identity.**

## Performance Budgets (SupaSnake Targets)

| Resource | Budget | Measured | Status |
|----------|--------|----------|--------|
| Frame time | 16.67ms (60fps) | TBD | Target |
| Memory | 150MB peak | TBD | Target |
| Initial download | 50MB max | ~40MB est. | On track |
| Battery drain | <5%/hour | TBD | Target |
| Network data | <1MB/hour | <100KB est. | Excellent |
| Storage | 100MB total | ~80MB est. | On track |

## See Also

- **Concept**: @knowledge_base/game_design/quick_ref/concept_tech_selection_solo.md
- **How-To**: @knowledge_base/game_design/how_to/choose_mobile_tech_stack.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_29_technology_summary.md
