# Dynasty System - Requirements & Design Sprint Planning

**Status:** CRITICAL BLOCKER - BLOCKS PRODUCTION
**Priority:** WEEK 1-2 DESIGN SPRINT REQUIRED
**Date:** 2025-10-14
**Document Type:** Requirements & Design Sprint Agenda

---

## CRITICAL BLOCKER STATUS

**Status:** UNDEFINED - BLOCKS PRODUCTION

**Mentions:** 20+ across all game design documents

**Blocks:**
- $58,000 art budget (500+ variant production pipeline)
- Breeding system implementation
- Evolution mechanics design
- Set bonus system
- Collection Lab UI (dynasty filters, organization)
- 20-week art production timeline

**Impact:** 4-6 week project delay if not resolved Week 1-2

---

## What We Know (Evidence from Existing Docs)

### References in MVP_VISION.md

**Core Loop Quote:**
> "Snake Lab (70% time) → Need Resources → Spend Energy → Play Snake (30% time)"

**Infinite Progression Quote:**
> "Prestige Systems: Reset progress for permanent account bonuses"
> "Mastery Tracks: 200+ levels per snake variant"

**Dynasties Mentioned:**
- Context implies Dynasties are fundamental to collection organization
- Progression appears to be per-Dynasty ("mastery tracks")
- Prestige system may reset Dynasty progress

### References in PLAYER_JOURNEY.md

**Player Archetype: The Completionist (35%)**
> "Trigger: 'Only 3 genomes left in Quantum Set!'"

**Identity Formation:**
> "I'm a MECHA dynasty specialist"

**Social Desire:**
> "That NEBULA dynasty though..."

**Discovery Phase (Day 1):**
> "Dynasty selection screen - 'This feels different'"

**Milestones:**
> "Dynasty revealed" (Day 2-3 milestone)

**Interpretation:**
- Players choose or unlock Dynasties early
- Dynasty becomes part of player identity ("MECHA specialist")
- Dynasties are socially visible and desirable
- Players collect/specialize within specific Dynasties

### References in CONSTRAINT_LATTICE.md

**CO-001: Collection Size - 500+ Variants**
> "Dynasty distribution: 10+ dynasties with 50+ variants each"

**Calculation Evidence:**
- 500 total variants mentioned
- If 10 Dynasties: 50 variants each
- If 8 Dynasties: 62-63 variants each
- If 12 Dynasties: 41-42 variants each

**BM-001: No Pay-to-Win**
> "Premium-only dynasty with +20% stats" (listed as NON-COMPLIANT example)

**Interpretation:**
- Some Dynasties may be premium, but cannot have stat advantage
- Dynasty selection must be fair (F2P can access all content)

### References in Collection Lab Analysis (Part 1)

**Set Tracking (BLOCKED by Dynasty):**
> "CYBER Set (6 pieces): Progress 3/6 (50%), Bonus: +10% DNA income"

**Dynasty Filters:**
> "Cannot create dynasty dropdown without dynasty list"
> "Cannot display dynasty visual themes without theme specification"

**Breeding Integration:**
> "Cannot filter valid breeding partners without dynasty breeding rules"

**Interpretation:**
- Sets are Dynasty-based (complete CYBER Dynasty = bonus)
- 6-piece sets mentioned (requires 6 variants per Dynasty minimum)
- +10% DNA bonus confirmed for set completion
- Cross-dynasty breeding rules unknown (can CYBER × NEBULA breed?)

### References in Collection Lab Analysis (Part 2)

**ART PRODUCTION BLOCKER:**
> "$58,000 art budget, 20-week timeline BLOCKED by undefined Dynasty visual themes"

**Dynasty Visual Themes (UNDEFINED):**
- Egyptian Dynasty: Gold/teal palette, hieroglyphic patterns
- Norse Dynasty: Frost blue/silver, runic markings
- Cyberpunk Dynasty: Neon pink/cyan, circuit patterns
- Feudal Dynasty: Cherry blossom pink, samurai armor
- Aztec Dynasty: Jade green/gold, feathered serpent
- Steampunk Dynasty: Bronze/copper, gear patterns
- Cosmic Dynasty: Deep purple/gold, nebula patterns
- Tribal Dynasty: Earth tones, war paint patterns

**Interpretation:**
- These are PROPOSED Dynasty themes (not confirmed)
- Art production cannot begin until themes locked
- Each Dynasty needs consistent visual identity (colors, patterns, motifs)

---

## Critical Questions (Must Answer in Design Sprint)

### Question 1: What IS a Dynasty?

**Possible Interpretations:**

**A. Visual Theme Only**
- Dynasty defines art style (CYBER = robotic, NEBULA = cosmic)
- No gameplay impact, purely cosmetic
- Easiest to implement, simplest to balance

**Pros:**
- Simple balance (no stat differences)
- Easy to add new Dynasties post-launch
- No pay-to-win risk

**Cons:**
- Less strategic depth
- Weaker player identity
- Breeding feels less meaningful

**Evidence from docs:**
- BM-001 constraint forbids "Premium-only dynasty with +20% stats" (implies no stat differences allowed)
- Player identity quotes ("I'm a MECHA specialist") suggest more than cosmetics
- Collection Lab analysis proposes Dynasty themes as purely visual

**B. Visual Theme + Stat Modifiers**
- Dynasty defines visual theme AND stat bonuses
- Example: CYBER = +10% speed, -5% size
- Strategic breeding choices (breed for desired stats)

