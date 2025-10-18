# Chapter 27: The Team Builds a Game With the Support of a Document - Summary

**Source:** Jesse Schell, *The Art of Game Design: A Book of Lenses* (3rd Edition, 2020), Chapter 27

**Adaptation Focus:** Solo mobile F2P development (lightweight, agile documentation)

---

## Core Concepts

### 1. Documentation as Communication Tool

**Schell's Point:** Documentation exists to **communicate design decisions** to the team and stakeholders. For large AAA teams, this means comprehensive Game Design Documents (GDDs) that can reach 100+ pages covering every system, feature, and asset.

**Solo Dev Adaptation:**
- **Traditional GDD is overkill** for solo/small teams
- Focus on **lightweight, living specifications** that evolve with the game
- Document to communicate with **future you** and potential collaborators
- **5-15 pages total** vs. 100+ page GDD

**SupaSnake Application:**
- Vision one-pager (elevator pitch, target audience, monetization)
- Core loop diagram (minute/session/daily/weekly loops)
- Feature specs (1-3 pages each: breeding, classic mode, collection book)
- Economy spreadsheet (living balance data)
- Content database (243 variants with stats, art status)

---

### 2. Types of Game Documentation

**Schell's Categories:**

#### A. Game Design Document (GDD)
**Purpose:** Comprehensive spec covering all game systems
**Audience:** Entire dev team, publishers, executives
**Format:** 50-200 pages, formal, detailed
**Update Frequency:** Rarely (written early, becomes outdated)

**Solo Dev Alternative:**
- Skip monolithic GDD
- Create **modular feature specs** instead (markdown files in git)
- Each spec: 1-3 pages, focused on single system
- Update continuously (living docs)

#### B. Technical Design Document (TDD)
**Purpose:** How systems are implemented (architecture, APIs, data structures)
**Audience:** Programmers
**Format:** Code comments, architecture diagrams, API docs

**Solo Dev Alternative:**
- Code comments for complex logic
- Architecture diagram (one page) showing system dependencies
- API integration notes (Supabase setup, Amplitude events)
- **Skip:** Formal TDD (you're implementing it yourself, you'll remember)

#### C. Art Bible / Style Guide
**Purpose:** Visual consistency (color palettes, character designs, UI style)
**Audience:** Artists, animators
**Format:** Visual reference boards, style guides

**Solo Dev Alternative:**
- **Figma mood board** (reference images, color palette)
- **UI mockups** (key screens designed in Figma)
- **Art pipeline notes** (Midjourney prompts for variants)
- **Content database** (tracks art status per variant)

#### D. Audio Design Document
**Purpose:** Sound effects, music style, audio implementation
**Audience:** Sound designers, composers

**Solo Dev Alternative:**
- **Skip** until post-MVP (use placeholders)
- **Reference playlist** (music style examples: "upbeat, retro, mobile-friendly")
- **Sound list** (spreadsheet: event → sound needed)

---

### 3. Living vs. Static Documentation

**Schell's Warning:** Documentation becomes **outdated instantly** in agile development. Traditional waterfall GDDs assume design is finalized before development starts - but modern game dev is iterative.

**Solution: Living Documentation**

**Characteristics:**
- **Updated continuously** (every sprint, every change)
- **Version-controlled** (git tracks history)
- **Integrated with workflow** (docs live in same repo as code)
- **Data-informed** (updated based on playtests, analytics)

**Solo Dev Best Practices:**

**Use Version Control (Git):**
```bash
docs/
  game_design/
    breeding_system_v2.3.md    # Current spec
    economy_balance_v1.8.md

# Git history shows changes:
git log breeding_system_v2.3.md

commit a3f8d1c: "Reduce Gen 2 breeding cost to 75 DNA (playtest data)"
commit 92bc5e7: "Add Generation 3 limits"
commit 7f1b2a4: "Initial breeding spec from prototype"
```

**Update Immediately After Changes:**
- Changed breeding cost in code? Update spec within same commit
- Add changelog at top of spec: "v2.3 (2025-10-18): Gen 2 cost reduced"

