# System Graph - Quick Reference

A distilled overview of SupaSnake's 19 major systems and build order. For complete dependency map and specifications, see @docs/game/01_SYSTEM_GRAPH.md.

---

## System Tiers & Build Order

### Tier 0: Foundation (Build First, Weeks 1-2)

**No Dependencies - Can Build in Parallel**

- **Core Snake Game**: Snake mechanics, grid, movement, collision (2 weeks)
- **UI Framework**: React Native, navigation, components (1.5 weeks)
- **Backend (Supabase)**: Database, API, real-time, auth (2 weeks)
- **Auth System**: Login, JWT, sessions, user accounts (1 week)

**Build these 4 systems first - they're independent.**

---

### Tier 1: Core Loop (Weeks 3-5)

**Depends on Tier 0**

- **Energy System**: Stamina for gameplay (1 week)
  - Depends: Auth (user state)
- **Resource Generation**: DNA collection (1.5 weeks)
  - Depends: Core Snake
- **Classic Mode**: Classic Snake gameplay (1 week)
  - Depends: Core Snake + Energy

**Build after Tier 0 complete.**

---

### Tier 2: Meta-Game (Weeks 6-10)

**Depends on Tier 0 + Tier 1**

- **Collection Lab**: View owned snakes (1.5 weeks)
  - Depends: Backend + Auth
- **Dynasty System**: 3 dynasties, 30 variants (2 weeks)
  - Depends: Backend
- **Breeding Lab**: Breed snakes (2 weeks)
  - Depends: Dynasty + Collection + Resources
- **Evolution Lab**: Transform snakes (1.5 weeks, v0.5+)
  - Depends: Dynasty + Collection
- **Lab UI**: Lab navigation (2 weeks)
  - Depends: UI Framework + Collection + Breeding + Evolution

**Build after core loop functional.**

---

### Tier 3-6: Advanced Features

**Tier 3 (Weeks 11-13):**
- Tower Mode (2 weeks) - High-risk challenges

**Tier 4 (Weeks 14-18):**
- Leaderboards (1 week)
- Clan System (2 weeks)
- Clan Wars (3 weeks)
- Gallery & Showcase (2 weeks)

**Tier 5 (Weeks 19-22):**
- Economy & Shop (1.5 weeks)
- Monetization & IAP (1 week)
- Tutorial & Onboarding (1 week)
- Analytics (1 week)

**Tier 6 (Post-MVP):**
- Trading System (Month 3+)
- Prestige System (Month 6+)
- Achievement Chains (Month 1+)

---

## Critical Path

**Must Complete in Order:**

1. Core Snake → 2. Energy → 3. Resources → 4. Classic Mode → 5. Collection → 6. Dynasty → 7. Breeding → 8. Evolution → 9. Lab UI → 10. Social → 11. Monetization

**Total MVP Timeline:** 22 weeks (5.5 months)

---

## See Also

**Quick References:**
- @knowledge_base/game/quick_ref/backend_supabase.md - Backend details
- @knowledge_base/game/quick_ref/core_snake_game.md - Core gameplay
- @knowledge_base/game/quick_ref/collection_lab.md - Collection system
- @knowledge_base/game/quick_ref/breeding_lab.md - Breeding mechanics

**How-To Guides:**
- @knowledge_base/game/how_to/setup_supabase_backend.md - Backend setup
- @knowledge_base/game/how_to/implement_energy_system.md - Energy implementation

**Complete Specification:**
- @docs/game/01_SYSTEM_GRAPH.md - Full dependency map (7,200+ words)

---

**Version:** 1.0
**Word Count:** 200
**Purpose:** Quick build order reference for development sequencing
