# Schell Extraction Framework - Batch 4 (Chapters 25-32)

**Purpose**: Extract game design knowledge from "The Art of Game Design" (3rd Edition, 2020) for SupaSnake solo/small team development.

**Version**: Batch 4
**Edition**: 3rd Edition (2020)
**Chapters**: 25-32 (Communities, Teams, Documentation, Playtesting, Technology, Clients, Pitching, Business)
**Created**: 2025-10-18

---

## Batch 4 Chapter Overview

**Chapter 25**: Other Players Sometimes Form Communities
- Community formation and health
- Moderation and toxicity prevention
- Community-driven content

**Chapter 26**: The Designer Usually Works with a Team
- Team roles and dynamics
- Communication patterns
- Remote collaboration (relevant for 2020)

**Chapter 27**: The Team Sometimes Communicates through Documents
- Design documentation
- GDDs, wikis, specs
- Documentation best practices

**Chapter 28**: Good Games Are Created through Playtesting
- Playtesting methodologies
- Feedback analysis
- Iteration based on testing

**Chapter 29**: The Team Builds a Game with Technology
- Technology selection
- Technical constraints
- Tech as design enabler

**Chapter 30**: Your Game Will Probably Have a Client
- Client relationships
- Managing expectations
- Self-publishing vs traditional

**Chapter 31**: The Designer Gives the Client a Pitch
- Pitch structure
- Selling your vision
- Demo creation

**Chapter 32**: The Designer and Client Want the Game to Make a Profit
- Business models
- Monetization strategies
- Financial sustainability

---

## SupaSnake Context (Solo/Small Team)

**CRITICAL ADAPTATIONS:**
- **Solo/Small Team Focus**: Schell assumes teams of 10-100+, SupaSnake is 1-3 devs
- **Self-Publishing**: No traditional client, YOU are the client
- **Mobile F2P**: Business model is already chosen (free + IAP)
- **Async Community**: Mobile players, not synchronous MMO
- **Agile/Lean**: Fast iteration, minimal documentation

**Relevance Tiers:**

**HIGH** (create detailed how_tos):
- Playtesting (Ch 28): Critical for mobile F2P balance
- Technology (Ch 29): React Native/Supabase/Expo decisions
- Business (Ch 32): Mobile monetization, LTV, retention

**MEDIUM** (create how_tos + quick_refs):
- Communities (Ch 25): Future Discord/Reddit community
- Documentation (Ch 27): Lightweight specs for solo dev
- Pitching (Ch 31): App Store presence, marketing

**LOW** (reference summaries + adapted quick_refs):
- Teams (Ch 26): Solo dev, but principles for future hiring
- Clients (Ch 30): Self-published, but portfolio/indie fund pitching relevant

---

## Output Structure

### Quick Refs (200-300 words each)

Focus on **solo dev adaptations** of team-based concepts.

**Naming:**
- `concept_[name]_solo_dev.md` - Adapted for solo context
- `concept_[name]_mobile_f2p.md` - Mobile-specific
- `lens_[number]_[name].md` - Lenses from chapters

**Required Sections:**
```markdown
# [Concept] - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter X

## Core Concept
[Schell's principle]

## Solo Dev Adaptation
[How this applies to 1-person or small team]

## SupaSnake Application
[Specific to mobile collection game]

**Key Adjustments:**
- [What changes for solo dev]
- [What stays the same]

## See Also
- @knowledge_base/...
```

### How-Tos (800-1,200 words)

**Focus on:**
- Playtesting mobile F2P games
- Technology selection for solo dev
- Mobile app store presence
- Monetization without predatory practices
- Community building for mobile games

**Template:**
```markdown
# How to [Action] for Solo Mobile Dev

**Schell's Principle:** [Team-based approach]
**Solo Dev Reality:** [Adaptation for 1-3 person team]
**SupaSnake Context:** [Mobile F2P collection game]

---

## Solo Dev Workflow
[Streamlined, agile process]

## Mobile-Specific Considerations
[Platform constraints, F2P monetization]

## SupaSnake Examples
[Concrete applications]
```

---

## Sub-Agent Assignments

### Agent 1: Communities & Teams (Chapters 25-26)
**Focus:** Community formation (future Discord/Reddit), solo dev workflow
**Priority:** MEDIUM - Future community important, team chapter needs heavy adaptation
**Expected Output:**
- Quick refs: concept_community_formation.md, concept_community_health.md, concept_moderation_solo_dev.md, concept_solo_dev_workflow.md, concept_async_collaboration.md + lenses
- How-tos: build_mobile_game_community.md, manage_solo_dev_workflow.md
- Summaries: chapter_25_communities_summary.md, chapter_26_teams_summary.md

