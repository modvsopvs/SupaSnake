# SupaSnake System Graph
## Complete Dependency Map & Build Order

**Version:** 1.0
**Last Updated:** 2025-10-14
**Purpose:** This document provides the complete system inventory, dependency relationships, and recommended build order for SupaSnake. It serves as the architectural blueprint for development sequencing.

---

## Overview

SupaSnake consists of **19 major game systems** spanning foundation, gameplay, meta-game, social, and monetization layers. This document maps:

1. **System Inventory:** Complete list with purpose and dependencies
2. **Dependency Graph:** Visual representation of what-needs-what
3. **Build Order:** Recommended implementation sequence (Phases 0-5)
4. **Integration Points:** How systems communicate
5. **Critical Gaps:** Undefined systems blocking development

**Key Insight:** The Dynasty System is mentioned 20+ times across docs but has ZERO specification. This is a CRITICAL blocker for progression design, breeding mechanics, and monetization. It must be defined immediately.

---

## System Inventory

### Tier 0: Foundation (Build First)

#### SYSTEM: Core Snake Game Engine
**Purpose:** The fundamental gameplay loop - snake movement, growth, collision, death
**Dependencies:** None (foundation layer)
**Depended By:** All gameplay modes (Classic, Tower, Clan Wars), Energy System, Resource Collection
**State:** Required for MVP
**Build Priority:** 1
**Complexity:** 7/10
**Estimated Time:** 2 weeks
**Integration Points:**
- Outputs: Game state, score, collected items
- Inputs: Player controls, game mode parameters

#### SYSTEM: Basic UI Framework
**Purpose:** Core UI rendering, navigation, screen management
**Dependencies:** None (foundation layer)
**Depended By:** All UI screens (Snake Lab, Menus, HUD), Tutorial System
**State:** Required for MVP
**Build Priority:** 1
**Complexity:** 5/10
**Estimated Time:** 1.5 weeks
**Integration Points:**
- Outputs: UI events, navigation requests
- Inputs: Game state, player data

#### SYSTEM: Backend Infrastructure (Supabase)
**Purpose:** Database, authentication, real-time sync, cloud saves
**Dependencies:** None (foundation layer)
**Depended By:** All systems requiring persistence (Collection, Economy, Clans, Leaderboards)
**State:** Required for MVP
**Build Priority:** 1
**Complexity:** 6/10
**Estimated Time:** 2 weeks
**Integration Points:**
- Outputs: Database queries, auth tokens, real-time updates
- Inputs: Player actions, game state changes
**Technical Constraints:**
- Must handle 10k concurrent users (TE-004)
- <200ms p99 API latency
- Cross-platform sync (TE-003)
- Offline queue for writes (TE-002)

#### SYSTEM: Authentication & Account System
**Purpose:** Player login, account creation, cross-platform sync
**Dependencies:** Backend Infrastructure
**Depended By:** All systems requiring player identity (Collection, Progress, Clans)
**State:** Required for MVP
**Build Priority:** 2
**Complexity:** 4/10
**Estimated Time:** 1 week
**Integration Points:**
- Outputs: User ID, session tokens, profile data
- Inputs: Login credentials, OAuth providers

---

### Tier 1: Core Gameplay Loop

#### SYSTEM: Energy System
**Purpose:** Gate gameplay sessions, create return triggers, strategic resource management
**Dependencies:** Core Snake Game, Backend
**Depended By:** All play modes (Classic, Tower, Clan Wars), Monetization
**State:** Required for MVP
**Build Priority:** 3
**Complexity:** 5/10
**Estimated Time:** 1 week
**Design Constraints:**
- Free daily refill (CE-005, BM-002)
- Clan energy bonuses
- Expandable max capacity via progression
- 20-minute recharge rate (CE-002)
**Integration Points:**
- Outputs: Energy available, depletion events, refill triggers
- Inputs: Mode start requests, purchase events, clan bonuses

#### SYSTEM: Resource Collection & DNA Economy
**Purpose:** Manage DNA strands, evolution materials, currencies
**Dependencies:** Core Snake Game, Backend
**Depended By:** Breeding, Evolution, Economy, Shop
**State:** Required for MVP
**Build Priority:** 3
**Complexity:** 6/10
**Estimated Time:** 1.5 weeks
**Design Constraints:**
- Classic Mode: Predictable base income (BA-002)
- Tower Mode: High-variance rare materials (BA-002)
- Clan Wars: Bonus resources (BA-002)
- No inventory management tedium (BA-004)
**Integration Points:**
- Outputs: DNA amounts, material counts, collection events
- Inputs: Game results, purchases, breeding costs

#### SYSTEM: Classic Mode
**Purpose:** Predictable DNA mining, relaxing 5-minute sessions
**Dependencies:** Core Snake Game, Energy System, Resource Collection
**Depended By:** Player progression, Daily loop
**State:** Required for MVP
**Build Priority:** 4
**Complexity:** 4/10
**Estimated Time:** 1 week
**Design Constraints:**
- 5-minute session length (MVP Vision)
- Predictable DNA rewards (BA-002)
- Energy cost: TBD (requires tuning)
**Integration Points:**
- Outputs: DNA collected, game completion
- Inputs: Energy spend, snake loadout

---

### Tier 2: Meta-Game Core

#### SYSTEM: Snake Collection Management
**Purpose:** Track owned snakes, organize by dynasty/generation/rarity
**Dependencies:** Backend, Resource Collection
**Depended By:** Breeding, Evolution, Snake Lab UI, Gallery
**State:** Required for MVP
**Build Priority:** 5
**Complexity:** 6/10
**Estimated Time:** 1.5 weeks
**Design Constraints:**
- 500+ variants supported (CO-001)
- 5 rarity tiers (Common, Uncommon, Rare, Epic, Legendary)
- Unlimited storage (BA-004)
- Smart filtering by dynasty, generation, rarity
- 20+ variants by Day 30 (PR-003)
**Integration Points:**
- Outputs: Snake roster, owned variants, collection stats
- Inputs: Breeding results, evolution completions

