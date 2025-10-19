# How to Create Variant Art (Midjourney)

**Goal**: Generate 10 high-quality snake variant art pieces with visual progression (Common → Legendary)

**Timeline**: 2-3 days per dynasty (10 variants)

**Prerequisites**: Midjourney Pro subscription ($120/month for unlimited fast generations)

---

## Step 1: Define Dynasty Visual Identity

### Core Visual Elements

**Before generating anything, define:**

1. **Theme Keywords** (3-5 words)
   - Example (CYBER): "cyberpunk, neon, holographic, circuits, tech"
   - Example (PRIMAL): "organic, nature, vines, bioluminescent, earth"
   - Example (COSMIC): "space, nebula, stars, celestial, energy"

2. **Color Palette** (2 primary colors)
   - CYBER: Electric cyan (#00FFFF) + neon magenta (#FF00FF)
   - PRIMAL: Forest green (#2d5016) + earth brown (#8b4513)
   - COSMIC: Deep purple (#4a0e4e) + cosmic gold (#ffd700)

3. **Visual Motifs** (patterns, textures)
   - CYBER: Circuit patterns, LED lines, data streams
   - PRIMAL: Vine patterns, leaf textures, wood grain
   - COSMIC: Nebula clouds, star sparkles, energy wisps

4. **Material/Texture**
   - CYBER: Glossy metallic, reflective surfaces
   - PRIMAL: Matte organic, rough bark-like
   - COSMIC: Semi-translucent, glowing ethereal

**Document these in a "Style Guide" before generating**

---

## Step 2: Craft Base Prompt Template

### Prompt Structure

```
"[theme] snake, [aesthetic style], [primary motifs],
[color 1] and [color 2] colors, [texture description],
[material/finish], [lighting style], 4K detailed,
centered composition, white background, full body visible, coiled pose"
```

### Example Prompts

**CYBER Dynasty**:
```
"cybernetic snake, neon holographic aesthetic, circuit board patterns,
electric cyan and neon magenta colors, glowing LED edges,
glossy metallic scales, dramatic rim lighting, 4K detailed,
centered composition, white background, full body visible, coiled pose"
```

**PRIMAL Dynasty**:
```
"organic nature snake, bioluminescent forest aesthetic, vine and leaf patterns,
forest green and earth brown colors, natural wood grain texture,
matte organic scales, soft ambient lighting, 4K detailed,
centered composition, white background, full body visible, coiled pose"
```

**COSMIC Dynasty**:
```
"cosmic celestial snake, nebula space aesthetic, star and energy patterns,
deep purple and cosmic gold colors, ethereal glowing wisps,
semi-translucent scales, dramatic backlighting, 4K detailed,
centered composition, white background, full body visible, coiled pose"
```

### Prompt Tips

**DO**:
- Be specific about colors (hex codes → "electric cyan #00FFFF")
- Include "white background" (easier to composite in UI)
- Specify "full body visible, coiled pose" (consistent framing)
- Use "4K detailed" (encourages high quality)

**DON'T**:
- Use vague terms ("cool snake" → not specific enough)
- Mix conflicting styles ("cyberpunk nature snake" → confusing)
- Include text/words (Midjourney can't render text well)
- Request multiple snakes (single subject is clearer)

---

## Step 3: Generate Initial Concept Pool

### Generation Strategy

**Goal**: 50-100 variations to choose from

**Process**:
1. Run base prompt 10-15 times (each generates 4 images = 40-60 total)
2. For interesting results, click "Vary (Strong)" to get 4 more variations
3. Continue until you have 50-100 candidates

**Midjourney Commands**:
```
/imagine [your prompt here]
→ Generates 4 images (numbered 1-4)

Click "V1" to upscale image #1
Click "🔄" on V1 to generate 4 variations of that image
Repeat until you have enough candidates
```

**Time**: 4-6 hours for 50-100 images (Midjourney Pro fast mode)

### Evaluation Criteria

**Look for**:
- Clear snake shape (recognizable as snake)
- Dynasty colors prominent (cyan/magenta for CYBER)
- Good composition (centered, full body, not cut off)
- Interesting details (patterns, textures)
- Visual variety (different enough from each other)

**Reject**:
- Unclear shape (abstract blob)
- Wrong colors (green snake for CYBER)
- Poor framing (snake cut off, too small)
- Duplicate concepts (too similar to existing)
- Low quality (blurry, artifacts)

---

## Step 4: Select Rarity Progression

### Common → Legendary Visual Escalation

**Principle**: Visual complexity and effects increase with rarity

**Common (3 variants)**: Simple, minimal effects
- Clean base design
- Single color gradient
- Simple pattern (light circuit overlay for CYBER)
- No particle effects
- Example names: CYBER SPARK, CYBER PULSE, CYBER FLICKER

**Uncommon (3 variants)**: Added details, moderate effects
- More intricate patterns (denser circuits)
- Dual color blend (cyan + magenta mix)
- Subtle glow effects
- Example names: CYBER VOLT, CYBER SURGE, CYBER ARC

**Rare (2 variants)**: Complex patterns, strong effects
- Highly detailed patterns (complex circuit boards)
- Strong glow/emission
- Additional elements (floating data fragments)
- Example names: CYBER NEXUS, CYBER MATRIX

**Epic (1 variant)**: Intricate design, dramatic effects
- Maximum pattern complexity
- Multiple glow layers
- Dynamic effects (energy trails)
- Example name: CYBER CORE

**Legendary (1 variant)**: Stunning, awe-inspiring
- Ultimate detail level
- All effects combined
- Unique visual signature (holographic wings, data streams)
- Example name: CYBER OMEGA

### Selection Process

1. Lay out all 50-100 candidates
2. Sort by visual complexity (simple → complex)
3. Select 3 simplest for Common
4. Select 3 mid-complexity for Uncommon
5. Select 2 high-complexity for Rare
6. Select 1 very-high for Epic
7. Select 1 absolute best for Legendary

**Ensure visual progression is clear**: Player should instantly recognize Legendary is "cooler" than Common

---

## Step 5: Upscale and Export

### Upscaling Process

**For each selected variant**:
1. Click "U1" (or U2, U3, U4) to upscale to 2048×2048px
2. Wait for upscale to complete (~30 seconds)
3. Right-click → "Save Image"
4. Save as PNG with naming convention

**Naming Convention**:
```
[DYNASTY]_[VARIANT_NAME]_[NUMBER].png

Examples:
CYBER_SPARK_001.png
CYBER_PULSE_002.png
...
CYBER_OMEGA_010.png
```

### File Organization

**Directory Structure**:
```
art/
  dynasties/
    cyber/
      CYBER_SPARK_001.png
      CYBER_PULSE_002.png
      ...
      CYBER_OMEGA_010.png
    primal/
      PRIMAL_SEED_001.png
      ...
    cosmic/
      COSMIC_SPARK_001.png
      ...
```

**File Specs**:
- Format: PNG (supports transparency if needed)
- Resolution: 2048×2048px (Midjourney upscale)
- Size: ~400-600KB per file
- Total: ~5-6MB per dynasty (10 files)

---

## Step 6: Quality Review

### Review Checklist

**Visual Consistency**:
- [ ] All 10 variants share dynasty color palette
- [ ] All have similar style/aesthetic (not random mix)
- [ ] Clear progression from Common → Legendary
- [ ] No jarring style breaks

**Technical Quality**:
- [ ] All images 2048×2048px
- [ ] No artifacts or blur
- [ ] White background (or consistent transparent)
- [ ] Snake centered and fully visible

**Naming**:
- [ ] Files follow naming convention
- [ ] Numbers 001-010 sequential
- [ ] Names match variant names in database

**Lore Alignment**:
- [ ] Visual matches lore description
- [ ] CYBER SPARK looks like "electric beginning"
- [ ] CYBER OMEGA looks like "digital apex"

### Iteration

**If variants don't meet quality**:
1. Regenerate specific variants (keep good ones)
2. Use "Vary (Strong)" on close-but-not-quite images
3. Refine prompt with more specific keywords
4. Example: "cybernetic snake" → "cybernetic snake with precise geometric circuit patterns"

**Don't settle for mediocre**: This art is the first thing players see in Lab. It must be stunning.

---

## Step 7: Upload to CDN

### Supabase Storage Upload

```bash
# Create bucket (one-time)
supabase storage create dynasties

# Upload all CYBER variants
supabase storage upload dynasties/cyber/ art/dynasties/cyber/*.png

# Verify upload
supabase storage list dynasties/cyber/
# Should show:
# CYBER_SPARK_001.png
# CYBER_PULSE_002.png
# ...
# CYBER_OMEGA_010.png
```

### Get CDN URLs

```bash
# Get public URL for each file
supabase storage get-url dynasties/cyber/CYBER_SPARK_001.png
# Returns: https://cdn.supabase.co/dynasties/cyber/CYBER_SPARK_001.png

# Test URL
curl https://cdn.supabase.co/dynasties/cyber/CYBER_SPARK_001.png
# Should return 200 OK and image data
```

### Update Database

```sql
UPDATE snake_variants
SET art_url = 'https://cdn.supabase.co/dynasties/cyber/CYBER_SPARK_001.png'
WHERE dynasty_id = 'cyber-dynasty-uuid'
AND name = 'CYBER SPARK';

-- Repeat for all 10 variants
```

---

## Advanced Techniques

### Prompt Modifiers for Rarity

**Common Prompt**:
```
"cybernetic snake, simple design, minimal effects, clean lines..."
```

**Legendary Prompt**:
```
"cybernetic snake, HIGHLY DETAILED, maximum complexity, intricate patterns,
multiple glow layers, dramatic effects, premium quality, masterpiece..."
```

### Using Midjourney Parameters

**Aspect Ratio**:
```
/imagine [prompt] --ar 1:1
```
(Ensures square 1:1 ratio for 2048×2048px)

**Stylize**:
```
/imagine [prompt] --s 750
```
(Default: 100, Max: 1000. Higher = more artistic)

**Quality**:
```
/imagine [prompt] --q 2
```
(Default: 1. Use --q 2 for Legendary variants)

### Iteration with Image Prompts

**Technique**: Use existing image as reference

```
/imagine [image URL] cybernetic snake, more intricate circuit patterns --iw 0.5
```

**Use Case**: Refine a good-but-not-perfect image
- Upload your upscaled image to Discord
- Copy image URL
- Use as prompt reference with modifications

---

## Common Mistakes

**❌ Inconsistent Style**:
- Generating each variant separately with different prompts
- Result: 10 variants that don't feel like same dynasty

**✅ Fix**: Use consistent base prompt, only modify detail level

**❌ Poor Rarity Progression**:
- Common looks cooler than Legendary
- Result: Players confused about rarity

**✅ Fix**: Explicitly add "simple" to Common, "HIGHLY DETAILED" to Legendary

**❌ Wrong Colors**:
- Midjourney ignores color requests
- Result: Green CYBER snake (should be cyan/magenta)

**✅ Fix**: Regenerate, be more specific ("MUST be electric cyan and neon magenta ONLY")

**❌ Not Enough Candidates**:
- Selecting from only 10-20 images
- Result: Settling for mediocre art

**✅ Fix**: Generate 50-100 candidates, pick absolute best

---

## Summary

**Workflow**:
1. Define visual identity (colors, motifs, style)
2. Craft base prompt template
3. Generate 50-100 concept variations
4. Select 10 with clear rarity progression
5. Upscale to 2048×2048px PNG
6. Quality review and iteration
7. Upload to CDN and update database

**Timeline**: 2-3 days per dynasty (10 variants)

**Cost**: $120/month (Midjourney Pro for unlimited generations)

**Result**: Stunning visual collection that players are proud to own

---

## See Also

**Art Pipeline**: @knowledge_base/game/quick_ref/art_pipeline.md
**Add New Dynasty**: @knowledge_base/game/how_to/add_new_dynasty.md
**Dynasty Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md
