# How to Add a New Dynasty (Monthly Expansion)

**Goal**: Add a new dynasty with 10 variants in 7 days

**Timeline**: 1 week per dynasty (sustainable monthly cadence)

**Prerequisites**: Midjourney Pro subscription, Supabase project access, 3D pipeline setup

---

## Day 1-2: Midjourney Art Generation

### Step 1: Choose Dynasty Theme

**Brainstorm Aesthetic**:
- Visual theme (e.g., "SHADOW - dark, ethereal, wispy")
- Color palette (2 primary colors)
- Visual motifs (patterns, textures, shapes)
- Lore concept (1-2 sentences)

**Example (SHADOW Dynasty)**:
- **Theme**: Dark ethereal spirits, ghost-like, shadowy wisps
- **Colors**: Obsidian black (#0a0a0a) + ghostly purple (#9d4edd)
- **Motifs**: Smoke tendrils, spectral glow, translucent edges
- **Lore**: "Born from forgotten dreams, masters of ethereal stealth"

### Step 2: Generate Midjourney Concepts

**Base Prompt Template**:
```
"[dynasty theme] snake, [visual aesthetic], [primary motifs],
[color 1] and [color 2] colors, [texture description],
[style keywords], dramatic lighting, 4K detailed, centered composition,
white background, full body visible, coiled pose"
```

**SHADOW Example Prompt**:
```
"shadow ethereal snake, dark ghostly aesthetic, wispy smoke tendrils,
obsidian black and ghostly purple colors, translucent spectral body,
smoke effects, haunting glowing eyes, phantom style,
dramatic backlighting, 4K detailed, centered composition,
white background, full body visible, coiled pose"
```

**Generation Process**:
1. Run base prompt 10-15 times (40-60 images with Midjourney's 4-image grid)
2. Select 15-20 best candidates
3. Upscale favorites to 2048×2048px
4. Generate variations of top concepts
5. Total: 50-100 images to choose from

**Timeline**: Day 1 (8 hours) for initial generation, Day 2 (4 hours) for refinement

### Step 3: Select Final 10 Variants

**Rarity Progression** (Common → Legendary):
- **Common (3 variants)**: Simple design, minimal effects
- **Uncommon (3 variants)**: Added details, moderate effects
- **Rare (2 variants)**: Complex patterns, strong effects
- **Epic (1 variant)**: Intricate design, dramatic effects
- **Legendary (1 variant)**: Maximum detail, stunning effects

**Visual Progression Example (SHADOW)**:
1. SHADOW WISP (Common) - Faint smoke outline
2. SHADOW MIST (Common) - Light purple glow
3. SHADOW FOG (Common) - Denser smoke tendrils
4. SHADOW VEIL (Uncommon) - Translucent body, glowing edges
5. SHADOW PHANTOM (Uncommon) - Spectral trails, brighter eyes
6. SHADOW WRAITH (Uncommon) - Multiple smoke layers
7. SHADOW SPECTER (Rare) - Complex ethereal patterns, flowing wisps
8. SHADOW REVENANT (Rare) - Intense purple glow, dramatic smoke
9. SHADOW NIGHTMARE (Epic) - Intricate spectral design, particle effects
10. SHADOW ECLIPSE (Legendary) - Maximum detail, haunting beauty

**Export**:
- Save as PNG: `SHADOW_WISP_001.png`, `SHADOW_MIST_002.png`, etc.
- Resolution: 2048×2048px
- File size: ~400-600KB each

**Timeline**: Day 2 (4 hours) for selection and export

---

## Day 3: Database Implementation

### Step 1: Insert Dynasty Row

```sql
-- Insert new dynasty
INSERT INTO dynasties (
  name,
  display_name,
  description,
  color_primary,
  color_secondary,
  stat_bonus_type,
  stat_bonus_value,
  release_date,
  sort_order,
  is_active,
  art_style_guide_url
) VALUES (
  'shadow',
  'Shadow Dynasty',
  'Born from forgotten dreams, masters of ethereal stealth',
  '#0a0a0a',    -- Obsidian black
  '#9d4edd',    -- Ghostly purple
  'stealth',    -- Stat bonus type (or 'speed', 'dna_gen', 'size')
  0.05,         -- 5% bonus
  NOW(),
  4,            -- Sort order (CYBER=1, PRIMAL=2, COSMIC=3, SHADOW=4)
  true,
  'https://storage.supabase.co/dynasties/shadow/style_guide.md'
);
```

### Step 2: Insert 10 Variant Rows

```sql
-- Get dynasty ID
SELECT id FROM dynasties WHERE name = 'shadow';
-- Returns: abc123-dynasty-id

-- Insert all 10 variants
INSERT INTO snake_variants (dynasty_id, name, rarity, art_url, lore_text, base_stats, unlock_cost_dna, sort_order) VALUES
('abc123-dynasty-id', 'SHADOW WISP', 'common',
  'https://cdn.supabase.co/dynasties/shadow/SHADOW_WISP_001.png',
  'A faint whisper of shadow, barely visible',
  '{"speed": 1.0, "size": 1.0, "dna_gen": 1.0}', 500, 1),

('abc123-dynasty-id', 'SHADOW MIST', 'common',
  'https://cdn.supabase.co/dynasties/shadow/SHADOW_MIST_002.png',
  'Drifting mist from the void',
  '{"speed": 1.0, "size": 1.0, "dna_gen": 1.0}', 500, 2),

-- [... 8 more variants ...]

('abc123-dynasty-id', 'SHADOW ECLIPSE', 'legendary',
  'https://cdn.supabase.co/dynasties/shadow/SHADOW_ECLIPSE_010.png',
  'The ultimate shadow, eclipse of all light',
  '{"speed": 1.5, "size": 1.5, "dna_gen": 1.5}', 8000, 10);
```

**Timeline**: Day 3 (2 hours) for SQL scripts

---

## Day 4: Supabase Storage Upload

### Step 1: Upload Art to CDN

```bash
# Upload via Supabase CLI
supabase storage upload dynasties/shadow/ SHADOW_WISP_001.png
supabase storage upload dynasties/shadow/ SHADOW_MIST_002.png
# ... repeat for all 10 files
```

### Step 2: Verify CDN URLs

```bash
# Test URL accessibility
curl https://cdn.supabase.co/dynasties/shadow/SHADOW_WISP_001.png
# Should return 200 OK
```

**Timeline**: Day 4 (1 hour) for uploads and verification

---

## Day 5: 3D Shader Creation

### Step 1: Create Dynasty Shader (Blender)

**SHADOW Shader Example**:
- Base color: Black (#0a0a0a) to purple (#9d4edd) gradient
- Emission: Purple glow (strength 0.3)
- Transparency: Alpha 0.7 (semi-translucent)
- Noise texture: Wispy smoke overlay (40% opacity)

**Shader Nodes**:
```
ColorRamp (black → purple) → Mix with Noise Texture → Emission + Transparency → Material Output
```

### Step 2: Add Particle System

**SHADOW Particles**:
- Type: Smoke wisps trailing behind snake
- Color: Purple (#9d4edd)
- Lifetime: 0.5 seconds
- Spawn rate: 20 particles/second

### Step 3: Export GLTF

```bash
# Export from Blender
File > Export > glTF 2.0 (.gltf)
# Save as: shadow_snake.gltf

# Upload to Supabase Storage
supabase storage upload models/dynasties/ shadow_snake.gltf
```

**Timeline**: Day 5 (6 hours) for shader creation and particle system

---

## Day 6: Testing & Validation

### Test Checklist

**Backend Tests**:
- [ ] Dynasty appears in `GET /dynasties` API
- [ ] 10 variants returned for SHADOW
- [ ] Art URLs load correctly
- [ ] Unlock flow works (deduct DNA, grant variant)

**UI Tests**:
- [ ] SHADOW tab appears in Panini book
- [ ] 10 variant grids render (9 locked, 1 unlocked if player purchased)
- [ ] Full-screen art view displays correctly
- [ ] Color theme matches dynasty (black/purple)

**3D Tests**:
- [ ] SHADOW shader displays in gameplay
- [ ] Particle system spawns correctly
- [ ] Performance: 60fps maintained

**Breeding Tests**:
- [ ] SHADOW + SHADOW = SHADOW offspring
- [ ] Cross-dynasty blocked (SHADOW + CYBER = error)

**Timeline**: Day 6 (4 hours) for comprehensive testing

---

## Day 7: Deployment & Announcement

### Step 1: Production Deploy

```bash
# Database already updated (Day 3)
# Storage already uploaded (Day 4)
# No app update needed! (hot content via Supabase)

# Verify production
curl https://api.supasnake.com/dynasties
# Should include SHADOW in response
```

### Step 2: In-Game Notification

**Push Notification**:
```
"NEW DYNASTY: Shadow has emerged from the void!
Unlock ethereal shadow snakes in the Collection Lab."
```

**In-Game Banner**:
- Display on app launch: "SHADOW DYNASTY NOW AVAILABLE"
- Direct link to Collection Lab > SHADOW tab

**Timeline**: Day 7 (2 hours) for deployment and announcements

---

## Checklist Summary

**Day 1-2**: ✅ Midjourney art generation (50-100 concepts → 10 final variants)
**Day 3**: ✅ Database insert (1 dynasty row + 10 variant rows)
**Day 4**: ✅ Supabase Storage upload (10 PNG files to CDN)
**Day 5**: ✅ 3D shader creation (Blender shader + particle system)
**Day 6**: ✅ Testing (backend, UI, 3D, breeding)
**Day 7**: ✅ Deployment (no app update) + announcement

**Result**: +1 dynasty, +10 variants, sustainable monthly cadence

---

## Tips for Success

**Midjourney Prompt Refinement**:
- Test prompts extensively (50+ images)
- Ensure visual progression (Common → Legendary)
- Maintain dynasty theme consistency

**Database Design**:
- Use consistent naming (lowercase: 'shadow', not 'SHADOW')
- Set `is_active = true` only when ready to go live
- Test on staging environment first

**3D Shader Balance**:
- Don't overdo particles (performance impact)
- Ensure shader looks good in gameplay (not just screenshots)
- Test on mid-range devices

**Deployment**:
- Deploy during low-traffic hours (3-5am local time)
- Have rollback plan (set `is_active = false` if issues)
- Monitor analytics for first 24 hours

---

## See Also

**Dynasty Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md
**Art Pipeline**: @knowledge_base/game/quick_ref/art_pipeline.md
**Create Variant Art**: @knowledge_base/game/how_to/create_variant_art.md
