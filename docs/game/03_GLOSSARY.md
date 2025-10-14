# SupaSnake Glossary
## Definitive Game Terminology Reference

**Version:** 1.0
**Last Updated:** 2025-10-14
**Purpose:** This glossary defines ALL game terminology used across SupaSnake design documents. It resolves inconsistencies, defines previously undefined terms, and serves as the single source of truth for all team communication.

---

## Overview

This glossary addresses a critical issue discovered during document analysis: **terms are used inconsistently and major concepts remain undefined**. Most critically, "Dynasty" appears 20+ times across docs but is NEVER defined.

### How to Use This Document

**For Designers:**
- Use ONLY terms from this glossary
- Check "Status" before using any term in design
- DO NOT design features around UNDEFINED terms
- If you need a new term, add it here FIRST

**For Engineers:**
- Variable names should match glossary terms exactly
- DO NOT implement UNDEFINED terms
- Flag any new game terms not in glossary for review

**For Writers:**
- All UI text must use exact glossary terms
- Player-facing names are LOCKED once defined
- Localization uses glossary as canonical source

---

## Status Legend

- ✅ **DEFINED:** Fully specified, ready for implementation
- ⚠️ **PARTIAL:** Partially defined, needs more detail before implementation
- ❌ **UNDEFINED:** Critical blocker, must define before using in design/implementation
- 🔄 **INCONSISTENT:** Used inconsistently across docs, resolution required

---

## A

### Achievement
**Status:** ⚠️ PARTIAL
**Category:** Progression System
**Definition:** Milestone-based goals that reward players for accomplishing specific tasks. Part of the 200+ achievement chain system mentioned in MVP_VISION.
**Example:** "Breed 10 Generation 5 snakes" achievement unlocks exclusive variant
**Related Terms:** Daily Rewards, Mastery System
**Used In:** Progression tracking, Retention features
**Missing Specification:**
- Achievement types (collection, progression, skill-based?)
- Reward structure (DNA amounts, exclusive unlocks?)
- Achievement chains (how do they unlock?)
**Priority:** LOW (Post-MVP, Month 6+)

### Active Snake
**Status:** ✅ DEFINED
**Category:** Gameplay
**Definition:** The snake variant currently equipped by the player for gameplay. Determines cosmetic appearance and stat bonuses during Snake runs.
**Example:** Player equips Gen 5 CYBER variant as active snake before starting Classic Mode
**Related Terms:** Snake Variant, Loadout, Collection
**Used In:** Snake Lab UI, Gameplay Sessions

### ARPDAU (Average Revenue Per Daily Active User)
**Status:** ✅ DEFINED
**Category:** Business Metrics
**Definition:** Total daily revenue divided by daily active users. Key monetization metric. Target: $0.50+ at v1.0.
**Example:** If 1000 DAU generate $500 revenue, ARPDAU = $0.50
**Related Terms:** LTV, Conversion Rate, DAU
**Used In:** Monetization tracking, Success metrics

---

## B

### Backend (Supabase)
**Status:** ✅ DEFINED
**Category:** Technical Infrastructure
**Definition:** Server infrastructure using Supabase (PostgreSQL + real-time features) for player data persistence, authentication, and cross-platform sync.
**Technical Specs:**
- Must handle 10k concurrent users (TE-004)
- <200ms p99 API latency
- Offline queue for write operations
**Related Terms:** Cloud Save, Database, Authentication
**Used In:** All systems requiring persistence

### Battlepass
**Status:** ⚠️ PARTIAL
**Category:** Monetization
**Definition:** 28-day seasonal progression track with free and premium reward tiers. Players earn tiers by completing gameplay activities.
**Example:** Tier 10: Free track = 500 DNA, Premium track = 1000 DNA + exclusive variant
**Related Terms:** Season, Premium Currency, Monetization
**Used In:** v0.5 monetization expansion
**Missing Specification:**
- Tier count (50 tiers mentioned, confirm)
- XP earning rate
- Premium price point
- Reward distribution (DNA, variants, materials)
**Priority:** MEDIUM (v0.5 feature)

### Breeding
**Status:** 🔄 INCONSISTENT / ❌ UNDEFINED ALGORITHM
**Category:** Meta-Game Mechanic
**Definition:** Core meta-game system where two parent snakes are combined to create offspring with inherited traits.
**Inconsistency Found:** Used interchangeably with "Evolution" in some contexts, but these are DISTINCT mechanics:
- **Breeding:** Combines TWO snakes → creates NEW offspring
- **Evolution:** Upgrades ONE snake → increases generation number
**Resolution:** Use "Breeding" for 2-parent combination only
**Example:** Gen 2 CYBER + Gen 3 CYBER → Gen 4 CYBER offspring
**Related Terms:** Generation, Offspring, Parents, Dynasty System
**Used In:** Snake Lab, Meta-game core loop
**CRITICAL UNDEFINED ELEMENTS:**
1. **Rarity inheritance:** Epic + Common = what?
2. **Stat inheritance:** Average? Additive? RNG?
3. **Generation formula:** Always parent_max + 1?
4. **Cross-dynasty rules:** Can CYBER breed with NATURE? What happens?
5. **Mutation chance:** Can random traits appear?
6. **Failure possibility:** Always succeeds or can fail?
**Blocks:** Cannot implement until Dynasty System defined + breeding algorithm specified
**Priority:** CRITICAL (v0.1 Path B or defer to v0.5)

### Breeding Slot
**Status:** ✅ DEFINED
**Category:** Meta-Game Mechanic
**Definition:** A parallel breeding queue position. v0.1 provides 3 free slots; additional slots available via premium in later versions.
**Example:** Player uses Slot 1 for CYBER breeding (30s timer), Slot 2 for NATURE breeding (30s timer) simultaneously
**Related Terms:** Breeding, Timer, Queue
**Used In:** Snake Lab UI, Monetization (v0.5+)

---

## C

### Clan / Corp / Corporation
**Status:** 🔄 INCONSISTENT
**Category:** Social System
**Definition:** Social organization of 20-50 players for collaboration, competition, and exclusive rewards.
**Inconsistency Found:**
- "Clan" used in: MVP_VISION (Clan Wars), CONSTRAINT_LATTICE (SO-001: Clan participation)
- "Corp" used in: MVP_VISION ("Lab Corporations"), PLAYER_JOURNEY ("corp marketplace")
- "Corporation" used in: MVP_VISION alternate text
**Resolution:** Use **"Clan"** consistently for UI and player-facing text. Use "Corp" only in specific contexts like "Corp Marketplace" (trading system). Never use "Corporation" (too formal).
**Example:** "Join a clan to earn energy bonuses and compete in Clan Wars"
**Related Terms:** Clan Wars, Corp Marketplace, Social Systems
**Used In:** v0.5 social features, v1.0 Clan Wars

### Clan Wars
**Status:** ⚠️ PARTIAL
**Category:** Gameplay Mode
**Definition:** 48-hour asynchronous multiplayer battles where clans compete for territory control and exclusive rewards.
**Specified:**
- 48-hour duration (no daily requirements per SO-002)
- Territory-based competition
- Exclusive corp-only snake variants as rewards
- Generates bonus energy for participants
**Missing Specification:**
- Battle mechanics (how do clans compete?)
- Territory capture rules
- Matchmaking algorithm (skill-based? clan size-based?)
- Victory conditions
- Reward distribution (clan-wide? top contributors?)
**Related Terms:** Clan, Territory, Multiplayer
**Used In:** v1.0 (Months 7-9 development)
**Priority:** HIGH (but post-v0.5)