#### SYSTEM: Dynasty System (CRITICAL - UNDEFINED)
**Purpose:** [COMPLETELY UNDEFINED - BLOCKS DEVELOPMENT]
**Dependencies:** Backend, Collection
**Depended By:** Breeding mechanics, Evolution, Progression, Monetization, Gallery
**State:** **CRITICAL GAP - MUST DEFINE IMMEDIATELY**
**Build Priority:** 5 (BUT NEEDS DESIGN FIRST)
**Complexity:** ???/10 (Cannot estimate without specification)
**Estimated Time:** ??? (Design needed first)
**Mentions in Docs:**
- MVP_VISION: "Show Off Collection → Social Competition" (mentions dynasties)
- MVP_VISION: "DNA marketplace with corp-based commerce" (dynasty trading?)
- PLAYER_JOURNEY: Dynasty selection screen, Dynasty revealed milestone
- PLAYER_JOURNEY: "That NEBULA dynasty though..." (player desire)
- PLAYER_JOURNEY: "I'm a MECHA dynasty specialist" (identity formation)
- CONSTRAINT_LATTICE: Multiple dynasty references (selection, unlock, exclusives)
**BLOCKING:**
- What IS a dynasty? (Species type? Aesthetic theme? Stat category?)
- How many dynasties exist? (8? 10? 12?)
- How are dynasties unlocked? (Play-based? Purchase? RNG?)
- Do dynasties have gameplay differences? (Stats? Abilities? Cosmetic only?)
- How do dynasties affect breeding? (Cross-dynasty breeding allowed?)
- What are "dynasty combos" mentioned in PLAYER_JOURNEY?
- Are there dynasty-exclusive variants?
- Do dynasties have progression trees?
**IMPACT OF UNDEFINED:**
- Cannot design breeding algorithm
- Cannot balance progression
- Cannot design monetization (what to sell?)
- Cannot implement set bonuses
- Cannot build Snake Lab UI (dynasty organization?)
- Cannot start art production (visual themes unknown)

#### SYSTEM: Breeding System
**Purpose:** Combine two snakes to create offspring with genetic combinations
**Dependencies:** Collection, Dynasty System (UNDEFINED), Resource Collection
**Depended By:** Evolution, Lab Investment metrics, Player progression
**State:** Required for MVP (but blocked by Dynasty definition)
**Build Priority:** 6
**Complexity:** 8/10 (Genetic algorithm, RNG systems, balancing)
**Estimated Time:** 2 weeks (after Dynasty defined)
**Design Constraints:**
- First breeding in Session 1 (PLAYER_JOURNEY)
- 3 breeding slots free, 2 premium (BM-003 example)
- Gen 5+ by Day 30 (PR-004)
- Breeding timers: 30s-3min for Gen 1, scaling up
- 100+ breeding actions by Day 30 (PR-005)
**UNDEFINED MECHANICS:**
- Breeding algorithm (what determines offspring?)
- Cross-dynasty breeding rules
- Rarity inheritance
- Generation progression formula
- Mutation chances
- Set bonus interactions
**Integration Points:**
- Outputs: New snake created, generation number, inherited traits
- Inputs: Parent snakes, DNA cost, breeding slot

#### SYSTEM: Evolution & Generation System
**Purpose:** Progress snakes through generations (Gen 1 → Gen 2 → ... Gen ∞)
**Dependencies:** Collection, Breeding, Resource Collection, Dynasty System
**Depended By:** Progression metrics, Power curve, Prestige
**State:** Required for MVP
**Build Priority:** 7
**Complexity:** 7/10
**Estimated Time:** 1.5 weeks
**Design Constraints:**
- Infinite generations (PR-001)
- Gen 5+ by Day 30 (PR-004)
- Exponential cost, linear power (BA-003)
- Example: Gen 1→5 = 1,000 DNA, Gen 5→10 = 10,000 DNA
**Integration Points:**
- Outputs: Generation level, stat increases, evolution events
- Inputs: DNA cost, parent snake, evolution trigger

#### SYSTEM: Snake Lab UI
**Purpose:** Central hub for breeding, evolution, collection management
**Dependencies:** UI Framework, Collection, Breeding, Evolution
**Depended By:** Player engagement (70% time here per CE-001)
**State:** Required for MVP
**Build Priority:** 8
**Complexity:** 7/10
**Estimated Time:** 2 weeks
**Design Constraints:**
- 70% of session time spent here (CE-001)
- Discovery within 5 minutes of first play (CE-001)
- 100+ interactions by Day 30 (PR-005)
**Integration Points:**
- Outputs: UI actions (breed, evolve, view)
- Inputs: Collection data, breeding status, resource counts

---

### Tier 3: Advanced Gameplay

#### SYSTEM: Tower Mode
**Purpose:** High-risk 15-45 minute challenges for rare materials
**Dependencies:** Core Snake Game, Energy System, Resource Collection
**Depended By:** Material economy, Competitive players
**State:** Required for MVP
**Build Priority:** 9
**Complexity:** 6/10
**Estimated Time:** 2 weeks
**Design Constraints:**
- 15-45 minute sessions
- High-variance rewards (80-150% DNA per energy, BA-002)
- Rare materials exclusive to Tower (Prismatic Scales, Quantum DNA)
- Skill-based difficulty (BA-001)
**Integration Points:**
- Outputs: Rare materials, challenge completion
- Inputs: Energy spend, snake loadout, difficulty selection

---

