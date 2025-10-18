# Lens #104: The Lens of Technology - Quick Reference

**Source**: Schell, "The Art of Game Design" (3rd ed.), Chapter 29

## The Lens

**Focus on**: How technology shapes and constrains your game design.

**Key Questions**:
1. What are the *real* limitations of your technology?
2. What *unexpected* possibilities does your technology enable?
3. How does your *choice* of technology match your design goals?
4. Are you *fighting* the technology or *embracing* its nature?
5. Is there a *better* technology for what you're trying to achieve?

## Purpose

Technology is not neutral—it has opinions about how games should be made. Understanding these opinions helps you either work with the tech's grain or know when you're fighting uphill.

## SupaSnake Application

### Question 1: Real Limitations

**React Native + Three.js limitations**:
- **60fps ceiling** (vs. native 120fps on modern devices)
  - **Design response**: Classic Snake doesn't need 120fps, 60fps is smooth enough
- **Particle count cap** (~30-50 particles performant vs. Unity's 1000+)
  - **Design response**: Stylized, minimal particle effects (quality over quantity)
- **JavaScript overhead** (slower than native C++/Swift/Kotlin)
  - **Design response**: Simple physics (grid-based Snake, not complex collision)

**Supabase free tier limitations**:
- **500MB storage** (can't store 60 hi-res snake textures)
  - **Design response**: Procedural textures, texture atlases, downloadable asset packs
- **Row-level security** (requires careful query structure)
  - **Design response**: Embrace RLS, use it for multiplayer leaderboard integrity

### Question 2: Unexpected Possibilities

**React Native enables**:
- **Hot reload** (iterate on game feel in seconds, not minutes)
  - **Exploitation**: Rapid balancing (tweak speed/energy in real-time)
- **Web tech ecosystem** (npm packages, React libraries)
  - **Exploitation**: Leverage existing UI components (charts, animations)

**Supabase enables**:
- **Postgres power** (complex SQL for breeding genetics)
  - **Exploitation**: Server-side breeding formula (impossible to cheat)
- **Realtime subscriptions** (database changes push to clients)
  - **Exploitation**: Live leaderboard updates (see score beat in real-time)
- **Edge functions** (serverless backend logic)
  - **Exploitation**: Daily challenges generated server-side

**Expo OTA (Over-The-Air) updates**:
- **Skip App Store review** for JS/asset changes (1-2 week wait avoided)
  - **Exploitation**: Balance patches same-day (nerf OP strategy immediately)

### Question 3: Tech Match to Goals

**SupaSnake goals → Tech fit**:

| Goal | Technology | Why It Matches |
|------|------------|----------------|
| Ship in 3-6 months (solo) | React Native | Existing web dev skills, hot reload speeds iteration |
| Cross-platform (iOS + Android) | React Native + Expo | 95% code reuse, one codebase |
| Complex breeding genetics | Supabase Postgres | SQL handles inheritance/generation logic elegantly |
| Iterate post-launch | Expo OTA | Deploy balance fixes without app review |
| Offline-first gameplay | React Native + AsyncStorage | Full game works offline, sync later |
| Low-poly 3D snakes | Three.js | Proven web 3D library, easier than native OpenGL |

**Goal → Tech mismatch to avoid**:
- ❌ Goal: AAA 3D graphics → React Native (use Unity/Unreal instead)
- ❌ Goal: Twitch shooter → React Native (60fps ceiling, input lag → use native)
- ❌ Goal: 100k concurrent multiplayer → Supabase free tier (use dedicated game server)

### Question 4: Fighting or Embracing?

**Embracing tech nature**:
- ✅ **React declarative UI**: Use state-driven rendering (not imperative DOM manipulation)
- ✅ **Postgres relational model**: Design breeding as JOIN queries (not NoSQL document crawling)
- ✅ **Three.js scene graph**: Organize snake body as nested objects (not manual matrix math)

**Fighting tech (anti-patterns)**:
- ❌ Trying to force 1000 particles in React Native (fights performance ceiling)
- ❌ Storing breeding history as JSON blob (fights Postgres relational strengths)
- ❌ Manual WebGL calls in Three.js (fights abstraction layer)

**SupaSnake design embrace**: Grid-based Snake (fights WITH React Native's strengths: DOM updates, CSS transforms)

### Question 5: Better Tech Available?

**Considered alternatives**:

**Unity vs. React Native**:
- Unity better for: 3D graphics, physics-heavy, AAA polish
- React Native better for: UI-heavy, rapid iteration, web dev background
- **Verdict**: React Native (SupaSnake is UI/collection-focused, not twitch gameplay)

**Firebase vs. Supabase**:
- Firebase better for: NoSQL flexibility, Google ecosystem, wider community
- Supabase better for: SQL (complex genetics), open-source, generous free tier
- **Verdict**: Supabase (breeding genetics need relational queries)

**Native Swift/Kotlin vs. React Native**:
- Native better for: Performance, platform APIs, 120fps
- React Native better for: Cross-platform, iteration speed, web dev skills
- **Verdict**: React Native (SupaSnake doesn't push hardware limits)

## Using This Lens

**When to use**: Before tech decisions, when fighting performance issues, when design feels "wrong"

**How to use**:
1. List your tech stack (React Native, Supabase, Three.js, etc.)
2. For each tech, ask: "What does this tech make easy? What does it make hard?"
3. Align design to "easy" things, avoid "hard" things (or accept the fight)
4. If many design goals are in "hard" category, consider different tech

**Red flags**:
- Spending more time fighting tech than building game
- Constant workarounds for tech limitations
- Tech stack doesn't match team skills

**Green flags**:
- Tech enables rapid iteration
- Limitations force creative solutions (constraints breed creativity)
- Team productive, not frustrated

## SupaSnake Tech Philosophy

**"Work with the grain, not against it."**

React Native's grain:
- Declarative UI → Design UI-driven game (menus, labs, collection)
- Hot reload → Design tweakable (balance, animation timing)
- JavaScript → Design logic-heavy (breeding algorithms), not physics-heavy

Supabase's grain:
- SQL → Design relational (snakes have parents, generations, dynasties)
- RLS → Design secure-by-default (leaderboards can't be cheated)
- Realtime → Design live (leaderboard updates, friend activity)

Three.js's grain:
- Scene graph → Design hierarchical (snake body = linked segments)
- Materials/lights → Design stylized (leverage built-in shaders)
- Web standard → Design exportable (WebGL → future web version)

**Result**: Tech stack enables SupaSnake's unique identity (breeding + Snake + collection)

## Examples in Practice

### Example 1: Energy System Performance

**Problem**: Energy regeneration needs to tick every second (60 ticks/minute)

**Tech constraint**: JavaScript timers unreliable when app backgrounded (iOS)

**Fighting tech**: Try to keep timers alive in background (iOS kills them anyway)

**Embracing tech**: Calculate energy on app foreground (timestamp math)
```javascript
// Calculate energy on resume
const minutesElapsed = (now - lastSeen) / 60000;
const energyGained = Math.floor(minutesElapsed / 5); // 1 per 5min
```

**Result**: Works with platform, not against (accurate energy, no battery drain)

### Example 2: Breeding Animation

**Problem**: Want smooth particle effect when breeding (egg sparkles)

**Tech constraint**: React Native limited to ~30 particles at 60fps

**Fighting tech**: Try to render 200 particles (drops to 20fps, janky)

**Embracing tech**: Design for 20-30 particles, make them HIGH QUALITY
- Larger particles (more visible)
- Smooth easing (fewer particles feel premium)
- Strategic timing (burst at climax, not constant)

**Result**: Limitation becomes aesthetic (stylized, polished)

### Example 3: Leaderboard Cheating

**Problem**: High scores could be faked (client sends score to server)

**Tech advantage**: Supabase RLS can validate server-side

**Embracing tech**: Use Postgres functions to validate score logic
```sql
-- Server-side score validation
CREATE FUNCTION submit_score(score INT, game_data JSON)
RETURNS BOOLEAN AS $$
  -- Validate score matches game_data (food eaten, time, etc.)
  -- If mismatch, reject (cheater)
$$;
```

**Result**: Tech enables anti-cheat (impossible with client-only validation)

## See Also

- **Concept**: @knowledge_base/game_design/quick_ref/concept_tech_selection_solo.md
- **Concept**: @knowledge_base/game_design/quick_ref/concept_technical_constraints_mobile.md
- **How-To**: @knowledge_base/game_design/how_to/choose_mobile_tech_stack.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_29_technology_summary.md