**Pros:**
- Strategic depth (breed CYBER for speed)
- Player specialization
- Stronger identity

**Cons:**
- Balance complexity (stat adjustments needed)
- Risk of "best Dynasty" meta
- Harder to add new Dynasties

**Evidence from docs:**
- PLAYER_JOURNEY mentions "I'm a MECHA specialist" (suggests specialization)
- But BM-001 explicitly forbids stat advantages for premium content
- If Dynasties have stats, all must be F2P accessible

**C. Visual Theme + Unique Abilities**
- Dynasty defines unique abilities/mechanics
- Example: CYBER = Shield ability, NEBULA = Warp ability

**Pros:**
- Deep strategic gameplay
- Strong player identity
- High replayability

**Cons:**
- Very high complexity
- 8-12 weeks development (vs 2-4 for stats)
- Balance nightmare
- Hard to add new Dynasties

**Evidence from docs:**
- No mentions of Dynasty-specific abilities in any docs
- High complexity would conflict with MVP timeline
- Unlikely for v0.1

**D. Hybrid - Visual + Minor Stat Modifiers (5-10%)**
- Dynasty defines visual theme AND small stat bonuses
- Example: CYBER = +5% speed, NEBULA = +5% size
- Bonuses noticeable but not game-breaking

**Pros:**
- Moderate strategic depth
- Player specialization without power creep
- Manageable balance
- Easier to add Dynasties later

**Cons:**
- Not as simple as cosmetic-only
- Not as deep as full abilities
- Requires stat balancing

**Evidence from docs:**
- Collection Lab Part 1 recommends "±5-10% stat variance" for variants
- BM-001 allows minor differences if not pay-to-win
- Balance constraint BA-003: "Power curve exponential cost, linear output"

---

### Question 2: How Many Dynasties?

**Evidence from docs:**
- CO-001: "10+ dynasties with 50+ variants each"
- Collection Lab Part 2: "8-12 Dynasties" proposed

**Option A: 5 Dynasties**
- 500 variants ÷ 5 = 100 variants per Dynasty
- Easier to complete Dynasty sets (achievable goal)
- Less variety (only 5 visual themes)

**Option B: 8 Dynasties**
- 500 variants ÷ 8 = 62-63 variants per Dynasty
- Balanced variety and completability
- 8 distinct visual themes

**Option C: 10 Dynasties**
- 500 variants ÷ 10 = 50 variants per Dynasty
- High variety (10 visual themes)
- Still completable Dynasty sets
- Matches CO-001 constraint

**Option D: 12 Dynasties**
- 500 variants ÷ 12 = 41-42 variants per Dynasty
- Maximum variety
- Harder to complete Dynasty sets (longer-term goal)

**Recommendation:** 10 Dynasties
- Matches CO-001 specification (10+ dynasties)
- 50 variants per Dynasty is achievable by endgame
- High variety without overwhelming players
- Room to add 2-3 more in Year 2

---

### Question 3: Do Dynasties Affect Gameplay?

**Option A: Cosmetic Only**
- All Dynasties have identical stats
- Visual variety is the only difference
- No gameplay impact

**Implications:**
- Simplest to balance
- No risk of "best Dynasty" meta
- Complies with BM-001 (no pay-to-win)
- Weaker motivation to collect specific Dynasties

**Option B: Minor Stat Modifiers (5-10%)**
- Each Dynasty has small stat bonuses
- Example: CYBER +5% speed, NEBULA +5% size, PRIMAL +5% DNA generation
- Bonuses noticeable but not mandatory

**Implications:**
- Strategic breeding (collect CYBER for speed)
- Player specialization without power creep
- Complies with BM-001 if all Dynasties F2P accessible
- Requires balancing (ensure no Dynasty dominates)

**Option C: Unique Abilities**
- Each Dynasty has unique active/passive abilities
- Example: CYBER Shield, NEBULA Warp, PRIMAL Regenerate
- High strategic depth

**Implications:**
- 8-12 weeks extra development (ability system)
- High complexity (balance nightmare)
- Conflicts with v0.1 MVP timeline
- Unlikely for initial release

**Recommendation:** Option B (Minor Stat Modifiers)
- 5-10% bonuses provide strategic depth
- Not game-breaking (skill > Dynasty)
- Manageable balance complexity
- Complies with BM-001 if all Dynasties earnable

---

### Question 4: How Do Players Choose/Unlock Dynasties?

**Option A: Choose One Dynasty at Start**
- Player selects 1 Dynasty during tutorial
- Permanent choice? Or switchable later?
- Locks player into Dynasty path

**Pros:**
- Creates commitment ("I'm a CYBER specialist")
- Replayability (different Dynasty on alt account)

**Cons:**
- Fear of "wrong choice" (tutorial paralysis)
- Limits collection variety
- Discourages experimentation

**Evidence:**
- PLAYER_JOURNEY: "Dynasty selection screen" in first contact (0-30s)
- Suggests early choice mechanic

**Option B: Unlock Dynasties Progressively**
- Start with 1-2 starter Dynasties
- Unlock more over time (DNA cost, achievements, milestones)
- Collection goal (unlock all Dynasties)

**Pros:**
- No tutorial paralysis (start simple)
- Progression goal (unlock all)
- Creates long-term objectives

**Cons:**
- Complex unlock system
- May gate content unfairly

**Evidence:**
- CONSTRAINT_LATTICE: "Basic dynasties unlockable via play"
- Suggests some Dynasties locked initially