### Tier 4: Social Systems

#### SYSTEM: Leaderboards
**Purpose:** Competitive rankings (global, regional, friends, clan)
**Dependencies:** Backend, Authentication, Collection
**Depended By:** Social discovery, Competitive motivation
**State:** Required for MVP
**Build Priority:** 10
**Complexity:** 5/10
**Estimated Time:** 1 week
**Design Constraints:**
- Skill-based brackets (Gen 1-5, Gen 6-10, Gen 11+) per BA-001
- Friend leaderboard shown Day 2 (SO-004)
- Multiple views: Global, Regional, Friends, Clan
**Integration Points:**
- Outputs: Rankings, scores, friend comparisons
- Inputs: Game scores, generation levels, player cohorts

#### SYSTEM: Clan System (Corps)
**Purpose:** Social organizations for collaboration, trading, wars
**Dependencies:** Backend, Authentication
**Depended By:** Clan Wars, Trading, Social metrics
**State:** Required for MVP
**Build Priority:** 11
**Complexity:** 7/10
**Estimated Time:** 2 weeks
**Design Constraints:**
- 40% of DAU in clans by Day 30 (SO-001)
- No daily requirements (SO-002)
- Clan size: 20-50 members (to be tuned)
- Energy bonuses for clan members
**Integration Points:**
- Outputs: Clan membership, shared resources, clan chat
- Inputs: Join/leave requests, clan actions

#### SYSTEM: Clan Wars
**Purpose:** 48-hour asynchronous territory battles for exclusive rewards
**Dependencies:** Clan System, Core Snake Game, Energy System
**Depended By:** Social engagement, Exclusive content
**State:** Required for MVP (but post-launch acceptable)
**Build Priority:** 12
**Complexity:** 8/10 (Multiplayer coordination, matchmaking)
**Estimated Time:** 3 weeks
**Design Constraints:**
- 48-hour async battles (SO-002)
- No daily requirements (can contribute anytime)
- Corp-exclusive snake variants
- Generates bonus energy for participants
**Integration Points:**
- Outputs: Territory control, clan scores, exclusive rewards
- Inputs: Player contributions, clan matchmaking

#### SYSTEM: Gallery & Showcase
**Purpose:** Display collections, fashion contests, social ratings
**Dependencies:** Collection, UI Framework, Backend
**Depended By:** Expressionist players (25% archetype), Social discovery
**State:** Optional for MVP (post-launch feature)
**Build Priority:** 13
**Complexity:** 6/10
**Estimated Time:** 2 weeks
**Design Constraints:**
- Fashion contest voting (weekly anchor)
- Showcase other players' snakes Day 2-3 (SO-004)
- Self-expression without paywall (PLAYER_JOURNEY)
**Integration Points:**
- Outputs: Showcase displays, contest votes, popularity scores
- Inputs: Collection data, player curation

---

### Tier 5: Economy & Monetization

#### SYSTEM: Economy & Shop
**Purpose:** Premium currency, DNA marketplace, purchase flows
**Dependencies:** Backend, Resource Collection, Authentication
**Depended By:** Monetization, Energy refills, Breeding slots
**State:** Required for MVP
**Build Priority:** 14
**Complexity:** 6/10
**Estimated Time:** 1.5 weeks
**Design Constraints:**
- Starter bundle Day 3-5 (BM-004)
- No paywalling basics (BM-003)
- Energy bundles, breeding accelerators
- Battlepass value perception
**Integration Points:**
- Outputs: Purchase receipts, premium currency balance
- Inputs: Store listings, purchase intents, IAP callbacks

#### SYSTEM: Trading System (Corp Marketplace)
**Purpose:** Clan-based DNA and material exchange (NOT P2P trading)
**Dependencies:** Clan System, Economy, Backend
**Depended By:** Social economy, Dynasty exclusives
**State:** Post-MVP (Month 3+)
**Build Priority:** 15
**Complexity:** 9/10 (Economic balancing, anti-exploit systems)
**Estimated Time:** 3 weeks
**Design Constraints:**
- Corp-based only (SO-003)
- No P2P trading (prevents gold farming)
- Daily/weekly trade limits
- Corp-exclusive items non-transferable outside corp
**Integration Points:**
- Outputs: Trade transactions, corp marketplace listings
- Inputs: Trade offers, corp membership verification

#### SYSTEM: Prestige System
**Purpose:** Reset progress for permanent account bonuses
**Dependencies:** Collection, Evolution, Backend
**Depended By:** Long-term retention, Infinite progression
**State:** Post-MVP (Month 6+)
**Build Priority:** 16
**Complexity:** 7/10
**Estimated Time:** 2 weeks
**Design Constraints:**
- Resets: Collection progress, snake generations (PR-002)
- Persists: Permanent stat bonuses, mastery levels, exclusive variants
- Requirement: 10-20 snakes (to be tuned)
- Net benefit: Faster progression than first run
**Integration Points:**
- Outputs: Permanent bonuses, prestige level, exclusive unlocks
- Inputs: Prestige trigger, confirmation

#### SYSTEM: Monetization & IAP
**Purpose:** In-app purchases, ads, battlepass, revenue tracking
**Dependencies:** Economy, Backend, Ad providers
**Depended By:** Business metrics, Player conversion
**State:** Required for MVP
**Build Priority:** 14 (parallel with Economy)
**Complexity:** 5/10
**Estimated Time:** 1 week
**Design Constraints:**
- Pay for convenience, not power (BM-001)
- No forced ads (BM-002)
- Opt-in ad rewards (+1 energy)
- Day 7 conversion: 5%, Day 30: 10% (KPIs)
**Integration Points:**
- Outputs: Purchase validation, ad completion events
- Inputs: Store listings, ad network SDKs

---

