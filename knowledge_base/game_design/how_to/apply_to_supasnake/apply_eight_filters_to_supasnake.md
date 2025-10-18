# How to Apply the Eight Filters to SupaSnake

**Schell's Principle:** Every design must pass eight filters (Artistic, Demographics, Experience, Innovation, Business, Engineering, Social, Playtesting). Failing any filter requires redesign and retesting all eight.

**SupaSnake Context:** Mobile F2P collection game targeting casual players (25-35) with deep engagement for collectors (10-18). Must balance broad appeal (v0.1) with long-term retention (v0.5+).

---

## Overview

The Eight Filters framework prevents "hope-based design" by forcing systematic evaluation against all constraints. SupaSnake must pass these filters at multiple levels: overall concept, each major system, and every Dynasty variant.

**Key Insight:** Changes that improve one filter (e.g., making breeding more complex for Innovation) may break another (Demographics - too complex for casuals). Iterate until all eight pass simultaneously.

---

## Filter #1: Artistic Impulse

**Key Question:** "Does this feel right to me as designer?"

### Application to SupaSnake

**What to Trust:**
- Gut feeling about collection compulsion (Panini book model)
- Intuition about energy system frustration thresholds
- Sense of "one more round" balance in Snake core

**When Testing Dynasties:**
Each new Dynasty must "feel right":
- Do Molten Dynasty mechanics feel cohesive?
- Does Aqua Dynasty aesthetic fit the world?
- Does Tempest Dynasty difficulty feel fair?

**Warning Signs:**
- Forcing features because "market research says so" (trust your gut if it feels wrong)
- Ignoring persistent discomfort with a system
- Rationalizing away design concerns

**SupaSnake Example:**
Designer intuition: "Energy costs feel stingy at 25 DNA per run."
→ Trust this feeling, playtest at 20/25/30 DNA
→ Result: 20 DNA passes Artistic Impulse filter AND playtesting

---

## Filter #2: Demographics

**Key Question:** "Will the intended audience like this enough?"

### Application to SupaSnake

**Primary Target: 25-35 Casual Mobile (Peak Family Formation)**

