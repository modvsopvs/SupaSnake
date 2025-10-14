# SupaSnake MVP Scope Definition
## v0.1 → v0.5 → v1.0 Release Plan

**Version:** 1.0
**Last Updated:** 2025-10-14
**Purpose:** Define realistic scope boundaries for three release phases, separating "true MVP" from the 2-year vision described in MVP_VISION.md

---

## Executive Summary

**The Problem:** MVP_VISION.md describes a 2-year roadmap (500+ variants, 3 game modes, Clan Wars, prestige, trading) as "MVP." This is unrealistic for a first release.

**The Solution:** Three phased releases that progressively build toward the vision:

- **v0.1 - TRUE MVP** (Months 1-3): Core Snake + Energy + ONE meta-game mechanic = Playable, addictive, monetizable
- **v0.5 - Social Foundation** (Months 4-6): Add social layer (clans, leaderboards, second game mode)
- **v1.0 - Complete Vision** (Months 7-15): All advanced features from MVP_VISION.md

**Key Constraint:** Dynasty System is UNDEFINED (identified in SYSTEM_GRAPH.md). Cannot include breeding/evolution in v0.1 until Dynasty is designed.

**Core Value Proposition Across All Versions:** SupaSnake isn't a Snake game with meta features. It's a genetic empire where Snake is just resource collection.

---

## Critical Blocker: Dynasty System (MUST RESOLVE BEFORE v0.1)

### Status: UNDEFINED - CRITICAL BLOCKER

**Problem:** SYSTEM_GRAPH.md identifies Dynasty System as mentioned 20+ times across docs but with ZERO specification. This blocks:
- Breeding algorithm design
- Evolution mechanics
- Collection organization
- Set bonus implementation
- Monetization strategy
- Art pipeline

**What We Don't Know:**
1. What IS a dynasty? (Species category? Aesthetic theme? Stat group?)
2. How many dynasties exist? (8? 10? 15?)
3. How are dynasties unlocked? (Play-based? Purchase? RNG?)
4. Do dynasties have gameplay differences or just cosmetic?
5. Cross-dynasty breeding rules
6. Dynasty-specific variants count
7. Visual themes per dynasty

**Impact on v0.1 Scope:**
- **If Dynasty defined in Week 1-2:** Can include Collection + Simple Breeding in v0.1
- **If Dynasty not defined:** Must use Collection-only meta-game for v0.1, defer breeding to v0.5

**Recommendation:** 3-5 day Dynasty Design Sprint BEFORE development starts. Lock Dynasty design before Phase 2 (meta-game core).

**Decision for this document:** Assuming Dynasty will be defined, but providing fallback scope if not.

---

## v0.1 - TRUE MVP (Months 1-3)

### Core Value Proposition
**"I'm addicted to Snake, but I'm actually addicted to growing my snake collection."**

Players discover that SupaSnake is not just Snake. Within 5 minutes they enter the Snake Lab and realize the real game is collection and progression. The 70/30 time split (Lab/Snake) must be evident from Session 1.

### Success Criteria
**Business Metrics:**
- D1 retention: 40%+ (relaxed from 50% for MVP)
- D7 retention: 15%+ (relaxed from 25% for MVP)
- D30 retention: 8%+ (relaxed from 15% for MVP)
- Session frequency: 2+ sessions daily (relaxed from 3+)
- Session length: 10+ minutes average (relaxed from 15+)
- First purchase conversion: 3%+ by Day 7 (relaxed from 5%)
- Lab time ratio: 60%+ Lab, 40% Snake (relaxed from 70/30 for MVP learning)

**Player Experience:**
- First win < 60 seconds
- Lab discovered within 5 minutes
- Complete ONE full meta-game loop (collect → use resources → progress)
- 5+ hours of unique gameplay without repetition
- Clear "next goal" always visible

**Technical:**
- 60fps on iPhone 12, Samsung Galaxy S21 equivalent
- Offline Core Snake gameplay functional
- <3 second app launch
- Zero critical bugs

---

### Included Systems (Tier 0-1)

#### SYSTEM: Core Snake Game Engine
**Why v0.1:** Foundation. Nothing works without this.
**Features:**
- Smooth 60fps Snake movement
- Collision detection
- Food collection
- Growth mechanics
- Death and restart
- Score tracking
**Scope:**
- Classic arcade Snake rules
- Touch controls (swipe or virtual joystick)
- Satisfying visual/audio feedback
- Polish is CRITICAL (this must feel AAA from second 1)
**Not Included:**
- Power-ups (deferred to v1.0)
- Obstacles beyond walls (deferred to Tower Mode)
- Multiplayer Snake (never planned)

#### SYSTEM: Basic UI Framework
**Why v0.1:** Need menus, HUD, navigation
**Features:**
- Main menu
- Settings screen
- Game HUD (score, energy, resources)
- Screen navigation
- Pause menu
**Scope:**
- Clean, premium aesthetic
- Responsive touch targets
- Loading states
- Accessibility support (text scaling, contrast)
**Not Included:**
- Advanced animations (minimal animation for v0.1)
- Particle effects (defer to v0.5)
- Customizable themes (v1.0)

#### SYSTEM: Backend Infrastructure (Supabase)
**Why v0.1:** Must save progress, authenticate users
**Features:**
- PostgreSQL database
- Authentication (email, OAuth)
- Real-time sync
- Cloud saves
- API endpoints
**Scope:**
- Handles 10k concurrent users (per TE-004)
- <200ms p99 API latency
- Cross-platform sync (iOS ↔ Android)
- Offline queue for writes
**Not Included:**
- Complex matchmaking (v0.5)
- Real-time multiplayer (Clan Wars in v1.0)
- Advanced analytics backend (use Firebase for v0.1)

#### SYSTEM: Authentication & Account
**Why v0.1:** Players must save progress
**Features:**
- Email/password signup
- OAuth (Google, Apple)
- Account recovery
- Cross-device sync
**Scope:**
- Guest mode for first session, prompt to save progress later
- Session management
- Profile basics (username, avatar)
**Not Included:**
- Social login features (friends list) - v0.5
- Profile customization beyond basics

#### SYSTEM: Energy System
**Why v0.1:** Creates return sessions, gates engagement, enables monetization
**Features:**
- Energy tracking (start with 5 units)
- 20-minute recharge per unit
- Max capacity: 5 energy (expandable via progression later)
- Daily free refill (1x per day, no ads required)
- Energy depletion on play
**Scope:**
- Classic Mode costs 1 energy per run
- Clear energy display in HUD
- Notification when energy full (opt-in)
**Constraints:**
- Must feel strategic, not punishing (CE-005)
- Free daily refill ensures F2P viability (BM-002)
**Not Included:**
- Clan energy bonuses (requires Clan System in v0.5)
- Energy expansion via upgrades (v0.5)
- Energy overflow mechanics (v1.0)

