# How to Choose a Mobile Tech Stack for Solo Indie Dev

**Goal**: Select technologies that maximize shipping speed while matching your skills and game requirements.

**Timeline**: 1-2 days research + decision (don't overthink)

**Prerequisites**: Clear game concept, understanding of your own skills, realistic timeline (3-6 months)

---

## Overview

As a solo indie dev, your technology choices make or break your project. Choose wrong, and you'll spend months fighting the tech instead of building your game. Choose right, and you'll ship faster with less friction.

This guide walks through SupaSnake's tech selection process as a case study for making smart solo dev decisions.

---

## Step 1: Define Your Constraints

Before researching tech, define your non-negotiable constraints. These narrow the field from 100+ options to 3-5 viable choices.

### Your Skill Inventory

**List what you KNOW**:
- Programming languages (JavaScript, Python, C++, etc.)
- Frameworks (React, Unity, Flutter, etc.)
- Tools (Git, VSCode, Photoshop, etc.)

**SupaSnake example**:
- ✅ Strong: JavaScript, React, web development (10 years)
- ⚠️ Moderate: Basic game design, 3D math, mobile development
- ❌ Weak: C++, native iOS/Android, Unity/Unreal, game physics

**Decision impact**: React Native (leverages JS/React) > Unity (requires learning C#)

### Your Timeline

**How long can you afford to spend?**
- Full-time: 3-6 months max (burn savings)
- Part-time: 6-12 months (nights/weekends)

**SupaSnake**: 6 months part-time (20 hrs/week) = ~500 hours total

**Learning budget**: Can afford 1-2 weeks learning new tech (40-80 hours), not 3-4 months

**Decision impact**: Leverage existing skills > learn new engine from scratch

### Your Game Requirements

**What does your game NEED?**

**SupaSnake requirements**:
- Cross-platform (iOS + Android from one codebase)
- 2D/simple 3D graphics (not AAA photorealistic)
- Offline-first (play without internet)
- Backend (user accounts, breeding data, leaderboards)
- Iteration speed (rapid tweaking of game balance)

**Nice-to-haves**:
- Hot reload (see changes instantly)
- Post-launch updates (fix bugs without app review)
- Low operational cost (free tier backend)

**Decision impact**: These requirements shape every tech choice

---

## Step 2: Map Requirements to Tech Categories

Break down your tech stack into layers, then research options per layer.

### Layer 1: Game Framework (Core Game Logic)

**Options**:
- **React Native**: JavaScript, cross-platform, hot reload, web dev friendly
- **Unity**: C#, powerful 3D, asset store, requires learning curve
- **Flutter**: Dart, growing ecosystem, good for UI-heavy games
- **Native (Swift/Kotlin)**: Maximum performance, platform-specific (2x work)

**SupaSnake evaluation**:

| Framework | Pros | Cons | Fit |
|-----------|------|------|-----|
| React Native | JS skills transfer, hot reload, cross-platform | 60fps ceiling, fewer game libs | ✅ High (UI-heavy game) |
| Unity | Powerful 3D, huge community | C# learning curve, overkill for 2D | ❌ Low (don't need 3D power) |
| Flutter | Growing, good docs | Dart = new language, smaller game community | ⚠️ Medium (viable alternative) |
| Native | Max performance | 2x codebases (iOS + Android), slow iteration | ❌ Low (solo dev can't maintain 2 codebases) |

**Decision**: React Native (leverages existing skills, iteration speed critical)

### Layer 2: 3D Rendering (Visual Engine)

**Options** (for React Native):
- **Three.js + Expo GL**: Web 3D standard, huge ecosystem
- **Babylon.js**: Game-focused 3D library, good docs
- **Custom WebGL**: Maximum control, maximum work

**SupaSnake evaluation**:

| Library | Pros | Cons | Fit |
|---------|------|------|-----|
| Three.js | Mature (2010+), massive community, web standard | Not game-specific (some boilerplate) | ✅ High (proven, stable) |
| Babylon.js | Game-focused, great docs | Smaller ecosystem than Three.js | ⚠️ Medium (viable alternative) |
| Custom WebGL | Full control | 10x more code, reinvent the wheel | ❌ Low (solo dev, no time) |

**Decision**: Three.js (mature, stable, transferable knowledge to web 3D)

### Layer 3: Backend (Data Persistence)

**Options**:
- **Supabase**: Postgres, Auth, Storage, Realtime, generous free tier
- **Firebase**: NoSQL, Google ecosystem, wider adoption
- **Custom backend**: Full control, full operational burden

**SupaSnake evaluation**:

| Backend | Pros | Cons | Fit |
|---------|------|------|-----|
| Supabase | SQL (breeding genetics), Auth built-in, open-source | Smaller community than Firebase | ✅ High (SQL perfect for genetics) |
| Firebase | Huge community, easy setup | NoSQL complex for breeding, pricey at scale | ⚠️ Medium (viable but NoSQL = harder) |
| Custom | Full control | Server ops, security, scaling = solo dev nightmare | ❌ Low (time sink, ops burden) |

**Decision**: Supabase (SQL critical for complex breeding queries, generous free tier)

### Layer 4: State Management (Game State)

**Options** (for React Native):
- **React Context + Hooks**: Built-in, simple, no external deps
- **Redux**: Industry standard, lots of boilerplate
- **MobX**: Reactive, less boilerplate than Redux
- **Zustand**: Minimal, modern

**SupaSnake evaluation**:

| State Mgmt | Pros | Cons | Fit |
|------------|------|------|-----|
| Context + Hooks | Built-in, simple, no deps | Can get messy at scale (but SupaSnake is small) | ✅ High (simplicity > power) |
| Redux | Industry standard, predictable | Boilerplate-heavy, overkill for small game | ❌ Low (overcomplicated) |
| MobX | Less boilerplate | Another library to learn | ⚠️ Low (unnecessary complexity) |
| Zustand | Minimal API | Less proven | ⚠️ Medium (too new) |

**Decision**: React Context + Hooks (keep it simple, SupaSnake state isn't complex)

### Layer 5: Development Tools

**Build/Deploy**:
- **Expo**: Managed React Native, EAS (Expo Application Services) for builds
- **Bare React Native**: More control, more configuration

**Decision**: Expo (managed workflow = less config, OTA updates = faster iteration)

**Analytics**:
- **Firebase Analytics**: Free, deep integration
- **Mixpanel**: Free tier, better event tracking
- **Amplitude**: Generous free tier, excellent UX

**Decision**: Firebase Analytics (free, easy setup, good enough for MVP)

---

## Step 3: Validate with Prototyping

Don't commit until you've prototyped. Spend 1 day building a "hello world" in each finalist stack.

### SupaSnake Prototyping (2 days)

**Day 1: React Native + Three.js Prototype**
- Set up: Expo app + Three.js renderer (2 hours)
- Implement: Rotating 3D cube (2 hours)
- Test: Performance on real device (iPhone 11, Galaxy S10)
- Result: Smooth 60fps, hot reload works, feels productive

**Day 2: Supabase Prototype**
- Set up: Supabase project + React Native client (1 hour)
- Implement: User signup/login + simple query (2 hours)
- Test: RLS (Row-Level Security) for breeding data
- Result: Auth works, SQL queries elegant, free tier generous

**Validation**: Both prototypes successful → Proceed with confidence

**Alternative outcome**: If prototype fails (janky performance, confusing API) → Reconsider tech choice

---

## Step 4: Plan for Evolution (Future-Proofing)

Your MVP tech choice shouldn't lock you into a dead end. Plan migration paths if the game succeeds.

### SupaSnake Evolution Plan

**Phase 1 (MVP): React Native + Supabase Free Tier**
- Cost: $0/month (free tiers)
- Supports: 10k-50k users
- Limitation: 500MB storage, 2GB transfer/month

**Phase 2 (Growth): Same Stack, Paid Tiers**
- Cost: $25/month Supabase Pro
- Supports: 100k-500k users
- Unlocks: 8GB storage, 50GB transfer/month

**Phase 3 (Scale): Potential Migration**
- If >500k users, consider:
  - Self-host Postgres (Supabase is open-source, portable)
  - Add CDN for assets (Cloudflare)
  - Native rewrites for performance-critical parts (if needed)

**Exit strategy**: All core data in Postgres (SQL dumps portable), React Native → Flutter migration possible (patterns transfer)

**Key**: Don't over-engineer for scale you don't have, but don't choose dead-end tech

---

## Step 5: Document Your Decision

Write down WHY you chose each tech. Future you (6 months in) will question these choices—have answers ready.

### SupaSnake Tech Decision Doc

**Framework: React Native**
- **Why**: Existing JS/React skills, hot reload (iteration speed), cross-platform (one codebase)
- **Trade-off**: 60fps ceiling (acceptable for Snake), smaller game ecosystem (mitigated by web libraries)
- **Alternative considered**: Unity (rejected: C# learning curve, overkill for 2D/simple 3D)

**3D Library: Three.js**
- **Why**: Web standard (transferable knowledge), mature (2010+), huge community
- **Trade-off**: More boilerplate than game engine (acceptable for simple 3D)
- **Alternative considered**: Babylon.js (viable, but Three.js larger ecosystem)

**Backend: Supabase**
- **Why**: SQL (complex breeding genetics), Auth built-in, generous free tier
- **Trade-off**: Smaller community than Firebase (acceptable, docs are good)
- **Alternative considered**: Firebase (rejected: NoSQL awkward for genetics)

**Benefits of documentation**:
- Onboarding (if you hire help later)
- Debugging (remember why you made trade-offs)
- Portfolio (show decision-making process to employers/investors)

---

## Common Mistakes to Avoid

### Mistake 1: "I'll use the most popular tech"

**Problem**: Popular ≠ right for your game
- Unity popular for 3D games, but overkill for 2D
- Firebase popular, but NoSQL wrong for complex queries

**Fix**: Choose tech that fits YOUR requirements, not popularity contests

### Mistake 2: "I'll learn the 'best' tech"

**Problem**: Best for AAA studio ≠ best for solo indie
- Unreal "best" for graphics, but 6-month learning curve
- Custom engine "best" for control, but 2-year development time

**Fix**: Choose tech you can ship with in YOUR timeline (3-6 months)

### Mistake 3: "I'll use what I learned in school"

**Problem**: Academic tech ≠ production tech
- Java taught in CS courses, but not ideal for mobile games
- C++ powerful, but slow iteration for solo dev

**Fix**: Prioritize iteration speed + shipping over academic correctness

### Mistake 4: "I'll future-proof for 1M users"

**Problem**: Over-engineering for scale you don't have
- Solo dev shouldn't build custom Kubernetes cluster
- Free tiers support 10k-100k users (your realistic Year 1-2 scale)

**Fix**: Build for 10k users, migrate when you actually hit 100k (nice problem to have)

### Mistake 5: "I'll pick tech then design game"

**Problem**: Tech-first = wrong game for your tech
- Pick Unity → Force 3D game (but your idea is 2D)
- Pick Firebase → Fight NoSQL for relational data

**Fix**: Design game FIRST, choose tech SECOND (tech serves design, not vice versa)

---

## Decision Checklist

Before finalizing your tech stack, verify:

**Skill Match**:
- [ ] I know this language (or can learn in 1-2 weeks)
- [ ] I've built something in this framework (or prototyped successfully)
- [ ] Documentation is excellent (can self-serve troubleshooting)

**Requirement Match**:
- [ ] Tech supports my game's needs (cross-platform, 3D, backend, etc.)
- [ ] Tech doesn't force compromises that break the game
- [ ] Performance is acceptable (60fps target met)

**Iteration Speed**:
- [ ] Hot reload or fast compile (<10 seconds)
- [ ] Can deploy updates quickly (Expo OTA, not week-long app review)
- [ ] Debugging is productive (good dev tools)

**Cost & Scale**:
- [ ] Free tier supports MVP launch (10k users)
- [ ] Paid tiers are affordable ($25-100/month at scale)
- [ ] Exit strategy exists (can migrate data if needed)

**Community & Support**:
- [ ] Active community (Stack Overflow answers, Discord)
- [ ] Maintained library (updates, security patches)
- [ ] Hiring potential (if you need help later)

**Gut Check**:
- [ ] I'm excited to work with this tech (not dreading it)
- [ ] This feels productive (prototyping was smooth)
- [ ] I can ship in 3-6 months with this stack

If any checklist item fails, reconsider that tech choice.

---

## SupaSnake Tech Stack (Final)

**Game Framework**: React Native + Expo
**3D Rendering**: Three.js + Expo GL
**Backend**: Supabase (Postgres + Auth + Storage + Realtime)
**State Management**: React Context + Hooks
**Analytics**: Firebase Analytics
**Deployment**: Expo EAS (builds) + OTA updates

**Total setup time**: 1 day (Expo + Supabase quick setup)
**Monthly cost**: $0 (free tiers) → $25 at scale
**Shipping timeline**: 6 months part-time (proven feasible)

**Validation**: Prototype successful, all requirements met, matches skill set, sustainable cost

---

## Key Takeaways

1. **Constraints first** (skills, timeline, requirements) → Narrow options
2. **Prototype finalists** (1 day each) → Validate before committing
3. **Iteration speed > power** (ship fast > perfect architecture)
4. **Leverage existing skills** (React > Unity if you know React)
5. **Document decisions** (future you will thank you)

**Remember**: Perfect tech doesn't exist. Choose "good enough to ship," then iterate.

**Mantra**: "The best tech is the one that ships your game."

---

## See Also

- **Concept**: @knowledge_base/game_design/quick_ref/concept_tech_selection_solo.md
- **Concept**: @knowledge_base/game_design/quick_ref/concept_technical_constraints_mobile.md
- **Lens**: @knowledge_base/game_design/quick_ref/lens_104_technology.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_29_technology_summary.md
