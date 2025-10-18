# Art Pipeline - Quick Reference

## Option A: Simple 3D Snake + Midjourney Cards

**Decision**: User explicitly chose Option A over B, C, D

**In-Game (Gameplay)**:
- Simple 3D snake model (base model reusable)
- Dynasty customization via shaders (color + pattern)
- CYBER: Cyan/magenta gradient, circuit overlay, glossy
- PRIMAL: Green/brown gradient, vine/leaf overlay, matte
- COSMIC: Purple/gold gradient, star sparkles, semi-translucent
- Result: 1 base model + 3 shader variants (no 30 separate 3D models needed)

**Collection Lab (Panini Book)**:
- Gorgeous Midjourney 2D art cards (2048×2048px PNG)
- 10 variants per dynasty (Common → Legendary visual progression)
- Full-screen viewing, pinch-to-zoom
- This is where the beautiful art shines

**Acceptable Disconnect**: Players understand rich art is for collection, simple snake is for gameplay

## Midjourney Production Process

**Per Dynasty (10 variants)**:
1. Generate 50-100 concepts (~2 days)
2. Refine best 10 (Common → Legendary progression)
3. Upscale to 2048×2048px PNG
4. Export with naming convention: `CYBER_SPARK_001.png`

**Prompt Template (CYBER example)**:
```
"cybernetic snake, neon circuit patterns, holographic scales,
electric cyan and magenta colors, glowing LED edges,
digital aesthetic, high-tech futuristic design, sleek metallic body,
data stream effects, cyberpunk style, dramatic lighting,
4K detailed, centered composition"
```

**Timeline**: 2-3 weeks for 30 MVP variants (3 dynasties × 10 variants)

**Cost**: $120 (Midjourney Pro subscription for 1 month)

## 3D Snake Production

**Base Model**:
- Generic snake in Blender (20-30 segments, smooth curves)
- UV unwrapped for texture mapping
- Simple rig for forward movement + turning
- Timeline: 1 week

**Dynasty Shaders**:
- 3 shader variants (CYBER, PRIMAL, COSMIC)
- Timeline: 2-3 days per shader
- Total: 1 week for all 3

**Result**: 2 weeks for all 3D assets vs 10+ weeks for 30 unique 3D models

## Cost Comparison

**Midjourney Approach**: $120 + 2 weeks 3D work
**Full 3D Approach**: $58,000 + 12+ weeks
**Savings**: 99.8% cost reduction, 6× faster

## See Also

**Complete Art Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md (Section 9)
**How to Create Variant Art**: @knowledge_base/game/how_to/create_variant_art.md
**How to Add Dynasty**: @knowledge_base/game/how_to/add_new_dynasty.md
