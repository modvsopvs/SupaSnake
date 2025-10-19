# Aesthetics Pillars - Quick Reference

**Source:** design/systems/aesthetics_strategy_v2.md

## Core Concept
Supercell-quality art direction with vibrant stylized 3D snakes, readable clarity for esports, and dynasty-specific visual identities using color theory, particle effects, and rarity progression (common → mythic).

## Key Points
- **Art Direction Pillars:**
  1. **Stylized Realism:** Not photorealistic, not cartoony - Clash Royale style
  2. **Visual Clarity:** Instantly readable at spectator distance (distinct silhouettes)
  3. **Dynasty Identity:** Each dynasty has unique color palette, pattern language, particle FX
  4. **Rarity Progression:** Visual complexity increases with rarity tier
- **Rarity Visual Language:**
  - **Common:** Clean base colors, minimal details, no particle effects
  - **Rare:** Added patterns (stripes, spots), subtle glow
  - **Epic:** Complex patterns, animated scales, persistent particle trail
  - **Legendary:** Metallic sheen, dynamic effects, unique animations
  - **Mythic:** Ethereal glow, celestial particles, screen-shake impact
- **Technical Standards:**
  - 60fps on iPhone 12 / Samsung Galaxy S21 (target mid-range 2021 devices)
  - Sub-100ms input latency
  - PBR materials (physically-based rendering for lighting consistency)
  - Modular snake construction (head/body/tail segments for variant efficiency)

## AAA Standards
- **Production Quality:** Supercell/Blizzard-level polish, multiple art reviews
- **Accessibility:** Colorblind modes (protanopia, deuteranopia, tritanopia)
- **Performance Budget:** Max 50k triangles per snake, 2048×2048 texture atlases
- **Cultural Authenticity:** Dynasty aesthetics researched with cultural consultants

## Implementation Priority
- **MVP:** Basic 3D models, simple color variants, no particle effects
- **v1.0:** Full rarity visual language, particle FX, polished animations
- **v2.0+:** Seasonal cosmetic themes, transmedia crossover skins

## See Also
- @design/systems/aesthetics_strategy_v2.md (complete visual design guide)
- @design/systems/dynasty_system_v2.md (dynasty thematic identities)
- @design/systems/audio_strategy_v2.md (audio complements visual identity)

---

*Word Count: 298 words*
