# How to Create Lightweight Game Documentation

**Goal:** Build a minimal, living documentation system for solo mobile F2P development that stays current and actually gets used.

**Timeline:** 2-4 hours initial setup, 30-60 minutes weekly maintenance

**Prerequisites:**
- Game concept defined
- Git repo set up
- Google account (for Sheets/Docs)

---

## Why Lightweight Documentation?

**Traditional Game Design Document (GDD):**
- 100+ pages
- Written before development starts
- Becomes outdated within weeks
- No one reads it
- **Result:** Wasted effort

**Lightweight Documentation:**
- 5-15 pages total (living specs)
- Written iteratively as you build
- Updated weekly (stays current)
- Actually referenced daily
- **Result:** Useful, actionable

**For solo dev:** You can't afford to spend weeks writing docs. Focus on just enough to communicate with future you and potential collaborators.

---

## Step 1: Create Documentation Structure

**Directory Setup:**

```bash
# In your game repo
mkdir -p docs/game_design
mkdir -p docs/technical
mkdir -p docs/economy
mkdir -p docs/content

# Initial files
touch docs/game_design/vision.md
touch docs/game_design/core_loop.md
touch docs/economy/balance.md
touch docs/content/dynasties.md
```

**Why This Structure:**
- **game_design/**: What the game is (vision, features, loops)
- **technical/**: How it's built (architecture, APIs)
- **economy/**: Balance data (costs, rewards, progression)
- **content/**: Game content (variants, levels, events)

---

## Step 2: Write Vision One-Pager

**File:** `docs/game_design/vision.md`

**Time:** 30 minutes

**Template:**

```markdown
# [Game Name] - Vision

**Last Updated:** [Date]

## Elevator Pitch
[One sentence: What is this game?]

**Example:** "Panini book meets Snake - collect 243 unique snake variants across 3 dynasties by playing classic Snake and breeding rare combinations."

## Target Audience
**Primary Persona:** [Name, age, behavior]
- **Emma** (28, casual mobile player)
- Plays during commute, 3-5 minute sessions
- Loves collecting, Pokémon nostalgia
- Will spend $5-10/month on games she loves

**Secondary Persona:** [Name, age, behavior]
- **Tyler** (22, optimization gamer)
- Min-maxes progression, studies wikis
- Plays 20-30 minute sessions
- F2P but highly engaged

## Core Experience
[What emotion/feeling are you creating?]

**Example:** "The dopamine hit of opening a Panini pack and finding the rare shiny card you've been hunting - but in a Snake game."

## Monetization Model
[How does this make money?]

**Example:**
- F2P with energy system (10 energy per game, 1 per 5 min regen)
- IAP: Energy packs ($0.99, $4.99), Dynasty unlocks ($4.99), cosmetics ($1.99)
- Target: 3-5% conversion, $1-2 ARPU first month

## Key Pillars
1. **[Pillar 1]**: [One sentence]
2. **[Pillar 2]**: [One sentence]
3. **[Pillar 3]**: [One sentence]

**Example:**
1. **Collecting**: 243 unique variants to find (Panini book psychology)
2. **Breeding**: Discover rare variants through clever combinations
3. **Mastery**: Perfect Snake gameplay to earn DNA for progression

## Success Metrics
- **D1 Retention:** 45%+
- **D7 Retention:** 25%+
- **D30 Retention:** 12%+
- **Conversion:** 3-5%
- **ARPU:** $1-2 first month

## Unique Selling Points
1. [What makes this different?]
2. [What makes this different?]
3. [What makes this different?]

**Example:**
1. Only Snake game with Pokémon-style breeding mechanics
2. 243 hand-designed variants (not procedural)
3. Panini book UI (nostalgia + completion psychology)

## Constraints
- Solo dev (1 person, part-time)
- Mobile-only (iOS first, Android later)
- 6-month dev cycle to v0.1
- No server (Supabase backend)

## Risks
| Risk | Mitigation |
|------|------------|
| [Risk 1] | [How you'll handle it] |
| [Risk 2] | [How you'll handle it] |

**Example:**
| Risk | Mitigation |
|------|------------|
| Players don't care about collecting | Playtest collection book early (Week 3) |
| Breeding too complex | Tutorial + gradual unlock (Gen 1→2→3) |
| Energy too restrictive | Test multiple regen rates (5min, 10min, 15min) |
```

**SupaSnake Example:** See `docs/game_design/vision.md` in repo

---

## Step 3: Document Core Loop

**File:** `docs/game_design/core_loop.md`

**Time:** 20 minutes

**Template:**

```markdown
# Core Loop

**Last Updated:** [Date]

## Minute-to-Minute Loop
[What player does every 30-60 seconds]

**Example:**
1. Play Classic Snake game (60-90 seconds)
2. Earn DNA based on score
3. Decide: Play again OR spend DNA on breeding
4. Repeat until energy depleted

## Session Loop
[What player does in a 3-5 minute session]

**Example:**
1. Open app, collect bred snakes (if any ready)
2. Play 3-5 Classic games (uses all energy)
3. Spend earned DNA on breeding/evolution
4. Check collection book progress
5. Close app (return in 30 min when energy refills)

## Daily Loop
[What player does each day]

**Example:**
1. Morning: Claim daily DNA reward (+10 DNA)
2. Morning: Play 3 games during commute
3. Lunch: Breed a new snake (starts 12h timer)
4. Evening: Play 5 games, collect bred snake from morning
5. Before bed: Set up overnight breeds

## Weekly Loop
[What player works toward over a week]

**Example:**
1. Complete 30-50% of Dynasty 1 (15/27 variants)
2. Unlock Gen 2, Gen 3 breeding
3. Save DNA for Dynasty 2 unlock (250 DNA goal)
4. Weekend event: 2x DNA from Classic mode

## Long-Term Loop
[What player works toward over weeks/months]

**Example:**
1. Complete Dynasty 1 (27/27 variants)
2. Unlock Dynasty 2 (Sly)
3. Complete Dynasty 2 (27/27 variants)
4. Unlock Dynasty 3 (Venomous)
5. Complete all 243 variants (months of play)

## Retention Hooks
| Loop Level | Hook | Mechanic |
|------------|------|----------|
| Minute | [What brings them back?] | [How it works] |
| Session | [What brings them back?] | [How it works] |
| Daily | [What brings them back?] | [How it works] |
| Weekly | [What brings them back?] | [How it works] |

**Example:**
| Loop Level | Hook | Mechanic |
|------------|------|----------|
| Minute | Gameplay fun | Snake with good controls, satisfying scoring |
| Session | Energy refill | "Check back in 25 minutes for more energy" |
| Daily | Breeding timer | "Your snake is ready in 8 hours - come back!" |
| Weekly | Collection goals | "5 more variants to complete Dynasty 1!" |
```

---

## Step 4: Create Economy Spec (Google Sheets)

**File:** Create Google Sheet: "SupaSnake Economy Balance"

**Time:** 1-2 hours

**Sheet 1: DNA Costs**

| Action | DNA Cost | Energy Cost | Unlock Requirement |
|--------|----------|-------------|--------------------|
| Classic Game | 0 | 10 | None |
| Breed Gen 1 | 0 | 0 | Tutorial complete |
| Breed Gen 2 | 50 | 0 | Own 2 Gen 1 snakes |
| Breed Gen 3 | 150 | 0 | Own 2 Gen 2 snakes |
| Evolution T1→T2 | 100 | 0 | Snake Level 10 |
| Evolution T2→T3 | 300 | 0 | Snake Level 20 |
| Dynasty 2 Unlock | 250 | 0 | Dynasty 1 complete |
| Dynasty 3 Unlock | 500 | 0 | Dynasty 2 complete |
| IAP: Energy 50 | -10 | +50 | $0.99 |
| IAP: DNA 100 | 0 | 0 | $4.99 (instant DNA) |

**Sheet 2: DNA Income**

| Source | DNA Earned | Frequency |
|--------|------------|-----------|
| Classic Game (100 score) | 5 | Per game |
| Classic Game (500 score) | 15 | Per game |
| Classic Game (1000 score) | 30 | Per game |
| Daily Login Reward | 10 | Once per day |
| Collection Milestone (10 variants) | 50 | One-time |
| Collection Milestone (27 variants) | 100 | One-time |
| Weekend Event | 2x DNA | Saturdays only |

**Sheet 3: Progression Curve**

| Day | Games Played | DNA Earned (Cumulative) | DNA Spent | Net DNA | Milestone |
|-----|--------------|-------------------------|-----------|---------|-----------|
| 1 | 5 | 75 (5 games × 15 avg) | 0 | 75 | Tutorial |
| 2 | 5 | 150 | 50 (Gen 2 breed) | 100 | First Gen 2 |
| 3 | 5 | 235 (includes daily +10) | 100 | 135 | - |
| 7 | 35 | 600 | 200 | 400 | Gen 3 unlocked |
| 14 | 70 | 1200 | 450 | 750 | Dynasty 2 unlocked |
| 30 | 150 | 2500 | 1000 | 1500 | Dynasty 1 complete |

**Formulas:**
- Cumulative DNA = Previous + (Games × Avg DNA) + Daily Bonus
- Net DNA = Cumulative - Spent
- Add chart: Net DNA over 30 days (should be positive curve)

**Sheet 4: Energy System**

| Parameter | Value | Rationale |
|-----------|-------|-----------|
| Starting Energy | 50 | 5 games to start |
| Max Energy Cap | 100 | 10 games max (prevents hoarding) |
| Energy per Game | 10 | Standard game cost |
| Regen Rate | 1 per 5 min | 12 per hour = 2 games per hour |
| Daily Free Refill | 50 (once) | Bonus for logging in |
| IAP: Small Pack | 50 for $0.99 | 5 games = $0.20 per game |
| IAP: Large Pack | 200 for $2.99 | 20 games = $0.15 per game (better value) |

**Why Spreadsheet:**
- **Live formulas**: Change Gen 2 cost from 50→75, see how it affects Day 7 progression
- **Visualizations**: Chart DNA curve, identify bottlenecks
- **Shareable**: Send link to playtesters, collaborators
- **Version history**: Google Sheets tracks changes automatically

---

## Step 5: Feature Specs (Markdown)

**File:** `docs/game_design/breeding_system.md`

**Time:** 30-45 minutes per feature

**Template:**

```markdown
# [Feature Name]

**Status:** [Planned / In Development / Shipped]
**Last Updated:** [Date]
**Owner:** [Your name]

## One-Liner
[What is this feature in one sentence?]

## Player Value
**For Emma:** [Why does Emma care?]
**For Tyler:** [Why does Tyler care?]

## Mechanics

### Core Mechanic
[How does it work? Be specific.]

**Example:**
Player selects 2 snakes from collection. Game calculates offspring based on:
- Parents' dynasties (must match for non-hybrid)
- Parents' generations (offspring = max(parent1_gen, parent2_gen) + 1, capped at Gen 3)
- Random variant roll (25% chance for rare, 5% for epic, 1% for legendary)

### Rules
1. [Rule 1]
2. [Rule 2]
3. [Rule 3]

**Example:**
1. Both parents must be Generation 1, 2, or 3
2. Cannot breed a snake with itself
3. Each breeding costs DNA (Gen 2 = 50 DNA, Gen 3 = 150 DNA)
4. Breeding takes 12 hours (real-time)

### Formula
[If applicable, show exact formula]

**Example:**
```
Offspring Generation = min(max(Parent1_Gen, Parent2_Gen) + 1, 3)
Offspring Dynasty = Parent1_Dynasty (if both match, else Hybrid)
Variant Rarity Roll:
  - 74% Common
  - 20% Rare (requires specific parent combo)
  - 5% Epic (requires rare parents)
  - 1% Legendary (requires epic parents + luck)
```

## UI/UX

### Flow
[Step-by-step user flow]

**Example:**
1. Player taps "Breeding Lab" from main menu
2. Sees 3 breeding slots (1 unlocked by default)
3. Taps empty slot → "Select Parent 1"
4. Chooses snake from collection grid
5. Taps "Select Parent 2"
6. Chooses second snake
7. Game shows preview: "Offspring will be Gen 2 Clever (Common-Rare variants possible)"
8. Player taps "Breed" (costs 50 DNA, starts 12h timer)
9. Slot shows countdown: "Ready in 11:42:15"
10. After 12h, notification: "Your snake is ready!"
11. Player opens app, taps slot, sees egg animation → new variant revealed

### Wireframe
[ASCII diagram or link to Figma]

```
┌─────────────────────────────────────┐
│      Breeding Lab                   │
├─────────────────────────────────────┤
│                                     │
│  Slot 1: [Parent1] + [Parent2]     │
│          ↓                          │
│      [Egg Icon]                     │
│      Ready in: 08:32:15             │
│                                     │
│  Slot 2: [Locked] (Unlock: 500 DNA)│
│                                     │
│  Slot 3: [Locked] (Unlock: 1000 DNA)│
│                                     │
└─────────────────────────────────────┘
```

## Economy

| Action | DNA Cost | Energy Cost | Time |
|--------|----------|-------------|------|
| Breed Gen 2 | 50 | 0 | 12 hours |
| Breed Gen 3 | 150 | 0 | 24 hours |
| Unlock Slot 2 | 500 | 0 | Instant |
| Unlock Slot 3 | 1000 | 0 | Instant |
| Speed up (instant) | 50 | 0 | Skip timer |

## Technical Notes
[For developers - how this is implemented]

**Example:**
- Breeding stored in Supabase `breeding_sessions` table
- Timer checked on app open (server timestamp vs. local)
- Variant generation: RNG with weighted probabilities
- Parents not consumed (stay in collection)

## Success Metrics
[How do we know this feature is working?]

**Example:**
- 60%+ of players breed at least 1 snake by Day 3
- Average 2-3 breeding sessions per week
- 20% of players unlock Slot 2 by Day 14
- Breeding contributes to 40% of D1 retention (players return to collect)

## Risks & Mitigations
| Risk | Impact | Mitigation |
|------|--------|------------|
| [Risk] | [High/Med/Low] | [How to handle] |

**Example:**
| Risk | Impact | Mitigation |
|------|--------|------------|
| 12h timer too long (players forget) | High | Send push notification when ready |
| Breeding too expensive (blocks progression) | High | Playtest DNA income vs. costs (Week 2) |
| RNG frustrating (never get rare) | Medium | Pity timer (guaranteed rare after 10 breeds) |

## Changelog
- **v1.2** (2025-10-18): Reduced Gen 2 cost from 75 → 50 DNA (playtest feedback)
- **v1.1** (2025-10-12): Added Slot 3 unlock
- **v1.0** (2025-10-08): Initial implementation
```

**Repeat for Key Features:**
- `classic_mode.md` (core Snake gameplay)
- `collection_book.md` (Panini-style UI)
- `lab_progression.md` (unlock tree)
- `daily_rewards.md` (retention system)

---

## Step 6: Content Database (Airtable or Sheets)

**Tool:** Airtable (free tier) or Google Sheets

**Time:** 1-2 hours setup, ongoing maintenance

**Structure:**

**Variants Table:**
| ID | Dynasty | Generation | Rarity | Name | Art Status | Unlock Method |
|----|---------|------------|--------|------|------------|---------------|
| CLV_G1_001 | Clever | 1 | Common | Forest | Done | Tutorial |
| CLV_G1_002 | Clever | 1 | Common | River | Done | Breed any Gen 1 |
| CLV_G2_012 | Clever | 2 | Rare | Shadow | In Progress | Breed Forest + River |
| SLY_G1_001 | Sly | 1 | Common | Desert | Planned | Unlock Dynasty 2 |

**Dynasties Table:**
| ID | Name | Unlock Cost | Theme | Stat Bonus |
|----|------|-------------|-------|------------|
| CLV | Clever | 0 (starter) | Intelligence, adaptability | +10% DNA earned |
| SLY | Sly | 250 DNA | Stealth, speed | +15% score multiplier |
| VEN | Venomous | 500 DNA | Danger, aggression | +20% energy regen |

**Why Database:**
- Sortable (find all Gen 2 Clever variants)
- Filterable (show only "In Progress" art)
- Linkable (click Dynasty → see all variants in that dynasty)
- Track production (art status, unlock methods)

---

## Step 7: Weekly Maintenance Routine

**Time:** 30-60 minutes per week

**Monday Morning (Review Week):**

1. **Review Analytics** (Amplitude):
   - D1/D7 retention from last week's cohort
   - DNA income vs. spend (is economy balanced?)
   - Feature usage (% of players who bred a snake)

2. **Update Economy Sheet**:
   - If DNA deficit found, adjust costs or income
   - Example: Players at Day 7 have 180 DNA, need 250 for Dynasty 2 → add daily reward or reduce unlock cost

3. **Update Feature Specs**:
   - If you changed breeding cost from 50→75 DNA, update `breeding_system.md`
   - Add changelog entry: "v1.3: Increased Gen 2 cost to 75 DNA (economy balancing)"

4. **Commit to Git**:
   ```bash
   git add docs/
   git commit -m "Update economy: Gen 2 cost 50→75 DNA (Week 3 balancing)"
   git push
   ```

**Friday Afternoon (Plan Next Week):**

5. **Review Roadmap**:
   - What features shipping next week?
   - Update feature specs to "In Development" status

6. **Write New Specs** (if needed):
   - Next week adding daily challenges? Write `daily_challenges.md` spec

7. **Archive Old Versions**:
   - Git tag major versions: `git tag v0.1-beta`
   - Keep old specs in `docs/archive/` if completely replaced

---

## Step 8: Collaboration (If Adding Team Members)

**Onboarding New Developer/Designer:**

1. **Read Vision Doc** (5 minutes) - understand what we're building
2. **Read Core Loop Doc** (5 minutes) - understand how it plays
3. **Review Feature Specs** (20 minutes) - understand current systems
4. **Check Economy Sheet** (10 minutes) - understand balance targets
5. **Browse Content DB** (5 minutes) - see all variants, art status

**Total Onboarding:** <1 hour (vs. days with traditional GDD)

**Weekly Sync:**
- Review analytics together
- Discuss what to change
- Update docs collaboratively (Google Docs suggestions mode, or git PRs)

---

## Tools Comparison

| Tool | Best For | Pros | Cons | Cost |
|------|----------|------|------|------|
| **Markdown + Git** | Feature specs, decisions | Version control, portable | No rich formatting | Free |
| **Google Sheets** | Economy, content DB | Live formulas, shareable | Not good for text | Free |
| **Notion** | Mixed docs (text + data) | Beautiful, flexible | Proprietary, slow | Free tier |
| **Airtable** | Content databases | Relational, powerful | Learning curve | Free tier |
| **Figma** | UI mockups, diagrams | Visual, collaborative | Not for text | Free tier |

**SupaSnake Recommended:**
- Markdown + Git (feature specs, vision)
- Google Sheets (economy balance)
- Figma (UI wireframes)
- **Total cost: $0**

---

## Anti-Patterns (Avoid These)

❌ **100-page GDD before coding**: Will be wrong, waste of time
❌ **Specs without dates**: Can't tell if current or outdated
❌ **No version control**: Lost history, can't track changes
❌ **Docs contradict game**: Specs not updated, now confusing
❌ **Over-documentation**: Spending more time writing than building
❌ **No one reads docs**: Wrong format, too verbose, or not useful

---

## Success Metrics

✅ **Docs referenced weekly** (you actually use them)
✅ **Updated within 24 hours of changes** (always current)
✅ **New collaborator onboards in <1 day** (clear, organized)
✅ **Specs match shipped game** (single source of truth)
✅ **Time spent documenting <10% of dev time** (lightweight)

---

## Quick Reference

**Vision Doc:** What is this game? (1 page, update quarterly)
**Core Loop:** How does it play? (1 page, update monthly)
**Economy Sheet:** What are the costs/rewards? (spreadsheet, update weekly)
**Feature Specs:** How does X work? (1-3 pages per feature, update as needed)
**Content DB:** What content exists? (database, update continuously)

**Weekly Routine:**
1. Monday: Review analytics → update economy sheet
2. Throughout week: Update feature specs if implementations change
3. Friday: Plan next week's features
4. Commit to git: Track all changes

**Total Time:** 2-4 hours setup, 30-60 minutes weekly maintenance

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_lightweight_documentation.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_living_specs.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_documentation_tools_solo.md
- **Complete**: @knowledge_base/game_design/reference/batch4_chapters/chapter_27_documentation_summary.md
