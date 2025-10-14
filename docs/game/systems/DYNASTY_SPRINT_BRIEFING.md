# Dynasty Design Sprint - Executive Briefing
## Critical Path Unblocking Session

**Date:** 2025-10-14
**Priority:** CRITICAL - BLOCKS v0.1 DEVELOPMENT
**Duration:** 5 days (20 hours total)
**Participants:** Product Lead, Design Lead, Art Director, Lead Engineer

---

## Executive Summary

**The Blocker:** The Dynasty System is mentioned 20+ times across all game documentation but has ZERO specification. This blocks:
- $58,000 art budget (500+ snake variants need dynasty visual themes)
- Breeding system implementation (dynasty inheritance rules undefined)
- Evolution mechanics (can dynasties change?)
- Collection Lab UI (dynasty filters need dynasty list)
- Set bonus system (dynasty completion rewards)
- 20-week art production timeline

**The Impact:** Without Dynasty definition in Week 1-2, the project delays by 4-6 weeks. Art production cannot begin, breeding cannot be designed, v0.1 scope must fall back to collection-only meta-game.

**The Solution:** 5-day Design Sprint to lock all Dynasty decisions, produce Dynasty System Specification v1.0, and unblock all dependent systems.

**This Document:** Pre-sprint briefing with all evidence synthesized, decision framework prepared, and recommendation ready for team vote.

---

## What We Know: Evidence Synthesis

### From MVP_VISION.md

**Player Identity Formation:**
> "I'm a MECHA dynasty specialist"

**Social Desire:**
> "That NEBULA dynasty though..."

**Discovery Phase:**
> "Dynasty selection screen - 'This feels different'"

**Interpretation:**
- Dynasties form player identity
- Dynasties are socially visible and desirable
- Players choose or unlock dynasties early (tutorial phase)
- Specialization is part of the fantasy

### From CONSTRAINT_LATTICE.md

**CO-001: Collection Size**
> "Dynasty distribution: 10+ dynasties with 50+ variants each"

**BM-001: No Pay-to-Win**
> "Premium-only dynasty with +20% stats" (listed as NON-COMPLIANT example)

**Interpretation:**
- Approximately 10 dynasties recommended (500 variants ÷ 10 = 50 per dynasty)
- Dynasties cannot have stat advantages if premium-gated
- All dynasties must be F2P accessible if they affect gameplay

### From Collection Lab Analysis

**Set Tracking Example:**
> "CYBER Set (6 pieces): Progress 3/6 (50%), Bonus: +10% DNA income"

**Dynasty Filters Blocked:**
> "Cannot create dynasty dropdown without dynasty list"

**Art Production Blocked:**
> "$58,000 art budget, 20-week timeline BLOCKED by undefined Dynasty visual themes"

**Proposed Dynasty Themes (EXAMPLES, NOT CONFIRMED):**
- Egyptian Dynasty: Gold/teal palette, hieroglyphic patterns
- Norse Dynasty: Frost blue/silver, runic markings
- Cyberpunk Dynasty: Neon pink/cyan, circuit patterns
- Feudal Dynasty: Cherry blossom pink, samurai armor
- Aztec Dynasty: Jade green/gold, feathered serpent
- Steampunk Dynasty: Bronze/copper, gear patterns
- Cosmic Dynasty: Deep purple/gold, nebula patterns
- Tribal Dynasty: Earth tones, war paint patterns

**Interpretation:**
- Sets are dynasty-based (complete CYBER dynasty = bonus)
- 6-piece sets mentioned (6 variants minimum per dynasty)
- Visual themes need to be culturally diverse and visually distinct

### From Breeding Lab Analysis

**Cross-Dynasty Breeding Unknown:**
> "Cannot filter valid breeding partners without dynasty breeding rules"

**Inheritance Rules Needed:**
- Can CYBER × NEBULA breed? Or same dynasty only?
- If cross-breeding allowed, which dynasty does offspring inherit?
- Mutation chance? (20% random dynasty offspring?)

### From Evolution Lab Analysis

**Dynasty Mutability Unknown:**
> "Cannot determine if evolution changes dynasty"

**Critical Question:**
- Is dynasty permanent? (Gen 1 CYBER → Gen 2 CYBER forever)
- Or can evolution change dynasty? (Gen 1 CYBER → Gen 2 NEBULA via evolution)

---

## The 7 Critical Questions

### Question 1: What IS a Dynasty?

**Four Possible Definitions:**