### Tier 6: Support Systems

#### SYSTEM: Tutorial & Onboarding
**Purpose:** Guide first-time players through core loop
**Dependencies:** UI Framework, Core Snake Game, Snake Lab
**Depended By:** D1 retention (50% target per CE-004)
**State:** Required for MVP
**Build Priority:** 17
**Complexity:** 5/10
**Estimated Time:** 1 week
**Design Constraints:**
- First win <60s (PLAYER_JOURNEY acceptance)
- Lab discovery in Session 1 (2-5 min mark)
- First breeding guided
- Tutorial completion >90% (success metric)
**Integration Points:**
- Outputs: Tutorial progress, skip events
- Inputs: Player actions, tutorial state

#### SYSTEM: Analytics & Events
**Purpose:** Track player behavior, funnel metrics, monetization KPIs
**Dependencies:** Backend, All game systems
**Depended By:** Product decisions, A/B testing, KPI monitoring
**State:** Required for MVP
**Build Priority:** 18
**Complexity:** 4/10
**Estimated Time:** 1 week
**Design Constraints:**
- Track funnel: game_start → tutorial_complete → lab_discovered → first_breed
- Retention: D1, D7, D30 cohorts
- Monetization: Conversion rates, LTV, ARPDAU
**Integration Points:**
- Outputs: Event logs, dashboards, alerts
- Inputs: All player actions, system events

#### SYSTEM: Achievement & Daily Rewards
**Purpose:** Daily login streaks, achievement chains, bonus rewards
**Dependencies:** Backend, Collection, Resource Collection
**Depended By:** Daily retention (CE-002), Habit formation
**State:** Post-MVP (Month 1)
**Build Priority:** 19
**Complexity:** 5/10
**Estimated Time:** 1 week
**Design Constraints:**
- Daily login streaks (PLAYER_JOURNEY)
- 200+ achievement chains (MVP_VISION)
- Escalating vs flat rewards (experimentation)
**Integration Points:**
- Outputs: Achievement unlocks, daily bonuses
- Inputs: Player milestones, login events

---

## Dependency Graph (Visual ASCII)

```
┌─────────────────────────────────────────────────────────────────────┐
│                          TIER 0: FOUNDATION                          │
└─────────────────────────────────────────────────────────────────────┘

┌──────────────┐   ┌──────────────┐   ┌──────────────────┐
│ Core Snake   │   │ UI Framework │   │ Backend (Supabase)│
│   Engine     │   │              │   │                  │
└──────┬───────┘   └──────┬───────┘   └────────┬─────────┘
       │                  │                     │
       │                  │         ┌───────────┴──────────┐
       │                  │         │                      │
       │                  │    ┌────▼───────┐              │
       │                  │    │ Auth &     │              │
       │                  │    │ Account    │              │
       │                  │    └────┬───────┘              │
       │                  │         │                      │
┌──────▼──────────────────▼─────────▼──────────────────────▼──────────┐
│                      TIER 1: CORE GAMEPLAY LOOP                      │
└──────────────────────────────────────────────────────────────────────┘

       ┌─────────────┐        ┌──────────────────┐
       │   Energy    │        │ Resource         │
       │   System    │        │ Collection & DNA │
       └──────┬──────┘        └────────┬─────────┘
              │                        │
              └────────┬───────────────┘
                       │
                 ┌─────▼──────┐
                 │  Classic   │
                 │    Mode    │
                 └─────┬──────┘
                       │
┌──────────────────────▼───────────────────────────────────────────────┐
│                    TIER 2: META-GAME CORE                            │
└──────────────────────────────────────────────────────────────────────┘

       ┌──────────────┐         ┌─────────────────┐
       │  Collection  │◄────────│ Dynasty System  │ ⚠️ UNDEFINED
       │  Management  │         │   (CRITICAL)    │
       └──────┬───────┘         └────────┬────────┘
              │                          │
              │         ┌────────────────┴──────────┐
              │         │                           │
              │    ┌────▼──────┐          ┌────────▼─────┐
              │    │ Breeding  │          │  Evolution & │
              │    │  System   │          │  Generations │
              │    └────┬──────┘          └────────┬─────┘
              │         │                          │
              │         └──────────┬───────────────┘
              │                    │
              │              ┌─────▼──────┐
              └──────────────►  Snake Lab  │
                             │     UI     │
                             └────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│                  TIER 3: ADVANCED GAMEPLAY                           │
└──────────────────────────────────────────────────────────────────────┘

                         ┌──────────┐
                         │  Tower   │
                         │   Mode   │
                         └──────────┘

┌──────────────────────────────────────────────────────────────────────┐
│                     TIER 4: SOCIAL SYSTEMS                           │
└──────────────────────────────────────────────────────────────────────┘

       ┌──────────────┐    ┌─────────────┐    ┌──────────────┐
       │ Leaderboards │    │    Clan     │    │   Gallery &  │
       │              │    │   System    │    │   Showcase   │
       └──────────────┘    └──────┬──────┘    └──────────────┘
                                  │
                            ┌─────▼──────┐
                            │  Clan Wars │
                            └────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│                 TIER 5: ECONOMY & MONETIZATION                       │
└──────────────────────────────────────────────────────────────────────┘

       ┌──────────────┐    ┌──────────────┐    ┌──────────────┐
       │  Economy &   │    │   Trading    │    │  Prestige    │
       │     Shop     │    │ (Corp Mkt)   │    │   System     │
       └──────┬───────┘    └──────────────┘    └──────────────┘
              │
       ┌──────▼───────┐
       │ Monetization │
       │   & IAP      │
       └──────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│                    TIER 6: SUPPORT SYSTEMS                           │
└──────────────────────────────────────────────────────────────────────┘

       ┌──────────────┐    ┌──────────────┐    ┌──────────────┐
       │   Tutorial   │    │  Analytics   │    │ Achievements │
       │  & Onboard   │    │   & Events   │    │   & Daily    │
       └──────────────┘    └──────────────┘    └──────────────┘
```