**Demographics Test:**
- ✅ **Time:** Snake rounds = 2-3 min (fits commute/bathroom/waiting)
- ✅ **Complexity:** Easy to understand (it's Snake + collect things)
- ✅ **Accessibility:** One-handed mobile play
- ✅ **Progress:** Visible collection advancement even in 5-minute session
- ⚠️ **Risk:** Breeding system too complex for casuals?
  - **Mitigation:** Breeding optional for v0.1, tutorial-gated for interested players

**Secondary Target: 10-18 Collectors (Age of Obsession)**

**Demographics Test:**
- ✅ **Depth:** Breeding strategy, rare variant hunting
- ✅ **Mastery:** Perfect runs, leaderboard competition
- ✅ **Discovery:** Hidden breeding combinations
- ⚠️ **Risk:** Not enough social features for teens?
  - **Mitigation:** v0.5 adds sharing, trading, community

**Gender Balance:**
- ✅ **Female appeal:** Collection, nurturing (breeding), accessible
- ✅ **Male appeal:** Mastery, competition, spatial challenge
- ✅ **Both:** Nostalgia (Nokia Snake), completion satisfaction

**Failure Example:**
Initial design: PvP competitive Snake battles
→ Fails Demographics Filter: Casuals don't want competitive pressure
→ Redesign: Leaderboards optional, collection-first
→ Passes: Appeals to both casual (ignores leaderboards) and competitive (chases high scores)

---

## Filter #3: Experience Design

**Key Question:** "Is this well-designed?"

### Application to SupaSnake

**Experience Lenses to Apply:**

**Collection Lab Experience:**
- **Anticipation:** Breeding outcomes, next variant discovery
- **Purification:** Completing Panini book sections (satisfying)
- **Discovery:** Finding rare variants, unlocking new dynasties
- **Pride:** Displaying completed collections

**Core Snake Experience:**
- **Challenge:** Increasing difficulty, mastery curve
- **Submission:** Flow state during intense gameplay
- **Triumph:** Beating personal best, no-hit runs

**Energy System Experience:**
- **Anticipation:** Energy refilling creates return patterns
- **Possibility:** "What should I spend energy on?" (meaningful choice)
- ⚠️ **Frustration:** If costs too high, breaks experience
  - **Test:** Ensure players end sessions satisfied, not frustrated

**Breeding System Experience:**
- **Discovery:** Learning combinations
- **Expression:** Building custom lineages
- **Anticipation:** Waiting for results (but not too long!)

**Failure Example:**
Initial design: 24-hour breeding timers
→ Fails Experience Design: Anticipation becomes frustration (too long)
→ Redesign: 1-hour timers, instant with DNA cost
→ Passes: Creates anticipation without frustration

---

## Filter #4: Innovation

**Key Question:** "Is this novel enough?"

### Application to SupaSnake

**What's New:**
1. **Snake + Collection Hybrid:** Snake hasn't been done with deep collection layer
2. **Panini Book Model:** Sticker book psychology in mobile game (underutilized)
3. **Dynasty System:** Breeding creates strategic depth beyond typical Snake
4. **Variant Diversity:** 180+ visual variants (more than typical Snake reskins)

**What's Familiar (Intentionally):**
1. **Snake Core:** Everyone knows Snake (accessibility)
2. **Collection Loop:** Pokémon/Panini familiarity (comfortable)
3. **Energy System:** Standard F2P mechanic (expected)

**Innovation Balance:**
- Too novel = confusing, risky
- Too familiar = boring, no differentiation
- **SupaSnake:** Novel combination of familiar elements (safe innovation)

**Competitive Landscape:**
- Typical Snake games: Simple reskins, no progression
- Typical collection games: Not Snake, different core loop
- **SupaSnake fills gap:** Snake nostalgia + modern collection progression

**Failure Example:**
Initial pitch: "Revolutionary AI-driven Snake opponent"
→ Fails Innovation: Sounds gimmicky, not meaningfully novel
→ Redesign: Focus on collection hybrid novelty
→ Passes: Clear differentiator, understandable innovation

---

## Filter #5: Business & Marketing

**Key Question:** "Will this sell?"

### Application to SupaSnake

**Mobile F2P Viability:**

**Revenue Potential (v1.0+):**
- Energy refills (standard F2P)
- Premium dynasties (cosmetic)
- Breeding accelerators (convenience)
- ⚠️ **Critical:** No pay-to-win at launch (user goodwill)

**Market Positioning:**
- **Genre:** Casual arcade + collection (proven F2P category)
- **Platform:** Mobile-first (largest gaming market)
- **Hook:** "Panini book meets Snake" (simple pitch)

**App Store Presence:**
- **Screenshots:** Instantly recognizable Snake + beautiful variants
- **Description:** One sentence = "Collect and breed 180+ snake variants in this nostalgic twist on classic Snake"
- **Genre tags:** Casual, Arcade, Collection

**Cost Structure:**
- **Development:** Solo dev + contractor art (low overhead)
- **Art Pipeline:** Midjourney + simple 3D (scalable, affordable)
- **Backend:** Supabase free tier → paid as scales (low upfront cost)

**Go-to-Market:**
- **Soft launch:** Test retention in small market (Philippines, Canada)
- **A/B test:** Energy costs, variant rarity, breeding costs
- **Global launch:** When retention/monetization metrics hit targets

**Failure Example:**
Initial monetization: Sell individual variants for $0.99 each
→ Fails Business Filter: Low ceiling (max revenue = $180), anti-collection
→ Redesign: F2P with optional premium dynasties, energy system
→ Passes: Higher LTV potential, standard F2P model

---

## Filter #6: Engineering

**Key Question:** "Is it technically possible to build this?"

### Application to SupaSnake

**Technical Feasibility:**

**Frontend (React Native):**
- ✅ Snake game logic (simple, proven)
- ✅ Collection UI (standard mobile patterns)
- ✅ Breeding system (state management, straightforward)
- ⚠️ 3D snake rendering (requires react-native-three or similar)
  - **Risk mitigation:** Prototype 3D rendering first (Week 1)

**Backend (Supabase):**
- ✅ User accounts, auth (built-in Supabase)
- ✅ Collection data (PostgreSQL, straightforward)
- ✅ Breeding calculations (database functions)
- ⚠️ Leaderboards at scale (potential bottleneck)
  - **Risk mitigation:** Optimize queries, consider Redis caching

**Art Pipeline:**
- ✅ Midjourney variants (tested, proven)
- ✅ Simple 3D base models (Blender, manageable)
- ⚠️ 180+ variants at launch (time-intensive)
  - **Risk mitigation:** Phase 1 = 60 variants (3 dynasties), expand post-launch

**Performance:**
- ✅ Snake game: 60fps (simple 2D/3D)
- ✅ Collection browsing: Smooth scrolling (standard React Native)
- ⚠️ Breeding simulations: Complex calculations?
  - **Risk mitigation:** Pre-calculate breeding tables, cache results

**Failure Example:**
Initial design: Real-time multiplayer Snake battles
→ Fails Engineering Filter: Requires complex netcode, synchronization, server infrastructure
→ Redesign: Async leaderboards only
→ Passes: Technically simple, achievable with Supabase

---

## Filter #7: Social/Community

**Key Question:** "Does this meet our social goals?"

### Application to SupaSnake

**v0.1 Social Goals:** Limited (solo focus, build core first)
- ✅ Leaderboards (passive social, no interaction required)
- ✅ Shareable achievements (external - Twitter/Instagram)
- ❌ No trading, no direct player interaction (defer to v0.5)

**v0.5 Social Goals:** Community building
- ✅ Collection sharing (show off rare variants)
- ✅ Trading system (swap duplicates)
- ✅ Breeding tips community (discovery sharing)
- ✅ Guild/clan system (collective goals)

**v1.0 Social Goals:** Thriving community
- ✅ Tournaments (competitive events)
- ✅ User-generated content (custom snake skins?)
- ✅ Social breeding (collaborative rare variant hunts)

**Design for Future Social:**
Even at v0.1, design systems anticipating social:
- Collection IDs (shareable, unique)
- Breeding system (tradeable outputs)
- Achievement system (social currency)

**Failure Example:**
Initial design: No unique variant IDs, all variants identical
→ Fails Social Filter: Can't show off rarity, no trading possible
→ Redesign: Each variant has unique ID, generation tracked
→ Passes: Enables future trading, rarity display

---

## Filter #8: Playtesting

**Key Question:** "Do playtesters enjoy this enough?"

### Application to SupaSnake

**What to Playtest:**

**Week 1-2: Core Loop (Paper Prototype)**
- Hand-drawn Panini book, paper "snakes"
- Test: "Do players enjoy collecting and filling sections?"
- Target: 80%+ say "I'd play this on mobile"

**Week 3-4: Energy Economics (Spreadsheet)**
- Model energy costs, DNA income, session length
- Test: "Does energy system create return behavior without frustration?"
- Target: Players want to return after energy refresh, not angry about costs

**Week 5-6: Minimal Snake + DNA (Playable)**
- Basic Snake, DNA drops, simple collection screen
- Test: "Is core loop fun? Do players care about DNA?"
- Target: 60%+ retention Day 1, average 3+ sessions

**Week 7-8: Breeding Prototype**
- Add breeding system, 2 dynasties, 20 variants
- Test: "Is breeding engaging? Too complex?"
- Target: 40%+ of players try breeding, 80%+ understand it

**Week 9-10: Full v0.1 Alpha**
- 3 dynasties, 60 variants, full collection UI
- Test: "Do players return Day 7? What's drop-off point?"
- Target: 30%+ retention Day 7, identify friction points

**Key Metrics:**
- **Retention:** D1/D7/D30 (mobile industry standards)
- **Session length:** Average 5-10 minutes (multiple Snake rounds)
- **Energy spend:** Are players spending all energy each session?
- **Breeding engagement:** % of players who breed, average breeds per player
- **Collection progress:** Are players completing sections? Which dynasties most popular?

**Iteration Based on Playtesting:**
- Energy costs too high? → Adjust and retest all eight filters
- Breeding too confusing? → Simplify, add tutorial, retest filters
- Core Snake not fun? → Stop, fix core, retest everything

**Failure Example:**
Playtest results: Players love collecting, hate energy system (frustrating)
→ Fails Playtesting Filter despite passing Demographics (wrong energy tuning)
→ Redesign: Increase energy regen rate, lower costs
→ Retest: Playtesters now satisfied
→ Recheck all filters: Does new energy system still pass Business filter (monetization)? Engineering filter (still implementable)?

---

## SupaSnake-Specific Filter Additions

Beyond Schell's eight, SupaSnake adds:

**Filter #9: Collection Psychology**
- "Does the Panini book model create compulsion?"
- Test: Do players feel satisfaction completing sections?

**Filter #10: Retention Mechanics**
- "Do energy system + daily goals create return behavior?"
- Test: Do players return Day 2, Day 7, Day 30?

**Filter #11: Nostalgia Factor**
- "Does Snake nostalgia enhance or hinder?"
- Test: Do 30-somethings feel nostalgic fondness? Or "this is old"?

---

## Iteration Workflow

**Step 1: Initial Design**
- Concept: Snake + Panini book collection
- Run through all 11 filters (conceptually)

**Step 2: Identify Failures**
- Engineering: Need to prototype 3D rendering
- Playtesting: Need to validate collection psychology
- Demographics: Need to test casual vs hardcore appeal

**Step 3: Build Prototypes**
- Paper prototype: Collection compulsion
- 3D rendering test: Technical feasibility
- Minimal playable: Core loop validation

**Step 4: Test Prototypes**
- Playtesting: Does collection feel good?
- Engineering: Does 3D render at 60fps?

**Step 5: Redesign Based on Results**
- Collection prototype successful → keep
- 3D rendering too slow → simplify art style
- Core loop needs tuning → adjust DNA drop rates

**Step 6: Retest All Filters**
- Simplified art (Engineering fix) → does it still pass Artistic Impulse?
- Adjusted DNA rates (Playtesting fix) → does it still pass Business (monetization)?

**Step 7: Repeat Until All Pass**
- Continue looping until SupaSnake passes all 11 filters simultaneously

---

## Tips for Success

✅ **DO:**
- Test filters early and often (don't wait until "done")
- Be willing to kill features that fail filters
- Retest all filters after any change
- Prioritize Playtesting and Demographics (external validation)
- Use Artistic Impulse as tie-breaker

❌ **DON'T:**
- Ignore filter failures ("we'll fix it later")
- Assume passing one filter guarantees others
- Skip prototyping to "save time" (costs more time later)
- Get emotionally attached to features that fail filters
- Neglect Business/Engineering filters (reality constraints)

---

## Example: Dynasty Design Through Eight Filters

**New Dynasty: Mystic Dynasty (Psychic Snakes)**

**Filter #1 (Artistic):** Does this feel right?
- ✅ Yes, mystical theme fits alongside Molten/Aqua/Tempest

**Filter #2 (Demographics):** Will casual/collector players like it?
- ✅ Casual: Cool visuals, easy to understand
- ✅ Collector: New variants to collect, rare psychic types

**Filter #3 (Experience):** Well-designed?
- ✅ Discovery: Psychic powers = new gameplay twist
- ✅ Challenge: Psychic snakes have unique abilities

**Filter #4 (Innovation):** Novel enough?
- ✅ First dynasty with "special powers" (differentiates from basic variants)

**Filter #5 (Business):** Will this sell?
- ✅ Premium dynasty (cosmetic + gameplay), monetization potential

**Filter #6 (Engineering):** Can we build it?
- ⚠️ "Special powers" = new code, testing required
- **Prototype:** Quick test of "teleport" ability
- ✅ After prototype: Achievable

**Filter #7 (Social):** Social goals?
- ✅ Rare Mystic variants = social currency, trading value

**Filter #8 (Playtesting):** Do playtesters enjoy?
- ⚠️ Playtest shows: "Powers feel unfair in competitive mode"
- **Redesign:** Powers only work in PvE, disabled in leaderboards
- ✅ Retest: Players now satisfied

**Result:** Mystic Dynasty passes all filters after one redesign iteration.

---

## See Also

- **Quick Ref:** @knowledge_base/game_design/quick_ref/concepts/concept_eight_filters.md
- **SupaSnake:** @knowledge_base/game/how_to/balance_progression.md
- **Complete:** @knowledge_base/game_design/reference/batch1_chapters/chapter_07_iteration_summary.md
