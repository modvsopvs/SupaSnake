# Game Balance - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 13

## Core Concept

Game balance is adjusting game elements until they deliver the intended player experience. It's the most artful part of design - understanding subtle relationships between elements and knowing what to change, how much to change, and what to leave alone. Like creating a recipe, balance combines mathematical precision with personal taste.

## Key Points

**Balance is Experiential, Not Mathematical:**
- Goal: Generate the exact experience you want
- Method: Playtest → Measure → Adjust → Repeat
- Like cooking: Math guides (baking ratios), but taste decides (sugar amount)

**Model + Prototype Virtuous Circle:**
- Create mathematical model of relationships
- Test prototype with real players
- Model informs balance changes
- Balance testing improves model
- Iterate until model matches reality and game feels right

**Timeline:**
- Balancing only begins when game is playable
- Rule of thumb: 6 months to balance after complete working version
- Or: Half of development time should be balancing
- More new gameplay elements = longer balancing time

**Common Failure:**
- Schedule consumed by "getting it to work"
- No time left to balance before ship
- Result: Technically functional but unfun game

## Application to SupaSnake

**SupaSnake Elements Requiring Balance:**

**1. DNA Economy:**
- DNA earned per run vs gacha pull cost
- Model: Target 15-20 min playtime per pull (player engagement sweet spot)
- Current: 50 DNA per pull, ~30-40 DNA per 60-90 sec run
- Needs testing: Does this feel achievable without frustration?

**2. Energy Gates:**
- Energy regen rate vs session length vs retention
- Model: F2P standard = 1 energy per 5-10 min
- Current: 10 energy cap, 1 energy per 8 min
- Needs testing: Do players return consistently? Too restrictive?

**3. Gacha Rates:**
- Common/Rare/Mythic percentages vs completion time vs excitement
- Model: Panini book psychology = 60-80 hour completion target
- Current: 10%/1%/0.1% with ~13 variants per dynasty
- Needs testing: Are mythics exciting without feeling impossible?

**4. Breeding Costs:**
- DNA cost to breed vs gacha pull cost vs strategic value
- Model: Breeding should be cheaper than pure gacha but require collection progress
- Current: TBD (needs balancing)
- Needs testing: Do players engage with breeding or just pull gacha?

**5. Snake Length vs Difficulty:**
- How fast does snake grow vs how much harder navigation becomes
- Model: Flow channel - challenge increases with skill improvement
- Current: Length increases with each DNA pickup
- Needs testing: Does difficulty ramp feel fair? Too hard too fast?

**Balancing Process for SupaSnake:**

**Phase 1: Build Playable Prototype (Months 1-3)**
- Core Snake mechanics working
- Collection/breeding systems functional
- Can complete one full loop (play → earn → pull → breed)

**Phase 2: Create Balance Models (Months 3-4)**
- DNA economy spreadsheet (earn rate, pull costs, completion time)
- Progression curve (easy levels → hard levels over time)
- Retention model (session length, energy gates, return frequency)

**Phase 3: Intensive Playtesting (Months 4-6)**
- 50+ testers with varying skill levels
- Track metrics: Session length, DNA earned, gacha pulls, retention
- Identify problems: Too easy? Too hard? Too grindy? Too random?

**Phase 4: Iterative Adjustments (Continuous)**
- Tweak one variable at a time
- Retest with same cohort
- Model informs changes, testing proves model
- Continue until all systems feel "just right"

**Balance Metrics to Track:**
- Average DNA per session
- Time to first mythic pull
- Retention Day 1, Day 7, Day 30
- % players who engage with breeding
- Completion time for one full dynasty

## Modern Mobile Context (2020 Edition)

**Schell's 2020 Updates:** Emphasizes balance as art, not science; discusses balancing free-to-play monetization
**SupaSnake Specific:** Mobile F2P adds complexity - must balance fun (player experience), fairness (no pay-to-win), AND revenue (viable business). Classic premium games balance for fun only. SupaSnake balances: skill mastery (fun), collection completion (satisfaction), energy gates (retention), gacha excitement (monetization hooks).

## See Also

- **How-To:** @knowledge_base/game_design/how_to/balance_supasnake_mechanics.md
- **How-To:** @knowledge_base/game_design/how_to/tune_dna_economy.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/economic_balance.md
- **SupaSnake Ref:** @knowledge_base/game/how_to/balance_progression.md
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_13_balance_summary.md