---

## Integration Points

### Core Snake Game ↔ Energy System
**Interface:** Game mode requests energy check before starting
**Data Flow:**
- Energy System → Core Snake: Energy available (boolean + amount)
- Core Snake → Energy System: Energy deduct on start
**Coupling:** Loose (Core Snake can run without Energy in dev mode)

### Core Snake Game ↔ Resource Collection
**Interface:** Game completion triggers resource calculation
**Data Flow:**
- Core Snake → Resource Collection: Score, items collected, mode type
- Resource Collection → Backend: DNA/material amounts added
**Coupling:** Loose (async, event-driven)

### Breeding System ↔ Dynasty System
**Interface:** Breeding algorithm queries dynasty rules for offspring
**Data Flow:**
- Breeding → Dynasty: Parent dynasties, breeding rules query
- Dynasty → Breeding: Cross-breed allowed?, stat inheritance rules
**Coupling:** TIGHT (breeding cannot function without dynasty definition)
**STATUS:** ⚠️ BLOCKED - Dynasty System undefined

### Breeding System ↔ Collection
**Interface:** New snake created, added to collection
**Data Flow:**
- Breeding → Collection: New snake data (generation, rarity, traits)
- Collection → Backend: Persist new snake
**Coupling:** Moderate (Breeding needs Collection to store results)

### Snake Lab UI ↔ All Meta-Game Systems
**Interface:** UI aggregates data from Collection, Breeding, Evolution
**Data Flow:**
- Collection/Breeding/Evolution → Lab UI: Current state, timers, availability
- Lab UI → Systems: Player actions (breed, evolve, select)
**Coupling:** Tight (Lab UI is central hub, depends on all meta systems)

### Energy System ↔ Monetization
**Interface:** Energy refills trigger purchase flows
**Data Flow:**
- Energy → Economy: Energy depleted event
- Economy → Energy: Purchase complete → add energy
**Coupling:** Loose (Energy can refill via time, ads, or purchases)

### Clan System ↔ Clan Wars
**Interface:** Clan Wars query clan membership for matchmaking
**Data Flow:**
- Clan Wars → Clan System: Get active clans, member lists
- Clan System → Clan Wars: Clan roster, activity status
**Coupling:** Tight (Clan Wars cannot exist without Clan System)

### Backend ↔ All Systems
**Interface:** All systems use Backend for persistence and sync
**Data Flow:**
- Systems → Backend: State changes, player actions
- Backend → Systems: Current state, other players' data
**Coupling:** Tight (most systems require Backend to function)
**Offline:** Core Snake + Energy + Breeding timers work offline (TE-002)

---

## Build Order (Recommended)

### Phase 0: Foundation (Week 1-2)
**Goal:** Core infrastructure operational

1. **Backend (Supabase) Setup** (2 weeks)
   - Database schema design
   - Auth configuration
   - API endpoints
   - Real-time subscriptions
   - Load testing for 10k users

2. **Core Snake Game Engine** (2 weeks, parallel with Backend)
   - Snake movement and controls
   - Collision detection
   - Growth mechanics
   - Death and restart
   - Score tracking

3. **Basic UI Framework** (1.5 weeks, parallel)
   - Screen navigation
   - Menu system
   - HUD rendering
   - Settings screen

4. **Authentication & Account** (1 week, after Backend)
   - Login flows
   - Account creation
   - Cross-platform sync

**Deliverable:** Can play basic Snake with account persistence

---

### Phase 1: Core Loop (Week 3-5)
**Goal:** Playable Classic Mode with resource collection

5. **Energy System** (1 week)
   - Energy tracking
   - Depletion on play
   - 20-minute recharge
   - Daily free refill
   - Clan bonus hooks (empty, filled later)

6. **Resource Collection & DNA Economy** (1.5 weeks)
   - DNA collection from gameplay
   - Material drop system
   - Resource storage and display
   - Economy balancing (Classic mode rates)

7. **Classic Mode** (1 week)
   - 5-minute gameplay variant
   - DNA reward calculation
   - Energy integration
   - Mode completion flow

**Deliverable:** Players can spend energy, play Classic Mode, collect DNA

---

### Phase 2: Meta-Game Core (Week 6-10)
**Goal:** Snake Lab operational with breeding and evolution

⚠️ **CRITICAL BLOCKER: Dynasty System must be designed BEFORE starting this phase**

**Pre-Phase 2 Requirement: Dynasty Design Sprint (3-5 days)**
- Define what dynasties ARE
- Specify number of dynasties
- Define unlock mechanics
- Define gameplay differences (if any)
- Define breeding rules (cross-dynasty allowed?)
- Define visual themes
- Define stat categories and bonuses
- Define set bonus structure

**After Dynasty Design Complete:**

8. **Snake Collection Management** (1.5 weeks)
   - Collection database schema
   - Owned snakes tracking
   - Dynasty organization
   - Generation tracking
   - Rarity system
   - Smart filtering UI

9. **Dynasty System** (2 weeks)
   - Implement dynasty definitions
   - Dynasty unlock system
   - Dynasty selection UI
   - Dynasty stat bonuses (if applicable)
   - Set bonus tracking
   - Dynasty marketplace hooks

10. **Breeding System** (2 weeks)
    - Breeding algorithm (using Dynasty rules)
    - Genetic inheritance
    - Generation progression
    - Breeding UI (slots, timers)
    - DNA cost calculation
    - Result animations