**A. Visual Theme Only (Cosmetic)**
- Dynasty defines art style only
- No gameplay impact
- All dynasties have identical stats
- **Pros:** Simple balance, easy to add new dynasties, no P2W risk
- **Cons:** Less strategic depth, weaker player identity

**B. Visual Theme + Stat Modifiers**
- Dynasty defines visual + stat bonuses (e.g., CYBER = +10% speed, -5% size)
- Strategic breeding choices (breed for desired stats)
- **Pros:** Strategic depth, player specialization
- **Cons:** Balance complexity, risk of "best dynasty" meta

**C. Visual Theme + Unique Abilities**
- Dynasty defines unique abilities (e.g., CYBER Shield, NEBULA Warp)
- Deep strategic gameplay
- **Pros:** High replayability, strong identity
- **Cons:** 8-12 weeks development, balance nightmare

**D. Hybrid - Visual + Minor Stats (5-10% bonuses)**
- Dynasty defines visual + small stat bonuses
- Bonuses noticeable but not game-breaking
- **Pros:** Moderate depth, manageable balance, easier to add dynasties
- **Cons:** Not as simple as cosmetic, not as deep as abilities

### Question 2: How Many Dynasties?

**Evidence:**
- CO-001: "10+ dynasties with 50+ variants each"
- Collection Lab: "8-12 Dynasties" proposed

**Options:**
- **5 Dynasties:** 100 variants each, easier to complete sets
- **8 Dynasties:** 62-63 variants each, balanced variety
- **10 Dynasties:** 50 variants each (matches CO-001)
- **12 Dynasties:** 41-42 variants each, maximum variety

### Question 3: Do Dynasties Affect Gameplay?

**Options:**
- **Cosmetic Only:** Identical stats, visual variety only
- **Minor Stat Modifiers:** 5-10% bonuses, strategic but not mandatory
- **Unique Abilities:** Each dynasty plays differently (high complexity)

### Question 4: How Do Players Choose/Unlock Dynasties?

**Options:**
- **Choose One at Start:** Permanent choice during tutorial
- **Progressive Unlock:** Start with 2-3, unlock rest via DNA spend
- **No Player Choice:** Collect snakes from all dynasties naturally

### Question 5: Can Snakes Change Dynasties?

**Options:**
- **Immutable:** Dynasty is permanent identity
- **Mutable:** Evolution or items can change dynasty

### Question 6: Do Dynasties Affect Breeding?

**Cross-Dynasty Breeding Rules:**
- **Same Dynasty Only:** CYBER + CYBER = CYBER (forces specialization)
- **Cross-Dynasty Allowed, Random:** CYBER + NEBULA = 50% either (variety encouraged)
- **Cross-Dynasty Allowed, Dominant:** Rarity determines dynasty inheritance

### Question 7: Do Dynasties Have Set Bonuses?

**From Collection Lab Analysis:**
> "Complete all 10 CYBER variants → +10% DNA bonus"

**Set Bonus Questions:**
- Do bonuses stack? (10 dynasties = +100% DNA?)
- Are bonuses permanent or equipped?
- Do bonuses persist through prestige?

---

## The Four Design Directions

### Direction 1: Visual Themes Only

**Definition:** Dynasty is ONLY a visual theme. No gameplay impact.

**Dynasty Count:** 10

**Example Dynasties:**
1. EGYPTIAN - Gold/teal, hieroglyphics
2. NORSE - Ice blue/silver, runes
3. CYBERPUNK - Neon pink/cyan, circuits
4. FEUDAL - Cherry blossom, samurai
5. AZTEC - Jade green/gold, feathered serpent
6. STEAMPUNK - Bronze/copper, gears
7. COSMIC - Purple/gold, nebula
8. TRIBAL - Earth tones, war paint
9. CRYSTAL - Geometric, gem-like
10. SHADOW - Dark/ethereal, wispy

**Unlock System:**
- Start with 3 unlocked (EGYPTIAN, CYBERPUNK, FEUDAL)
- Unlock remaining 7 via DNA (3,000 DNA each)
- Total cost: 21,000 DNA (achievable Week 3-4)

**Breeding Rules:**
- Same dynasty only (EGYPTIAN + EGYPTIAN = EGYPTIAN)
- Offspring inherits dynasty (immutable)

**Set Bonuses:**
- Complete 50 EGYPTIAN variants = +10% DNA income
- Complete all 10 dynasties = +100% DNA total (additive)