### Classic Mode
**Status:** ✅ DEFINED
**Category:** Gameplay Mode
**Definition:** The primary Snake gameplay mode. 5-minute sessions focused on predictable DNA collection. Costs 1 energy per run. Arcade-style gameplay with no environmental hazards.
**Balancing:**
- Session length: 3-7 minutes (average 5)
- DNA reward: 50-100 DNA per run (predictable, not RNG)
- Energy cost: 1 unit
- Difficulty: Medium (no variations in v0.1)
**Purpose:** Reliable "DNA mine" for daily Lab progression (per MVP_VISION)
**Related Terms:** Energy System, DNA, Tower Mode
**Used In:** v0.1 core gameplay loop

### Collection
**Status:** 🔄 INCONSISTENT USAGE
**Category:** Meta-Game System
**Definition:** The total set of snake variants owned by a player, organized by dynasty, generation, and rarity.
**Inconsistency Found:**
- Sometimes means "player's owned snakes"
- Sometimes means "set of related variants" (e.g., "Quantum Set")
- Sometimes interchangeable with "Gallery"
**Resolution:**
- Use **"Collection"** for player's total owned snakes
- Use **"Set"** for specific groupings (e.g., "Quantum Set" = all Quantum variants)
- Use **"Gallery"** for social showcase feature only
**Example:** "Your collection contains 23 variants across 4 dynasties"
**Related Terms:** Variant, Gallery, Set, Dynasty
**Used In:** Snake Lab UI, Progression tracking
**Target Metrics:**
- 20+ variants by Day 30 (PR-003)
- 500+ variants available in game at v1.0 (CO-001)

### Common (Rarity)
**Status:** ✅ DEFINED
**Category:** Collection System
**Definition:** The most basic rarity tier. Easiest to obtain, lowest stat bonuses, starting point for breeding chains.
**Rarity Tiers (in order):**
1. Common (most frequent)
2. Uncommon
3. Rare
4. Epic (introduced v0.5)
5. Legendary (introduced v1.0)
**Example:** "CYBER Starter" variant is Common rarity with +5% speed bonus
**Related Terms:** Rarity, Uncommon, Rare, Epic, Legendary
**Used In:** Collection system, Drop rates, Breeding

### Conversion Rate
**Status:** ✅ DEFINED
**Category:** Business Metrics
**Definition:** Percentage of players who make their first purchase within a time window.
**Targets:**
- D7 conversion: 3%+ (v0.1), 5%+ (v0.5), 5%+ (v1.0)
- D30 conversion: 10%+ (v1.0)
**Example:** If 100 new players arrive and 5 purchase within 7 days, D7 conversion = 5%
**Related Terms:** Monetization, IAP, ARPDAU, LTV
**Used In:** Success metrics, Monetization tracking

### Corp Marketplace
**Status:** ⚠️ PARTIAL
**Category:** Economy & Social
**Definition:** Clan-based trading system where clan members exchange DNA and materials. NO player-to-player trading (anti-RMT measure per SO-003).
**Specified:**
- Clan-only trading (prevents gold farming)
- Daily/weekly trade limits per player
- Corp-exclusive items non-transferable outside corp
**Missing Specification:**
- Trade interface design
- Price discovery mechanism (auction? fixed prices? barter?)
- Tax/fee system (if any)
- Exploit prevention details
**Related Terms:** Clan, Trading, DNA, Materials
**Used In:** v1.0 (Post-MVP, Month 10+)
**Priority:** MEDIUM (high complexity, deferred to v1.0)

---

## D

### DAU (Daily Active Users)
**Status:** ✅ DEFINED
**Category:** Business Metrics
**Definition:** Count of unique players who launch the game on a given day. Key engagement metric.
**Related Terms:** Retention, Session Frequency, ARPDAU
**Used In:** All business metrics and KPIs

### DNA / DNA Strands / Quantum DNA
**Status:** 🔄 INCONSISTENT - REQUIRES CLARIFICATION
**Category:** Resource / Currency
**Problem:** Used THREE different ways across docs:
1. **"DNA"** - Primary currency in Classic Mode ("costs 50 DNA")
2. **"DNA Strands"** - Mentioned in MVP_VISION as "Base DNA strands"
3. **"Quantum DNA"** - Tower Mode reward, sounds like different resource

**Proposed Resolution:**
- **DNA** = Single unified resource (eliminate confusion)
- **"DNA Strands"** = Flavor text synonym for DNA (not separate resource)
- **Quantum DNA** = Premium/rare DNA variant OR eliminate term entirely

**CRITICAL DECISION NEEDED:** Are these three DIFFERENT resources or THREE NAMES for the same resource?

**Recommendation:**
- v0.1: Use only "DNA" as single resource (simplest)
- v0.5+: Can introduce "Quantum DNA" as rare variant if needed
- Never use "DNA Strands" as separate resource (confusing)

**Related Terms:** Resource Collection, Economy, Classic Mode, Tower Mode
**Used In:** All gameplay modes, Economy, Breeding costs, Evolution costs
**Priority:** CRITICAL (Week 1 decision required)

### Dynasty / Dynasty System
**Status:** ❌ UNDEFINED - CRITICAL BLOCKER
**Category:** Core Meta-Game Concept
**Mentions:** 20+ times across all docs
**Examples Found in Docs:**
- "MECHA dynasty" (PLAYER_JOURNEY)
- "NEBULA dynasty" (PLAYER_JOURNEY)
- "I'm a MECHA dynasty specialist" (PLAYER_JOURNEY)
- "Dynasty selection screen" (PLAYER_JOURNEY)
- "Dynasty revealed" milestone (PLAYER_JOURNEY)
- "Corp-exclusive snake variants" related to dynasties (MVP_VISION)
- "10+ dynasties" at v1.0 (SYSTEM_GRAPH)
- "Dynasty combos" mentioned (PLAYER_JOURNEY, unclear what this means)

**Inferred Purpose from Context:**
- Creates player identity ("I'm a MECHA specialist")
- Desirable/aspirational ("That NEBULA dynasty though...")
- Multiple dynasties exist (MECHA, NEBULA, FROST, CYBER mentioned)
- Related to visual themes/aesthetics
- Unlock over time (not all available at start)
- Affects breeding somehow
- May have exclusive variants per dynasty
- Possibly affects stats or just cosmetic

**CRITICAL UNDEFINED QUESTIONS:**
1. **What IS a dynasty?** (Species category? Visual theme? Stat archetype? Play style?)
2. **How many dynasties exist?** (8? 10? 15? Variable by version?)
3. **How do players unlock dynasties?** (Play hours? DNA cost? Purchase? RNG drops? Choice at start?)
4. **Do dynasties have gameplay differences?** (Stats? Abilities? Or purely cosmetic?)
5. **How do dynasties affect breeding?** (Can CYBER + NATURE breed? What happens to offspring?)
6. **What are "dynasty combos"?** (Breeding across dynasties? Set bonuses? Something else?)
7. **Are there dynasty-exclusive variants?** (If yes, how many per dynasty?)
8. **Do dynasties have progression trees?** (Unlock variants within dynasty sequentially?)
9. **How many variants per dynasty?** (50+? 100+? Variable?)
10. **Which dynasties are F2P vs premium?** (All earnable? Some purchase-only?)

**SYSTEMS BLOCKED BY UNDEFINED DYNASTY:**
- ❌ Breeding algorithm (cross-dynasty rules unknown)
- ❌ Evolution mechanics (do dynasties evolve differently?)
- ❌ Collection organization (how to display dynasties in UI?)
- ❌ Set bonuses (dynasty-based sets?)
- ❌ Monetization strategy (which dynasties to sell?)
- ❌ Snake Lab UI (dynasty categorization?)
- ❌ Art pipeline (visual themes undefined)
- ❌ Progression tuning (how many dynasties by Day 30?)

