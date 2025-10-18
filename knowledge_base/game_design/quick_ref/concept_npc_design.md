# NPC Design - Quick Reference

**Source**: The Art of Game Design (Schell), Chapter 20

## Core Concept

NPCs (Non-Player Characters) populate game worlds and serve various functions - from providing information to creating emotional connections. In SupaSnake, "NPCs" are the snake variants themselves - characters player interacts with but doesn't directly control during gameplay.

## NPC Functions (Applied to Variants)

**Traditional NPC Roles:**
1. **Information Source**: Variants teach about dynasties through design
2. **World Building**: Variants populate and define dynasty worlds
3. **Emotional Connection**: Players form attachments to favorite variants
4. **Goals**: Rare variants serve as collection objectives
5. **Obstacles**: Hard-to-breed variants create challenges

## SupaSnake's Unique NPC Model

**Variants as Collectible NPCs:**
- **Not Controlled**: Players don't "play as" individual snakes (unlike avatar games)
- **Observed**: Players watch variants in collection, breeding, animations
- **Collected**: Players pursue specific variants like befriending NPCs
- **Related To**: Breeding creates familial relationships between variants

**The Pokémon Parallel:**
- Pokémon are collectible creatures with personalities
- SupaSnake variants = collectible snakes with visual personalities
- Difference: No battles, focus purely on collection and breeding

## NPC Character Depth Levels

**Schell's NPC Depth Scale (Applied to Variants):**

| Depth Level | Implementation | SupaSnake Example |
|-------------|---------------|-------------------|
| **Cardboard** | Pure function, no personality | N/A - all variants have character |
| **Functional** | Basic personality, serves purpose | Common variants - clear dynasty identity |
| **Realized** | Distinct personality, memorable | Uncommon/Rare - unique designs, implied backstory |
| **Deep** | Complex character, emotional depth | Epic/Legendary - rich visual storytelling, player aspiration |

**Design Target:**
- Commons/Uncommons: **Functional** depth (clear personality, dynasty appropriate)
- Rares: **Realized** depth (memorable, distinct character)
- Epics/Legendaries: **Deep** depth (emotional resonance, complex design)

## Personality Without Dialogue

**Visual Personality Cues:**

**Eyes/Expression:**
- Fierce eyes = aggressive character
- Soft eyes = gentle character
- Glowing eyes = mysterious/powerful
- Hidden eyes = secretive character

**Body Language:**
- Coiled = defensive/cautious
- Extended = confident/bold
- Curved = playful/friendly
- Rigid = serious/formal

**Accessories/Details:**
- Crown/horns = leadership/authority
- Scars/wear = battle-hardened veteran
- Ornate patterns = important/special
- Simple design = pure/essential

**Color Palette:**
- Bright colors = energetic/approachable
- Dark colors = serious/powerful
- Iridescent = mysterious/magical
- Earthy tones = grounded/ancient

## Creating Variant Personality

**The Personality Formula:**
1. **Dynasty Foundation**: Base personality on dynasty identity
2. **Rarity Amplification**: Higher rarity = stronger personality expression
3. **Unique Hook**: One distinctive feature that defines character
4. **Consistent Details**: All elements support same personality

**Example Process - Designing "Neon Serpent" (CYBER Rare):**

1. **Dynasty**: CYBER (tech, digital, modern)
2. **Personality Concept**: Energetic, flashy, attention-seeking
3. **Visual Hook**: Pulsing neon strips along body
4. **Supporting Details**:
   - Bright cyan/magenta colors (high energy)
   - Circuit patterns flow like motion
   - Slightly oversized head (eager, curious)
   - Glowing eyes (alert, aware)
   - Smooth, sleek body (fast, modern)
5. **Behavioral Hints**:
   - Idle animation: Neon pulses like heartbeat
   - Movement: Quick, darting motions
   - Breeding: Eager, excited particle effects
   - Collection pose: Front-and-center, showing off

**Result**: Player perceives energetic, modern, attention-loving character without reading any text

## NPC Relationships in Collection

**Variant-to-Variant Implied Relationships:**

**Family Bonds:**
- Bred variants are "children" of parents
- Players track lineage, see family resemblance
- Multi-generation breeding creates "family trees"

**Dynasty Kinship:**
- Pure dynasty variants are "from same world"
- Hybrids are "outsiders" or "bridge characters"
- Completing dynasty = reuniting the "family"

**Rarity Hierarchy:**
- Legendaries = "leaders" or "gods" of dynasties
- Commons = "citizens" or "everyday folk"
- Players aspire to "meet" (unlock) higher-tier variants

**Emotional Bonds:**
- First variant = "starter companion"
- Favorite variant = "best friend"
- Hardest to breed = "earned respect"
- Perfect IV variant = "true companion"

## Design Strategies for Collectible NPCs

**Make Every Variant Count:**
- Even commons deserve personality
- Avoid throwaway/filler designs
- Players should want to keep all variants, not just legendaries

**Differentiation:**
- Each variant should be distinct from others in same rarity/dynasty
- No "palette swap" variants (lazy design)
- Unique silhouette or feature per variant

**Aspiration:**
- Higher rarity = more aspirational character
- Legendaries should feel worth 6-12 hour pursuit
- Design should justify rarity difficulty

**Player Projection:**
- Leave room for player interpretation
- Implied personality > explicit backstory
- Players assign meaning through collection journey

## Quick Facts

- **Variants = Silent NPCs**: Express personality through design, not dialogue
- **Collection = NPC Roster**: Players build relationship with each variant through pursuit and breeding
- **Personality Hierarchy**: Rarer variants have deeper, more complex character design
- **No Direct Control**: Players observe and collect variants, don't control them (different from avatar games)

## Design Questions

- What personality does this variant project at first glance?
- How is this variant's character different from similar variants?
- What emotional response do I want when player unlocks this variant?
- Does visual design support intended personality?
- Would player remember this variant a week later?

## Common Pitfalls

- Treating variants as pure mechanics (ignoring character)
- Inconsistent personality between visual and behavior
- All variants feeling same within rarity tier
- Legendary variants that don't feel special enough
- Overdesigning commons (should be approachable)

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_character_design.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_character_relationships.md
- **How-To**: @knowledge_base/game_design/how_to/design_variants_as_characters.md
- **Reference**: @knowledge_base/game_design/reference/batch3_chapters/chapter_20_characters_summary.md