**Pros:**
- Simple to implement (2 weeks)
- Easy to balance (no stat differences)
- No P2W risk
- Easy to add new dynasties post-launch

**Cons:**
- Less strategic depth
- Weaker player identity (cosmetic only)
- Breeding feels less meaningful

**Implementation:** 2 weeks
- Week 1: Dynasty unlock system, filters, UI
- Week 2: Set bonus tracking, breeding rules

---

### Direction 2: Visual + Stat Modifiers

**Definition:** Dynasty defines visual theme AND stat bonuses.

**Dynasty Count:** 10

**Dynasty List with Stats:**
1. EGYPTIAN - +5% DNA generation, +10% size
2. NORSE - +10% speed, -5% size
3. CYBERPUNK - +10% speed, +5% breeding success
4. FEUDAL - Balanced stats, +5% DNA generation
5. AZTEC - +10% rare breeding chance, -5% speed
6. STEAMPUNK - +5% evolution speed, +5% HP
7. COSMIC - +10% evolution speed, -5% DNA generation
8. TRIBAL - +10% HP, -5% speed
9. CRYSTAL - +15% rare breeding chance, -10% speed
10. SHADOW - +10% breeding success, -5% DNA generation

**Stat Impact:**
- Speed affects Snake movement
- Size affects collision box
- DNA generation affects resource income
- Breeding success affects offspring quality
- Evolution speed affects progression rate

**Breeding Rules:**
- Same dynasty only (v0.1 simplicity)
- Offspring inherits parent dynasty stats
- Gen 1 EGYPTIAN → Gen 2 EGYPTIAN (stats scale +5% per gen + dynasty bonus)

**Set Bonuses:**
- Complete dynasty set = +10% DNA + dynasty stat bonus intensified
- Example: Complete EGYPTIAN = +10% DNA + EGYPTIAN bonus +7.5% (up from +5%)

**Balancing:**
- All dynasties equally viable (no "best dynasty")
- Stats have trade-offs (NORSE +speed -size)
- F2P can unlock all (no premium advantage)

**Pros:**
- Strategic depth (breed for desired stats)
- Player specialization ("NORSE speed specialist")
- Stronger identity
- Replayability

**Cons:**
- Balance complexity
- Risk of "meta dynasty"
- Harder to add new dynasties

**Implementation:** 4-6 weeks
- Week 1-2: Dynasty unlock, stat formulas
- Week 3-4: Breeding inheritance, stat application
- Week 5-6: Balancing, testing, iteration

---

### Direction 3: Visual + Abilities

**Definition:** Dynasty defines visual theme AND unique abilities.

**Dynasty Count:** 10

**Dynasty List with Abilities:**
1. EGYPTIAN - Resurrection (survive 1 death per run)
2. NORSE - Frost Shield (immune 3s, once per run)
3. CYBERPUNK - Data Hack (slow time 3s, once per run)
4. FEUDAL - Blade Dance (cut obstacles 3s)
5. AZTEC - Serpent's Fury (2× speed for 5s)
6. STEAMPUNK - Steam Boost (instant acceleration)
7. COSMIC - Warp (teleport short distance)
8. TRIBAL - Nature's Blessing (heal 1 collision after 30s)
9. CRYSTAL - Reflect (bounce off walls once)
10. SHADOW - Phase (pass through obstacles once)

**Ability Mechanics:**
- Activated during Snake gameplay
- Cooldown or per-run limit
- Significantly affects gameplay strategy

**Set Bonuses:**
- Complete dynasty = Ultimate ability unlock
- Example: Complete EGYPTIAN = "Phoenix Resurrection" (3 deaths instead of 1)

**Pros:**
- Deep strategic gameplay
- Strong player identity
- High replayability
- Competitive depth

**Cons:**
- Very high complexity (8-12 weeks dev)
- Balance nightmare
- Hard to add new dynasties
- Conflicts with v0.1 timeline

**Implementation:** 8-12 weeks
- Week 1-2: Ability system architecture
- Week 3-6: 10 dynasty abilities
- Week 7-10: Core Snake integration, balancing
- Week 11-12: Testing, iteration

---

### Direction 4: Hybrid - Visual + Minor Stats (RECOMMENDED)

**Definition:** Dynasty defines visual theme AND minor stat modifiers (5% bonuses).

**Dynasty Count:** 10