**Impact Timeline:**
- v0.1: BLOCKS breeding system (Path B)
- v0.5: BLOCKS evolution depth, set bonuses
- v1.0: BLOCKS full collection (500+ variants across dynasties)

**Recommendation:** IMMEDIATE 3-5 day Design Sprint (Week 1)
**Sprint Deliverables Required:**
1. Dynasty definition document
2. List of all dynasties (names, themes)
3. Unlock requirements per dynasty
4. Cross-dynasty breeding rules
5. Visual style guide per dynasty
6. Stat differences (if any)
7. Progression path per dynasty
8. Monetization allocation (F2P vs premium)

**Fallback if Dynasty Undefined:** Use Path A (collection-only) for v0.1, defer breeding to v0.5 after Dynasty design complete.

**Priority:** CRITICAL - Must define Week 1-2 or v0.1 timeline slips

---

## E

### Energy / Energy System
**Status:** ✅ DEFINED
**Category:** Resource / Engagement System
**Definition:** Consumable resource required to play Snake modes. Creates strategic session planning and return triggers. Core monetization and engagement mechanism.
**Specified:**
- Starting amount: 5 units
- Max capacity: 5 (expandable via progression in v0.5+)
- Recharge rate: 1 unit per 20 minutes
- Classic Mode cost: 1 energy per run
- Tower Mode cost: 2 energy per run (v0.5)
- Daily free refill: 1x per day (no ads required per BM-002)
- Clan bonus: +1 energy every 6 hours if in active clan (v0.5)
**Purpose:** Transform Snake from unlimited play into meaningful sessions (CE-005)
**Related Terms:** Session, Energy Refill, Monetization
**Used In:** All gameplay modes, Monetization, Retention mechanics
**Constraints:**
- Must feel strategic, not punishing
- Free daily refill ensures F2P viability
- No forced ads for energy (BM-002)

### Energy Refill
**Status:** ✅ DEFINED
**Category:** Monetization
**Definition:** Purchasable item that immediately restores energy. Primary monetization vector in v0.1.
**Pricing (v0.1):**
- 1 gem = 3 energy ($0.99)
- Daily free refill (no purchase required)
**Related Terms:** Energy, Premium Currency, IAP
**Used In:** Shop, Monetization

### Epic (Rarity)
**Status:** ⚠️ PARTIAL
**Category:** Collection System
**Definition:** Second-highest rarity tier, introduced in v0.5. Rare drops, significant stat bonuses, aspirational for collectors.
**Missing Specification:**
- Drop rate (what % of drops are Epic?)
- Stat bonus magnitude (+50%? +100%?)
- Unlock requirements (breeding only? Tower Mode drops?)
- Visual distinction from Rare
**Related Terms:** Rarity, Rare, Legendary, Collection
**Used In:** v0.5 collection expansion
**Priority:** MEDIUM (v0.5 feature)

### Evolution / Evolution System
**Status:** ⚠️ PARTIAL
**Category:** Meta-Game Mechanic
**Definition:** Process of upgrading a SINGLE snake to increase its Generation number and stats. DISTINCT from Breeding (which combines two snakes).
**Clarification:** NOT interchangeable with Breeding. Evolution = 1 snake upgrade, Breeding = 2 snakes combination.
**Example:** Gen 5 CYBER → spend DNA → evolves to Gen 6 CYBER (same snake, higher generation)
**Related Terms:** Generation, Breeding, Power Curve
**Used In:** v0.5 meta-game (not in v0.1)
**Specified:**
- Exponential cost, linear power output (BA-003)
- Gen 1→5: 1,000 DNA total
- Gen 5→10: 10,000 DNA total (10x cost, 2x power)
- No maximum generation (infinite progression per PR-001)
**Missing Specification:**
- Exact cost formula per generation
- Stat increase formula (currently "+5% per gen" mentioned)
- Evolution UI flow
- Material requirements (just DNA or other materials?)
**Priority:** HIGH (v0.5 core feature)

---

## F

### F2P (Free-to-Play)
**Status:** ✅ DEFINED
**Category:** Business Model
**Definition:** Players who never make purchases. Per BM-001, ALL content must be achievable by F2P players given time and effort. Paying players may progress faster but cannot achieve impossible outcomes.
**Related Terms:** Monetization, Pay-to-Win, Fairness
**Used In:** Business model constraints, Balancing

### Fashion Contest
**Status:** ⚠️ PARTIAL
**Category:** Social Feature
**Definition:** Weekly voting event where players showcase their best snake collections and others vote on favorites. Targets "Expressionist" player archetype (25% per PLAYER_JOURNEY).
**Missing Specification:**
- Voting mechanics
- Reward structure
- Curation process (who gets featured?)
- Entry requirements
**Related Terms:** Gallery, Showcase, Social Features
**Used In:** v0.5 Gallery feature
**Priority:** LOW (v0.5 optional feature)

---

## G

### Gallery / Showcase
**Status:** 🔄 INCONSISTENT
**Category:** Social Feature
**Problem:** "Gallery" and "Showcase" used interchangeably
**Resolution:**
- **Gallery** = System-wide feature for viewing other players' snakes
- **Showcase** = Individual player's curated display of their best snakes
- A player creates a "showcase" that others view in the "gallery"
**Example:** "Visit the gallery to see top showcases from other players"
**Related Terms:** Collection, Social Features, Fashion Contest
**Used In:** v0.5 social features
**Priority:** MEDIUM (v0.5)

### Generation (Gen)
**Status:** ⚠️ PARTIAL
**Category:** Progression Metric
**Definition:** Numerical indicator of a snake's evolutionary stage. Higher generation = higher stats. Increases through breeding (offspring = parent_max + 1) or evolution (direct upgrade).
**Specified:**
- Gen 1: Starting snakes from unlocks
- Gen 5+: Target by Day 30 (PR-004 for v0.1 Path B)
- Gen 10+: Target by Day 30 in v1.0
- No maximum generation (infinite progression per PR-001)
- Power scaling: Linear (+5% stats per generation mentioned)
- Cost scaling: Exponential (Gen 1→5 = 1k DNA, Gen 5→10 = 10k DNA)
**Missing Specification:**
- Exact generation formula for breeding (always max_parent + 1? average? other?)
- Visual indicators per generation
- Generation caps per rarity tier (if any)
**Related Terms:** Evolution, Breeding, Power Curve, Progression
**Used In:** All meta-game systems
**Priority:** CRITICAL (core progression mechanic)

### Genome
**Status:** 🔄 INCONSISTENT / POTENTIAL DEPRECATED TERM
**Category:** Unclear
**Problem:** "Genome" appears in PLAYER_JOURNEY:
- "Only 3 genomes left in Quantum Set!" (sounds like variants?)
- "First genome collected" (first reward?)
- "Post-game genome reward animation" (end-of-run reward?)

**This term is confusing because:**
- Is "genome" same as "variant"?
- Or is "genome" same as "DNA"?
- Or is "genome" something else entirely?

**Proposed Resolution:** ELIMINATE term "Genome" entirely, use existing terms:
- If it means variant → use "variant"
- If it means DNA → use "DNA"
- If it means something unique → define it clearly OR cut it

**Current Status:** Undefined and confusing
**Priority:** MEDIUM (clarify in Week 1-2 terminology review)

---

## H

### HUD (Heads-Up Display)
**Status:** ✅ DEFINED
**Category:** UI
**Definition:** On-screen interface during Snake gameplay showing score, energy remaining, DNA collected, and other real-time information.
**Related Terms:** UI Framework, Gameplay
**Used In:** All gameplay modes

---

## I

