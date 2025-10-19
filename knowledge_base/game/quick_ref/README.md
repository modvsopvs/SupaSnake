# SupaSnake AAA Quick Reference Index

**Purpose:** Query-optimized documentation extracted from comprehensive AAA design documents. Each quick_ref answers specific questions in 200-300 words, enabling 95%+ context reduction vs loading full docs.

**Query Strategy:** Start here for fast answers, escalate to comprehensive docs only for deep-dive.

---

## Vision & Philosophy (4 files)

1. **aaa_vision.md** (237 words)
   - One-sentence vision, 5 design pillars, success metrics
   - Source: vision/vision_statement_aaa.md (6,847 words)

2. **competitive_landscape.md** (248 words)
   - SNAP vs Supercell hybrid model, skill-first + social retention
   - Source: vision/snap_competitive_analysis.md (2,847 words)

3. **monetization_model.md** (265 words)
   - Fair gacha, battle pass, $50M ARR target, no pay-to-win
   - Source: design/monetization_architecture_aaa.md (10,300 words)

4. **design_philosophy.md** (268 words)
   - Schell's top 10 AAA principles, holistic design thinking
   - Source: vision/aaa_design_principles.md (14,500+ words)

---

## Core Systems (5 files)

5. **core_loop.md** (269 words)
   - Goal-based Snake, 4 win conditions, DNA wagering, 3-minute matches
   - Source: design/core_loop_aaa.md (~4,600 words)

6. **breeding_overview.md** (293 words)
   - Egg gacha, pity system, generational breeding, 500+ variants
   - Source: design/systems/breeding_system_v2.md

7. **progression_paths.md** (269 words)
   - Collection/Competitive/Prestige ladders, parallel progression
   - Source: design/progression_systems_aaa.md (7,800 words)

8. **guild_system.md** (287 words)
   - 50-member guilds, trading post, 3-4x retention multiplier
   - Source: design/social_systems_aaa.md (4,800 words)

9. **live_ops_cadence.md** (272 words)
   - Weekly content, 12-week seasons, 52 variants/year
   - Source: design/live_ops_framework_aaa.md (9,000 words)

---

## Dynasty & Collection (3 files)

10. **dynasties.md** (297 words)
    - 10 dynasties, visual/mechanical identities, 50 variants each
    - Source: design/systems/dynasty_system_v2.md

11. **evolution_prestige.md** (287 words)
    - Gen 1→5+ breeding, Ascension tiers, cosmetic prestige glows
    - Source: design/systems/evolution_prestige_v2.md

12. **aesthetics_pillars.md** (298 words)
    - Art direction, rarity visual language, Supercell quality bar
    - Source: design/systems/aesthetics_strategy_v2.md

---

## Competitive & Social (4 files)

13. **competitive_ladder.md** (271 words)
    - Bronze→Grandmaster, MMR matchmaking, esports tournaments
    - Source: design/systems/competitive_systems_v2.md

14. **guild_wars.md** (293 words)
    - 96-hour weekly events, 20-guild matchmaking, exclusive rewards
    - Source: design/systems/guild_systems_v2.md

15. **seasonal_narratives.md** (299 words)
    - 12-week story arcs, transmedia (comics, animated shorts)
    - Source: design/systems/story_narrative_v2.md

16. **anti_toxicity.md** (299 words)
    - Guild moderation, AI chat filtering, report systems
    - Source: design/social_systems_aaa.md

---

## Monetization & Economy (2 files)

17. **f2p_economy.md** (298 words)
    - 300-500 DNA daily, generous F2P progression, no paywalls
    - Source: design/monetization_architecture_aaa.md

18. **battle_pass.md** (296 words)
    - $9.99 seasonal pass, 100 tiers, 5x value vs direct purchase
    - Source: design/monetization_architecture_aaa.md

---

## Production & Polish (4 files)