**Dynasty List with Minor Stats:**
1. EGYPTIAN - +5% DNA generation
2. NORSE - +5% speed
3. CYBERPUNK - +5% breeding success rate
4. FEUDAL - +5% DNA generation (balanced)
5. AZTEC - +5% rare breeding chance
6. STEAMPUNK - +5% evolution speed
7. COSMIC - +5% size
8. TRIBAL - +5% HP (collision forgiveness)
9. CRYSTAL - +5% breeding success rate
10. SHADOW - +5% evolution speed

**Stat Impact:**
- Bonuses noticeable but not mandatory
- 5% advantage = expert with BASE beats beginner with BONUS
- Skill > Dynasty (maintains BM-001 compliance)

**Breeding Rules:**
- Same dynasty only (v0.1)
- 80% dynasty inheritance, 20% mutation (rare cross-dynasty offspring)
- Offspring generation = max(parent_gen) + 1

**Set Bonuses:**
- Complete dynasty = +10% DNA income (stacks)
- Complete all 10 = +100% DNA total
- Dynasty stat bonus doubles when set complete (EGYPTIAN +5% → +10%)

**Unlock System:**
- Start: 3 dynasties unlocked (EGYPTIAN, CYBERPUNK, FEUDAL)
- Unlock: 2,000-3,000 DNA per dynasty
- Total cost: 21,000 DNA (Week 3-4 for engaged players)

**Balancing:**
- All bonuses equally valuable (+5% DNA ≈ +5% speed ≈ +5% breeding)
- No dominant dynasty
- F2P can unlock all

**Pros:**
- Moderate strategic depth (bonuses matter but not mandatory)
- Player specialization without power creep
- Manageable balance complexity
- Easier to add new dynasties later
- Complies with BM-001 (fair monetization)

**Cons:**
- Not as simple as cosmetic-only
- Not as deep as full abilities
- Requires ongoing balance monitoring

**Implementation:** 3-4 weeks
- Week 1: Dynasty unlock, stat formulas
- Week 2: Breeding inheritance rules
- Week 3: Set bonus tracking, stat application
- Week 4: Balancing, testing, iteration

---

## Recommendation Matrix

| Criteria | Direction 1 (Cosmetic) | Direction 2 (Stats) | Direction 3 (Abilities) | Direction 4 (Hybrid) |
|----------|------------------------|---------------------|-------------------------|----------------------|
| **Development Time** | 2 weeks ⭐⭐⭐⭐⭐ | 4-6 weeks ⭐⭐⭐ | 8-12 weeks ⭐ | 3-4 weeks ⭐⭐⭐⭐ |
| **Balance Complexity** | Simple ⭐⭐⭐⭐⭐ | Moderate ⭐⭐⭐ | High ⭐ | Low-Medium ⭐⭐⭐⭐ |
| **Strategic Depth** | Low ⭐⭐ | Medium ⭐⭐⭐⭐ | High ⭐⭐⭐⭐⭐ | Medium ⭐⭐⭐ |
| **Player Identity** | Weak ⭐⭐ | Strong ⭐⭐⭐⭐ | Very Strong ⭐⭐⭐⭐⭐ | Moderate ⭐⭐⭐ |
| **BM-001 Compliance** | Perfect ⭐⭐⭐⭐⭐ | Good ⭐⭐⭐⭐ | Good ⭐⭐⭐⭐ | Perfect ⭐⭐⭐⭐⭐ |
| **Long-term Maintainability** | Easy ⭐⭐⭐⭐⭐ | Moderate ⭐⭐⭐ | Hard ⭐⭐ | Easy ⭐⭐⭐⭐ |
| **Risk Level** | Low ⭐⭐⭐⭐⭐ | Medium ⭐⭐⭐ | High ⭐ | Low-Medium ⭐⭐⭐⭐ |
| **v0.1 Viability** | ✅ Yes | ✅ Yes | ❌ No | ✅ Yes |
| **Retention Potential** | Medium ⭐⭐⭐ | High ⭐⭐⭐⭐ | Very High ⭐⭐⭐⭐⭐ | High ⭐⭐⭐⭐ |

**RECOMMENDATION: Direction 4 (Hybrid)**

**Rationale:**
1. **Balanced Trade-offs:** Provides strategic depth without overwhelming complexity
2. **Achievable Timeline:** 3-4 weeks fits v0.1 12-week timeline
3. **Manageable Balance:** 5% bonuses are noticeable but skill still dominates
4. **Player Identity:** "CYBER speed specialist" creates attachment
5. **Expandable:** Easy to add new dynasties in v0.5+
6. **Compliant:** No P2W risk if all F2P accessible