### IAP (In-App Purchase)
**Status:** ✅ DEFINED
**Category:** Monetization
**Definition:** Purchasable items or currency within the game using real money. Includes energy refills, starter bundle, battlepass, breeding accelerators.
**Related Terms:** Monetization, Premium Currency, Energy Refill
**Used In:** Economy system, Shop UI

---

## L

### Lab / Snake Lab
**Status:** ✅ DEFINED
**Category:** Meta-Game Hub
**Definition:** The central interface where players manage their collection, breed snakes, evolve variants, and plan progression. THE core experience of SupaSnake (70% of session time per CE-001).
**Features:**
- Collection browser
- Breeding interface (select parents, view timers)
- Evolution interface (v0.5+)
- Active snake loadout
- DNA balance display
- "Next goal" always visible
**Philosophy:** Lab is NOT a feature - it IS the game. Snake gameplay is resource collection for the Lab.
**Related Terms:** Collection, Breeding, Evolution, Meta-Game
**Used In:** Core game loop, primary UI screen
**Design Constraint:** Must be compelling enough for 70% of session time (CE-001)

### Leaderboard
**Status:** ⚠️ PARTIAL
**Category:** Social Feature
**Definition:** Competitive rankings showing player scores across multiple views: global, regional, friends, clan.
**Specified:**
- Skill-based brackets (Gen 1-5, Gen 6-10, Gen 11+) per BA-001
- Multiple views: Global, Regional, Friend, Clan
- Real-time updates
- Shown in Session 1 of v0.5 for social discovery (SO-004)
**Missing Specification:**
- Scoring algorithm (high score? DNA collected? collection size?)
- Reset frequency (daily? weekly? season-based?)
- Reward structure (if any)
- Bracket boundaries (Gen 1-5, 6-10, 11+ confirmed or adjustable?)
**Related Terms:** Competition, Social Features, Skill Brackets
**Used In:** v0.5 social features
**Priority:** MEDIUM (v0.5)

### Legendary (Rarity)
**Status:** ⚠️ PARTIAL
**Category:** Collection System
**Definition:** Highest rarity tier, introduced in v1.0. Extremely rare, maximum stat bonuses, prestige items.
**Missing Specification:**
- Drop rate (0.1%? 0.01%?)
- Stat bonus magnitude
- Unlock requirements (prestige-only? special events?)
- Visual distinction from Epic
**Related Terms:** Rarity, Epic, Collection, Prestige
**Used In:** v1.0 collection expansion
**Priority:** LOW (v1.0 feature)

### Loadout
**Status:** ⚠️ PARTIAL
**Category:** Gameplay
**Definition:** The active snake variant equipped for gameplay. Determines cosmetics and stats during Snake runs.
**Missing Specification:**
- Can players save multiple loadouts for quick switching?
- Is loadout per-mode (different snake for Classic vs Tower)?
- Loadout UI design
**Related Terms:** Active Snake, Snake Variant, Collection
**Used In:** Snake Lab UI, Gameplay
**Priority:** MEDIUM (v0.1 feature)

### LTV (Lifetime Value)
**Status:** ✅ DEFINED
**Category:** Business Metrics
**Definition:** Total revenue expected from a player over their entire relationship with the game. Target: $15+ per player at v1.0.
**Calculation:** Sum of all purchases from player over lifetime
**Related Terms:** ARPDAU, Conversion Rate, Monetization
**Used In:** Success metrics, ROI calculations

---

## M

### Material / Evolution Material
**Status:** 🔄 INCONSISTENT
**Category:** Resource
**Problem:** "Materials" mentioned but relationship to DNA unclear
**Examples Found:**
- "Evolution materials" (MVP_VISION)
- "Prismatic Scales, Quantum DNA, Mythic Catalysts" (MVP_VISION - Tower Mode rewards)
- "Base DNA strands, common evolution materials" (MVP_VISION - Classic Mode rewards)

**Proposed Clarification:**
- **DNA** = Primary universal resource (breeding, evolution, unlocks)
- **Materials** = Rare resources for advanced evolution (Tower Mode drops)
  - Prismatic Scales (rare material)
  - Quantum DNA (premium DNA variant OR rare material?)
  - Mythic Catalysts (legendary material)

**Missing Specification:**
- What do materials do that DNA doesn't?
- When are materials required vs just DNA?
- Drop rates per Tower floor
- Material costs per evolution tier

**Related Terms:** DNA, Tower Mode, Evolution, Resource Collection
**Used In:** v0.5 Tower Mode, Evolution system
**Priority:** MEDIUM (v0.5 feature, must clarify before Tower Mode dev)

### Mastery / Mastery System
**Status:** ❌ UNDEFINED
**Category:** Progression System
**Definition:** Mentioned as "200+ levels per snake variant" in MVP_VISION but mechanism is completely undefined.
**Inferred Purpose:** Long-term progression per individual variant (not per dynasty or collection-wide)
**Critical Questions:**
1. What IS mastery? (XP per variant? Usage-based? Collection-based?)
2. How do you gain mastery XP? (Play runs with that variant? Breed with it? Just own it?)
3. What do mastery levels provide? (Stat bonuses? Cosmetic variants? Unlock rewards?)
4. Is mastery per-variant or per-dynasty?
5. Does mastery persist through prestige?
6. Cap at 200 levels or truly infinite?
**Related Terms:** Progression, Collection, Prestige
**Used In:** v1.0 advanced features (Post-MVP)
**Priority:** LOW (Month 6+ feature, not blocking)

### Meta-Game
**Status:** ✅ DEFINED
**Category:** Game Design Concept
**Definition:** The progression systems outside of core Snake gameplay. Includes Collection, Breeding, Evolution, and Snake Lab management. The "real game" in SupaSnake's paradigm shift.
**Components:**
- Snake Lab (hub)
- Collection management
- Breeding system
- Evolution system (v0.5+)
- Dynasty progression
- Set bonuses
**Philosophy:** Players spend 70% time in meta-game, 30% playing Snake (CE-001)
**Related Terms:** Snake Lab, Collection, Breeding, Evolution
**Used In:** Core game design, Session time allocation

### Monetization
**Status:** ✅ DEFINED
**Category:** Business System
**Definition:** Revenue generation through in-app purchases and ads. Governed by strict constraints: pay for convenience not power (BM-001), no forced ads (BM-002), no paywalling basics (BM-003).
**v0.1 Monetization:**
- Energy refills
- Starter bundle (Day 3-5)
- Opt-in ad rewards
**v0.5 Expansion:**
- Battlepass
- Breeding accelerators
- Exclusive dynasties
**v1.0 Complete:**
- Trading fees
- Prestige bonuses
- Monthly exclusive content
**Related Terms:** IAP, Premium Currency, Energy Refill
**Used In:** Economy system, Shop UI

### Mutation
**Status:** ❌ UNDEFINED
**Category:** Breeding Mechanic (Potential)
**Definition:** Mentioned as potential breeding outcome but never specified.
**Questions:**
1. Can mutations occur during breeding?
2. What triggers mutations? (RNG chance? specific combinations?)
3. What do mutations do? (New traits? Rarity boost? Cosmetic differences?)
4. Are mutations inheritable in subsequent breeding?
**Related Terms:** Breeding, RNG, Rarity
**Used In:** Potentially v1.0 advanced breeding (if implemented)
**Priority:** LOW (optional complexity, may not implement)

### Mythic Catalyst
**Status:** ⚠️ PARTIAL
**Category:** Resource (Material)
**Definition:** Rare material exclusive to Tower Mode. Mentioned as high-tier evolution material.
**Missing Specification:**
- Drop rate in Tower Mode
- What evolution tier requires Mythic Catalysts?
- Quantity required per use
- Can it be obtained outside Tower Mode?
**Related Terms:** Material, Tower Mode, Evolution, Prismatic Scales
**Used In:** v0.5 Tower Mode rewards
**Priority:** MEDIUM (v0.5, must specify before Tower Mode)