**Key Adaptation:** Schell assumes large teams. Focus on solo dev realities and future small team.

### Agent 2: Documentation & Playtesting (Chapters 27-28)
**Focus:** Lightweight docs for solo dev, mobile F2P playtesting
**Priority:** HIGH - Playtesting critical for balance, docs need streamlining
**Expected Output:**
- Quick refs: concept_lightweight_documentation.md, concept_living_specs.md, concept_mobile_playtesting.md, concept_playtest_analysis.md + lenses
- How-tos: create_lightweight_game_docs.md, playtest_mobile_f2p_game.md
- Summaries: chapter_27_documentation_summary.md, chapter_28_playtesting_summary.md

**Key Deliverable:** How to playtest SupaSnake with Emma & Tyler personas, balance DNA economy, test retention.

### Agent 3: Technology & Business (Chapters 29-32)
**Focus:** Tech stack decisions (React Native/Supabase), mobile F2P monetization
**Priority:** HIGH - Critical business/technical decisions
**Expected Output:**
- Quick refs: concept_tech_selection_solo.md, concept_technical_constraints.md, concept_mobile_monetization.md, concept_ethical_f2p.md, concept_app_store_presence.md + lenses
- How-tos: choose_mobile_tech_stack.md, design_ethical_monetization.md, optimize_app_store_presence.md
- Summaries: chapter_29_technology_summary.md, chapter_30_clients_summary.md, chapter_31_pitching_summary.md, chapter_32_business_summary.md

**Key Deliverable:** SupaSnake monetization strategy (ethical F2P), tech decisions validated, app store optimization.

---

## Quality Standards

### Solo Dev Focus

**DO:**
✅ Adapt team concepts to solo/small team reality
✅ Provide agile/lean workflows
✅ Focus on pragmatic, time-efficient approaches
✅ Acknowledge resource constraints
✅ Provide mobile-first strategies

**DON'T:**
❌ Assume large team resources
❌ Recommend heavyweight processes
❌ Ignore self-publishing realities
❌ Forget mobile platform constraints

### Mobile F2P Context

**Business Model:**
- Free to download + optional IAP
- Ethical monetization (no predatory practices)
- LTV > CAC over time
- Retention-focused (not extraction-focused)

**Technology:**
- React Native (cross-platform iOS/Android)
- Supabase (backend as a service)
- Expo + Three.js (game engine)
- Zustand (state management)

**Community:**
- Async mobile players (not synchronous)
- Future Discord/Reddit community
- App Store reviews as feedback source

---

## SupaSnake Cross-References

**Playtesting:**
- @knowledge_base/game/quick_ref/player_journey.md (test retention hooks)
- @knowledge_base/game_design/how_to/balance_progression.md (test balance)

**Technology:**
- @knowledge_base/game/quick_ref/ui_framework.md (React Native structure)
- @knowledge_base/game/quick_ref/backend_supabase.md (tech stack)

**Business:**
- @knowledge_base/game/quick_ref/economic_balance.md (monetization balance)
- @knowledge_base/game/quick_ref/energy_system.md (F2P pacing gate)

**Community:**
- @knowledge_base/game/quick_ref/player_journey.md (community touchpoints)
- @knowledge_base/game_design/how_to/plan_multiplayer_features.md (social features)

---

## Verification Checklist

✅ **Solo Dev Adaptation:** Every team concept adapted for 1-3 person context
✅ **Mobile F2P Focus:** Business/tech advice specific to mobile free-to-play
✅ **Ethical Monetization:** No predatory practices recommended
✅ **SupaSnake Examples:** Concrete applications to collection game
✅ **Cross-References:** Link to Batches 1-3 and SupaSnake docs
✅ **Pragmatic:** Time-efficient, resource-conscious approaches
✅ **Word Counts:** Within specified ranges
✅ **Terminology:** Consistent SupaSnake vocabulary

---

**End of Framework**

**Instructions:**
1. Read framework completely
2. Read assigned chapters from 3rd edition epub
3. **ADAPT team concepts to solo dev reality**
4. Extract concepts with mobile F2P focus
5. Create quick_refs + how_tos + summaries
6. Apply to SupaSnake (React Native, Supabase, collection game)
7. Cross-reference previous batches
8. Verify quality checklist
9. Return file manifest with word counts