#### SYSTEM: Resource Collection & DNA Economy
**Why v0.1:** Resources drive meta-game progression
**Features:**
- DNA collection from Snake runs
- DNA bank (unlimited storage)
- Resource display in UI
- Collection events (sparkle animations)
**Scope:**
- One resource type: DNA strands (simplify for MVP)
- Predictable rewards (not high-variance RNG)
- No inventory management tedium (BA-004)
**Balancing:**
- Classic Mode: 50-100 DNA per run (5-minute session)
- Enough DNA to complete 3-5 collection actions per day
**Not Included:**
- Multiple material types (Prismatic Scales, Quantum DNA) - defer to Tower Mode in v0.5
- Material rarity tiers (v0.5)
- DNA marketplace (v1.0)

#### SYSTEM: Classic Mode
**Why v0.1:** Primary gameplay loop, predictable DNA source
**Features:**
- 5-minute Snake sessions
- Arcade-style gameplay
- DNA rewards based on score
- Clear end-of-run summary
**Scope:**
- Single difficulty (medium)
- Standard food spawns
- Predictable DNA formula (score × multiplier = DNA)
- Energy cost: 1 unit per run
**Balancing:**
- Target: 50-100 DNA per run for average player
- Session length: 3-7 minutes (depending on skill)
**Not Included:**
- Multiple difficulty levels (v0.5)
- Special food types (v1.0)
- Environmental hazards (Tower Mode)

---

### Meta-Game: TWO PATHS (Dynasty-Dependent)

**CRITICAL DECISION:** Choose ONE meta-game mechanic based on Dynasty System definition status.

#### PATH A: Collection-Only Meta-Game (IF Dynasty UNDEFINED or defined late)

**Why This Path:** Can ship v0.1 without breeding mechanics. Still delivers "Snake Lab" paradigm shift.

**SYSTEM: Snake Collection Management**
**Features:**
- Unlock snake variants by spending DNA
- 20-30 variants in v0.1 (NOT 500+)
- 3 rarity tiers: Common, Uncommon, Rare
- Visual gallery showcasing owned snakes
- Set bonuses: Collect 4 of same rarity → +10% DNA income
**Progression:**
- First variant unlocked free (tutorial)
- Unlock new variants: 500-1000 DNA each
- 5 variants in first hour, 15 by Day 7, 25 by Day 30
**Lab Experience:**
- Browse collection gallery
- Select active snake (cosmetic + small stat bonus)
- Track collection completion %
- See "next unlock" target clearly
**70/30 Time Split:**
- After each run: Return to Lab, decide which snake to unlock next
- Browse locked snakes (creates desire)
- Manage active snake loadout

**Meta-Game Loop:**
```
Play Snake (1 energy) → Collect DNA → Return to Lab → Browse Gallery →
Choose Next Unlock → Spend DNA → Unlock Variant → Equip New Snake →
[Repeat with new snake visual/stats]
```

**Pros:**
- Shippable regardless of Dynasty definition
- Still achieves 70/30 time split (Lab browsing, unlock decisions)
- Simple, polished experience
- Monetization works (energy + exclusive variants)

**Cons:**
- Less depth than breeding (may impact D30 retention)
- No "create unique snakes" fantasy
- Less player identity formation

---

#### PATH B: Collection + Simple Breeding (IF Dynasty DEFINED by Week 2)

**Why This Path:** Delivers the "genetic empire" fantasy from day one. Higher retention potential.

**Prerequisites:**
- Dynasty System fully specified
- Breeding algorithm designed
- 3-5 additional weeks of development

**SYSTEM: Snake Collection Management** (same as Path A)
- 20-30 variants across 3-5 dynasties
- Collection gallery
- Set bonuses