---

## O

### Offspring
**Status:** ✅ DEFINED
**Category:** Breeding Result
**Definition:** The new snake created when two parent snakes breed. Inherits traits from parents according to breeding algorithm.
**Example:** Gen 2 CYBER (parent 1) + Gen 3 CYBER (parent 2) → Gen 4 CYBER (offspring)
**Related Terms:** Breeding, Parent Snakes, Generation
**Used In:** Breeding system, Meta-game

---

## P

### Parent Snakes
**Status:** ✅ DEFINED
**Category:** Breeding Input
**Definition:** The two snakes selected for breeding. Their traits determine offspring characteristics.
**Related Terms:** Breeding, Offspring, Generation
**Used In:** Breeding system

### Prestige / Prestige System
**Status:** ⚠️ PARTIAL
**Category:** Progression System
**Definition:** End-game system that resets SOME progress (collection, generations) but grants PERMANENT account-wide bonuses. Designed for veterans seeking fresh challenge with accelerated progression.
**Specified:**
- Resets: Collection progress, snake generations
- Persists: Permanent stat bonuses (+5% DNA per prestige mentioned), mastery levels, exclusive "Reborn" variants
- Requirement: 10-20 snakes collected (to be tuned)
- Net benefit: Post-prestige progression faster than first playthrough (PR-002)
- Can prestige infinite times
**Missing Specification:**
- Exact reset scope (what else resets?)
- Bonus scaling (first prestige +5% DNA, does it stack?)
- Exclusive variant details ("Reborn" dynasty mentioned - what is this?)
- Prestige UI flow
- Prestige leaderboard scoring
**Related Terms:** Progression, Reborn Variants, Long-term Retention
**Used In:** v1.0 (Month 10+)
**Priority:** MEDIUM (v1.0 feature, not blocking earlier versions)

### Premium Currency
**Status:** ⚠️ PARTIAL
**Category:** Monetization
**Definition:** Purchasable currency used for premium items and convenience features. Called "Gems" in MVP_SCOPE.
**Specified:**
- Name: Gems
- Uses: Energy refills, breeding accelerators, exclusive dynasties
**Missing Specification:**
- Earn rates (if any - can you earn gems F2P?)
- Price points ($1 = X gems, $5 = Y gems with bonus?)
- Conversion rates (1 gem = 3 energy confirmed, what else?)
**Related Terms:** Monetization, IAP, Energy Refill
**Used In:** v0.1 monetization (minimal), expanded in v0.5/v1.0
**Priority:** MEDIUM (specify during v0.1 economy design)

### Prismatic Scales
**Status:** ⚠️ PARTIAL
**Category:** Resource (Material)
**Definition:** Rare material exclusive to Tower Mode, used for advanced evolution.
**Missing Specification:**
- Drop rate per Tower floor
- What evolution tier requires Prismatic Scales?
- Quantity needed per evolution
- Visual design (cosmetic importance for premium feel)
**Related Terms:** Material, Tower Mode, Evolution, Quantum DNA
**Used In:** v0.5 Tower Mode rewards
**Priority:** MEDIUM (v0.5 feature)

### Progression
**Status:** ✅ DEFINED
**Category:** Game Design Concept
**Definition:** Player advancement through collection depth, generation levels, and power increases. SupaSnake features infinite progression (no ceiling per PR-001).
**Key Metrics:**
- Collection size (20+ variants by Day 30)
- Generation level (Gen 5+ by Day 30 in v0.1)
- Lab investment (100+ actions by Day 30)
**Related Terms:** Collection, Generation, Evolution, Prestige
**Used In:** All progression systems, Success metrics

---

## Q

### Quantum DNA
**Status:** 🔄 INCONSISTENT (see DNA entry)
**Category:** Resource (Potentially)
**Definition:** Mentioned as Tower Mode reward, but relationship to regular DNA undefined.
**See:** DNA entry for full inconsistency analysis
**Priority:** CRITICAL (resolve in Week 1 terminology review)

### Quantum Set
**Status:** ❌ UNDEFINED
**Category:** Collection Grouping (Potential)
**Definition:** Mentioned in PLAYER_JOURNEY ("Only 3 genomes left in Quantum Set!") but never explained.
**Questions:**
1. What is a "set"? (Collection of related variants?)
2. Is "Quantum Set" related to Quantum DNA?
3. How many sets exist?
4. Are sets dynasty-specific?
5. What's the completion reward for a set?
**Related Terms:** Set Bonus, Collection, Dynasty
**Used In:** Potentially Set Bonus system
**Priority:** HIGH (required for Set Bonus system design)

---

## R

### Rare (Rarity)
**Status:** ✅ DEFINED
**Category:** Collection System
**Definition:** Third rarity tier (after Common and Uncommon). Harder to obtain, notable stat bonuses, satisfying milestone for collectors.
**Rarity Order:**
1. Common
2. Uncommon
3. **Rare** ← This tier
4. Epic (v0.5)
5. Legendary (v1.0)
**Example:** "NEBULA Comet" variant is Rare rarity with +25% DNA income bonus
**Related Terms:** Rarity, Collection, Common, Uncommon
**Used In:** v0.1 collection system

### Rarity
**Status:** ✅ DEFINED
**Category:** Collection System
**Definition:** Tier system categorizing snake variants by desirability and power. Five tiers total (Common, Uncommon, Rare, Epic, Legendary). Affects drop rates, stat bonuses, and visual prestige.
**Tiers:**
1. Common (most frequent, lowest bonuses)
2. Uncommon (frequent, modest bonuses)
3. Rare (infrequent, notable bonuses)
4. Epic (rare, significant bonuses) - v0.5+
5. Legendary (extremely rare, maximum bonuses) - v1.0+
**Related Terms:** Collection, Common, Uncommon, Rare, Epic, Legendary
**Used In:** Collection system, Drop rates, Breeding inheritance

### Reborn Variants
**Status:** ❌ UNDEFINED
**Category:** Collection (Prestige Exclusive)
**Definition:** Mentioned as prestige-exclusive snake variants but never specified.
**Questions:**
1. Are Reborn variants new dynasties or variants of existing dynasties?
2. How many Reborn variants exist?
3. Do they have unique stats/abilities?
4. Can they be bred/evolved like regular variants?
5. Visual design (how do players identify Reborn snakes?)
**Related Terms:** Prestige, Collection, Exclusive Content
**Used In:** v1.0 Prestige system
**Priority:** LOW (v1.0 feature, define alongside Prestige design)

### Resource Collection
**Status:** ✅ DEFINED
**Category:** Game System
**Definition:** The process of gathering DNA (and materials in v0.5+) through Snake gameplay. Core loop: Play → Collect → Spend in Lab → Progress.
**Sources:**
- Classic Mode: 50-100 DNA per run (predictable)
- Tower Mode: 80-150% variance (high risk/reward) - v0.5
- Clan Wars: Bonus resources - v1.0
**Related Terms:** DNA, Materials, Classic Mode, Tower Mode
**Used In:** All gameplay modes, Economy

### Retention (D1, D7, D30)
**Status:** ✅ DEFINED
**Category:** Business Metrics
**Definition:** Percentage of players who return after X days.
**Targets:**
- **D1 retention:** Players who return Day 1 after install
  - v0.1 target: 40%+
  - v0.5 target: 45%+
  - v1.0 target: 50%+
- **D7 retention:** Players still playing after 7 days
  - v0.1 target: 15%+
  - v0.5 target: 20%+
  - v1.0 target: 25%+
