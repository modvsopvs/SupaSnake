# Documentation Tools for Solo Devs - Quick Reference

## Core Principle

For **solo mobile F2P developers**, documentation tools must be **lightweight, fast, and integrated** with your workflow. Avoid enterprise tools (Confluence, Jira) - they're overkill. Choose tools you'll actually use daily.

## Essential Tool Stack

### 1. Markdown + Git (Core Documentation)

**Best For:** Feature specs, design decisions, system docs

**Why:**
- **Version control built-in** (every change tracked)
- **Fast** (plain text, instant search)
- **Future-proof** (markdown will outlive proprietary formats)
- **Integrated** (docs live in same repo as code)

**SupaSnake Setup:**
```
docs/
  game_design/
    breeding_system.md
    economy_balance.md
    retention_features.md
  technical/
    architecture.md
    api_integration.md
```

**Tools:**
- VS Code (edit markdown)
- GitHub/GitLab (browse docs online)
- Obsidian (if you want backlinks/graph view)

**Pros:** Free, version-controlled, portable
**Cons:** No rich formatting, requires git knowledge

---

### 2. Google Sheets (Economy & Balance)

**Best For:** Economy tuning, content databases, balance calculations

**Why:**
- **Live formulas** (calculate costs automatically)
- **Version history** (track balance changes)
- **Shareable** (send link to playtesters)
- **Data visualization** (charts for economy curves)

**SupaSnake Examples:**

**Economy Balance Sheet:**
```
| Level | DNA Income | DNA Spent | Net DNA | Days to Dynasty Unlock |
|-------|------------|-----------|---------|------------------------|
| 1-3   | 30/day     | 50 (breed)| -20     | 7.5 days               |
| 4-7   | 50/day     | 150 (evo) | -100    | +3 days                |
```
- Formula: `=B2-C2` (auto-calculates net DNA)
- Chart: DNA progression curve over 30 days

**Content Database:**
```
| Variant ID | Dynasty | Generation | DNA Cost | Art Status |
|------------|---------|------------|----------|------------|
| CLV_G1_001 | Clever  | 1          | 0        | Done       |
| CLV_G2_002 | Clever  | 2          | 50       | In Progress|
```

**Pros:** Easy formulas, version history, shareable
**Cons:** Not good for long-form text

---

### 3. Notion (Living Wiki - Optional)

**Best For:** Mixed docs (text + data), knowledge base, roadmap

**Why:**
- **Databases** (content management)
- **Templates** (consistent feature specs)
- **Rich formatting** (images, embeds, toggles)
- **Fast updates** (web-based)

**SupaSnake Setup:**

**Game Design Wiki:**
- **Vision** page (one-pager)
- **Features** database (status: planned/in dev/shipped)
- **Playtests** database (date, findings, actions)
- **Roadmap** timeline view

**Feature Spec Template:**
```
# [Feature Name]

## One-Liner
[What is this feature in one sentence?]

## Player Value
[Why does Emma/Tyler care?]

## Mechanics
[How does it work?]

## Economy
[DNA/energy costs]

## Success Metrics
[How do we know it's working?]
```

**Pros:** Beautiful, flexible, great for mixed content
**Cons:** Proprietary format, requires internet, can get slow

---

### 4. Figma/FigJam (Visual Docs)

**Best For:** UI mockups, flow diagrams, system maps

**Why:**
- **Fast prototyping** (drag-and-drop UI)
- **Collaborative** (even solo - share with friends for feedback)
- **Living mockups** (update as game evolves)

**SupaSnake Examples:**
- **UI mockups** (Lab screen, Collection Book UI)
- **Flow diagrams** (Breeding flow, IAP purchase flow)
- **System map** (how economy, progression, content systems connect)

**Pros:** Visual, collaborative, free tier
**Cons:** Not for text-heavy docs

---

### 5. Amplitude/Mixpanel (Analytics Dashboard)

**Best For:** Living metrics, replaces static KPI reports

**Why:**
- **Real-time data** (no manual reports)
- **Cohort analysis** (retention tracking)
- **Funnels** (where players drop off)

**SupaSnake Dashboards:**

**Retention Dashboard:**
- D1/D7/D30 retention by cohort
- Churn points (when players quit)

**Economy Dashboard:**
- Average DNA at Day 1, 7, 30
- DNA income vs. spend (is economy balanced?)
- IAP conversion rate

**Engagement Dashboard:**
- Games per session
- Time to first IAP
- Collection completion rate

**Replaces:** Static "KPI Report" documents (dashboard is always current)

**Pros:** Always up-to-date, visual, actionable
**Cons:** Requires integration, learning curve

---

## Tool Selection Matrix

| Need | Solo Dev Tool | Team Tool (2-5) | Avoid |
|------|---------------|-----------------|-------|
| **Feature Specs** | Markdown + Git | Notion, Google Docs | Confluence |
| **Economy Balance** | Google Sheets | Google Sheets, Airtable | Excel files |
| **Content DB** | Airtable, Sheets | Airtable | SQL database |
| **UI Mockups** | Figma | Figma | Photoshop |
| **Metrics** | Amplitude/Mixpanel | Amplitude/Mixpanel | Manual reports |
| **Roadmap** | Trello, Notion | Jira, Linear | MS Project |

---

## SupaSnake Recommended Stack

**Tier 1 (Essential):**
1. **Markdown + Git** (feature specs, decisions) - Free
2. **Google Sheets** (economy, content database) - Free
3. **Amplitude** (analytics dashboard) - Free tier

**Tier 2 (Nice to Have):**
4. **Figma** (UI mockups) - Free tier
5. **Notion** (living wiki) - Free for personal use

**Total Cost:** $0 (all free tiers)

---

## Anti-Patterns (Avoid These)

❌ **Microsoft Word docs** (no version control, hard to update)
❌ **100-page PDF GDD** (no one will read it, instantly outdated)
❌ **Confluence** (overkill for solo, slow, expensive)
❌ **Jira** (too complex for solo dev)
❌ **SharePoint** (why would you do this to yourself?)
❌ **Email threads** (documentation lives in inboxes = lost forever)

---

## Workflow Integration

**Daily:**
- Open Amplitude → check yesterday's retention
- Update economy sheet if balance feels off
- Commit markdown docs if anything changed

**Weekly:**
- Review analytics dashboard → update retention spec
- Playtest → add findings to Notion/markdown
- Update roadmap based on data

**Monthly:**
- Archive old versions of specs (git tags: `v1.0-september`)
- Review tool usage (is Notion collecting dust? Drop it)

---

## Best Practices

**Keep It Simple:**
- Start with markdown + sheets only
- Add tools only when you feel pain (don't over-tool)
- If you haven't opened a tool in 2 weeks, delete it

**Make It Fast:**
- Docs should take <30 seconds to find
- Updates should take <5 minutes
- If it's slow, you won't use it

**Integrate with Workflow:**
- Docs in same repo as code (one place to look)
- Analytics dashboard pinned in browser
- Templates for common docs (copy/paste, done)

---

## Success Metrics

✅ **You reference docs multiple times per week** (they're useful)
✅ **Docs updated within 24 hours of changes** (living process)
✅ **New collaborator onboards in <1 day** (clear, organized)
✅ **Tool cost: $0-50/month** (lightweight, sustainable)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_lightweight_documentation.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_living_specs.md
- **How-To**: @knowledge_base/game_design/how_to/create_lightweight_game_docs.md
- **Complete**: @knowledge_base/game_design/reference/batch4_chapters/chapter_27_documentation_summary.md