**Link to Data Sources:**
- Economy spec links to Amplitude dashboard
- Retention features spec references cohort analysis
- Include rationale: "Reduced cost because Day 7 players had 180 DNA, needed 250 (deficit)"

**SupaSnake Living Specs:**
- Economy balance spreadsheet (updated weekly after analytics review)
- Breeding system markdown (updated when formula changes, links to code)
- Retention features (updated after cohort analysis)
- Content database (updated as new variants added)

---

### 4. Documentation for Different Audiences

**Schell's Insight:** Different stakeholders need different levels of detail.

**Audiences:**

#### A. Executives / Publishers
**What They Need:** High-level vision, market positioning, revenue projections
**Format:** 1-page summary (elevator pitch, USP, monetization)
**Frequency:** Quarterly updates

**SupaSnake:** Vision doc (1 page: "Panini meets Snake", target Emma/Tyler, 3-5% conversion target)

#### B. Team Members (Programmers, Artists, Designers)
**What They Need:** Detailed specs to implement features
**Format:** Feature specs (mechanics, UI flow, technical notes)
**Frequency:** Updated continuously

**SupaSnake:** Breeding system spec (formula, costs, UI flow), art pipeline notes

#### C. QA / Playtesters
**What They Need:** What to test, what's expected behavior
**Format:** Test plans, acceptance criteria
**Frequency:** Every build

**SupaSnake:** TestFlight "What to Test" notes (each build lists new features, known issues)

#### D. Community / Players
**What They Need:** Patch notes, tutorials, FAQs
**Format:** Player-facing docs (simple, visual)
**Frequency:** Every update

**SupaSnake:** Tutorial, in-game help tooltips, future: patch notes on App Store

---

### 5. Documentation Formats and Tools

**Schell's Recommendations (2020):**

**Traditional:**
- Microsoft Word (formal GDDs)
- Wikis (Confluence, MediaWiki)
- Project management tools (Jira, Trello)

**Modern:**
- Google Docs (collaborative, cloud-based)
- Notion (flexible, rich formatting)
- Markdown + Git (version-controlled, lightweight)

**Solo Dev Recommendations:**

**Essential Tools:**

1. **Markdown + Git** (Feature Specs)
   - **Why:** Version control built-in, plain text (future-proof), searchable
   - **Use For:** Feature specs, design decisions, system docs
   - **Example:** `docs/game_design/breeding_system.md`

2. **Google Sheets** (Economy & Balance)
   - **Why:** Live formulas, version history, shareable
   - **Use For:** Economy balance, content databases, progression curves
   - **Example:** "SupaSnake Economy Balance" sheet with DNA costs/rewards

3. **Notion** (Living Wiki - Optional)
   - **Why:** Beautiful, flexible, combines text + databases
   - **Use For:** Project wiki, roadmap, playtest notes
   - **Example:** Feature database (status: planned/in dev/shipped)

4. **Figma** (Visual Docs)
   - **Why:** UI mockups, flow diagrams, mood boards
   - **Use For:** UI design, onboarding flows, art style guides
   - **Example:** Lab screen mockup, breeding flow diagram

5. **Amplitude/Mixpanel** (Analytics Dashboard)
   - **Why:** Real-time metrics replace static reports
   - **Use For:** Retention tracking, economy balance, funnel analysis
   - **Example:** D1/D7/D30 retention dashboard (always current)

**Avoid (Too Heavy for Solo):**
- Confluence (enterprise wiki - overkill)
- Jira (complex project management)
- Microsoft Word (no version control)
- Email threads (documentation lost in inboxes)

---

### 6. Balancing Detail vs. Flexibility

**Schell's Dilemma:**
- **Too detailed:** Takes forever to write, becomes outdated, restricts iteration
- **Too vague:** Team doesn't know what to build, inconsistent implementation

**Solution: Right-Size Your Docs**

**Detail Levels by System:**

**High Detail (Lock Down Early):**
- Core mechanics (breeding formula - needs to be exact for balance)
- Economy (DNA costs, energy regen - affects monetization)
- Technical constraints (mobile performance targets, file sizes)