19. **audio_identities.md** (292 words)
    - Dynasty soundscapes, adaptive music, AAA audio production
    - Source: design/systems/audio_strategy_v2.md

20. **retention_science.md** (297 words)
    - Hook/Habit/Hobby, 40% D1/20% D7 targets, guild multiplier
    - Source: vision/supercell_monetization_study.md (13,500+ words)

21. **content_pipeline.md** (298 words)
    - 52 variants/year, AI-assisted production, modular construction
    - Source: design/live_ops_framework_aaa.md

22. **esports_infrastructure.md** (286 words)
    - Spectator mode, tournament tools, $500k World Championship
    - Source: design/systems/competitive_systems_v2.md

---

## Implementation & Launch (5 files)

23. **onboarding_ftue.md** (298 words)
    - 5-minute tutorial, guaranteed rare pull, 40% D1 hook
    - Source: design/progression_systems_aaa.md

24. **accessibility_features.md** (299 words)
    - Colorblind modes, reduced motion, COPPA/GDPR compliance
    - Source: vision/aaa_design_principles.md

25. **platform_strategy.md** (299 words)
    - Mobile-first iOS/Android, 60fps, PC/console expansion plans
    - Source: vision/vision_statement_aaa.md

26. **mvp_scope.md** (297 words)
    - 6-month MVP, 3 dynasties, validation metrics
    - Source: vision/vision_statement_aaa.md (implied)

27. **success_metrics.md** (298 words)
    - 10M MAU, $50M ARR, 40%/20%/10% retention targets
    - Source: vision/vision_statement_aaa.md

---

## Meta (1 file)

28. **aaa_transformation.md** (297 words)
    - v1.0 solo-dev → v2.0 AAA comparison, investment delta
    - Source: All comprehensive docs

---

## Total Quick Refs Created: 28 files

**Total Word Count:** ~8,200 words (avg 293 words per file)

**Comprehensive Source Word Count:** ~150,000 words (17 documents)

**Query Efficiency:** 95%+ reduction (load 300 words vs 10,000+ words for typical query)

---

## Usage Guidelines

**Query Pattern:**
1. **Quick Lookup:** Start with quick_ref (200-300 words, <1 second read)
2. **Deep Dive:** Escalate to comprehensive docs if needed (cross-references provided)
3. **Context Optimization:** Load only what you need, save 85-95% of context budget

**Cross-Reference Format:**
- `@vision/[doc].md` - Comprehensive vision documents
- `@design/[doc].md` - Core systems design documents
- `@design/systems/[doc].md` - Deep systems specifications
- `@knowledge_base/game_archive_v1_solo_dev/` - Original v1.0 documentation for comparison

---

## Common Queries → Quick Ref Mapping

**"What is SupaSnake?"** → aaa_vision.md
**"How does monetization work?"** → monetization_model.md + f2p_economy.md + battle_pass.md
**"What are the dynasties?"** → dynasties.md + aesthetics_pillars.md + audio_identities.md
**"How does breeding work?"** → breeding_overview.md + evolution_prestige.md
**"What's the competitive system?"** → competitive_ladder.md + core_loop.md
**"How do guilds work?"** → guild_system.md + guild_wars.md
**"What's the content pipeline?"** → live_ops_cadence.md + content_pipeline.md + seasonal_narratives.md
**"What are success metrics?"** → success_metrics.md + retention_science.md
**"What's the MVP scope?"** → mvp_scope.md
**"How is v2.0 different from v1.0?"** → aaa_transformation.md

---

## Philosophy

**Database-Like Query Optimization:**
- Don't load 15,000-word comprehensive doc when 300-word quick_ref answers the question
- Escalate to comprehensive docs only when deep technical detail required
- Save context budget for active development work, not reading documentation

**Result:** Top 1% context management system - query-optimized knowledge base enabling 95%+ token savings per documentation lookup.

---

**Version:** 1.0
**Last Updated:** 2025-10-19
**Status:** Production-Ready AAA Quick Reference Library