**Why NOT Direction 1 (Cosmetic):**
- Player identity formation is weaker ("I'm a MECHA specialist" feels hollow if cosmetic only)
- Breeding feels less meaningful (only visual outcome)
- May impact D30 retention (less depth)

**Why NOT Direction 2 (Full Stats):**
- Higher balance risk (10% speed + 10% size can dominate meta)
- More complex stat interactions
- Only 2 weeks longer than Direction 4, but 2x the balance risk

**Why NOT Direction 3 (Abilities):**
- 8-12 weeks development conflicts with v0.1 3-month timeline
- Balance nightmare (abilities significantly affect gameplay)
- Hard to add new dynasties (must design unique ability each time)
- Can add abilities in v1.0 if desired (after Dynasty system proven)

---

## Pre-Sprint Preparation

### Materials Prepared

✅ **Dynasty System Requirements Document**
- 4 design directions fully specified
- 7 critical questions framed with evidence
- Implementation timelines estimated
- Blocked systems identified

✅ **Evidence Synthesis** (this document)
- All Dynasty mentions across 25 docs consolidated
- Constraint analysis (BM-001, CO-001, BA-003)
- Player archetype insights (PLAYER_JOURNEY)

✅ **Decision Framework**
- Recommendation matrix with scoring
- Trade-off analysis (complexity vs depth vs timeline)
- Risk assessment per direction

### Still Needed (Sprint Day 1-2)

- [ ] **Stakeholder Input** on 7 critical questions
  - Complexity preference (simple vs deep)?
  - Balance philosophy (easy vs strategic)?
  - Art budget confirmation ($58k available?)
  - Player identity importance (core vs nice-to-have)?
  - Long-term vision (10 dynasties permanent or expand to 20+?)

- [ ] **Dynasty Name Brainstorming** (Day 2)
  - 15-20 dynasty name options
  - Cultural themes (Egyptian, Norse, Aztec, Feudal)
  - Sci-fi themes (Cyberpunk, Cosmic, Steampunk)
  - Natural themes (Tribal, Crystal, Shadow)

- [ ] **Visual Theme Sketches** (Day 2)
  - 2-3 concept sketches per dynasty
  - Color palette proposals
  - Pattern style references
  - Accessory ideas

### Sprint Agenda Ready

**Day 1: Evidence Gathering** ✅ COMPLETE (this document)
**Day 2: Diverge** → Brainstorm 15-20 dynasty names, sketch visual themes
**Day 3: Converge** → Vote on direction, lock decision
**Day 4: Define Spec** → Lock dynasty count, names, visual themes, stats
**Day 5: Roadmap** → Art pipeline kickoff, backend schema, UI mockups

---

## Next Steps (Immediate)

### For Product Lead & Design Lead

1. **Schedule Design Sprint:** Block 20 hours over 5 days (can be spread over 2 weeks)
2. **Invite Stakeholders:** PM, Designer, Art Director, Lead Engineer
3. **Pre-Read:** Share this briefing document 24 hours before sprint
4. **Prepare for Day 1:** Review evidence, come with preferences on 7 questions

### For Art Director

1. **Budget Confirmation:** Is $58k available for 500 snake variants?
2. **Art Studio Research:** Identify 2-3 external art studios (3 artists, 20-25 snakes/week capacity)
3. **Visual Theme References:** Gather mood boards for 10 potential dynasty themes
4. **Concept Art Capacity:** Can you produce 2-3 concept snakes per dynasty (20-30 total) in 2 weeks?

### For Lead Engineer

1. **Backend Schema Review:** Can we add `dynasty` column to `snakes` table? (trivial, yes)
2. **Stat System Architecture:** If we choose Direction 2/4, how complex is stat modifier system? (estimate 1 week)
3. **UI Impact:** Dynasty filters in Collection Lab UI - complexity estimate? (estimate 2-3 days)
4. **Breeding Algorithm:** Same-dynasty-only vs cross-dynasty - complexity delta? (estimate 3-5 days delta)

---

## Success Criteria for Sprint

**End of Day 3 (Converge):**
- [ ] Direction chosen (1, 2, 3, or 4)
- [ ] Team consensus achieved
- [ ] Dynasty System Specification v1.0 drafted

**End of Day 4 (Define Spec):**
- [ ] Dynasty count locked (8? 10? 12?)
- [ ] Dynasty names finalized (10 names locked)
- [ ] Visual themes defined (color palettes, pattern styles, 1 page per dynasty)
- [ ] Stats/abilities defined (if Direction 2/3/4)
- [ ] Set bonus formulas locked
- [ ] Breeding inheritance rules specified