**Option C: No Player Choice - Collect All Dynasties**
- Dynasties are snake attributes (not player choice)
- Players collect snakes from all Dynasties
- No "main Dynasty" commitment

**Pros:**
- No choice paralysis
- Maximum collection variety
- Encourages complete collection

**Cons:**
- Weaker identity ("I'm a MECHA specialist" doesn't apply)
- No specialization mechanic

**Recommendation:** Option B (Progressive Unlock)
- Start with 2-3 Dynasties unlocked (variety from day 1)
- Unlock remaining Dynasties via DNA spend (2,000-5,000 DNA each)
- Creates progression goals ("Unlock all Dynasties")
- Allows specialization (focus on unlocked Dynasties early)

---

### Question 5: Can Snakes Change Dynasties?

**Option A: Dynasty is Immutable**
- Snake is born into Dynasty, stays forever
- Breeding: Parents' Dynasties determine offspring Dynasty
- Evolution: Gen 1 CYBER → Gen 2 CYBER (same Dynasty)

**Pros:**
- Clear, simple system
- Dynasty is stable identity
- Breeding predictable

**Cons:**
- No Dynasty transformation mechanic
- Less flexibility

**Evidence:**
- No mentions of Dynasty change in any docs
- Simplicity suggests immutable

**Option B: Dynasty Can Change**
- Evolution can change Dynasty (CYBER → NEBULA)
- Special items ("Dynasty Crystals") allow re-assignment
- Premium feature possibility

**Pros:**
- Flexibility (fix "wrong" Dynasty)
- Premium monetization opportunity

**Cons:**
- Complex system
- Dilutes Dynasty identity
- Balancing nightmare

**Recommendation:** Option A (Immutable)
- Dynasty is permanent identity
- Breeding always produces same Dynasty as parents
- Evolution upgrades generation, not Dynasty
- Simpler, clearer system

---

### Question 6: Do Dynasties Affect Breeding?

**Cross-Dynasty Breeding Rules:**

**Option A: Same Dynasty Only**
- CYBER + CYBER = CYBER offspring
- Cannot breed CYBER × NEBULA
- Forces Dynasty specialization

**Pros:**
- Simple rule
- Encourages Dynasty focus
- Clear set completion path

**Cons:**
- Limits breeding combinations
- No hybrid mechanics

**Option B: Cross-Dynasty Allowed, Random Inheritance**
- CYBER + NEBULA = 50% CYBER, 50% NEBULA offspring
- Encourages collection variety
- Hybrid possibility

**Pros:**
- Maximum breeding combinations
- Collection variety encouraged
- Interesting RNG mechanic

**Cons:**
- Cannot predictably breed specific Dynasty
- May frustrate completionists

**Option C: Cross-Dynasty Allowed, Dominant Inheritance**
- CYBER (rare) + NEBULA (common) = CYBER offspring (higher rarity wins)
- Predictable but allows cross-breeding
- Rarity determines Dynasty inheritance

**Pros:**
- Predictable cross-breeding
- Rarity matters in breeding
- Strategic choices

**Cons:**
- Complex rule
- May favor rare Dynasties unfairly

**Recommendation:** Option A (Same Dynasty Only) for v0.1
- Simplest to implement and understand
- Encourages Dynasty specialization
- Clear breeding strategy
- Can add cross-Dynasty in v0.5+ if desired

---

### Question 7: Do Dynasties Have Set Bonuses?

**From Collection Lab Analysis:**
> "Complete all 10 CYBER variants → +10% DNA bonus"

**Set Bonus Structure:**

**Dynasty Set Completion:**
- Complete all variants in one Dynasty = +10% DNA income
- Complete all Dynasties = additional prestige bonus
- Stacking: Multiple Dynasty bonuses stack additively

**Rarity Set Completion:**
- Complete all Common variants = +5% DNA
- Complete all Uncommon variants = +5% DNA
- Complete all Rare variants = +10% DNA
- Complete all Epic variants = +15% DNA
- Complete all Legendary variants = +20% DNA

**Thematic Set Completion:**
- Complete "Serpent Kings" set (10 royal-themed snakes) = exclusive variant
- Complete "Elemental" set (all element snakes) = cosmetic reward

**Set Bonus Questions:**
1. Do bonuses stack? (If complete 2 Dynasties, +20% DNA?)
2. Are bonuses permanent or equipped?
3. Do bonuses persist through prestige?

**Recommendation:**
- Dynasty set bonuses: +10% DNA per Dynasty (stacking, permanent)
- Rarity set bonuses: +5-20% based on rarity tier (stacking)
- Bonuses active at all times (not equipped)
- Bonuses persist through prestige (reward for completion)

---

## Proposed Design Directions

### Direction 1: Visual Themes Only (Simplest)

**Definition:**
Dynasty is ONLY a visual theme. No gameplay impact.

**Dynasty Count:** 10 Dynasties

**Dynasty List:**
1. **EGYPTIAN** - Gold/teal, hieroglyphic patterns, pharaoh headdresses
2. **NORSE** - Ice blue/silver, runic markings, viking helmets
3. **CYBERPUNK** - Neon pink/cyan, circuit patterns, holographic effects
4. **FEUDAL** - Cherry blossom pink, samurai armor, Japanese motifs
5. **AZTEC** - Jade green/gold, feathered serpent, stone textures
6. **STEAMPUNK** - Bronze/copper, gear patterns, Victorian aesthetics
7. **COSMIC** - Deep purple/gold, nebula patterns, celestial motifs
8. **TRIBAL** - Earth tones, war paint patterns, bone decorations
9. **CRYSTAL** - Geometric patterns, transparent/refractive, gem-like
10. **SHADOW** - Dark/ethereal, wispy effects, monochromatic

**Variants per Dynasty:** 50 (500 total ÷ 10)

**Unlock System:**
- Start with 3 Dynasties unlocked (EGYPTIAN, CYBERPUNK, FEUDAL)
- Unlock remaining 7 via DNA spend (3,000 DNA each)
- Total unlock cost: 21,000 DNA (achievable Week 3-4)

**Breeding Rules:**
- Same Dynasty only (EGYPTIAN + EGYPTIAN = EGYPTIAN)
- Parents' Dynasties must match to breed
- Offspring inherits Dynasty (immutable)

**Set Bonuses:**
- Complete 50 EGYPTIAN variants = +10% DNA income
- Complete all 10 Dynasties = +100% DNA income (additive)
- Bonuses stack, permanent

**Pros:**
- Simple to implement (2 weeks: unlock system + filters)
- Easy to balance (no stat differences)
- Easy to add new Dynasties post-launch
- No pay-to-win risk

**Cons:**
- Less strategic depth
- Weaker player identity ("I'm a MECHA specialist" is purely cosmetic)
- Breeding feels less meaningful (only visual outcome)

**Estimated Implementation:** 2 weeks
- Week 1: Dynasty unlock system, filters, UI
- Week 2: Set bonus tracking, breeding rules

---

### Direction 2: Visual + Stat Modifiers (Moderate)

**Definition:**
Dynasty defines visual theme AND stat bonuses.

**Dynasty Count:** 10 Dynasties

**Dynasty List with Stats:**
1. **EGYPTIAN** - +5% DNA generation, +10% size
2. **NORSE** - +10% speed, -5% size
3. **CYBERPUNK** - +10% speed, +5% breeding success rate
4. **FEUDAL** - Balanced stats, +5% DNA generation
5. **AZTEC** - +10% rare breeding chance, -5% speed
6. **STEAMPUNK** - +5% evolution speed, +5% HP
7. **COSMIC** - +10% evolution speed, -5% DNA generation
8. **TRIBAL** - +10% HP, -5% speed
9. **CRYSTAL** - +15% rare breeding chance, -10% speed
10. **SHADOW** - +10% breeding success, -5% DNA generation

**Stat Impact:**
- Speed affects Snake gameplay (movement speed)
- Size affects Snake gameplay (collision box)
- DNA generation affects resource income
- Breeding success affects offspring quality
- Evolution speed affects progression rate

**Breeding Rules:**
- Same Dynasty only (for v0.1 simplicity)
- Offspring inherits parent Dynasty stats
- Gen 1 EGYPTIAN (base stats) → Gen 2 EGYPTIAN (base stats +5% per gen + Dynasty bonus)

**Set Bonuses:**
- Complete Dynasty set = +10% DNA income + Dynasty stat bonus intensified (+10% → +15%)
- Example: Complete EGYPTIAN = +10% DNA income + EGYPTIAN bonus becomes +7.5% DNA (instead of +5%)

**Balancing:**
- All Dynasties equally viable (no "best Dynasty")
- Stats have trade-offs (NORSE +speed -size)
- F2P can unlock all Dynasties (no premium stat advantage)

**Pros:**
- Strategic depth (breed for desired stats)
- Player specialization ("I'm a NORSE speed specialist")
- Stronger identity
- Replayability (try different Dynasty strategies)

**Cons:**
- Balance complexity (need stat adjustments over time)
- Risk of "meta Dynasty" (one becomes dominant)
- Harder to add new Dynasties (affects balance)

**Estimated Implementation:** 4-6 weeks
- Week 1-2: Dynasty unlock system, stat formulas
- Week 3-4: Breeding inheritance, stat application
- Week 5-6: Balancing, testing, iteration

---

### Direction 3: Visual + Abilities (Complex)

**Definition:**
Dynasty defines visual theme AND unique abilities.

**Dynasty Count:** 10 Dynasties

**Dynasty List with Abilities:**
1. **EGYPTIAN** - Ability: Resurrection (survive 1 death per run)
2. **NORSE** - Ability: Frost Shield (immune to collisions for 3s, once per run)
3. **CYBERPUNK** - Ability: Data Hack (slow time for 3s, once per run)
4. **FEUDAL** - Ability: Blade Dance (cut through obstacles for 3s)
5. **AZTEC** - Ability: Serpent's Fury (2× speed for 5s)
6. **STEAMPUNK** - Ability: Steam Boost (instant acceleration)
7. **COSMIC** - Ability: Warp (teleport short distance, once per run)
8. **TRIBAL** - Ability: Nature's Blessing (heal 1 collision after 30s)
9. **CRYSTAL** - Ability: Reflect (bounce off walls once per run)
10. **SHADOW** - Ability: Phase (pass through obstacles once per run)

**Ability Mechanics:**
- Abilities activated during Snake gameplay
- Each ability has cooldown or per-run limit
- Abilities significantly affect gameplay strategy

**Breeding Rules:**
- Same Dynasty only (complex cross-Dynasty ability inheritance)
- Offspring inherits parent Dynasty abilities
- No ability mixing (too complex for v0.1)

**Set Bonuses:**
- Complete Dynasty set = Ultimate ability unlock (stronger version of base ability)
- Example: Complete EGYPTIAN = "Phoenix Resurrection" (survive 3 deaths instead of 1)

**Pros:**
- Deep strategic gameplay
- Strong player identity ("I main CYBERPUNK for Data Hack")
- High replayability (each Dynasty plays differently)
- Competitive depth (ability-based strategies)

**Cons:**
- Very high complexity (8-12 weeks development)
- Balance nightmare (abilities affect gameplay significantly)
- Hard to add new Dynasties (must design unique ability)
- Conflicts with v0.1 MVP timeline

**Estimated Implementation:** 8-12 weeks
- Week 1-2: Ability system architecture
- Week 3-6: 10 Dynasty abilities implementation
- Week 7-10: Core Snake integration, ability balancing
- Week 11-12: Testing, iteration, balance tuning

---

### Direction 4: Hybrid - Visual + Minor Stat Modifiers (RECOMMENDED)

**Definition:**
Dynasty defines visual theme AND minor stat modifiers (5-10% bonuses).

**Dynasty Count:** 10 Dynasties

**Dynasty List with Minor Stats:**
1. **EGYPTIAN** - +5% DNA generation
2. **NORSE** - +5% speed
3. **CYBERPUNK** - +5% breeding success rate
4. **FEUDAL** - +5% DNA generation (balanced)
5. **AZTEC** - +5% rare breeding chance
6. **STEAMPUNK** - +5% evolution speed
7. **COSMIC** - +5% size
8. **TRIBAL** - +5% HP (collision forgiveness)
9. **CRYSTAL** - +5% breeding success rate
10. **SHADOW** - +5% evolution speed

**Stat Impact:**
- Bonuses are noticeable but not mandatory
- 5% advantage = expert player with BASE beats beginner with BONUS
- Skill > Dynasty (maintains BM-001 compliance)

**Breeding Rules:**
- Same Dynasty only (v0.1 simplicity)
- Parents' Dynasty has 80% inheritance chance
- Example: EGYPTIAN + EGYPTIAN = 80% EGYPTIAN offspring, 20% random Dynasty (mutation)

**Set Bonuses:**
- Complete Dynasty set = +10% DNA income (stacks with Dynasty bonus)
- Complete all 10 Dynasties = +100% DNA income total (10 × +10%)
- Dynasty stat bonus doubles when set complete (EGYPTIAN +5% becomes +10%)

**Unlock System:**
- Start: 3 Dynasties unlocked (EGYPTIAN, CYBERPUNK, FEUDAL)
- Unlock: 2,000-3,000 DNA per Dynasty
- Total cost: 21,000 DNA (achievable Week 3-4 for engaged players)

**Balancing:**
- All bonuses equally valuable (+5% DNA ≈ +5% speed ≈ +5% breeding)
- No dominant Dynasty (each good for different strategies)
- F2P can unlock all (no premium-only Dynasties)

**Pros:**
- Moderate strategic depth (bonuses matter but not mandatory)
- Player specialization without power creep
- Manageable balance complexity
- Easier to add new Dynasties later
- Complies with BM-001 (fair monetization)

**Cons:**
- Not as simple as cosmetic-only
- Not as deep as full abilities
- Requires ongoing balance monitoring

**Estimated Implementation:** 3-4 weeks
- Week 1: Dynasty unlock system, stat formulas
- Week 2: Breeding inheritance rules
- Week 3: Set bonus tracking, stat application
- Week 4: Balancing, testing, iteration

**RECOMMENDATION:** This direction provides best balance of strategic depth, implementation speed, and long-term maintainability.

---

## Blocked Systems & Impact

### Blocked: Collection Lab Dynasty Filters

**Impact:** Cannot implement dynasty filters in Collection Lab UI
**Blocker:** Don't know dynasty list, visual themes, unlock progression
**Timeline:** Collection Lab UI incomplete without dynasty organization

**Required for Unblocking:**
- List of 10 Dynasty names
- Visual themes per Dynasty (colors, icons)
- Unlock rules (which start unlocked, which require DNA)

**Estimated Implementation After Unblock:** 2-3 days for filter UI

---

### Blocked: 500+ Variant Art Pipeline

**Impact:** Cannot start production on 500 snake designs
**Blocker:** Don't know Dynasty visual themes (colors, patterns, motifs)
**Timeline:** 20-week art pipeline cannot start
**Cost:** $58,000 art budget on hold

**Required for Unblocking:**
- Dynasty visual style guide (8-12 pages, 1 per Dynasty)
- Color palettes (primary, secondary, accent colors)
- Pattern styles (geometric, organic, cultural motifs)
- Accessory themes (headdresses, armor, decorations)
- 2-3 concept snakes per Dynasty (reference for production artists)

**Estimated Timeline After Unblock:**
- Week 1-2: Concept art (2-3 snakes per Dynasty × 10 = 20-30 concepts)
- Week 3-22: Production art (25 snakes per week × 20 weeks = 500 snakes)

---

### Blocked: Breeding System Implementation

**Impact:** Cannot design breeding inheritance rules
**Blocker:** Don't know if/how Dynasty affects offspring
**Timeline:** Breeding system design incomplete

**Required for Unblocking:**
- Cross-Dynasty breeding rules (same Dynasty only? or allowed?)
- Dynasty inheritance formula (if cross-breeding allowed)
- Mutation rules (can offspring change Dynasty?)

**Estimated Implementation After Unblock:** 2 weeks for breeding algorithm

---

### Blocked: Evolution System Design

**Impact:** Cannot determine if evolution changes Dynasty
**Blocker:** Don't know Dynasty mutability rules
**Timeline:** Evolution system design incomplete

**Required for Unblocking:**
- Can evolution change Dynasty? (Yes/No decision)
- If yes, what are the rules? (DNA cost? random? choice?)
- If no, Dynasty is permanent (simplest)

**Estimated Implementation After Unblock:** 1 week for evolution rules

---

### Blocked: Lab UI Dynasty Organization

**Impact:** Cannot implement "Filter by Dynasty" in Collection Lab
**Blocker:** Don't know Dynasty categories, visual themes
**Timeline:** UI mockups incomplete

**Required for Unblocking:**
- Dynasty filter list (10 Dynasty names)
- Dynasty icons (10 icons, 128×128px)
- Dynasty colors (used in UI theming)

**Estimated Implementation After Unblock:** 3-4 days for filter UI

---

### Blocked: Gallery Showcase Dynasty Themes

**Impact:** Cannot create Dynasty-themed showcase backgrounds
**Blocker:** Don't know visual themes
**Timeline:** Social features incomplete

**Required for Unblocking:**
- Dynasty background patterns (10 backgrounds)
- Dynasty color schemes (for gallery borders, frames)

**Estimated Implementation After Unblock:** 1-2 weeks for gallery assets

---

### Blocked: Set Bonus System

**Impact:** Cannot implement Dynasty set bonuses
**Blocker:** Don't know Dynasty set structure (how many variants per set?)
**Timeline:** Progression rewards incomplete

**Required for Unblocking:**
- Dynasty set size (50 variants per Dynasty, confirmed)
- Set bonus formula (+10% DNA per Dynasty, confirmed)
- Stacking rules (bonuses additive)

**Estimated Implementation After Unblock:** 1 week for set tracking

---

## Design Sprint Agenda (Week 1-2)

### Day 1: Evidence Gathering & Question Framing (4 hours)

**Objectives:**
- Review all Dynasty mentions across documents
- Frame the 7 critical questions
- Identify design constraints (BM-001, CO-001, BA-003)
- Research comparable systems (Pokémon types, MTG colors, Clash Royale clans)

**Activities:**
- Document review session (2 hours)
  - MVP_VISION.md Dynasty references
  - PLAYER_JOURNEY.md identity quotes
  - CONSTRAINT_LATTICE.md Dynasty constraints
  - Collection Lab analysis Dynasty blockers
- Constraint mapping (1 hour)
  - BM-001: No pay-to-win (how does Dynasty comply?)
  - CO-001: 500+ variants across 10+ Dynasties
  - BA-003: Power curve exponential cost, linear output
- Comparable system research (1 hour)
  - Pokémon: 18 types, rock-paper-scissors balance
  - MTG: 5 colors, deckbuilding identity
  - Clash Royale: Clans as social groups (not gameplay)
  - Hearthstone: 10 classes, unique abilities

**Deliverable:** Framed questions document (7 critical questions with evidence)

---

### Day 2: Diverge - Generate Options (4 hours)

**Objectives:**
- Brainstorm 10+ Dynasty names
- Sketch 4-5 visual themes per Dynasty
- Propose stat modifiers (if applicable)
- Propose set bonuses
- Explore ability concepts (if going complex route)

**Activities:**
- Dynasty naming brainstorm (1 hour)
  - Cultural themes (Egyptian, Norse, Aztec, Feudal)
  - Sci-fi themes (Cyberpunk, Cosmic, Steampunk)
  - Natural themes (Tribal, Crystal, Shadow)
  - Total: 15-20 Dynasty name options
- Visual theme sketches (2 hours)
  - 2-3 concept sketches per Dynasty
  - Color palette proposals (primary, secondary, accent)
  - Pattern style references (geometric, organic, cultural)
  - Accessory ideas (headdresses, armor, decorations)
- Stat/ability proposals (1 hour)
  - If Direction 2 (stats): +5-10% bonuses per Dynasty
  - If Direction 3 (abilities): 1 unique ability per Dynasty
  - If Direction 4 (hybrid): +5% bonuses per Dynasty

**Deliverable:** Dynasty concept document (15-20 Dynasty options with visual/stat proposals)

---

### Day 3: Converge - Select Direction (4 hours)

**Objectives:**
- Present 4 design directions (cosmetic, stats, abilities, hybrid)
- Evaluate against constraints (dev time, budget, balance complexity)
- Vote on direction
- Make FINAL DECISION on Dynasty definition

**Activities:**
- Direction presentations (1 hour)
  - Direction 1: Visual themes only (2 weeks, low risk)
  - Direction 2: Visual + stat modifiers (4-6 weeks, medium risk)
  - Direction 3: Visual + abilities (8-12 weeks, high risk)
  - Direction 4: Visual + minor stats (3-4 weeks, low-medium risk)
- Evaluation matrix (1 hour)
  - Development time: 2 weeks vs 4 weeks vs 12 weeks
  - Balance complexity: Simple vs Moderate vs High
  - Strategic depth: Low vs Medium vs High
  - BM-001 compliance: Yes vs Yes vs Yes
  - Long-term maintainability: Easy vs Moderate vs Hard
- Team vote (1 hour)
  - Stakeholders: PM, Game Designer, Lead Engineer, Art Director
  - Vote on preferred direction (majority wins)
  - Discuss concerns, finalize decision
- Document decision (1 hour)
  - Write Dynasty System Specification v1.0
  - Lock chosen direction (no changes after this)

**Deliverable:** Dynasty System Specification v1.0 (FINAL DECISION)

---

### Day 4: Define Dynasty System Spec (4 hours)

**Objectives:**
- Lock in number of Dynasties (8? 10? 12?)
- Name each Dynasty
- Define visual theme for each (art direction)
- Define stats/abilities for each (if applicable)
- Define set bonuses
- Define breeding inheritance rules

**Activities:**
- Dynasty finalization (1 hour)
  - Select final Dynasty count (recommendation: 10)
  - Lock Dynasty names (EGYPTIAN, NORSE, CYBERPUNK, etc.)
  - Assign variants per Dynasty (50 each for 10 Dynasties)
- Visual theme specification (2 hours)
  - Art Director creates Dynasty Style Guide (8-12 pages)
  - 1 page per Dynasty:
    - Color palette (primary, secondary, accent)
    - Pattern style (geometric, cultural, organic)
    - Texture style (smooth, rough, metallic)
    - Accessory themes (headdresses, armor, decorations)
    - 5-10 reference images (mood board)
- Stat/ability specification (1 hour)
  - If Direction 2/4: Define stat bonuses per Dynasty
    - EGYPTIAN: +5% DNA generation
    - NORSE: +5% speed
    - [etc. for all 10 Dynasties]
  - If Direction 3: Define abilities per Dynasty (skip for v0.1)
- Set bonus specification (30 minutes)
  - Dynasty set completion = +10% DNA income
  - Bonuses stack additively (10 Dynasties = +100% DNA)
  - Dynasty stat bonus doubles when set complete
- Breeding rules specification (30 minutes)
  - Same Dynasty only (v0.1)
  - 80% inheritance, 20% mutation chance
  - Offspring generation = max(parent_gen) + 1

**Deliverable:** Dynasty System Specification v1.0 (complete) + Dynasty Style Guide (8-12 pages)

---

### Day 5: Create Implementation Roadmap (4 hours)

**Objectives:**
- Art pipeline kickoff (commission 500+ designs)
- Backend schema updates (Dynasty column in snakes table)
- UI mockups (Dynasty filters, set tracking)
- Breeding logic updates
- Evolution logic updates
- Testing plan

**Activities:**
- Art pipeline planning (1.5 hours)
  - Batch 1: 50 snakes for v0.1 MVP (5 per Dynasty, Weeks 3-5)
  - Batch 2: 200 snakes for v0.5 soft launch (20 per Dynasty, Weeks 6-14)
  - Batch 3: 250 snakes for v1.0 launch (25 per Dynasty, Weeks 15-22)
  - Commission external art studio (3 artists, 20-25 snakes/week combined)
  - Total timeline: 20 weeks from concept approval to final delivery
- Backend implementation (1 hour)
  - Database schema: Add `dynasty` column to `snakes` table
  - Add `dynasty_stats` JSONB column (if Direction 2/4)
  - Create `dynasty_sets` table (set tracking)
  - Update breeding algorithm (same Dynasty only)
  - Estimated: 1 week backend work
- UI mockups (1 hour)
  - Dynasty filter dropdown (10 Dynasties)
  - Dynasty icons (128×128px, 10 icons)
  - Set tracking panel (progress rings per Dynasty)
  - Dynasty showcase backgrounds (for Gallery)
  - Estimated: 2-3 days UI implementation
- Testing plan (30 minutes)
  - Breeding: Test inheritance rules (100 breeding simulations)
  - Stats: Test Dynasty bonuses applied correctly
  - Set bonuses: Test completion triggers (+10% DNA)
  - Balancing: Test no single Dynasty dominates

**Deliverable:** Implementation Roadmap (timeline, milestones, owners)

---

## Deliverables Summary

**End of Day 1:**
- [ ] Framed questions document (7 critical questions)

**End of Day 2:**
- [ ] Dynasty concept document (15-20 options)

**End of Day 3:**
- [ ] Dynasty System Specification v1.0 (FINAL DECISION)

**End of Day 4:**
- [ ] Dynasty System Specification v1.0 (complete)
- [ ] Dynasty Style Guide (8-12 pages, art reference)

**End of Day 5:**
- [ ] Implementation Roadmap (timeline, backend, UI, art pipeline)

**Unblocked:**
- [ ] $58,000 art budget (500-variant production pipeline UNBLOCKED)
- [ ] 20-week art timeline (kickoff Week 3)
- [ ] Collection Lab Dynasty filters (implementation starts Week 6)
- [ ] Breeding system inheritance rules (implementation starts Week 6)
- [ ] Set bonus tracking (implementation starts Week 7)

---

## Recommended Timeline

**Week 1-2: Dynasty Design Sprint** (20 hours total)
- Day 1: Evidence gathering (4 hours)
- Day 2: Diverge (4 hours)
- Day 3: Converge (4 hours)
- Day 4: Define spec (4 hours)
- Day 5: Implementation roadmap (4 hours)

**Week 3: Art Pipeline Kickoff**
- Batch 1 kickoff: 50 snakes for v0.1 MVP
- Commission external art studio (3 artists)
- Produce concept art (2-3 snakes per Dynasty × 10 = 20-30 concepts)
- Art Director review and approval

**Week 4-6: Backend + UI Implementation**
- Dynasty unlock system (DNA spend, progression)
- Dynasty filters (Collection Lab UI)
- Set bonus tracking (progress tracking, completion rewards)
- Breeding rules (same Dynasty only, inheritance)

**Week 7-22: Art Production** (500 variants over 16 weeks)
- Week 7-10: Batch 1 (50 snakes) → v0.1 MVP
- Week 11-18: Batch 2 (200 snakes) → v0.5 soft launch
- Week 19-22: Batch 3 (250 snakes) → v1.0 launch

**CRITICAL:** Without Week 1-2 Design Sprint, the entire project timeline shifts by 4-6 weeks.

---

## Questions for Design Team

Before Design Sprint, gather input on:

1. **Complexity Preference:** Simple (cosmetic) vs Deep (abilities)?
   - Team preference for Direction 1, 2, 3, or 4?
   - Tolerance for complexity vs speed to market?

2. **Balance Philosophy:** Easy to balance vs Strategic depth?
   - Prioritize simplicity or replayability?
   - Acceptable risk of "meta Dynasty" emergence?

3. **Art Budget:** Can we afford 10 distinct visual themes for 500 variants?
   - $58,000 budget confirmed available?
   - External art studio vs in-house production?

4. **Player Identity:** How important is "I'm a MECHA specialist" identity?
   - Core to player retention or nice-to-have?
   - Affects Direction choice (cosmetic vs stats)

5. **Long-term Vision:** How many Dynasties in Year 2? Year 3?
   - 10 Dynasties at v1.0, then add 2-3 per year?
   - Or 10 Dynasties permanent (no additions)?

6. **Breeding Philosophy:** Should Dynasty heavily influence offspring?
   - Same Dynasty only (simple) or cross-Dynasty (complex)?
   - Predictable or RNG-based inheritance?

7. **Evolution Philosophy:** Can/should evolution change Dynasty?
   - Dynasty immutable (simple) or mutable (complex)?
   - Premium "Dynasty Transform" item opportunity?

---

## Recommendation Summary

**Recommended Direction:** Hybrid (Visual + Minor Stat Modifiers) - Direction 4

**Rationale:**
1. Provides strategic depth without overwhelming complexity
2. 3-4 week implementation (vs 8-12 for abilities)
3. Manageable balance (5-10% bonuses vs game-changing abilities)
4. Supports player identity ("CYBER speed specialist")
5. Easy to expand (add new Dynasties in v1.0+)
6. Complies with BM-001 (no pay-to-win if all F2P accessible)

**Recommended Dynasty Count:** 10 Dynasties

**Rationale:**
1. 500 variants ÷ 10 Dynasties = 50 variants per Dynasty (clean division)
2. 50 variants per Dynasty is achievable endgame goal (not trivial, not impossible)
3. 10 visual themes provide high variety without overwhelming players
4. Matches CO-001 specification ("10+ dynasties")
5. Room to add 2-3 more Dynasties in Year 2 expansion

**Recommended Dynasty List:**
1. EGYPTIAN - Ancient royalty (+5% DNA generation)
2. NORSE - Viking warriors (+5% speed)
3. CYBERPUNK - High-tech future (+5% breeding success rate)
4. FEUDAL - Samurai honor (+5% DNA generation, balanced)
5. AZTEC - Mesoamerican power (+5% rare breeding chance)
6. STEAMPUNK - Victorian industrial (+5% evolution speed)
7. COSMIC - Celestial entities (+5% size)
8. TRIBAL - Primal warriors (+5% HP/collision forgiveness)
9. CRYSTAL - Geometric/mineral (+5% breeding success rate)
10. SHADOW - Dark/ethereal (+5% evolution speed)

**Recommended Unlock System:**
- Start with 3 Dynasties unlocked (EGYPTIAN, CYBERPUNK, FEUDAL)
- Unlock remaining 7 via DNA spend (3,000 DNA each)
- Total unlock cost: 21,000 DNA (achievable Week 3-4 for engaged players)

**Recommended Breeding Rules:**
- Same Dynasty only (EGYPTIAN + EGYPTIAN = EGYPTIAN offspring)
- 80% Dynasty inheritance, 20% mutation (rare cross-Dynasty offspring)
- Offspring generation = max(parent_gen) + 1
- Dynasty is immutable (cannot change Dynasty after birth)

**Recommended Set Bonuses:**
- Complete 50 EGYPTIAN variants = +10% DNA income (permanent, stacking)
- Complete all 10 Dynasties = +100% DNA income total
- Dynasty stat bonus doubles when set complete (EGYPTIAN +5% → +10% DNA)

**Next Step:** Schedule Week 1-2 Design Sprint to finalize decisions and unblock art production.

---

## Budget Impact

**If Dynasty System Defined Week 1-2:**
- Art production: $58,000 (on schedule)
- Backend development: 3-4 weeks (included in v0.1 timeline)
- UI implementation: 2-3 days (included in Collection Lab)
- Total: $58,000 + dev time (already budgeted)

**If Dynasty System NOT Defined:**
- Art production delayed: 4-6 weeks (timeline slip)
- MVP timeline delayed: 4-6 weeks (cascading delay)
- Risk of scope creep: Late decisions = rushed implementation = bugs
- Total cost: $58,000 + 4-6 weeks of additional dev salaries

**ROI of Design Sprint:**
- Investment: 20 hours (5 days × 4 hours)
- Savings: 4-6 weeks of project delay avoided
- Unblocked: $58,000 art budget + 20-week critical path

---

**Priority:** CRITICAL - WEEK 1-2
**Estimated Effort:** 20 hours (Design Sprint)
**Blocks:** $58k art budget, Breeding, Evolution, Collection Lab sets, Lab UI filters
**Impact:** 4-6 week project delay if not resolved immediately

**RECOMMENDATION:** Conduct Dynasty Design Sprint Week 1-2, lock all decisions, unblock art production immediately.