**Medium Detail (Iterative):**
- Features (describe what it does, leave implementation flexible)
- UI flows (mockups, but expect changes during development)
- Content lists (243 variants planned, but specific designs evolve)

**Low Detail (Sketch Only):**
- Post-MVP features (leaderboards, PvP - vague ideas for now)
- Art style (mood board, not final assets)
- Narrative (if not core to game - SupaSnake has minimal story)

**SupaSnake Detail Allocation:**

**High Detail:**
- Breeding formula (exact math documented)
- DNA costs per action (spreadsheet with formulas)
- Energy system (regen rate, costs, IAP packs)

**Medium Detail:**
- Classic mode scoring (general rules, exact balance tweaked during playtesting)
- Collection book UI (Figma mockup, but implementation flexible)
- Lab progression tree (outline of unlocks, specific costs can change)

**Low Detail:**
- Dynasty 2/3 themes (general concepts, specific variants designed later)
- Events system (future feature, just notes for now)
- Social features (not in MVP, just ideas in backlog)

---

### 7. Documentation as Design Tool

**Schell's Insight:** Writing documentation **forces you to think through design** - it's not just communication, it's a design process.

**Benefits of Writing Specs:**

1. **Identifies Gaps:** Writing breeding spec reveals: "Wait, what happens if you breed a Gen 3 with a Gen 1?" (need rule)

2. **Forces Consistency:** Documenting economy shows: "Players earn 600 DNA by Day 7 but need 250 for unlock - too much!" (rebalance)

3. **Enables Estimation:** Feature spec with steps helps estimate dev time (breeding: 2 weeks implementation)

4. **Creates Shared Understanding:** Even solo, writing it down ensures "future you" remembers why decisions were made

**Solo Dev Workflow:**

**Before Coding:**
1. Write feature spec (1-3 pages)
2. Include acceptance criteria ("Player can breed 2 Gen 1 snakes to create Gen 2")
3. Note edge cases ("Can't breed snake with itself")
4. Estimate dev time (helps prioritization)

**During Coding:**
5. Update spec if implementation differs from plan
6. Document decisions ("Used formula X instead of Y because of performance")

**After Shipping:**
7. Update spec with actual behavior
8. Add metrics ("60% of players breed by Day 3")
9. Plan iterations ("Next: Add breeding slots 2 & 3")

---

### 8. When NOT to Document

**Schell's Warning:** Over-documentation is waste. Don't document:

**Things That Change Rapidly:**
- Placeholder values (DNA cost might change daily during balancing)
- Experimental features (if you're just testing, don't write full spec)
- Implementation details that are obvious (don't document every function)

**Things That Aren't Needed:**
- Formal approval processes (if you're solo, just decide and build)
- Exhaustive feature lists (only document what's actually being built)
- Character backstories (unless narrative-driven - SupaSnake isn't)

**Solo Dev Anti-Patterns:**

❌ **Documenting before prototyping** ("Let me write a 20-page spec for a feature I haven't tested yet")
❌ **Documenting implementation details** ("Function X calls function Y which updates variable Z...")
❌ **Documenting aspirations** ("In v5.0 we might add multiplayer...")
❌ **Formal documentation for personal notes** (just use comments or scratch notes)

**SupaSnake: What NOT to Document:**

- Exact Midjourney prompts for each variant (too granular - art pipeline notes are enough)
- Every bug fix (git commits capture this)
- Placeholder UI (mockups for final UI only)
- Far-future features (v2.0+ ideas stay in backlog, not formal specs)

---

### 9. Documentation Maintenance

**Schell's Problem:** Documentation becomes outdated if not maintained. Stale docs are worse than no docs (cause confusion).

**Solutions:**

**1. Regular Review Cycles:**
- **Weekly:** Review economy sheet (based on analytics)
- **Sprint end:** Update feature specs with what actually shipped
- **Monthly:** Review vision doc (still aligned with goals?)

**2. Clear Ownership:**
- Each doc has "Last Updated" date at top
- Solo dev: You're responsible for all docs (but keep it lightweight)

**3. Archive Old Versions:**
- Don't delete (history is valuable)
- Git: Tag major versions (`git tag v0.1-beta`)
- Google Sheets: File > Version history (named versions)
- Move superseded docs to `docs/archive/`

**4. Update Triggers:**
- **Code change:** Update spec in same commit
- **Playtest findings:** Update economy/retention specs after analysis
- **Content added:** Update content database immediately

**SupaSnake Maintenance Routine:**

**Weekly (30-60 minutes):**
- Monday: Review analytics → update economy sheet if needed
- Throughout week: Update feature specs if implementation changed
- Friday: Commit all doc changes to git

**Monthly (1-2 hours):**
- Review all specs → mark outdated ones for update/deletion
- Update roadmap based on progress
- Tag release versions (`v0.1-mvp`, `v0.2-beta`)

---

## Key Takeaways for SupaSnake

**1. Lightweight Over Comprehensive:**
- No 100-page GDD
- 5-15 pages total (vision, core loop, key features, economy)
- Update continuously (living docs)

**2. Right Tools for Solo Dev:**
- Markdown + Git (feature specs - version-controlled)
- Google Sheets (economy balance - live formulas)
- Figma (UI mockups - visual)
- Amplitude (analytics - replaces static reports)
- **Total cost: $0**

**3. Document for Future You:**
- Why did we choose 12h breeding timer? (documented decision rationale)
- What's the breeding formula? (exact math in spec)
- What's the progression curve? (Day 1/7/14/30 targets in spreadsheet)

**4. Living Specifications:**
- Update economy sheet weekly (based on playtest data)
- Update feature specs when implementation changes
- Link to analytics (retention targets, economy balance)

**5. Know When NOT to Document:**
- Don't document far-future features (focus on MVP)
- Don't over-detail placeholders (art notes, not final assets)
- Don't formalize personal notes (use comments/scratch)

**6. Documentation as Design:**
- Writing breeding spec forces you to think through edge cases
- Economy spreadsheet reveals balance issues before coding
- UI flow diagrams show UX problems early

**7. Maintenance is Key:**
- Weekly: Update economy based on data
- Every change: Update spec in same commit
- Monthly: Review all docs (delete stale, archive old)

---

## Lenses from Chapter 27

*(Note: Chapter 27 doesn't introduce specific numbered lenses in the text, but reinforces documentation as a tool to support other lenses)*

**Documentation Supports These Lenses:**

- **Lens of the Player** (Lens #6): Document target personas (Emma, Tyler) to keep player needs front-of-mind
- **Lens of the Visible Progress** (Lens #37): Economy spreadsheet shows progression curve (are milestones visible?)
- **Lens of the Team** (Lens #94): Even solo, docs help "team of one" stay aligned over months

---

## SupaSnake Documentation Structure

```
docs/
  game_design/
    vision.md                      # 1 page - elevator pitch, personas, goals
    core_loop.md                   # 1 page - minute/session/daily loops
    breeding_system.md             # 2-3 pages - formula, costs, UI
    classic_mode.md                # 1-2 pages - scoring, DNA rewards
    collection_book.md             # 1-2 pages - Panini UI, completion goals
    retention_features.md          # 1-2 pages - daily rewards, push notifs

  economy/
    balance.xlsx (Google Sheets)   # Living spreadsheet - costs, rewards, curves

  content/
    variants_database (Airtable)   # 243 variants - stats, art status, unlock methods

  technical/
    architecture.md                # 1 page - system diagram, dependencies
    supabase_setup.md              # 1 page - backend integration notes
    analytics_events.md            # 1 page - what events to track

  ui/
    figma_mockups (link)           # UI designs, flows, style guide
```

**Total:** ~15 pages + spreadsheet + database (manageable for solo dev)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_lightweight_documentation.md (200 words)
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_living_specs.md (250 words)
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_documentation_tools_solo.md (300 words)
- **How-To**: @knowledge_base/game_design/how_to/create_lightweight_game_docs.md (1,000+ words step-by-step)
- **Book**: Jesse Schell, *The Art of Game Design* (3rd ed.), Chapter 27 (full text)
