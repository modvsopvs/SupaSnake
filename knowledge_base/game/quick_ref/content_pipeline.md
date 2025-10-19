# Content Pipeline - Quick Reference

**Source:** design/live_ops_framework_aaa.md, design/systems/aesthetics_strategy_v2.md

## Core Concept
Industrialized content production delivering 52+ new variants/year (1 per week) using modular snake construction, AI-assisted art generation, and efficient pipeline to sustain live-ops cadence without crunch.

## Key Points
- **Production Target:**
  - Year 1: 52 new variants (1 per week minimum)
  - Year 2+: 104 variants/year (2 per week) as team scales
  - Total library: 500+ variants by Year 2
- **Modular Construction System:**
  - Snake anatomy: 3 segments (head, body, tail)
  - Each segment: 5 rarity tiers (common → mythic)
  - Mix-and-match: 10 dynasties × 5 tiers × 3 segments = efficient production
- **AI-Assisted Workflow:**
  - Concept art: Midjourney/DALL-E for initial ideation (30 min per variant)
  - 3D modeling: Outsource to vendor (Fiverr/ArtStation), modular templates
  - Texturing: Substance Painter with dynasty-specific material presets
  - VFX: Particle effect templates per rarity tier (reuse 80% of effects)
- **Pipeline Stages:**
  1. Creative brief (1 hour): Dynasty, rarity, thematic hook
  2. AI concept generation (30 min): 10+ variations, team votes on best
  3. 3D modeling (2-4 hours): Vendor execution from concept
  4. Technical integration (1 hour): Import to Unity, apply materials, test
  5. QA (30 min): Visual check, performance test, colorblind mode verification

## AAA Standards
- **Quality Consistency:** Every variant meets Supercell art bar (multiple review gates)
- **Performance Budget:** Max 50k triangles, 2048×2048 textures (60fps on mid-range)
- **No Crunch:** Sustainable pipeline, buffer weeks for polish/iteration
- **Cultural Authenticity:** Consult cultural experts for dynasty-specific variants

## Implementation Priority
- **MVP:** Manual production, 10 variants per dynasty (30 total)
- **v1.0:** Modular pipeline, 50 variants per dynasty (500 total)
- **v2.0+:** Fully automated AI pipeline, 104+ variants/year

## See Also
- @design/live_ops_framework_aaa.md (weekly content cadence strategy)
- @design/systems/aesthetics_strategy_v2.md (visual design workflow)

---

*Word Count: 298 words*
