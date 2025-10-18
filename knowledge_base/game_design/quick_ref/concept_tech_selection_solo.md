# Technology Selection for Solo Mobile Dev - Quick Reference

**Source**: Schell Ch. 29 "Choose Your Platform Wisely"

## Core Principle

**Technology is a means, not an end.** Choose tech that serves your game vision while matching your solo dev constraints: time, budget, skills, and iteration speed.

## Solo Dev Selection Criteria

**1. Familiarity vs. Learning Curve**
- Use what you know unless new tech offers 10x advantage
- Learning new tech = 2-4 weeks lost to tutorials vs. building
- SupaSnake choice: React Native (existing web dev skills transfer)

**2. Iteration Speed**
- Hot reload > compile-test cycles
- Web tech (React Native + Expo) = instant preview
- Native iOS/Android = slower compile, harder debugging

**3. Cross-Platform Reality**
- True cross-platform = iOS + Android from one codebase
- React Native delivers 90%+ code reuse vs. 2 separate codebases
- Trade-off: Slight performance vs. 2x development time

**4. Backend Complexity**
- BaaS (Backend-as-a-Service) > custom backend for solo dev
- SupaSnake choice: Supabase (Postgres + Auth + Storage + Realtime)
- Alternative considered: Firebase (rejected due to NoSQL complexity for breeding system)

**5. Asset Pipeline**
- 3D rendering library choice affects asset creation workflow
- SupaSnake: Three.js (web standard) + React Native GL bridge
- Trade-off: Web performance patterns work, native Metal/Vulkan expertise not required

## SupaSnake Tech Stack Validation

| Component | Choice | Why (Solo Dev) | Rejected Alternative |
|-----------|--------|----------------|----------------------|
| Framework | React Native + Expo | Hot reload, JS familiarity, cross-platform | Native Swift/Kotlin (2x codebases) |
| Backend | Supabase | SQL (complex breeding), Auth built-in, generous free tier | Firebase (NoSQL harder for genetics), Custom backend (ops burden) |
| 3D | Three.js + Expo GL | Web 3D knowledge transfers, huge ecosystem | Unity (overkill, C# learning), Custom OpenGL (too low-level) |
| State | React Context + Hooks | Simple, no external deps, debuggable | Redux (boilerplate), MobX (learning curve) |
| Animation | React Native Animated | Built-in, performant, familiar API | Reanimated (complexity), Lottie (overkill) |

## Schell's Technology Lenses Applied

**Lens #104: Technology**
- *What limitations does SupaSnake's tech impose?*
  - React Native: 60fps ceiling (vs. native 120fps capable)
  - Three.js: Fewer particles than Unity (but sufficient for mobile)
  - Supabase: 500MB free storage (constraints variant art strategy)

- *What new possibilities does the tech enable?*
  - Hot reload: 10x faster iteration on game feel
  - Supabase RLS: Complex breeding rules enforced at DB level (impossible solo with custom backend)
  - Expo OTA: Update game balance without app store review (1-2 week wait avoided)

**Lens #105: Toy**
- *Is the tech fun to use?*
  - React Native dev experience: High (instant feedback, declarative UI)
  - Three.js: Moderate (math-heavy, but visual results satisfying)
  - Supabase: High (SQL queries powerful, dashboard excellent)

## Decision Framework for Solo Devs

```
For each tech decision:

1. Can I ship in 3 months with this tech? (vs. 6 months with alternative)
   → If NO, choose simpler tech

2. Does this tech reduce or increase my operational burden?
   → Choose: Managed services (Supabase, Expo EAS)
   → Avoid: Custom servers, complex DevOps

3. Will this tech help or hurt my iteration speed?
   → Hot reload, declarative code, visual tools = HELP
   → Compile cycles, verbose syntax, manual testing = HURT

4. Does this tech match my existing mental models?
   → Web dev → React Native (YES)
   → Game dev → Unity (NO, but learn if needed)

5. What's the exit strategy if this tech fails?
   → React Native → Flutter migration possible (React patterns transfer)
   → Supabase → Postgres dump portable to any host
```

## Common Solo Dev Tech Mistakes (Schell-Derived)

**Mistake 1: "I'll just use Unity"**
- Unity powerful, but overkill for 2D/simple 3D mobile
- 3-4 week learning curve for solo web dev
- SupaSnake needs breeding system (SQL) > physics engine

**Mistake 2: "I'll build my own backend"**
- Solo dev time = your scarcest resource
- Custom backend = server management, security patches, scaling
- BaaS = focus on game, not infrastructure

**Mistake 3: "Native is always better"**
- True for AAA 3D games pushing hardware limits
- False for most mobile games (UI-heavy, moderate graphics)
- SupaSnake = collection game, not twitch shooter (React Native sufficient)

**Mistake 4: "Latest tech = best tech"**
- Bleeding edge = unstable APIs, sparse documentation
- Choose mature, stable tech with large communities
- SupaSnake: React Native (2015+), Supabase (2020+, stable), Three.js (2010+, rock solid)

## Key Metrics for Tech Success

**Solo Dev Edition:**
- **Time to First Playable**: <2 weeks (React Native + Expo: ✅ 1 week achieved)
- **Iteration Cycle**: <10 seconds (hot reload: ✅ ~2 seconds)
- **Deployment Speed**: <1 hour (Expo EAS: ✅ ~15 minutes)
- **Bug Fix to User**: <24 hours (Expo OTA: ✅ ~1 hour without review)

## See Also

- **How-To**: @knowledge_base/game_design/how_to/choose_mobile_tech_stack.md
- **Concept**: @knowledge_base/game_design/quick_ref/concept_technical_constraints_mobile.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_29_technology_summary.md