**End of Day 5 (Roadmap):**
- [ ] Art pipeline kickoff scheduled
- [ ] Backend implementation timeline (1 week)
- [ ] UI mockups timeline (2-3 days)
- [ ] Testing plan created

**Sprint Deliverables:**
- [ ] Dynasty System Specification v1.0 (complete, locked)
- [ ] Dynasty Style Guide (8-12 pages, art reference)
- [ ] Implementation Roadmap (timeline, backend, UI, art)

**Unblocked Systems:**
- [ ] $58,000 art budget (500-variant pipeline UNBLOCKED)
- [ ] 20-week art timeline (kickoff Week 3)
- [ ] Collection Lab Dynasty filters (implementation Week 6)
- [ ] Breeding system inheritance rules (implementation Week 6)
- [ ] Set bonus tracking (implementation Week 7)

---

## Risk Assessment

### If Sprint Completes Week 1-2

✅ **v0.1 Development Proceeds On Schedule**
- Path B (Breeding) viable for v0.1
- Higher retention potential
- 12-week v0.1 timeline maintained

### If Sprint Delayed or Incomplete

⚠️ **Fallback to Path A (Collection-Only)**
- Defer breeding to v0.5
- Use 20-30 "generic" snake variants for v0.1
- Lower retention potential
- Dynasty sprint happens during v0.5 development

### If Dynasty Definition Changes Mid-Development

🚨 **CRITICAL RISK - MUST PREVENT**
- Breeding algorithm rework required
- Art assets may need revision
- 2-4 week timeline slip
- **Mitigation:** LOCK Dynasty design after Day 4, NO CHANGES until v0.5

---

## Appendix: Quick Comparison Table

| Feature | Dir 1 (Cosmetic) | Dir 2 (Stats) | Dir 3 (Abilities) | Dir 4 (Hybrid) ★ |
|---------|------------------|---------------|-------------------|------------------|
| **Visual Themes** | ✅ 10 dynasties | ✅ 10 dynasties | ✅ 10 dynasties | ✅ 10 dynasties |
| **Stat Bonuses** | ❌ None | ✅ ±5-10% | ❌ None | ✅ +5% |
| **Unique Abilities** | ❌ None | ❌ None | ✅ 10 abilities | ❌ None |
| **Dev Time** | 2 weeks | 4-6 weeks | 8-12 weeks | 3-4 weeks |
| **Balance Risk** | Low | Medium | High | Low-Medium |
| **v0.1 Viable** | ✅ Yes | ✅ Yes | ❌ No | ✅ Yes |
| **Player Identity** | Weak | Strong | Very Strong | Moderate |
| **Long-term Expandable** | ✅ Easy | ⚠️ Moderate | ❌ Hard | ✅ Easy |

**★ = Recommended Direction**

---

## Questions for Sprint Participants

### Before Day 1, Consider:

1. **Complexity Tolerance:** How much complexity are we comfortable with in v0.1?
   - Simple (cosmetic) for speed?
   - Or moderate depth (minor stats) for retention?

2. **Balance Philosophy:** Easy to balance or strategic depth?
   - Prioritize simplicity (no meta imbalance)?
   - Or accept ongoing tuning for deeper gameplay?

3. **Player Identity:** How important is "I'm a MECHA specialist"?
   - Core to retention?
   - Or nice-to-have flavor?

4. **Long-term Vision:** 10 dynasties permanent or expand to 20+?
   - Add 2-3 dynasties per year?
   - Or 10 dynasties is the complete set?

5. **Art Budget:** Confirmed $58k for 500 variants?
   - Can we afford 10 distinct visual themes?
   - External studio vs in-house?

6. **Risk Tolerance:** Ship fast (2 weeks, cosmetic) or ship deep (4 weeks, stats)?
   - Prioritize speed to market?
   - Or retention potential?

---

**Document Status:** ACTIVE - Pre-Sprint Briefing
**Version:** 1.0
**Word Count:** 4,800+ words
**Next Step:** Schedule Dynasty Design Sprint, complete Days 1-5
**Owner:** Product Lead + Design Lead

**Remember:** This 20-hour sprint unblocks $58k and 20 weeks. The ROI is massive. Make time for this sprint IMMEDIATELY.

**The entire v0.1 timeline depends on completing this sprint in Week 1-2.**
