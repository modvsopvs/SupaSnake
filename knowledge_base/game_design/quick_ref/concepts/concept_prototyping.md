# Prototyping - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (2008), Chapter 7

## Core Concept

Prototypes answer specific questions about your design's riskiest elements. Build rough, fast prototypes to mitigate risks before investing in full production. Quality doesn't matter - only answering the question matters.

## Eight Prototyping Tips

1. **Answer a Question** - Every prototype tests specific hypothesis
2. **Forget Quality** - Rough and ugly = faster = more loops
3. **Don't Get Attached** - Plan to throw prototypes away
4. **Prioritize Prototypes** - Face biggest risks first
5. **Parallelize** - Run multiple prototypes simultaneously
6. **Non-Digital Works** - Paper prototypes for mechanics testing
7. **Fast Loop Engine** - Use scripting for real-time changes
8. **Build the Toy First** - Fun to play with before adding goals

## Application to SupaSnake

**Critical Prototypes (Priority Order):**

**1. Collection Psychology (Paper Prototype)**
- **Question:** Is Panini book model addictive?
- **Method:** Paper cards, sticker book, simulate finding/completing
- **Time:** 1 day to build, 1 week to test
- **Risk Mitigated:** Core appeal of collection mechanic

**2. Energy System Balance (Spreadsheet)**
- **Question:** What energy costs create "one more round" feeling without frustration?
- **Method:** Excel model of play sessions, energy regeneration, DNA income
- **Time:** 2 hours to build, test instantly
- **Risk Mitigated:** Retention vs frustration balance

**3. Breeding Combinations (Algorithm Test)**
- **Question:** Do breeding rules create enough strategy and discovery?
- **Method:** Python script testing all combinations, rarity distribution
- **Time:** 1 day to code, run 1000 simulations instantly
- **Risk Mitigated:** Breeding system depth and balance

**4. Snake + DNA Economy (Minimal Build)**
- **Question:** Is core gameplay fun enough to support collection layer?
- **Method:** Basic Snake in React Native, add DNA drops
- **Time:** 1 week for programmer
- **Risk Mitigated:** Core gameplay loop validation

**5. Visual Style (Art Mockups)**
- **Question:** Does "3D character + Midjourney variants" look cohesive?
- **Method:** Photoshop mockups, test renders
- **Time:** 3 days for artist
- **Risk Mitigated:** Art pipeline viability

## The Toy First Principle

**SupaSnake Application:**
- **The Toy:** Snake that feels great to control + satisfying DNA collection
- **The Game:** Goals layered on top (complete collections, breed dynasties)

**Validation:** If Snake core isn't fun to "play with" (no goals), collection won't save it. Build and tune core feel FIRST.

## Modern Context

**2008 Context:** Prototyping primarily pre-production, limited post-launch iteration
**2025 Mobile F2P:**
- Pre-launch prototyping validates core
- Post-launch A/B testing = continuous prototyping
- Analytics show what questions to ask

**SupaSnake Approach:**
Fast pre-launch prototypes (weeks) + continuous post-launch tuning (config-driven).

## See Also

- **How-To:** @knowledge_base/game_design/how_to/apply_to_supasnake/maximize_iteration_loops.md
- **Complete:** @knowledge_base/game_design/reference/batch1_chapters/chapter_07_iteration_summary.md