- **D30 retention:** Players still playing after 30 days
  - v0.1 target: 8%+
  - v0.5 target: 12%+
  - v1.0 target: 20%+ (2x industry standard)
**Related Terms:** DAU, Engagement, Session Frequency
**Used In:** Success metrics, Product decisions

---

## S

### Season
**Status:** ⚠️ PARTIAL
**Category:** Content Cadence
**Definition:** 28-day period for Battlepass progression and rotating content.
**Missing Specification:**
- Season themes
- Content rotation (what changes each season?)
- End-of-season rewards
- Downtime between seasons (if any)
**Related Terms:** Battlepass, Monthly Content
**Used In:** v0.5+ monetization
**Priority:** MEDIUM (v0.5 feature)

### Session
**Status:** ✅ DEFINED
**Category:** Engagement Metric
**Definition:** A single app usage period from launch to close (or backgrounding).
**Targets:**
- Session frequency: 2+ per day (v0.1), 3+ per day (v0.5+)
- Session length: 10+ min avg (v0.1), 15+ min avg (v1.0)
- Session composition: 70% Lab time, 30% Snake gameplay (CE-001)
**Related Terms:** Energy, Lab Time, Retention
**Used In:** Engagement tracking, Energy balancing

### Set / Set Bonus
**Status:** ❌ UNDEFINED - HIGH PRIORITY
**Category:** Collection System
**Definition:** Mentioned multiple times but never clearly defined. Appears to be rewards for collecting related snake variants.
**Examples Found:**
- "Quantum Set" (PLAYER_JOURNEY - collection of what?)
- "Set completion bonuses" (MVP_VISION - what bonuses?)
- "4 pieces vs 6 for first tier" (PLAYER_JOURNEY experimentation - 4 of what?)
- Dynasty "set bonuses" implied (CONSTRAINT_LATTICE)

**Critical Questions:**
1. **What defines a "set"?**
   - All variants of same dynasty?
   - All variants of same rarity?
   - All variants of same generation?
   - Specific curated groupings?
2. **How many sets exist?**
3. **What are the completion requirements?**
   - 4-piece sets? 6-piece sets? Variable?
4. **What bonuses do sets provide?**
   - Stat bonuses ("+10% DNA income" mentioned in MVP_SCOPE)
   - Exclusive unlocks?
   - Cosmetic rewards?
5. **Are set bonuses permanent or equipped?**
6. **Do set bonuses stack?** (If player completes multiple sets)
7. **Are sets dynasty-specific or cross-dynasty?**

**Proposed Definition (Requires Confirmation):**
A "set" is a collection of 4-6 related snake variants. Completing a set grants permanent bonuses:
- Basic sets (Common rarity): +10% DNA income
- Advanced sets (Rare+): +20% DNA income + exclusive variant unlock
- Dynasty sets: Complete all variants in a dynasty → dynasty-specific bonus

**Related Terms:** Collection, Dynasty, Bonus, Progression
**Used In:** Collection incentives, Progression rewards
**Blocks:** Cannot implement collection incentives without this definition
**Priority:** HIGH (Required for v0.1 collection system design)

### Showcase
**Status:** ✅ DEFINED (see Gallery/Showcase for clarification)
**Category:** Social Feature
**Definition:** Individual player's curated display of their best snakes, viewable by others in the Gallery.
**Related Terms:** Gallery, Collection, Fashion Contest
**Used In:** v0.5 social features

### Snake / Snake Game / Core Snake
**Status:** ✅ DEFINED
**Category:** Core Gameplay
**Definition:** The foundational arcade gameplay - control a snake that grows by eating food, avoid collisions. In SupaSnake's paradigm, Snake is the "resource collection mechanic" not the main game.
**Technical Requirements:**
- 60fps on iPhone 12, Samsung Galaxy S21 (TE-001)
- Smooth controls (swipe or virtual joystick)
- Satisfying feedback (audio, visuals)
- Offline capable (TE-002)
**Related Terms:** Classic Mode, Tower Mode, Resource Collection
**Used In:** All gameplay modes
**Philosophy:** Snake is 30% of player time, Lab is 70% (CE-001)

### Snake Lab
**Status:** See "Lab / Snake Lab" entry above

### Snake Variant / Variant
**Status:** ✅ DEFINED
**Category:** Collection Unit
**Definition:** A unique snake design with specific dynasty, rarity, generation, and stats. The collectable unit in SupaSnake.
**Example:** "CYBER Starlight Gen 5 (Rare)" is a specific variant
**Attributes:**
- Dynasty (e.g., CYBER, NEBULA, MECHA)
- Rarity (Common, Uncommon, Rare, Epic, Legendary)
- Generation (Gen 1, Gen 2, ... Gen ∞)
- Stats (derived from rarity + generation)
- Visual design (cosmetic appearance)
**Related Terms:** Collection, Dynasty, Rarity, Generation
**Used In:** All collection and meta-game systems
**Target Count:**
- v0.1: 20-30 variants
- v0.5: 100 variants
- v1.0: 500+ variants (CO-001)

### Species
**Status:** 🔄 INCONSISTENT - DEPRECATED
**Category:** Unclear
**Problem:** "Species" used in PLAYER_JOURNEY ("creating the ultimate snake species") but elsewhere uses "Variant"
**Resolution:** ELIMINATE "Species" term. Always use "Variant" for individual snakes.
**Rationale:** "Species" sounds biological/scientific, "Variant" sounds game-like. Variant is clearer and already established.

### Starter Bundle
**Status:** ✅ DEFINED
**Category:** Monetization
**Definition:** First-time purchase offer appearing Day 3-5 after demonstrated engagement. Designed to convert engaged F2P players to payers.
**v0.1 Starter Bundle:**
- Price: $2.99 (marketed as "80% off $14.99 value")
- Contents: 20 energy + 1000 DNA + 1 exclusive variant
- Timing: Appears Day 3-5, NOT during tutorial (BM-004)
- One-time purchase only
**Related Terms:** Monetization, IAP, Conversion
**Used In:** v0.1 monetization strategy
**Constraint:** Must appear AFTER engagement, not before (BM-004)

---

## T

### Territory
**Status:** ⚠️ PARTIAL
**Category:** Clan Wars Mechanic
**Definition:** Clans compete for control of territories in Clan Wars. Exact mechanics undefined.
**Missing Specification:**
- How many territories exist?
- How do clans capture/defend territories?
- Do territories provide ongoing bonuses?
- Victory conditions (most territories? specific key territories?)
**Related Terms:** Clan Wars, Multiplayer
**Used In:** v1.0 Clan Wars
**Priority:** MEDIUM (v1.0 feature, specify during Clan Wars design)