**SYSTEM: Dynasty System (SIMPLIFIED FOR v0.1)**
**Features:**
- 3-5 dynasties available (NOT 10+)
- Each dynasty has 5-8 variants
- Dynasties are cosmetic themes (visual only, no stat differences in v0.1)
- Example dynasties: CLASSIC (traditional), CYBER (tech), NATURE (organic)
**Unlock:**
- 1 dynasty unlocked at start (player choice)
- Additional dynasties unlocked via play (DNA spend: 2000 each)
**Scope:**
- Simple visual themes (don't need full art pipeline yet)
- Dynasty selection screen in tutorial
**Not Included:**
- Dynasty stat differences (v0.5)
- Dynasty-specific abilities (v1.0)
- 10+ dynasties (v1.0)

**SYSTEM: Breeding System (SIMPLIFIED)**
**Features:**
- Combine 2 snakes → create offspring
- Generation progression: Gen 1 + Gen 1 = Gen 2
- 3 breeding slots (all free in v0.1)
- Breeding timer: 30 seconds (instant gratification for MVP)
- DNA cost: 200 DNA per breed
**Breeding Rules (SIMPLIFIED):**
- Same dynasty only (no cross-dynasty for v0.1)
- Rarity inheritance: Average parents (Common + Uncommon = 50% Common, 50% Uncommon)
- Generation: Max parent generation + 1
- Stats: Offspring has +5% stats per generation
**Lab Experience:**
- Select 2 parent snakes
- Pay DNA cost
- 30-second timer
- Reveal offspring (animation + stats)
- Add to collection
**Progression:**
- Gen 1 snakes from unlocks
- Breed to Gen 2-4 by Day 7
- Breed to Gen 5-7 by Day 30 (hits PR-004 target)

**Meta-Game Loop:**
```
Play Snake (1 energy) → Collect DNA → Return to Lab →
Choose 2 Parents → Breed (30s timer) → New Offspring →
Equip Stronger Snake → Play Again [Loop]
```

**Pros:**
- Delivers full "genetic empire" vision
- Player creates unique combinations
- Higher depth → better D30 retention
- Sets up v0.5 for evolution mechanics

**Cons:**
- Requires Dynasty definition (blocker)
- +3-5 weeks development time
- Higher complexity = more bugs
- Balancing breeding = high risk

---

### Meta-Game Choice: RECOMMENDATION

**If Dynasty defined by Week 2:** Choose Path B (Breeding)
- Higher long-term retention potential
- Delivers core vision immediately
- Worth the extra 3-5 weeks

**If Dynasty not defined by Week 2:** Choose Path A (Collection-only)
- Ships on time
- Still achieves Lab paradigm shift
- Add breeding in v0.5 after Dynasty sprint

**For this document, assume Path B (breeding) but build Path A as fallback.**

---

### Snake Lab UI (Central Hub)
**Why v0.1:** Must deliver 70/30 time split, Lab must feel like THE GAME
**Features:**
- Collection gallery (grid view, filters)
- Breeding interface (select parents, timer, results)
- Active snake loadout
- DNA balance display
- "Next goal" always visible
**Scope:**
- Clean, intuitive layout
- Tutorial integration (guided first breed)
- Smooth transitions between Lab and Snake
- Persistent state (stay in Lab between runs)
**User Flow:**
1. Launch app → Lab is default screen (not main menu)
2. See collection, current DNA, active snake
3. Tap "Play" → deduct energy → play Snake
4. Return automatically to Lab after run
5. New DNA visible, celebration animation
6. Browse collection, make decisions
7. Repeat

**70/30 Enforcement:**
- Lab is default screen (not game)
- After each run, return to Lab
- Lab has enough content to spend 7+ minutes (browse, breed, plan)
- Energy gates Snake play to 30% of time

---

### Economy & Monetization (Minimal)
**Why v0.1:** Must be monetizable to validate business model
**Features:**
- Premium currency (Gems)
- Energy refill bundle: 1 gem = 3 energy (price: $0.99)
- Starter bundle (Day 3-5): 20 energy + 1000 DNA + 1 exclusive variant ($2.99, 80% off)
- Opt-in ad: Watch ad → +1 bonus energy (1x per 4 hours)
**Scope:**
- Minimal shop UI (energy + starter bundle only)
- IAP integration (iOS, Android)
- No aggressive monetization (no popups in first 48 hours per BM-004)
**Constraints:**
- Pay for convenience, not power (BM-001)
- F2P can unlock all variants given time
- No forced ads (BM-002)
**Not Included:**
- Battlepass (v0.5)
- DNA marketplace (v1.0)
- Breeding accelerators (v0.5)
- Multiple bundle tiers (v0.5)

---

### Tutorial & Onboarding
**Why v0.1:** D1 retention depends on clear onboarding
**Features:**
- Guided first Snake run (<60 seconds to first win)
- Lab discovery moment ("This isn't just Snake!")
- First collection unlock (free, instant gratification)
- First breeding walkthrough (if Path B)
- Energy system explanation
**Scope:**
- Skippable (for returning players)
- 3-5 minute total tutorial
- No text walls (visual, interactive)
- Guarantees first win (easier difficulty, subtle)
**Constraints:**
- Tutorial completion >90% (acceptance criteria from PLAYER_JOURNEY)
- Lab discovered in Session 1 (2-5 min mark)
- Self-expression pre-paywall (can unlock variants before seeing shop)

---

### Analytics & Events
**Why v0.1:** Must measure success criteria
**Features:**
- Event tracking (Firebase or Mixpanel)
- Funnel: game_start → tutorial_complete → lab_discovered → first_unlock → first_breed
- Retention cohorts: D1, D7, D30
- Monetization: conversion rate, ARPDAU
- Playtime tracking (Lab time vs Snake time)
**Scope:**
- Dashboard for key metrics
- Daily/weekly reports
- A/B test framework (for v0.5 experiments)
**Critical Metrics:**
- Lab time ratio (must hit 60%+ in v0.1)
- D7 retention (must hit 15%+)
- First purchase conversion (must hit 3%+)

---

### Excluded from v0.1 (Defer to v0.5 or v1.0)

**Game Modes:**
- ❌ Tower Mode (defer to v0.5)
- ❌ Clan Wars (defer to v1.0)
- ❌ Special events (defer to v1.0)

**Meta-Game Features:**
- ❌ Evolution system (defer to v0.5)
- ❌ Prestige (defer to v1.0)
- ❌ Mastery levels (defer to v1.0)
- ❌ 500+ variants (start with 20-30)
- ❌ Multiple material types (just DNA for v0.1)
- ❌ Set bonuses beyond basic (+10% DNA)

**Social Features:**
- ❌ Clans (defer to v0.5)
- ❌ Leaderboards (defer to v0.5)
- ❌ Gallery showcase (defer to v0.5)
- ❌ Fashion contests (defer to v1.0)
- ❌ Trading (defer to v1.0)

**Monetization:**
- ❌ Battlepass (defer to v0.5)
- ❌ Multiple bundle tiers (defer to v0.5)
- ❌ Breeding accelerators (defer to v0.5)
- ❌ Dynasty exclusives (defer to v0.5)

**Polish:**
- ❌ Advanced particle effects (v0.5)
- ❌ Complex animations (v0.5)
- ❌ Extensive localization beyond English (v0.5)
- ❌ Achievement system (v0.5)

---

### v0.1 Development Timeline

**Month 1: Foundation**
- Week 1-2: Core Snake Engine + Backend setup
- Week 3-4: Energy System + Resource Collection + Classic Mode
- **Deliverable:** Can play Snake, collect DNA, save progress

**Month 2: Meta-Game**
- Week 5: Collection Management + Lab UI (first pass)
- Week 6-7: Dynasty System (if defined) + Breeding OR Collection refinement (if Dynasty undefined)
- Week 8: Lab UI polish + Tutorial
- **Deliverable:** Complete meta-game loop functional

**Month 3: Polish + Monetization**
- Week 9: Economy + IAP integration
- Week 10: Analytics + Events
- Week 11-12: Bug fixing, balancing, performance optimization, soft launch prep
- **Deliverable:** Shippable MVP

**Contingency:** +1-2 weeks if Dynasty definition delayed or breeding balancing issues

---

### v0.1 Risk Analysis

**HIGH RISK:**
1. **Dynasty System undefined** → Blocks breeding implementation → Must use Path A (collection-only) OR delay launch
   - Mitigation: 3-5 day design sprint Week 1
2. **70/30 time split not achieved** → Players just farm Snake, ignore Lab → Core hypothesis fails
   - Mitigation: Energy system must be tight, Lab must be compelling
3. **Breeding balancing issues** (if Path B) → Progression too fast/slow → Retention fails
   - Mitigation: Simulation testing, soft launch tuning

**MEDIUM RISK:**
1. **Energy feels too restrictive** → Churn in first week → D7 retention fails
   - Mitigation: Daily free refill, playtesting
2. **Lab UI not intuitive** → Players confused, don't engage → 70/30 split fails
   - Mitigation: User testing, tutorial iteration
3. **Collection depth insufficient** → Boredom by Day 15 → D30 retention fails
   - Mitigation: 20-30 variants should support 30 days if unlock pacing tuned well

**LOW RISK:**
- Core Snake polish (well-understood mechanic)
- Backend scalability (Supabase handles load)
- IAP integration (standard mobile pattern)

---

### v0.1 Go/No-Go Criteria

**Before Soft Launch:**
- [ ] Core Snake is fun (internal playtest score >7/10)
- [ ] Lab discovered by 80%+ of playtesters in Session 1
- [ ] Lab time >50% in playtests (target 60%+)
- [ ] First collection action completed by 70%+ in Session 1
- [ ] 60fps sustained on target devices
- [ ] Energy system has daily free refill
- [ ] Monetization functional (can purchase energy)
- [ ] Analytics tracking all funnel events
- [ ] Zero critical bugs

**Before Full Launch (Post Soft Launch):**
- [ ] D1 retention >40%
- [ ] D7 retention >15%
- [ ] Session frequency >2 per day
- [ ] Lab time ratio >60%
- [ ] First purchase conversion >3% by Day 7
- [ ] Crash rate <1%
- [ ] Performance 60fps on 90%+ devices

---

## v0.5 - Social Foundation (Months 4-6)

### Core Value Proposition
**"I'm part of a snake empire community."**

v0.5 adds the social layer that drives retention and community. Players compare collections, join clans, compete on leaderboards. The game becomes a social experience, not just solo grinding.

### Goals
- 30% of players in clans
- D30 retention >12% (up from 8% in v0.1)
- Clan-based energy bonuses create social incentive
- Two game modes create variety

---

### New Systems Added

#### SYSTEM: Evolution & Generations
**Why v0.5:** Adds depth to breeding, enables power progression
**Features:**
- Gen 5 → Gen 6 → Gen 7+ progression
- Evolution costs DNA (exponential cost, linear power per BA-003)
- Stat increases per generation (+5% per gen)
- Max Gen cap: None (infinite progression per PR-001)
**Balancing:**
- Gen 1→5: 1000 DNA total
- Gen 5→10: 10,000 DNA total (10x cost, 2x power)
- Target: Gen 7+ by Day 30 in v0.5
**Integration:**
- Builds on v0.1 breeding
- Adds "evolution lab" section to Lab UI

#### SYSTEM: Tower Mode
**Why v0.5:** Adds challenge, rewards skill, introduces rare materials
**Features:**
- 15-45 minute challenge runs
- Difficulty scaling (floors 1-50)
- Rare materials exclusive to Tower (Prismatic Scales, Quantum DNA)
- Energy cost: 2 units per Tower run (higher risk)
**Balancing:**
- DNA variance: 80-150% of Classic Mode (high-risk, high-reward per BA-002)
- Target: 30% of playtime in Tower by engaged players
**Scope:**
- Single Tower (not multiple towers)
- Progressive difficulty (not randomized)
- Checkpoints every 5 floors

#### SYSTEM: Leaderboards
**Why v0.5:** Adds competition, social discovery
**Features:**
- Global leaderboard
- Regional filters
- Friend leaderboard (requires friend system)
- Skill brackets: Gen 1-5, Gen 6-10, Gen 11+ (per BA-001)
**Social Discovery:**
- Shown in Session 1 of v0.5 (immediate social awareness)
- "Your friend has a higher score!" notifications
- Climb leaderboard creates goals

#### SYSTEM: Clan System (Basic)
**Why v0.5:** Social bonds drive retention
**Features:**
- Create/join clans (corps)
- 20-50 members per clan
- Clan chat (basic)
- Clan energy bonuses (+1 energy every 6 hours if in active clan)
- Clan leaderboard
**Constraints:**
- No daily requirements (SO-002)
- Can contribute when convenient
- Missing days doesn't hurt clan
**Target:**
- 30%+ of DAU in clans by Month 6

#### SYSTEM: Gallery & Showcase
**Why v0.5:** Self-expression, "Expressionist" archetype (25% of players per PLAYER_JOURNEY)
**Features:**
- Showcase your best snakes
- View other players' collections
- Rate other players' showcases
- Weekly fashion contest voting
**Social Discovery:**
- "Your friend has a NEBULA snake!" (creates desire)
- Browse top collections
- Aspiration creates spending

#### SYSTEM: Expanded Monetization
**Why v0.5:** Increase LTV, more purchase options
**Features:**
- Battlepass (28-day season)
- Breeding accelerators (reduce timer from 30s to instant, $0.99)
- Energy capacity upgrades (expand max from 5 to 7, 2000 DNA or $1.99)
- Exclusive dynasty bundle (1 exclusive dynasty + energy, $4.99)
**Constraints:**
- All content achievable F2P (BM-001)
- Battlepass has free track + premium track
- No exclusive power (cosmetic + convenience only)

---

### Excluded from v0.5 (Defer to v1.0)

- ❌ Clan Wars (complex, defer to v1.0)
- ❌ Trading (economy risk, defer to v1.0)
- ❌ Prestige (not needed until collection complete, v1.0)
- ❌ 500+ variants (expand to 100 in v0.5)
- ❌ Multiple dynasties beyond 5 (v1.0)
- ❌ Advanced set bonuses (v1.0)

---

### v0.5 Success Criteria

**Business Metrics:**
- D1 retention: 45%+ (up from 40%)
- D7 retention: 20%+ (up from 15%)
- D30 retention: 12%+ (up from 8%)
- Clan participation: 30%+ of DAU
- Session frequency: 3+ per day
- Conversion rate: 7%+ by Day 7 (up from 3%)

**Player Experience:**
- Two game modes create variety
- Social features discovered by 80%+ in first week
- Clan energy bonus feels meaningful
- Leaderboard climbing creates goals

---

### v0.5 Development Timeline

**Month 4: Evolution + Tower Mode**
- Week 13-14: Evolution system
- Week 15-16: Tower Mode
- **Deliverable:** Two game modes, power progression

**Month 5: Social Systems**
- Week 17-18: Leaderboards + Friend system
- Week 19-20: Clan system (basic)
- **Deliverable:** Social infrastructure

**Month 6: Social Polish**
- Week 21-22: Gallery & Showcase
- Week 23-24: Expanded monetization (Battlepass, bundles)
- **Deliverable:** Complete v0.5

---

## v1.0 - Complete Vision (Months 7-15)

### Core Value Proposition
**"This is my genetic empire. I'm breeding dynasties, competing in wars, and trading with my corp."**

v1.0 delivers the full MVP_VISION.md experience: Clan Wars, Trading, Prestige, 500+ variants, monthly content drops, complete social economy.

---

### New Systems Added

#### SYSTEM: Clan Wars
**Why v1.0:** Multiplayer complexity high, but drives long-term retention
**Features:**
- 48-hour asynchronous battles
- Territory control
- Corp-exclusive snake variants
- Matchmaking system
- Bonus energy for participants
**Constraints:**
- No daily requirements (contribute anytime in 48 hours)
- Skill-based matchmaking
- Exclusive rewards (not power, just unique variants)

#### SYSTEM: Trading (Corp Marketplace)
**Why v1.0:** Enables social economy, but high anti-exploit risk
**Features:**
- Clan-based marketplace (no P2P trading per SO-003)
- DNA and material exchange
- Daily/weekly trade limits
- Corp-exclusive items
**Anti-Exploit:**
- No gold farming (clan-only prevents external RMT)
- Trade limits prevent bot abuse
- Exclusive items non-transferable outside corp

#### SYSTEM: Prestige System
**Why v1.0:** Resets provide fresh start for veterans
**Features:**
- Reset collection + generations
- Permanent bonuses (+5% DNA income per prestige)
- Exclusive "Reborn" variants
- Prestige leaderboard
**Constraints:**
- Net benefit: Faster progression than first playthrough (PR-002)
- Requirement: 20+ snakes collected

#### SYSTEM: Expanded Content
**Why v1.0:** Achieves 500+ variant goal from MVP_VISION
**Features:**
- 500+ snake variants
- 10+ dynasties
- Monthly dynasty releases (new dynasty every month)
- Seasonal events
- Limited-time variants
**Content Pipeline:**
- Art team produces 20-30 variants per month
- New dynasty every 2-3 months
- Events rotate weekly

#### SYSTEM: Advanced Features
**Why v1.0:** Completes feature set
**Features:**
- Mastery system (200+ levels per variant)
- Achievement chains (200+ achievements)
- Daily quests
- Advanced set bonuses (6-piece sets, dynasty-specific bonuses)
- Power-ups in Snake gameplay
- Environmental hazards

---

### Excluded from v1.0 (Post-Launch Content)

Some features in MVP_VISION.md are post-launch (Year 2+):
- Advanced breeding genetics (mutations, traits)
- Multiple Tower variants
- Large-scale esports tournaments
- In-game spectating
- User-generated content

These belong in Year 2 roadmap, not v1.0.

---

### v1.0 Success Criteria (Full MVP_VISION Metrics)

**Engagement KPIs:**
- Lab time: 70%, Snake time: 30% (full target achieved)
- Session frequency: 3+ daily
- Session length: 15+ minutes
- D30 retention: 20%+ (2x industry standard, original goal)

**Progression KPIs:**
- Collection depth: 30+ variants per player by Day 30 (up from 20)
- Generation progress: Gen 10+ by Day 30 (up from Gen 5)
- Lab investment: 150+ upgrades/experiments by Day 30
- Clan participation: 40% of DAU (per SO-001)

**Monetization KPIs:**
- D7 conversion: 5%
- D30 conversion: 10%
- ARPDAU: $0.50+
- LTV: $15+ per player

---

### v1.0 Development Timeline

**Months 7-9: Multiplayer Foundation**
- Clan Wars development (3 months)
- Matchmaking infrastructure
- Territory control mechanics

**Months 10-12: Economy + Content**
- Trading system (Corp Marketplace)
- Prestige system
- Content expansion to 300 variants

**Months 13-15: Polish + Scale**
- Expand to 500 variants
- Monthly content pipeline operational
- Advanced features (Mastery, Achievements)
- Final polish, optimization
- Full launch

---

## Feature Comparison Table

| Feature | v0.1 MVP | v0.5 Social | v1.0 Complete |
|---------|----------|-------------|---------------|
| **Core Gameplay** |
| Core Snake | ✓ Full | ✓ | ✓ |
| Classic Mode | ✓ | ✓ | ✓ |
| Tower Mode | ✗ | ✓ | ✓ |
| Power-ups | ✗ | ✗ | ✓ |
| **Meta-Game** |
| Energy System | ✓ Basic | ✓ Enhanced | ✓ Full |
| DNA Collection | ✓ | ✓ | ✓ |
| Collection (variants) | ✓ 20-30 | ✓ 100 | ✓ 500+ |
| Dynasties | ✓ 3-5 (if defined) | ✓ 5-8 | ✓ 10+ |
| Breeding | ✓ Simple (if defined) | ✓ Enhanced | ✓ Complex |
| Evolution | ✗ | ✓ Gen 1-10 | ✓ Infinite |
| Set Bonuses | ✓ Basic | ✓ Enhanced | ✓ Advanced |
| Prestige | ✗ | ✗ | ✓ |
| Mastery | ✗ | ✗ | ✓ 200+ levels |
| **Social** |
| Leaderboards | ✗ | ✓ | ✓ |
| Friend System | ✗ | ✓ Basic | ✓ Full |
| Clans | ✗ | ✓ Basic | ✓ Full |
| Clan Wars | ✗ | ✗ | ✓ |
| Gallery/Showcase | ✗ | ✓ | ✓ |
| Trading | ✗ | ✗ | ✓ Corp-based |
| **Monetization** |
| Energy Refills | ✓ | ✓ | ✓ |
| Starter Bundle | ✓ Day 3-5 | ✓ | ✓ |
| Battlepass | ✗ | ✓ | ✓ |
| Exclusive Dynasties | ✗ | ✓ Limited | ✓ Expanded |
| Breeding Accelerators | ✗ | ✓ | ✓ |
| **Content** |
| Snake Variants | 20-30 | 100 | 500+ |
| Game Modes | 1 (Classic) | 2 (Classic, Tower) | 3+ (Wars) |
| Monthly Releases | ✗ | ✗ | ✓ New dynasty/month |
| Seasonal Events | ✗ | ✗ | ✓ |
| Achievements | ✗ | ✗ | ✓ 200+ |

---

## Content Roadmap

### v0.1 Launch Content
**Goal:** Enough content for 30 days of engaged play

**Snake Variants:** 20-30 total
- If Path B (Breeding): 3-5 dynasties × 5-8 variants each
- If Path A (Collection): 20-30 unique snakes, 3 rarity tiers

**Game Modes:** 1 (Classic)

**Progression:**
- 5 variants unlockable in first hour
- 15 variants by Day 7
- 25 variants by Day 30 (hits PR-003 relaxed target)

**Monetization:**
- 1 starter bundle
- Energy refills
- 0-2 exclusive variants

**Estimated v0.1 Content Creation:**
- 20-30 snake art assets
- 1 game mode implementation
- 3-5 dynasty themes (if Path B)
- Tutorial cinematics
- UI art
- SFX and music

---

### v0.5 Content Expansion
**Goal:** Double content depth, add variety

**New Snake Variants:** +70 variants (100 total)
- Expand dynasties to 5-8 types
- 12-15 variants per dynasty
- Introduce Epic rarity tier

**Game Modes:** +1 (Tower Mode)

**Social Content:**
- Clan badges and emblems
- Showcase templates
- Weekly fashion contests

**Monetization Content:**
- 28-day Battlepass track (50 tiers)
- 3-5 exclusive dynasties
- Seasonal bundles

**Estimated v0.5 Content Creation:**
- +70 snake art assets
- Tower Mode environments
- Clan UI assets
- Battlepass rewards art

---

### v1.0 Complete Content
**Goal:** Achieve 500+ variant collection from MVP_VISION

**New Snake Variants:** +400 variants (500+ total)
- 10+ dynasties
- 50+ variants per dynasty
- Legendary rarity tier
- Prestige-exclusive variants

**Game Modes:** +Clan Wars mode

**Content Pipeline:**
- 1 new dynasty per month (post-launch)
- 20-30 new variants per month
- Weekly events
- Seasonal themes

**Monetization Content:**
- Monthly battlepass refresh
- Limited-time exclusive dynasties
- Prestige rewards

**Estimated v1.0 Content Creation:**
- +400 snake art assets
- Clan Wars maps/environments
- Event assets
- Prestige visual upgrades
- Achievement badges

---

## Development Timeline Summary

### v0.1 - TRUE MVP: Months 1-3

**Month 1: Foundation**
- Core Snake Engine (2 weeks)
- Backend + Auth (2 weeks, parallel)
- UI Framework (1.5 weeks, parallel)
- Energy System (1 week)
- Resource Collection (1 week)
- Classic Mode (1 week)

**Month 2: Meta-Game Core**
- **CRITICAL:** Dynasty Design Sprint (3-5 days, Week 5)
- Collection Management (1.5 weeks)
- Dynasty System (2 weeks, if defined)
- Breeding System (2 weeks, if defined) OR Collection refinement (if not)
- Snake Lab UI (2 weeks)

**Month 3: Monetization + Polish**
- Economy & Shop (1.5 weeks)
- IAP Integration (1 week, parallel)
- Tutorial & Onboarding (1 week)
- Analytics & Events (1 week, parallel)
- Bug fixing + Balancing (2 weeks)
- Performance optimization (ongoing)
- Soft launch prep (1 week)

**v0.1 Total:** 3 months (12 weeks)

---

### v0.5 - Social Foundation: Months 4-6

**Month 4: Depth**
- Evolution System (2 weeks)
- Tower Mode (2 weeks)

**Month 5: Social**
- Friend System (1 week)
- Leaderboards (1 week)
- Clan System (2 weeks)

**Month 6: Social Economy**
- Gallery & Showcase (2 weeks)
- Expanded Monetization (Battlepass) (2 weeks)
- Social polish + balancing (2 weeks)

**v0.5 Total:** +3 months (6 months cumulative)

---

### v1.0 - Complete Vision: Months 7-15

**Months 7-9: Multiplayer**
- Clan Wars (3 months)

**Months 10-12: Economy**
- Trading System (3 weeks)
- Prestige System (2 weeks)
- Content expansion to 300 variants (ongoing)
- Advanced features (Mastery, Achievements) (4 weeks)

**Months 13-15: Scale + Polish**
- Content expansion to 500 variants (ongoing)
- Monthly content pipeline operational
- Final optimization
- Full launch marketing

**v1.0 Total:** +9 months (15 months cumulative)

---

## Critical Path

### Blocking Dependencies

**CRITICAL - WEEK 1:**
1. **Dynasty Design Sprint** → Determines Path A (collection) or Path B (breeding)
   - If not completed Week 1-2 → Must use Path A (collection-only)
   - Impacts v0.1 scope and retention potential

**Foundation (Weeks 1-4):**
2. **Core Snake Engine** → Blocks all gameplay modes
3. **Backend Infrastructure** → Blocks all persistence, auth, sync
4. **Energy System** → Blocks monetization, session gating

**Meta-Game (Weeks 5-8):**
5. **Collection System** → Blocks Lab UI, breeding
6. **Dynasty System** (if defined) → Blocks breeding algorithm
7. **Breeding System** (if defined) → Blocks v0.5 evolution

**Monetization (Weeks 9-10):**
8. **Economy & IAP** → Blocks revenue

**Launch (Weeks 11-12):**
9. **Analytics** → Blocks success measurement
10. **Tutorial** → Blocks D1 retention

---

### Parallel Opportunities

**Weeks 1-2:** Core Snake + Backend + UI Framework (all parallel)

**Weeks 3-4:** Energy + Resources + Classic (sequential, but can overlap)

**Weeks 5-8:** Collection + Dynasty + Breeding (sequential dependencies)

**Weeks 9-10:** Economy + IAP + Tutorial + Analytics (can parallelize)

**Weeks 11-12:** Bug fixing + Performance (team-wide effort)

---

### High-Risk Dependencies

**Dynasty → Breeding → Evolution:**
- If Dynasty definition changes mid-Phase 2, breeding must be reworked
- Mitigation: LOCK Dynasty design after sprint, no changes

**Breeding Balancing → Retention:**
- If progression too fast: Collection completed Day 10, churn by Day 15
- If progression too slow: Frustration, churn by Day 7
- Mitigation: Simulation testing (10k virtual breeding runs), soft launch tuning

**Energy Balancing → Monetization:**
- If energy too generous: No purchase motivation, revenue fails
- If energy too restrictive: D7 retention fails
- Mitigation: A/B test energy costs, live tuning dashboard

**Clan Wars Complexity → v1.0 Timeline:**
- Multiplayer coordination high risk
- Mitigation: Can slip to Month 16-18 if needed (post-v1.0 launch)

---

## Scope Creep Prevention

### Rules
1. **v0.1 scope freeze:** No new systems after Week 8 (Month 2)
2. **Feature displacement:** Any new feature request must displace existing feature of equal scope
3. **Dynasty lock:** Dynasty design frozen after sprint (Week 2), no changes until v0.5
4. **No "quick adds":** Final month before launch (Month 3) is polish only, no new features

### Change Control
**To add feature to locked version:**
1. Written proposal with rationale
2. Impact analysis (development time, risk, dependencies)
3. Identify feature to cut (equal scope)
4. Team consensus required
5. Update this document

**Example:**
- Request: "Add daily quests to v0.1"
- Impact: +1 week development
- Cut: Remove advanced set bonuses from v0.1 (defer to v0.5)
- Rationale: Daily quests drive retention, set bonuses are nice-to-have

---

## Version Strategy Rationale

### Why Three Versions?

**v0.1 (Months 1-3): Prove Core Hypothesis**
- Hypothesis: Players will spend 70% time in Lab, 30% playing Snake
- Test: Does the paradigm shift work? Is this addictive?
- Risk: If hypothesis fails at v0.1, pivot before investing 15 months
- Benefit: Real user feedback after 3 months vs 15 months

**v0.5 (Months 4-6): Validate Social Layer**
- Hypothesis: Social features drive retention and community
- Test: Do clans increase D30 retention? Does Tower Mode add variety?
- Risk: Social features may not resonate
- Benefit: Learn what social features work before investing in Clan Wars

**v1.0 (Months 7-15): Complete Vision**
- Hypothesis: Full feature set achieves MVP_VISION metrics
- Test: Does complete experience hit 20% D30 retention and monetization targets?
- Benefit: Iterative releases build momentum, each version funds next

---

### Why NOT Launch with Everything?

**Risk: 15 months before ANY user feedback**
- User hypothesis could be wrong
- Wasted development on features users don't want
- Market changes during 15-month development
- Competitor launches first

**Opportunity Cost: Iterating vs Building**
- v0.1 launch at Month 3 → learn → iterate based on real data
- vs Single v1.0 launch at Month 15 → discover issues late

**Team Health: Shipping Creates Momentum**
- 3-month milestones keep team motivated
- Shipping v0.1 celebrates success, builds confidence
- 15 months without launch creates burnout risk

**Market Timing: Competitors**
- Mobile gaming moves fast
- Launching v0.1 establishes market presence
- Iterative releases show active development
- vs 15-month silence allows competitor to launch similar game first

---

### Why This IS an MVP

**v0.1 Delivers Core Value:**
- Playable Snake (polished, fun)
- Paradigm shift to Snake Lab (70/30 split)
- One complete meta-game loop (collect → progress → breed OR unlock)
- Energy system (creates return sessions)
- Monetization (energy refills, starter bundle)
- **Result:** Players can experience the "genetic empire" vision in simplified form

**v0.1 Tests Key Hypothesis:**
- Will players spend 70% time in Lab? (Core to vision)
- Does energy system feel strategic or punishing?
- Is collection/breeding addictive?
- Do players return for sessions 2, 3, 4...?

**v0.1 Generates Revenue:**
- Energy refills
- Starter bundle
- Opt-in ads
- **Result:** v0.1 can fund v0.5 development (if metrics hit targets)

**v0.1 Builds Player Base:**
- Early adopters become evangelists
- Word-of-mouth growth during v0.5 dev
- Community forms before social features launch
- **Result:** v0.5 social features have existing community to activate

---

## Go/No-Go Criteria

### v0.1 Ship Gate

**Product Readiness:**
- [ ] Core Snake is fun (internal playtest score >7/10 from 20+ playtesters)
- [ ] Lab discovered by 80%+ of playtesters within 5 minutes
- [ ] Lab time >60% in playtests (70% is aspirational, 60% acceptable for v0.1)
- [ ] First collection action (unlock or breed) completed by 70%+ in Session 1
- [ ] Energy system has free daily refill + clear recharge display
- [ ] One complete meta-game loop functional (play → collect → progress)
- [ ] Tutorial completion >85% (90% is target, 85% acceptable)

**Technical Readiness:**
- [ ] 60fps sustained on iPhone 12, Samsung Galaxy S21 under load
- [ ] <3 second app cold start
- [ ] Offline Core Snake gameplay functional
- [ ] Cross-platform sync working (iOS ↔ Android)
- [ ] Backend load tested to 10k concurrent users
- [ ] Crash rate <2% (1% is target, 2% acceptable for soft launch)

**Monetization Readiness:**
- [ ] IAP functional (can purchase energy)
- [ ] Starter bundle appears Day 3-5 (not before per BM-004)
- [ ] No forced ads (opt-in only per BM-002)
- [ ] Receipt validation working (prevent fraud)

**Analytics Readiness:**
- [ ] All funnel events tracked (game_start → tutorial_complete → lab_discovered → first_unlock)
- [ ] Retention cohorts configured (D1, D7, D30)
- [ ] Monetization events tracked (purchase, ad view)
- [ ] Playtime tracking (Lab vs Snake ratio)

**No-Go Triggers:**
- Dynasty System still undefined (choose Path A as fallback)
- Core Snake not fun (<6/10 playtest score) → Delay launch, improve polish
- Lab not discovered (<50% in playtests) → Redesign tutorial
- Critical bugs (save corruption, payment failures) → Delay until fixed

---

### v0.5 Ship Gate

**Product Readiness:**
- [ ] Two game modes feel distinct (Classic vs Tower)
- [ ] Evolution system adds meaningful progression
- [ ] Leaderboards drive competition (playtester engagement metrics)
- [ ] Clans provide energy bonus and social benefit
- [ ] Gallery showcases create desire (playtester feedback)

**Business Metrics (Post v0.1 Launch):**
- [ ] v0.1 D1 retention >40%
- [ ] v0.1 D7 retention >15%
- [ ] v0.1 first purchase conversion >3%
- [ ] v0.1 Lab time ratio >60%
- **Rationale:** If v0.1 fails metrics, must pivot before v0.5

**Technical Readiness:**
- [ ] Clan system scales to 1000+ clans
- [ ] Leaderboard queries <200ms at scale
- [ ] Tower Mode maintains 60fps

**No-Go Triggers:**
- v0.1 retention failed (<10% D7) → Pivot v0.5 scope based on learnings
- Clan system bugs (chat failures, invite issues) → Delay until stable

---

### v1.0 Ship Gate

**Product Readiness:**
- [ ] Clan Wars functional (matchmaking, battles, rewards)
- [ ] Trading system has anti-exploit measures
- [ ] Prestige system tested (no progression loss bugs)
- [ ] 500+ variants in game
- [ ] Monthly content pipeline operational

**Business Metrics (Post v0.5 Launch):**
- [ ] v0.5 D30 retention >12%
- [ ] v0.5 Clan participation >30%
- [ ] v0.5 conversion rate >7% by Day 7
- [ ] v0.5 ARPDAU >$0.30
- **Rationale:** Validates full vision is viable

**Technical Readiness:**
- [ ] Clan Wars handles 100+ simultaneous battles
- [ ] Trading system tested for exploits
- [ ] Content pipeline produces 20+ variants/month reliably

**Full Launch Criteria (All MVP_VISION Metrics):**
- [ ] D30 retention: 20%+
- [ ] Lab time: 70%, Snake time: 30%
- [ ] Clan participation: 40% of DAU
- [ ] D30 conversion: 10%+
- [ ] ARPDAU: $0.50+
- [ ] LTV: $15+ per player

---

## Measuring Success

### v0.1 Success Indicators

**Week 1 (Soft Launch):**
- D1 retention: 40%+
- Tutorial completion: 85%+
- Lab discovery: 80%+
- First purchase: 0.5%+ (Day 1)

**Week 2:**
- D7 retention: 15%+
- Session frequency: 2+ per day
- Lab time ratio: 60%+
- First purchase: 3%+ (Day 7)

**Week 4:**
- D30 retention: 8%+
- Collection depth: 15+ variants (median player)
- Generation progress: Gen 5+ (if breeding) OR 20+ unlocks (if collection-only)
- ARPDAU: $0.20+

**If Metrics Exceeded:**
- D7 >20%: Core loop is very strong, accelerate v0.5
- Conversion >5% Day 7: Monetization resonates, expand offerings in v0.5
- Lab time >70%: Paradigm shift successful, maintain focus

**If Metrics Missed:**
- D7 <10%: Core loop issue, diagnose before v0.5
  - Is Lab compelling? (browse time, interaction count)
  - Is energy too restrictive? (churn after depletion?)
  - Is Snake fun enough? (playtime, scores)
- Conversion <1% Day 7: Monetization issue
  - Is starter bundle appealing? (show rate, purchase rate)
  - Is energy bundle priced right? (test $0.99 vs $1.99)
- Lab time <50%: Paradigm shift failed
  - **CRITICAL:** This invalidates core hypothesis, requires pivot

---

### v0.5 Success Indicators

**Month 4:**
- D1 retention: 45%+ (up from 40%)
- D7 retention: 20%+ (up from 15%)
- Tower Mode adoption: 50%+ of players try Tower by Day 7

**Month 5:**
- Clan participation: 20%+ of DAU (target 30% by Month 6)
- Friend feature adoption: 40%+ of players add friends
- Leaderboard engagement: 60%+ check leaderboard weekly

**Month 6:**
- D30 retention: 12%+ (up from 8%)
- Clan participation: 30%+
- Conversion rate: 7%+ by Day 7 (up from 3%)
- ARPDAU: $0.35+ (up from $0.20)

---

### v1.0 Success Indicators

**Month 12:**
- Clan Wars participation: 25%+ of clans active in wars
- Trading volume: 1000+ trades daily
- Prestige adoption: 5%+ of D60 players prestige

**Month 15 (Full Launch):**
- D30 retention: 20%+ (MVP_VISION target)
- Lab time: 70%, Snake time: 30%
- Clan participation: 40% of DAU
- D30 conversion: 10%+
- ARPDAU: $0.50+
- LTV: $15+ per player

**If All Metrics Hit:**
- Platform is validated
- Scale marketing spend
- Expand team for Year 2 content

**If Metrics Missed:**
- Analyze which pillar failed (engagement, monetization, social)
- Iterate post-launch
- Consider feature cuts or pivots

---

## Risk Mitigation Summary

### CRITICAL RISKS (Can Kill v0.1)

**1. Dynasty System Undefined**
- **Impact:** Blocks breeding, delays launch
- **Mitigation:** 3-5 day design sprint Week 1, lock design Week 2
- **Fallback:** Path A (collection-only meta-game) ships without breeding

**2. 70/30 Time Split Not Achieved**
- **Impact:** Core hypothesis fails, paradigm shift doesn't work
- **Mitigation:** Energy system tight (1 energy = 5min play = 30% of 15min session), Lab must be compelling (browsing, decisions, planning)
- **Fallback:** If <50% Lab time in playtests → Redesign Lab to be more engaging, consider delaying launch

**3. Retention Below 10% D7**
- **Impact:** Game not engaging, v0.5 won't save it
- **Mitigation:** Playtest early (Week 6-7), iterate based on feedback, soft launch to test metrics before full launch
- **Fallback:** If <10% D7 in soft launch → Pivot scope (add content, change energy balance, improve onboarding)

---

### HIGH RISKS (Can Delay Launch)

**4. Breeding Balancing Issues** (if Path B)
- **Impact:** Progression too fast (boredom) or too slow (frustration)
- **Mitigation:** Simulation testing (10k breeding runs), A/B test breeding costs in soft launch
- **Fallback:** Live tuning dashboard to adjust costs post-launch

**5. Energy Feels Too Restrictive**
- **Impact:** Churn in first week, D7 fails
- **Mitigation:** Playtest energy balance, ensure daily free refill feels generous
- **Fallback:** A/B test energy recharge rate (20min vs 15min), increase free refill frequency

**6. Performance Issues (< 60fps)**
- **Impact:** Signals low quality, bad reviews, uninstalls
- **Mitigation:** Performance budgeting from Week 1, profile on target devices weekly, optimize particle effects and rendering
- **Fallback:** Reduce visual effects, optimize asset sizes, delay launch if necessary (performance is non-negotiable)

---

### MEDIUM RISKS (Can Reduce Success)

**7. Lab UI Not Intuitive**
- **Impact:** Players confused, don't engage with Lab, 70/30 fails
- **Mitigation:** User testing (5-10 users Week 7), iterate based on feedback, clear tutorial
- **Fallback:** Simplified Lab UI, reduce options, clearer calls-to-action

**8. Collection Depth Insufficient**
- **Impact:** Boredom by Day 15, D30 retention fails
- **Mitigation:** 20-30 variants should support 30 days if unlock pacing tuned (unlock 1 per day average)
- **Fallback:** Accelerate v0.5 content (add 20 more variants), extend breeding depth (more generations)

**9. Monetization Too Aggressive**
- **Impact:** Backlash, bad reviews, "pay-to-win" perception
- **Mitigation:** Follow BM constraints (no forced ads, pay for convenience, starter bundle delayed to Day 3-5)
- **Fallback:** Pull back monetization, extend free energy, reduce bundle prominence

---

## Summary

### Three-Version Strategy

**v0.1 (Months 1-3): TRUE MVP**
- Core Snake + Energy + ONE meta-game mechanic
- 20-30 variants, 1 game mode, collection OR breeding
- D7 retention >15%, first purchase >3%
- **Goal:** Prove core hypothesis (70/30 time split, Lab paradigm shift)

**v0.5 (Months 4-6): Social Foundation**
- Add Evolution + Tower Mode + Leaderboards + Clans + Gallery
- 100 variants, 2 game modes
- D30 retention >12%, clan participation >30%
- **Goal:** Validate social features drive retention

**v1.0 (Months 7-15): Complete Vision**
- Add Clan Wars + Trading + Prestige + 500+ variants
- Monthly content pipeline, seasonal events
- D30 retention >20%, ARPDAU >$0.50, LTV >$15
- **Goal:** Achieve all MVP_VISION metrics

---

### Why This Works

**v0.1 is realistic:** 3 months, focused scope, shippable regardless of Dynasty definition

**v0.5 adds depth:** Social layer tested on existing player base

**v1.0 completes vision:** Full feature set delivered incrementally

**Total timeline:** 15 months (vs 15 months for single v1.0 launch)
- But with user feedback at Month 3, 6, enabling iteration
- Each version funds next version if metrics hit
- Market presence established at Month 3 (vs Month 15)

---

### Critical Success Factor

**Dynasty System must be defined Week 1-2.**

If Dynasty undefined:
- Use Path A (collection-only) for v0.1
- Add breeding in v0.5 after Dynasty sprint
- Timeline extends 1-2 months

If Dynasty defined Week 1-2:
- Use Path B (collection + breeding) for v0.1
- Higher retention potential
- Smoother path to v1.0

---

### Next Steps

1. **Immediate (Week 1):** Dynasty Design Sprint (3-5 days, Senior PM + Game Designer)
2. **Week 2:** Lock v0.1 scope (Path A or Path B based on Dynasty definition)
3. **Week 3:** Begin development (Foundation phase)
4. **Week 6-7:** First playtest (internal)
5. **Week 11:** Soft launch prep
6. **Month 3:** v0.1 soft launch
7. **Month 4:** Analyze v0.1 metrics, plan v0.5 adjustments
8. **Month 6:** v0.5 launch
9. **Month 15:** v1.0 full launch

---

**Document Status:** ACTIVE - MVP Scope Definition
**Version:** 1.0
**Word Count:** 9,200+ words
**Next Review:** After Dynasty Design Sprint (Week 2), lock scope
**Owner:** Product Lead + Design Lead

**Remember:** Scope discipline is the difference between shipping in 3 months and shipping in never. Respect the constraints, ship iteratively, learn from users.

**Ship v0.1. Learn. Iterate. Win.**