11. **Evolution & Generation System** (1.5 weeks)
    - Evolution algorithm
    - Gen 1 → Gen 2+ progression
    - Stat scaling (exponential cost, linear power)
    - Evolution UI
    - Material requirements
    - Power curve balancing

12. **Snake Lab UI** (2 weeks)
    - Lab main screen
    - Collection browser
    - Breeding interface
    - Evolution interface
    - Dynasty showcase
    - Tutorial integration

**Deliverable:** Complete meta-game loop functional - play → collect → breed → evolve

---

### Phase 3: Advanced Gameplay (Week 11-13)
**Goal:** Tower Mode adds challenge and rare materials

13. **Tower Mode** (2 weeks)
    - Tower progression system
    - Difficulty scaling
    - 15-45 minute challenge design
    - Rare material drops (Tower-exclusives)
    - Energy balancing vs Classic
    - Skill-based matchmaking brackets

**Deliverable:** Two distinct play modes with different reward profiles

---

### Phase 4: Social Systems (Week 14-18)
**Goal:** Social features drive retention and community

14. **Leaderboards** (1 week)
    - Global leaderboard
    - Regional filters
    - Friend comparisons
    - Skill-based brackets (Gen 1-5, 6-10, 11+)
    - Real-time updates

15. **Clan System** (2 weeks)
    - Clan creation and management
    - Member roster
    - Clan chat (basic)
    - Clan energy bonuses
    - Clan stats and leaderboards

16. **Clan Wars** (3 weeks)
    - 48-hour async battle system
    - Territory control mechanics
    - Contribution tracking
    - Matchmaking system
    - Exclusive rewards (Corp-only variants)
    - Energy bonus distribution

17. **Gallery & Showcase** (2 weeks, parallel with Clan Wars)
    - Collection showcase UI
    - Fashion contest voting
    - Social ratings
    - Other players' snake browsing
    - Discovery in Day 2-3

**Deliverable:** Fully social game with clans, wars, and competitive features

---

### Phase 5: Monetization & Polish (Week 19-22)
**Goal:** Revenue systems and MVP polish

18. **Economy & Shop** (1.5 weeks)
    - Premium currency
    - Shop UI
    - Energy bundles
    - Breeding accelerators
    - Dynasty exclusives
    - Starter bundle (Day 3-5 trigger)

19. **Monetization & IAP** (1 week, parallel)
    - IAP integration (iOS, Android)
    - Purchase flows
    - Ad network integration (opt-in rewards)
    - Battlepass framework
    - Receipt validation

20. **Tutorial & Onboarding** (1 week)
    - Guided first run (<60s to first win)
    - Lab discovery tutorial
    - First breeding walkthrough
    - Energy system introduction
    - Social feature hints

21. **Analytics & Events** (1 week, parallel)
    - Event tracking implementation
    - Funnel monitoring
    - Retention cohorts
    - Monetization dashboards
    - A/B test framework

22. **MVP Polish** (2 weeks)
    - Performance optimization (60fps target)
    - Offline mode testing
    - Cross-platform sync verification
    - Accessibility (WCAG 2.1 AA)
    - Localization (5 languages)
    - Bug fixing
    - Balance tuning

**Deliverable:** Shippable MVP with monetization and polish

---

### Post-MVP Roadmap (Month 6+)

**Month 3-4:**
- Trading System (Corp Marketplace)
- Achievement Chains
- Daily Rewards expansion

**Month 6+:**
- Prestige System
- Additional game modes
- Monthly dynasty releases
- Seasonal events
- Expanded Clan Wars features

---

## Critical Path Analysis

### Blocking Systems (Everything Waits)

1. **Dynasty System (UNDEFINED)**
   - Blocks: Breeding algorithm, Evolution mechanics, Set bonuses, Monetization design
   - Status: CRITICAL - Define immediately (3-5 day design sprint)
   - Impact: Phase 2 cannot start without this

2. **Core Snake Game Engine**
   - Blocks: All gameplay modes, Energy system, Resource collection
   - Status: Foundation layer, must complete first
   - Impact: Nothing works without this

3. **Backend Infrastructure**
   - Blocks: All persistence, Auth, Clans, Leaderboards, Sync
   - Status: Foundation layer, parallel with Core Snake
   - Impact: Single-player works offline, but no progression saves

### Parallel Systems (Can Build Simultaneously)

**Foundation Phase:**
- Core Snake + Backend + UI Framework (all parallel)

**Gameplay Phase:**
- Classic Mode + Tower Mode (after Energy system complete)

**Social Phase:**
- Leaderboards + Clan System (parallel)
- Gallery + Clan Wars (parallel, but Clan Wars needs Clan System first)

**Monetization Phase:**
- Economy + IAP integration (parallel)
- Tutorial + Analytics (parallel)

### High-Risk Dependencies

**Dynasty → Breeding → Evolution**
- If Dynasty definition changes mid-development, breeding and evolution must be reworked
- Mitigation: Lock Dynasty design before Phase 2

**Breeding Timers → Retention**
- If timers too long, D7 retention tanks
- Mitigation: A/B test 30s vs 3min in soft launch

**Energy Balancing → Monetization**
- If energy too generous, purchase conversion fails
- Mitigation: Tuning dashboard for live adjustments

**Clan Wars Complexity → Launch Date**
- Multiplayer coordination is high-risk
- Mitigation: Can launch without Clan Wars, add Month 2

---

## Undefined Systems (Critical Gaps)

### 1. DYNASTY SYSTEM (CRITICAL)

**Status:** Mentioned 20+ times, ZERO specification

