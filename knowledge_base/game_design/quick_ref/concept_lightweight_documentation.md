# Lightweight Documentation - Quick Reference

## Core Concept

**Lightweight documentation** means creating **just enough** documentation to communicate effectively without drowning in bureaucracy. For solo/small mobile teams, heavy documentation is waste - focus on living, actionable specs that evolve with your game.

## Key Principles

**Right-Size Your Docs:**
- Solo dev: Markdown files, Notion pages, minimal overhead
- Small team (2-5): Shared wikis, lightweight specs
- No 100-page Game Design Documents (GDDs) - they become outdated instantly

**Living Documents:**
- Update docs as game evolves (not "write once, forget")
- Version control with git (track changes automatically)
- Link to actual code/assets (docs stay relevant)

**Purpose-Driven:**
- **Vision doc**: One-pager - what is this game? (elevator pitch)
- **Feature specs**: Short (1-3 pages) - how does X work?
- **System design**: Technical details for complex systems only
- **Player-facing**: Tutorials, patch notes (what players need)

## Solo Mobile F2P Focus

**Essential Documents:**
- **Vision one-pager**: Game concept, target audience, monetization model
- **Economy spec**: DNA costs, energy regen, IAP pricing (data-driven)
- **Retention features**: Progression milestones, daily rewards, events
- **Metrics dashboard**: KPIs (D1/D7/D30 retention, ARPU, conversion)

**Skip These:**
- Detailed character bios (unless narrative-driven)
- Exhaustive feature lists (build what you need when you need it)
- Formal approval processes (you're solo - just decide)

## SupaSnake Application

**Vision Doc** (1 page):
- "Panini book meets Snake - collect 243 variants across 3 dynasties"
- Target: Emma (casual mobile collector) & Tyler (progression optimizer)
- Monetization: IAP energy, dynasty unlocks, cosmetic bundles

**Economy Spec** (living spreadsheet):
- DNA costs for breeding, evolution, lab upgrades
- Energy costs per game mode
- IAP price points ($0.99, $4.99, $19.99)
- Updated weekly based on playtest data

**Feature Specs** (Markdown files):
- `breeding_system.md`: Formula, generation limits, DNA costs
- `classic_mode.md`: Scoring, energy cost, DNA rewards
- `lab_progression.md`: Unlock tree, upgrade costs

**Metrics Dashboard** (Amplitude/Mixpanel):
- Live KPIs replace static reports
- Daily retention cohorts
- DNA economy balance (income vs. spend)

## Tools for Solo Dev

**Writing:**
- Markdown (.md files in git repo) - simple, version-controlled
- Notion - lightweight wiki with databases
- Google Docs - collaborative if needed

**Data/Spreadsheets:**
- Google Sheets - economy balancing, live formulas
- Airtable - content databases (variant stats, costs)

**Visuals:**
- Figma/FigJam - UI mockups, flow diagrams
- Miro - brainstorming, system maps

**Avoid:**
- Microsoft Word (heavy, no version control)
- Confluence (overkill for solo)
- Formal documentation tools (too much overhead)

## Best Practices

**Write for Future You:**
- Document decisions when you make them (you'll forget why)
- Include rationale ("Why we chose X over Y")
- Link to playtest data that informed decisions

**Keep It Scannable:**
- Bullet points > paragraphs
- Tables for data (costs, stats)
- Diagrams for complex flows

**Update or Delete:**
- If doc is outdated, update it or delete it
- Stale docs are worse than no docs (cause confusion)

**Link to Code:**
- Reference actual files: `src/breeding/formula.ts`
- When code changes, you know to update docs

## Red Flags

❌ **Doc hasn't been opened in 3 months** - probably outdated
❌ **More time writing docs than building** - over-documenting
❌ **Specs contradict actual game** - not living docs
❌ **No one reads them** - wrong format or too verbose

## Success Metrics

✅ **You reference docs weekly** - they're useful
✅ **Docs updated with each sprint** - living process
✅ **New team member onboards in <1 day** - clarity
✅ **Decisions traced to docs** - accountability

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_living_specs.md
- **How-To**: @knowledge_base/game_design/how_to/create_lightweight_game_docs.md
- **Complete**: @knowledge_base/game_design/reference/batch4_chapters/chapter_27_documentation_summary.md
