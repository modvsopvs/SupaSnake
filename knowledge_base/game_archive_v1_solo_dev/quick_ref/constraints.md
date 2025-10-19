# Constraints - Quick Reference

## Technical Constraints

**Performance (Mobile)**:
- Target: 60fps on mid-range Android/iOS devices
- Frame budget: 16.67ms per frame
- Memory limit: 512MB RAM usage max
- Battery efficiency: Minimize GPU operations

**Platform Compatibility**:
- iOS 13+ (95% of iOS users)
- Android 8+ (90% of Android users)
- React Native + Three.js for 3D rendering
- Supabase backend (serverless PostgreSQL)

**Asset Sizes**:
- 2D Art Cards: 2048×2048px PNG (~500KB each)
- 3D Snake Model: <2MB GLTF
- Total App Size: <100MB (iOS requirement)
- CDN delivery for art (not bundled in app)

## Business Constraints

**Budget (MVP)**:
- Art Production: $120 (Midjourney)
- Backend: $0 (Supabase free tier)
- 3D Modeling: Internal (2 weeks)
- Total: ~$200 for MVP

**Timeline**:
- v0.1 MVP: 10 weeks from start
- v0.5 Abilities: +5 weeks (Week 15)
- v1.0 PvP: +5 weeks (Week 20)
- Monthly Expansions: 1 dynasty per month post-launch

**Team Size**: 1-2 developers (lean startup)

## Design Constraints

**Dynasty Count**:
- MVP: 3 dynasties (user constraint: "3 to max 5")
- Post-Launch: +1 dynasty/month
- Year 1 Target: 15 dynasties

**Art Production Capacity**:
- "Can produce amazing art with Midjourney" (user)
- "3D design will be tough for MVP" (user)
- Solution: 2D Midjourney cards + simple 3D shader variants

**Collection Psychology**:
- "Panini book style" (user requirement)
- Empty slots create desire
- Visual progress tracking
- Set completion rewards

**Visibility Problem**:
- "In game, we won't see this much" (user)
- Solution: Accept disconnect (art for Lab, simple snake for gameplay)
- 70% time in Lab (collection), 30% playing Snake (resource gathering)

## Gameplay Constraints

**Core Mechanic**: Classic Snake (cannot deviate - players expect this)

**Progression**:
- No paywalls (all content unlockable via gameplay)
- 1-2 weeks per dynasty completion (engaged player)
- Breeding accessible (low DNA costs)

**Balance**:
- Dynasty bonuses: 5% max (strategic but balanced)
- Skill > Dynasty choice (level playing field)
- No pay-to-win mechanics

## Expansion Constraints

**Scalability (Database)**:
- Add new dynasty = INSERT 1 row + 10 variant rows
- No app update needed (hot content via Supabase)
- CDN stores art (scales infinitely)

**Content Pipeline**:
- 1 week per new dynasty (sustainable)
- Midjourney generation: 2-3 days
- Database insert: 1 day
- Testing: 2 days

**Retention Strategy**:
- New dynasty every month (never "complete")
- Stacking set bonuses (long-term value)
- Always something new to collect

## See Also

**Platform Architecture**: @docs/platform/PLATFORM_STATUS.md
**Complete Constraints**: @docs/game/00_CONSTRAINT_LATTICE.md
**MVP Scope**: @knowledge_base/game/quick_ref/mvp_scope.md