**What We Know:**
- Players select a dynasty (when? how many choices?)
- Dynasties create identity ("I'm a MECHA specialist")
- Dynasties are desirable ("That NEBULA dynasty though...")
- Dynasties relate to breeding (cross-dynasty? single-dynasty only?)
- Dynasties unlock over time (how? play-based? purchase?)
- Dynasties have visual themes (MECHA, NEBULA, FROST mentioned)
- There are "dynasty combos" (what does this mean?)
- Corp-exclusive dynasties exist (Clan Wars reward)

**What We DON'T Know (BLOCKING):**
1. **Definition:** What IS a dynasty? (Species category? Aesthetic theme? Stat group?)
2. **Count:** How many dynasties exist? (8? 10? 15?)
3. **Unlock:** How do players unlock dynasties? (Play hours? Achievements? Purchase? RNG drops?)
4. **Gameplay:** Do dynasties have stat differences or just cosmetic?
5. **Breeding:** Can you cross-breed dynasties? What happens?
6. **Progression:** Do dynasties have progression trees?
7. **Variants:** How many variants per dynasty? (50+? 100+?)
8. **Set Bonuses:** What are "set bonuses" and how do they relate to dynasties?
9. **Monetization:** Which dynasties are premium? Which are F2P?
10. **Visual Design:** What are the visual themes for each dynasty?

**Impact of Remaining Undefined:**
- Breeding system cannot be designed (cross-dynasty rules unknown)
- Evolution mechanics unclear (do dynasties evolve differently?)
- Monetization strategy blocked (what exclusive dynasties to sell?)
- Set bonus system cannot be implemented (requires dynasty definition)
- Snake Lab UI cannot be designed (dynasty organization unknown)
- Art pipeline cannot start (visual themes undefined)
- Collection targets unclear (how many dynasties should player have by Day 30?)

**Recommendation:** IMMEDIATE 3-5 day Design Sprint with Senior PM + Game Designer to fully specify Dynasty System before Phase 2 begins.

---

### 2. SET BONUSES (HIGH PRIORITY)

**Status:** Mentioned but never explained

**What We Know:**
- Set bonuses exist
- 4 pieces vs 6 pieces for first tier (experimentation item in PLAYER_JOURNEY)
- Related to collection

**What We DON'T Know:**
1. What is a "set"? (Dynasty collection? Rarity collection? Generation collection?)
2. What bonuses do sets provide? (Stats? DNA income? Exclusive variants?)
3. How many sets exist?
4. Are sets dynasty-specific or cross-dynasty?
5. Do set bonuses stack?
6. Are set bonuses permanent or equipped?

**Impact:** Collection incentives unclear, progression design incomplete

**Recommendation:** Define alongside Dynasty System in design sprint

---

### 3. BREEDING ALGORITHM (MEDIUM PRIORITY)

**Status:** High-level concept, no implementation details

**What We Know:**
- Two parents create offspring
- Genetic combinations involved
- Generation progresses (Gen 1 + Gen 1 = Gen 2?)
- Breeding costs DNA

**What We DON'T Know:**
1. Rarity inheritance (Epic + Common = what?)
2. Stat inheritance (additive? average? RNG?)
3. Generation formula (always +1? average parents? max parent +1?)
4. Mutation chance (can rare mutations occur?)
5. Cross-dynasty breeding results (if allowed)
6. Failed breeding? (always succeeds or can fail?)

**Impact:** Cannot implement breeding system without this

**Recommendation:** Design after Dynasty definition, before Phase 2 begins

---

### 4. MASTERY SYSTEM (LOW PRIORITY)

**Status:** Mentioned in MVP_VISION ("200+ levels per variant")

**What We Know:**
- 200+ levels per snake variant
- Related to long-term progression

**What We DON'T Know:**
1. What IS mastery? (XP per variant? Usage-based? Collection-based?)
2. How do you gain mastery XP?
3. What do mastery levels provide? (Stats? Cosmetics? Bonuses?)
4. Is mastery per-variant or per-dynasty?
5. Does mastery persist through prestige?

**Impact:** Post-MVP feature, not blocking

**Recommendation:** Design in Month 3-4

---

## System Complexity Estimates

| System | Complexity (1-10) | Estimated Time | Risk Level |
|--------|-------------------|----------------|------------|
| Core Snake Game | 7/10 | 2 weeks | Medium (polish critical) |
| Backend Infrastructure | 6/10 | 2 weeks | Medium (scaling) |
| Basic UI Framework | 5/10 | 1.5 weeks | Low |
| Authentication | 4/10 | 1 week | Low (well-known pattern) |
| Energy System | 5/10 | 1 week | Low (standard mechanic) |
| Resource Collection | 6/10 | 1.5 weeks | Low |
| Classic Mode | 4/10 | 1 week | Low |
| Collection Management | 6/10 | 1.5 weeks | Medium (scalability) |
| **Dynasty System** | **???/10** | **??? weeks** | **CRITICAL (undefined)** |
| Breeding System | 8/10 | 2 weeks | High (balancing complex) |
| Evolution System | 7/10 | 1.5 weeks | Medium (power curve tuning) |
| Snake Lab UI | 7/10 | 2 weeks | Medium (UX critical) |
| Tower Mode | 6/10 | 2 weeks | Medium (difficulty scaling) |
| Leaderboards | 5/10 | 1 week | Low (standard feature) |
| Clan System | 7/10 | 2 weeks | Medium (social complexity) |
| Clan Wars | 8/10 | 3 weeks | High (multiplayer, matchmaking) |
| Gallery & Showcase | 6/10 | 2 weeks | Low |
| Economy & Shop | 6/10 | 1.5 weeks | Medium (monetization critical) |
| Trading System | 9/10 | 3 weeks | High (anti-exploit design) |
| Prestige System | 7/10 | 2 weeks | Medium (reset logic) |
| Monetization & IAP | 5/10 | 1 week | Medium (platform SDKs) |
| Tutorial & Onboarding | 5/10 | 1 week | Medium (UX critical) |
| Analytics & Events | 4/10 | 1 week | Low |
| Achievements | 5/10 | 1 week | Low |