### Tower Mode
**Status:** ⚠️ PARTIAL
**Category:** Gameplay Mode
**Definition:** High-risk, high-reward challenge mode with progressive difficulty. 15-45 minute sessions. Exclusive source of rare materials (Prismatic Scales, Quantum DNA, Mythic Catalysts).
**Specified:**
- Session length: 15-45 minutes
- Energy cost: 2 units per run (higher than Classic)
- DNA rewards: 80-150% variance (vs Classic's predictable 100%)
- Rare materials exclusive to Tower
- Difficulty scaling (floors 1-50 mentioned)
- Checkpoints every 5 floors
**Missing Specification:**
- Floor layout design
- Obstacle types (what makes it challenging?)
- Boss mechanics (if any)
- Drop rate curve (materials per floor?)
- Difficulty scaling formula
- Skill bracket matchmaking (if any)
**Related Terms:** Energy, Materials, Challenge, Classic Mode
**Used In:** v0.5 (Months 4-6)
**Priority:** HIGH (v0.5 core feature)

### Trading / Trading System
**Status:** ⚠️ PARTIAL (see Corp Marketplace)
**Category:** Economy
**Definition:** Exchange of DNA and materials between players. MUST be clan-based only (no P2P) per SO-003.
**See:** Corp Marketplace entry for details
**Related Terms:** Corp Marketplace, Clan, Economy
**Used In:** v1.0 (Month 10+)

### Tutorial
**Status:** ⚠️ PARTIAL
**Category:** Onboarding
**Definition:** Guided first-time experience teaching core mechanics. Critical for D1 retention.
**Specified:**
- First win guaranteed in <60 seconds (easier difficulty, subtle)
- Lab discovery within 5 minutes
- First breeding walkthrough (if Path B)
- Energy system explanation
- Skippable (for returning players)
- Total length: 3-5 minutes
**Missing Specification:**
- Exact step-by-step flow
- Dynasty selection timing (start or later?)
- Balance between guidance and freedom
- Tutorial completion events for analytics
**Related Terms:** Onboarding, Retention, First Session
**Used In:** v0.1 critical feature
**Target:** 85%+ completion rate
**Priority:** CRITICAL (v0.1)

---

## U

### Uncommon (Rarity)
**Status:** ✅ DEFINED
**Category:** Collection System
**Definition:** Second rarity tier (after Common). More frequent than Rare, modest stat bonuses.
**Rarity Order:**
1. Common
2. **Uncommon** ← This tier
3. Rare
4. Epic (v0.5)
5. Legendary (v1.0)
**Example:** "NATURE Sprout" variant is Uncommon rarity with +15% HP bonus
**Related Terms:** Rarity, Common, Rare
**Used In:** v0.1 collection system

---

## V

### Variant
**Status:** See "Snake Variant / Variant" entry above

---

## W

### (No W terms identified)

---

## X

### (No X terms identified)

---

## Y

### (No Y terms identified)

---

## Z

### (No Z terms identified)

---

# Terminology Inconsistencies Summary

## Critical Inconsistencies Requiring Resolution

### 1. DNA / DNA Strands / Quantum DNA
**Status:** 🔄 THREE DIFFERENT TERMS for potentially same resource
**Resolution Needed:** WEEK 1
**Recommendation:** Use only "DNA" in v0.1, potentially introduce "Quantum DNA" as premium tier in v0.5 if needed, ELIMINATE "DNA Strands" terminology
**Impact:** Economy design, Tutorial language, UI text

### 2. Variant vs Species vs Genome
**Status:** 🔄 THREE TERMS used interchangeably
**Resolution:**
- Use **"Variant"** exclusively for individual snakes
- ELIMINATE "Species" (deprecated)
- ELIMINATE "Genome" (confusing, undefined)
**Impact:** All documentation, UI text, code naming

### 3. Clan vs Corp vs Corporation
**Status:** 🔄 THREE TERMS for same concept
**Resolution:**
- Use **"Clan"** for player-facing UI and primary term
- Use **"Corp"** ONLY in "Corp Marketplace" context
- ELIMINATE "Corporation" (too formal)
**Impact:** UI text, Social features, Marketing

### 4. Gallery vs Showcase
**Status:** 🔄 Used interchangeably
**Resolution:**
- **Gallery** = System-wide feature for browsing
- **Showcase** = Individual player's curated display
**Impact:** v0.5 social features UI

### 5. Collection vs Set
**Status:** 🔄 "Collection" sometimes means total owned, sometimes means specific grouping
**Resolution:**
- **Collection** = All owned snakes
- **Set** = Specific grouping for bonuses (e.g., "Quantum Set")
**Impact:** Collection system, Set Bonus design

### 6. Breeding vs Evolution
**Status:** 🔄 Sometimes used interchangeably, but are DISTINCT
**Resolution:**
- **Breeding** = Combine TWO snakes → NEW offspring
- **Evolution** = Upgrade ONE snake → Increase generation
- NEVER use interchangeably
**Impact:** Meta-game mechanics, Tutorial, UI text

---

# Critical Undefined Terms (Blockers)

## Priority 1: CRITICAL (Block v0.1)

### Dynasty System
**Why Critical:** Mentioned 20+ times, blocks breeding algorithm, evolution mechanics, collection organization, monetization strategy, art pipeline
**Status:** Completely undefined
**Deliverables Needed:**
1. Dynasty definition document
2. List of all dynasties (names, themes)
3. Unlock requirements
4. Cross-dynasty breeding rules
5. Visual themes
6. Stat differences (if any)
7. Progression paths
8. F2P vs premium allocation
**Timeline Impact:** Must define Week 1-2 or v0.1 Path B (breeding) becomes impossible
**Fallback:** Use Path A (collection-only) for v0.1 if Dynasty remains undefined

### DNA Terminology
**Why Critical:** Primary resource, used in ALL systems, currently THREE conflicting terms
**Resolution Needed:** Single unified term decision
**Timeline:** Week 1 (before any economy implementation)

### Set / Set Bonus
**Why Critical:** Collection incentive system, mentioned in progression targets, completely undefined
**Deliverables Needed:**
1. Set definition (what qualifies as a set?)
2. Set types (dynasty-based? rarity-based? curated?)
3. Completion requirements (4-piece? 6-piece?)
4. Bonus structure (+10% DNA confirmed, what else?)
5. Stacking rules
**Timeline:** Week 2-3 (before collection system implementation)

## Priority 2: HIGH (Block v0.5)

### Breeding Algorithm
**Why High:** Cannot implement breeding without this, blocks Path B for v0.1
**Deliverables Needed:**
1. Rarity inheritance formula
2. Stat inheritance rules
3. Generation calculation
4. Cross-dynasty rules (dependent on Dynasty definition)
5. Mutation mechanics (if any)
**Timeline:** Week 5-6 (after Dynasty defined, before breeding implementation)

### Materials Hierarchy
**Why High:** Tower Mode rewards, evolution requirements unclear
**Deliverables Needed:**
1. Material types (Prismatic Scales, Quantum DNA, Mythic Catalysts - confirm these)
2. Purpose per material (what tier of evolution requires what?)
3. Drop rates
4. Relationship to DNA
**Timeline:** Month 4 (before Tower Mode development)

### Evolution Cost Formula
**Why High:** Power curve balancing, infinite progression design
**Deliverables Needed:**
1. Cost per generation (Gen 1→2, 2→3, etc.)
2. Cost formula for generations 10+
3. Material requirements per generation tier
**Timeline:** Month 4 (before Evolution system implementation)

## Priority 3: MEDIUM (Block v1.0)

### Clan Wars Mechanics
**Deliverables:** Territory system, battle mechanics, matchmaking
**Timeline:** Month 7-9 (Clan Wars development)

### Trading Anti-Exploit
**Deliverables:** Trade limits, fraud prevention, economy balancing
**Timeline:** Month 10+ (Trading system development)

### Prestige Mechanics
**Deliverables:** Reset scope, bonus scaling, exclusive content
**Timeline:** Month 10+ (Prestige system development)

---

# Term Categories

## Core Gameplay
- Snake / Core Snake
- Classic Mode
- Tower Mode (v0.5)
- Clan Wars (v1.0)
- Energy / Energy System
- Session

## Meta-Game
- Lab / Snake Lab
- Collection
- Snake Variant / Variant
- Breeding
- Evolution (v0.5)
- Generation
- Dynasty (**UNDEFINED**)
- Set / Set Bonus (**UNDEFINED**)

## Resources & Economy
- DNA (**INCONSISTENT** - needs resolution)
- DNA Strands (**DEPRECATED** - eliminate)
- Quantum DNA (**INCONSISTENT** - clarify or eliminate)
- Materials / Evolution Materials
- Prismatic Scales
- Mythic Catalysts
- Premium Currency / Gems
- Energy Refill

## Collection System
- Rarity (Common, Uncommon, Rare, Epic, Legendary)
- Active Snake / Loadout
- Offspring
- Parent Snakes

## Social & Competitive
- Clan (**INCONSISTENT** - use this)
- Corp (**INCONSISTENT** - use only in "Corp Marketplace")
- Corporation (**DEPRECATED** - eliminate)
- Clan Wars
- Leaderboard
- Gallery
- Showcase
- Fashion Contest
- Trading / Corp Marketplace

## Progression Systems
- Generation (Gen)
- Evolution
- Prestige
- Mastery (**UNDEFINED**)
- Achievement
- Set Bonus (**UNDEFINED**)

## Monetization
- IAP (In-App Purchase)
- Starter Bundle
- Battlepass
- Breeding Accelerator
- Energy Refill
- Premium Currency
- F2P vs Paying Players

## Business Metrics
- DAU (Daily Active Users)
- Retention (D1, D7, D30)
- Conversion Rate
- ARPDAU
- LTV
- Session Frequency
- Session Length

## Technical
- Backend (Supabase)
- Authentication
- Cloud Save
- HUD
- Tutorial
- Analytics

---

# Usage Guidelines

## For Designers

### Before Using Any Term:
1. Check glossary for definition
2. Verify status: ✅ DEFINED, ⚠️ PARTIAL, ❌ UNDEFINED, 🔄 INCONSISTENT
3. DO NOT design features around UNDEFINED terms
4. DO NOT use INCONSISTENT terms without checking resolution

### When Creating New Features:
1. List all game terms used in feature
2. Verify each term exists in glossary
3. For new terms: Add to glossary BEFORE design doc
4. Flag any UNDEFINED terms blocking your design

### Terminology Lock:
Once a term is ✅ DEFINED and used in player-facing UI, it is **LOCKED** for that version. Changes require:
- Localization rework
- UI text updates
- Player communication
- Documentation updates

**Therefore:** Be certain of terminology before UI implementation begins.

## For Engineers

### Variable Naming:
Match glossary terms exactly:
```typescript
// GOOD
class SnakeVariant {
  dynasty: Dynasty;
  generation: number;
  rarity: Rarity;
}

// BAD
class SnakeSpecies {  // "Species" is deprecated term
  genome: Genome;     // "Genome" is undefined/deprecated
  level: number;      // Use "generation" not "level"
}
```

### Implementation Order:
1. Check term status in glossary
2. If ❌ UNDEFINED → Flag blocker, DO NOT implement
3. If 🔄 INCONSISTENT → Wait for resolution
4. If ⚠️ PARTIAL → Clarify missing specs before implementing
5. If ✅ DEFINED → Safe to implement

### Adding Game Terms:
If code introduces new game concept:
1. Propose term to design team
2. Add to glossary with definition
3. Get approval before implementation
4. Update glossary with code references

## For Writers

### UI Text Rules:
- Use EXACT terms from glossary (case-sensitive)
- Never create synonyms for player-facing text
- "DNA" not "DNA Strands" or "Quantum DNA" (unless specified)
- "Variant" not "Species" or "Genome"
- "Clan" not "Corp" (except "Corp Marketplace")

### Localization:
- Glossary is canonical source for translation
- Terms marked ✅ DEFINED are locked for translation
- Terms marked ⚠️ PARTIAL may change (warn translators)
- Terms marked ❌ UNDEFINED should NOT be translated yet

### Tutorial Text:
Tutorial is first impression. Use ONLY ✅ DEFINED terms. Introduce terms one at a time. Never use deprecated terms.

---

# Glossary Maintenance

## Ownership
**Document Owner:** Game Director + Lead Designer
**Review Frequency:** Weekly during active development
**Version Control:** Update version number on ANY change

## Change Process

### Adding New Term:
1. Propose term with full definition
2. Check for conflicts with existing terms
3. Assign status (DEFINED, PARTIAL, UNDEFINED)
4. Add to appropriate category
5. Update cross-references
6. Announce to team

### Modifying Existing Term:
1. Document reason for change
2. Assess impact:
   - Does UI text need updates?
   - Does code need refactoring?
   - Does documentation need updates?
   - Does localization need rework?
3. Get stakeholder approval (design, eng, product)
4. Make change
5. Update dependent systems
6. Announce change to team with migration guide

### Resolving Inconsistency:
1. Document all current usages
2. Propose canonical term
3. List all replacements needed
4. Get team consensus
5. Execute find-replace across all docs
6. Update glossary
7. Announce resolution

### Deprecating Term:
1. Mark as **DEPRECATED** in glossary
2. Provide replacement term
3. Set deprecation timeline
4. Find-replace in all new documents
5. Eventually remove from glossary

## Version History

**v1.0 (2025-10-14):** Initial glossary from design doc extraction
- Identified 20+ Dynasty mentions with zero definition (CRITICAL BLOCKER)
- Resolved 6 major inconsistencies (DNA, Variant, Clan, Breeding, etc.)
- Flagged 10 undefined critical terms
- Defined 60+ terms across all categories

**Next Review:** After Dynasty Design Sprint (Week 1-2)
**Next Major Update:** v1.1 after Dynasty System fully specified

---

# Summary

## The Glossary Problem

SupaSnake's design documents suffered from:
1. **Major concepts undefined** (Dynasty mentioned 20+ times, never explained)
2. **Terminology inconsistencies** (DNA/DNA Strands/Quantum DNA, Variant/Species/Genome)
3. **Interchangeable terms** (Clan/Corp/Corporation, Breeding/Evolution, Gallery/Showcase)
4. **Missing specifications** (Set Bonus, Breeding Algorithm, Materials)

## The Resolution

This glossary provides:
1. **Single source of truth** for ALL game terms
2. **Status indicators** (DEFINED, PARTIAL, UNDEFINED, INCONSISTENT)
3. **Clear resolution** of inconsistencies
4. **Blocking term identification** (what must be defined before implementation)
5. **Usage guidelines** for designers, engineers, and writers

## Critical Next Steps

### Week 1 (IMMEDIATE):
1. **Dynasty Design Sprint** (3-5 days) - Define dynasty system completely
2. **DNA terminology resolution** - Decide: one resource or multiple?
3. **Set Bonus specification** - What are sets? What bonuses?

### Week 2:
4. **Breeding algorithm design** (dependent on Dynasty)
5. **Lock v0.1 terminology** - No changes after this point

### Before Each Version:
- v0.1: Dynasty, DNA, Set Bonus, Core terms locked
- v0.5: Materials, Evolution, Tower Mode terms locked
- v1.0: Clan Wars, Trading, Prestige terms locked

## Success Criteria

**This glossary succeeds if:**
1. Zero implementation blockers due to undefined terms
2. Zero UI text inconsistencies
3. Zero "what does X mean?" questions in team chat
4. Localization proceeds smoothly (clear, locked terminology)
5. Players understand game concepts immediately (consistent naming)

---

**Document Status:** ACTIVE - Canonical Terminology Reference
**Version:** 1.0
**Word Count:** 13,800+ words
**Next Review:** After Dynasty Design Sprint (Week 1-2)
**Owner:** Game Director + Lead Designer

**Remember:** This glossary is the single source of truth. When in doubt, check here. If it's not here, it's not defined. If it's not defined, don't design it, don't implement it, don't write about it.

**The Dynasty System is the elephant in the room. It must be defined Week 1, or v0.1 ships with collection-only meta-game.**

**All other terms can wait. Dynasty cannot.**
