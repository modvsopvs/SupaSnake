# Living Specs - Quick Reference

## Core Concept

**Living specifications** are documentation that evolves with your game, always reflecting current design. Unlike traditional "waterfall" specs (written once, never updated), living specs are versioned, iterated, and data-informed - essential for agile mobile F2P development.

## Key Characteristics

**Always Current:**
- Updated every sprint/release
- Reflects what's actually in the game (not aspirational)
- Version-controlled (git tracks changes automatically)

**Data-Informed:**
- Incorporates playtest results
- Updated based on analytics (retention, balance)
- Includes KPIs and success metrics

**Actionable:**
- Clear enough to build from
- Includes acceptance criteria
- Links to tasks/tickets

**Discoverable:**
- Easy to find (consistent location/naming)
- Searchable (markdown, wiki)
- Cross-referenced (links between related specs)

## Traditional vs. Living Specs

**Traditional (Waterfall):**
- Written before development starts
- 100+ page GDD
- Rarely updated (too much overhead)
- Becomes outdated instantly
- "The spec says X, but the game does Y"

**Living (Agile):**
- Written iteratively as features develop
- Short feature specs (1-3 pages)
- Updated every sprint
- Version-controlled (git)
- "The spec matches the game" (single source of truth)

## Mobile F2P Application

**Economy Spec** (Google Sheets):
```
| Action         | DNA Cost | Energy Cost | Updated   |
|----------------|----------|-------------|-----------|
| Classic Game   | 0        | 10          | 2025-10-10|
| Breed (Gen 1)  | 50       | 0           | 2025-10-12|
| Evolve (Tier 2)| 150      | 0           | 2025-10-15|
```
- **Living**: Costs updated weekly based on economy data
- **Data**: Tracks average player DNA at each milestone
- **Versioned**: Google Sheets history shows changes over time

**Progression Spec** (Markdown):
```markdown
# Collection Progression v2.3 (Updated: 2025-10-18)

## Milestone: First Dynasty Complete (27 variants)
- **Target**: Day 7 for Emma persona
- **Current Data**: 65% of players achieve by Day 9
- **Action**: Reduce Gen 2 breeding cost from 100 → 75 DNA
- **Rationale**: Players stalling at Gen 2 (not enough DNA income)
```
- **Living**: Updated after each playtest
- **Data**: Includes actual player data vs. targets
- **Actionable**: Clear next step (cost reduction)

## SupaSnake Living Specs

**Essential Specs:**

1. **Economy Spec** (Google Sheets)
   - DNA costs, energy costs, IAP prices
   - Updated weekly after analytics review
   - Version history tracks balance changes

2. **Retention Features Spec** (Markdown)
   - Daily rewards, milestones, events
   - Target retention rates (D1/D7/D30)
   - Updated after cohort analysis

3. **Breeding System Spec** (Markdown)
   - Formula, generation limits, inheritance
   - Updated when formula changes
   - Links to code: `src/breeding/formula.ts`

4. **Content Database** (Airtable/Sheets)
   - 243 variants with stats, art, unlock costs
   - Updated as new variants added
   - Linked to art pipeline status

**Update Triggers:**

- **Weekly**: Economy balancing (based on analytics)
- **After Playtest**: Retention features, difficulty
- **After Build**: Technical specs (if implementation differs)
- **Content Drops**: Variant database (new dynasties)

## Version Control Strategy

**Git for Markdown Specs:**
```bash
docs/
  game_design/
    breeding_system_v2.3.md    # Current version
    economy_spec_v1.8.md
    progression_milestones_v3.1.md

# Git history shows:
commit a3f8d1c: "Reduce Gen 2 breeding cost to 75 DNA (playtest feedback)"
commit 92bc5e7: "Add daily DNA reward to improve income (retention data)"
```

**Spreadsheet Version History:**
- Google Sheets: File > Version history
- Track major changes with comments
- Name versions: "v1.5 - Post-Beta Balancing"

**Changelog at Top:**
```markdown
# Breeding System Spec

## Changelog
- **v2.3** (2025-10-18): Gen 2 cost reduced to 75 DNA
- **v2.2** (2025-10-12): Added Generation 3 limits
- **v2.1** (2025-10-08): Initial spec from prototype
```

## Solo Dev Workflow

**Sprint Start** (Monday):
1. Review last week's analytics
2. Update specs with new data/insights
3. Plan features based on current specs

**During Development**:
- Update spec if implementation differs from plan
- Document decision rationale in spec

**Sprint End** (Friday):
- Update specs with what actually shipped
- Commit changes to git with clear message
- Review: "Does spec match game?"

## Best Practices

**Do:**
✅ Update specs immediately after changes (while fresh)
✅ Include "last updated" date at top
✅ Link to data sources (analytics dashboard, playtest notes)
✅ Version major changes (v1.0 → v2.0)
✅ Archive old versions (don't delete - history is valuable)

**Don't:**
❌ Write specs months in advance (they'll be wrong)
❌ Update specs without committing/saving (lose history)
❌ Keep outdated specs around (confusing)
❌ Update without explaining why (include rationale)

## Red Flags

⚠️ **Spec says Gen 2 costs 100 DNA, game has 75** - spec is stale
⚠️ **Last updated 6 weeks ago** - probably outdated
⚠️ **No version history** - can't track changes
⚠️ **Spec contradicts analytics dashboard** - not data-informed

## Success Criteria

✅ **Specs updated within 24 hours of changes**
✅ **Version history shows regular updates**
✅ **Analytics data referenced in specs**
✅ **New features built from up-to-date specs**
✅ **Team (or future you) trusts the specs**

## Tools

**Markdown + Git:**
- Version control built-in
- Diff shows exactly what changed
- Easy to search/grep

**Google Sheets:**
- Version history automatic
- Live formulas (calculate balance automatically)
- Share with playtesters

**Notion:**
- Living wiki with databases
- Easy updates
- Good for mixed text + data

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_lightweight_documentation.md
- **How-To**: @knowledge_base/game_design/how_to/create_lightweight_game_docs.md
- **Complete**: @knowledge_base/game_design/reference/batch4_chapters/chapter_27_documentation_summary.md