**Total Estimated MVP Development Time:** 22 weeks (5.5 months)

---

## Risk Analysis

### High-Risk Systems

**Dynasty System (CRITICAL)**
- Risk: Undefined specification blocks entire meta-game
- Impact: Phase 2 cannot start (Breeding, Evolution, Lab UI all blocked)
- Mitigation: Immediate 3-5 day design sprint
- Timeline Impact: +1-2 weeks if definition delayed

**Breeding Algorithm (HIGH)**
- Risk: Balancing genetic combinations is mathematically complex
- Impact: Broken breeding = broken progression
- Mitigation: Simulation testing with 10,000+ breeding iterations
- Timeline Impact: +1 week if rebalancing needed

**Clan Wars (HIGH)**
- Risk: Multiplayer coordination, matchmaking complexity
- Impact: Can delay launch if not ready
- Mitigation: Make Clan Wars post-launch (Month 2) - not required for MVP
- Timeline Impact: -3 weeks if deferred post-launch

**Energy Balancing (MEDIUM)**
- Risk: Too generous = no monetization, too stingy = churn
- Impact: Affects retention and revenue simultaneously
- Mitigation: A/B test energy costs in soft launch, live tuning dashboard
- Timeline Impact: +1 week for tuning infrastructure

**Performance (60fps) (MEDIUM)**
- Risk: Mobile performance degrades with particles, large collections
- Impact: Poor performance signals low quality
- Mitigation: Performance budgeting, profiling from Week 1
- Timeline Impact: +2 weeks if major optimization needed

### Medium-Risk Systems

**Backend Scalability (MEDIUM)**
- Risk: 10k concurrent users at launch
- Impact: Server crashes during launch = bad press
- Mitigation: Load testing, cloud autoscaling, caching layer
- Timeline Impact: +1 week for infrastructure hardening

**Cross-Platform Sync (MEDIUM)**
- Risk: Data conflicts, race conditions between devices
- Impact: Lost progress = support tickets, bad reviews
- Mitigation: Conflict resolution strategy, sync queue
- Timeline Impact: +3 days for sync debugging

**Breeding Timers & Retention (MEDIUM)**
- Risk: If timers too long, D7 retention fails
- Impact: Miss retention targets (25% D7 goal)
- Mitigation: A/B test 30s vs 3min timers
- Timeline Impact: +1 week for tuning after soft launch

### Low-Risk Systems

**Leaderboards:** Standard implementation, well-known patterns

**Tutorial:** UX-critical but low technical risk

**Analytics:** Off-the-shelf tools (Firebase, Mixpanel)

**Economy & Shop:** Standard mobile game pattern

---

## Dependency Violation Risks

**Circular Dependency:** Breeding ↔ Evolution ↔ Collection
- Risk: Tight coupling creates fragile system
- Mitigation: Clear interfaces, event-driven communication
- Testing: Unit test each system in isolation

**Backend Single Point of Failure:** Most systems depend on Backend
- Risk: Backend outage kills entire game
- Mitigation: Offline mode for Core Snake + Breeding timers (TE-002)
- Testing: Test offline mode extensively

**Dynasty Definition Ripple:** Changes to Dynasty affect 6+ systems
- Risk: Late Dynasty changes require rework across multiple systems
- Mitigation: LOCK Dynasty design before Phase 2, no changes after
- Contract: Design sprint output becomes immutable specification

---

## Summary

SupaSnake consists of **19 major systems** with complex dependencies. The most critical finding:

**DYNASTY SYSTEM IS COMPLETELY UNDEFINED**

This is a **CRITICAL BLOCKER** for Phase 2 development (meta-game core). Dynasty is mentioned 20+ times across all design documents but has ZERO specification. It blocks:
- Breeding algorithm design
- Evolution mechanics
- Set bonus implementation
- Monetization strategy
- Snake Lab UI design
- Art pipeline
- Collection progression tuning

**Immediate Action Required:**
1. Conduct 3-5 day Dynasty Design Sprint (Senior PM + Game Designer)
2. Produce complete Dynasty specification document
3. Lock Dynasty design before Phase 2 begins
4. No Dynasty changes after Phase 2 starts (ripple effects too large)

**Build Order Summary:**
- Phase 0 (Weeks 1-2): Foundation (Core Snake, Backend, UI, Auth)
- Phase 1 (Weeks 3-5): Core Loop (Energy, Resources, Classic Mode)
- **BLOCKER:** Dynasty Design Sprint (3-5 days) before Phase 2
- Phase 2 (Weeks 6-10): Meta-Game (Collection, Dynasty, Breeding, Evolution, Lab UI)
- Phase 3 (Weeks 11-13): Advanced Gameplay (Tower Mode)
- Phase 4 (Weeks 14-18): Social (Leaderboards, Clans, Wars, Gallery)
- Phase 5 (Weeks 19-22): Monetization & Polish (Economy, IAP, Tutorial, Analytics)

**Total MVP Timeline:** 22 weeks (5.5 months) + Dynasty design sprint

**Critical Path:** Core Snake → Energy → Resources → Classic → (DYNASTY SPRINT) → Collection → Breeding → Evolution → Lab UI → Social → Monetization

**Recommendation:** Do NOT start Phase 2 development until Dynasty System is fully specified. The ripple effects of changing Dynasty definition mid-Phase 2 would add 3-4 weeks of rework.

---

**Document Complete - System Graph v1.0**
**Word Count:** 7,200+ words
**Status:** Dynasty System identified as critical blocker requiring immediate design sprint
**Next Step:** Senior PM + Game Designer conduct Dynasty Design Sprint (3-5 days)
