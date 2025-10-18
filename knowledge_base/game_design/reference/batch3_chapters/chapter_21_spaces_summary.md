# Chapter 21: Spaces - Summary

**Source**: The Art of Game Design (3rd Edition, 2020) by Jesse Schell
**Chapter Focus**: Level design, architectural design, and spatial organization in games

---

## Core Concepts

### Game Spaces as Designed Environments

Schell emphasizes that game spaces are not merely containers for gameplay—they are carefully designed environments that communicate meaning, guide player behavior, and create emotional experiences. Whether designing a 3D world or a 2D mobile interface, spatial design principles apply universally.

**Key Insight**: Architecture is a form of communication. The organization, scale, materials, and flow of a space tell players what to do and how to feel without explicit instruction.

### Christopher Alexander's Pattern Language

Schell extensively references Christopher Alexander's "A Pattern Language" (1977), a seminal work in architecture that identifies timeless design patterns for creating harmonious, livable spaces. Alexander's work, originally about physical buildings, provides powerful frameworks for game designers.

**Selected Patterns Applicable to Games:**

1. **Entrance Transition**: Create a boundary experience when moving from outside to inside a space. In games, this means transition moments when entering new areas—visual or audio cues that prepare players for a context shift.

2. **Light on Two Sides**: Rooms feel better with windows on more than one wall. In games, avoid visual monotony—provide variety in viewing angles, lighting sources, or visual interest from multiple directions.

3. **Sequence of Sitting Spaces**: A series of comfortable spaces creates better flow than one large room. In game UI, this translates to breaking complex interactions into a sequence of focused steps.

4. **Alcove**: A partially enclosed space within a larger space creates special moments. Games use alcoves for focus—shops, challenge areas, or important NPCs positioned in distinct sub-spaces.

5. **Things from Your Life**: Spaces feel personal when they contain objects meaningful to inhabitants. Games create ownership through customization, player-created content, or persistent player items.

**Application to Mobile UI**: Though abstract, these patterns guide interface design. A menu system with clear entry points (entrance transition), visual variety (light on two sides), step-by-step workflows (sequence of sitting spaces), and personalized content (things from your life) feels more coherent and comfortable than a flat, undifferentiated interface.

---

## Level Design Goals

Schell outlines five primary goals for level design that apply across game types and platforms:

### 1. Guide the Player

**Principle**: Players should know where to go and what to do next without frustration.

**Techniques:**
- **Landmarks**: Memorable visual elements that aid wayfinding
- **Visual flow**: Leading lines, lighting, and color that direct attention
- **Breadcrumbs**: Trails of collectibles or clues pointing the way
- **Natural paths**: Clear routes vs blocked areas
- **Tutorials integrated into space**: Level geometry teaches mechanics

**Mobile Application**: In SupaSnake's Labs, visual hierarchy, clear call-to-action buttons, and consistent navigation patterns guide players without explicit instruction.

### 2. Create Interest

**Principle**: Spaces should be varied, surprising, and engaging.

**Techniques:**
- **Rhythm and pacing**: Alternate between open and confined spaces
- **Visual variety**: Different textures, colors, architectural styles
- **Secrets and discovery**: Hidden areas reward exploration
- **Environmental storytelling**: Details that imply history or context
- **Dynamic elements**: Moving parts, changing conditions

**Mobile Application**: Collection Lab (open browsing), Breeding Lab (focused workflow), and Evolution Lab (dramatic transformation) each offer distinct spatial experiences, creating variety within the game.

### 3. Tell a Story

**Principle**: Spaces can convey narrative without words.

**Techniques:**
- **Environmental narrative**: Destroyed environments tell of past battles
- **Progression in architecture**: Simple to complex = journey
- **Visual metaphors**: Prison breaks mean actual prison geometry
- **Backstory through details**: Found objects, graffiti, wear patterns

**Mobile Application**: Lab design tells story of progression—Collection (basic), Breeding (intermediate), Evolution (advanced). Visual metaphors (gallery, workshop, chamber) communicate function instantly.

### 4. Support the Player's Abilities

**Principle**: Level design should enable and showcase player skills.

**Techniques:**
- **Platformer**: Platforms at jump distances that feel good
- **Shooter**: Cover placement enabling tactical decisions
- **Puzzle**: Space organized to make logic problems clear
- **Mobile**: Touch targets sized for thumbs, information at comfortable reading distance

**Mobile Application**: One-handed thumb zones in SupaSnake Labs place primary actions within comfortable reach. Grid sizes in Collection Lab optimized for browsing efficiency.

### 5. Present Challenge Appropriately

**Principle**: Difficulty should feel fair and scale with player mastery.

**Techniques:**
- **Graduated difficulty**: Early levels teach, later levels test
- **Visible challenge**: Players can see what's ahead and prepare
- **Checkpoints**: Failure doesn't erase too much progress
- **Multiple approaches**: Different player skills have viable paths

**Mobile Application**: Evolution Lab locked initially (prevents overwhelm), DNA costs scale with player progression, breeding challenges increase complexity as collection grows.

---

## Types of Level Organization

Schell categorizes level structures:

### Linear Levels
**Structure**: Single path from start to finish
**Examples**: Classic platformers, on-rails shooters
**Pros**: Controlled pacing, clear progression, focused experience
**Cons**: Limited freedom, reduced replayability

### Branching Levels
**Structure**: Multiple paths, player chooses route
**Examples**: RPG quest lines, strategy game campaigns
**Pros**: Player agency, replayability, personalization
**Cons**: Development cost (more content), balancing difficulty across paths

### Hub Worlds
**Structure**: Central area with spokes to sub-levels
**Examples**: Super Mario 64, Crash Bandicoot
**Pros**: Player freedom within structure, clear progression visualization, return to familiar space
**Cons**: Can feel disconnected if hub lacks identity

**SupaSnake Application**: Hub-and-spoke model (Main Menu → Labs). Each Lab is a distinct "level" in the meta-game.

### Open Worlds
**Structure**: Fully interconnected, exploration-driven
**Examples**: Skyrim, Breath of the Wild, GTA
**Pros**: Maximum freedom, emergent gameplay, deep immersion
**Cons**: Can overwhelm, requires massive content, risk of aimlessness

### Network Levels
**Structure**: Interconnected areas with multiple access points
**Examples**: Metroidvanias (unlocking shortcuts), Dark Souls
**Pros**: Rewards mastery, deep interconnection, satisfying unlocks
**Cons**: Confusing navigation, complex to design and balance

---

## Architectural Design Principles

### Scale and Proportion

**Human Scale**: Spaces feel comfortable when sized appropriately to the player character. Too large = insignificance, too small = claustrophobia.

**Mobile Scale**: UI elements sized for touch (minimum 44x44 points), text readable at arm's length, information density appropriate to screen size.

**Monumental Scale**: Occasionally, intentionally oversized elements create awe or intimidation (boss arenas, grand vistas).

### Materials and Texture

**Visual Communication**: Materials tell players about space function and safety.
- Stone = permanent, safe, important
- Wood = temporary, common, rustic
- Metal = industrial, modern, mechanical
- Glass = fragile, transparent, modern
- Organic = natural, alive, unpredictable

**Mobile Application**: Visual materials define Lab identity—Collection Lab (clean, light), Breeding Lab (experimental, gradient), Evolution Lab (mysterious, gold/dark).

### Lighting

**Emotional Impact**:
- Bright lighting = safe, open, welcoming
- Dim lighting = dangerous, mysterious, tense
- Directional light = drama, focus
- Ambient light = calm, even mood
- Colored light = specific emotion (red = danger, blue = cold/tech)

**Mobile Application**: Lighting as visual polish—shadows on cards, glow effects on rare items, lighting shifts between Labs create distinct moods.

### Symmetry vs Asymmetry

**Symmetrical Spaces**: Formal, stable, predictable, monumental (temples, palaces)
**Asymmetrical Spaces**: Natural, dynamic, interesting, organic (forests, towns)

**Balance**: Games often use balanced asymmetry—overall stability with local variety for visual interest.

---

## Spatial Storytelling

### Revealing History Through Space

Spaces can imply what happened before the player arrived:
- Battlefields show signs of combat (craters, debris)
- Abandoned areas show former habitation (furniture, belongings)
- Progression shows change over time (decay, growth, construction)

### Foreshadowing Through Architecture

Players learn what's coming by observing spaces:
- Locked doors imply keys to find
- Boss arena architecture telegraphs fight mechanics
- Environmental hazards preview challenges
- Visual progression shows journey length

### Player-Created Narrative

Spaces gain meaning through player actions:
- Paths worn into grass show player choices
- Destruction left behind shows player power
- Customized spaces reflect player personality
- Historical markers (bloodstains, corpses) show past attempts

---

## Mobile-Specific Spatial Considerations

While Schell's book predates many modern mobile conventions, principles adapt:

### Screen as Space

Each screen is a designed environment:
- **Top**: Navigation, context (less critical info)
- **Middle**: Content, focal area
- **Bottom**: Actions, controls (thumb zone)
- **Edges**: Boundaries, frame for content

### Transitions as Doorways

Movement between screens mimics architectural transitions:
- **Slide**: Moving between adjacent rooms (lateral navigation)
- **Fade**: Teleporting to different space (context switch)
- **Zoom**: Entering detail from overview (focus change)
- **Modal**: Temporary room within room (overlay)

### Information Architecture as Building Layout

Navigation structure follows architectural logic:
- **Lobby**: Main menu (entry, orientation, distribution)
- **Corridors**: Navigation paths (collections, menus)
- **Rooms**: Functional spaces (Labs, minigames)
- **Closets**: Detail views (individual items, stats)

---

## Lens Applications to SupaSnake

### Lens #78: The Lens of Moments

Schell asks: What are the memorable moments in my game, and how can I create more?

**SupaSnake Applications**:
- Rare variant reveal (breeding moment)
- Collection completion (achievement moment)
- First evolution (power moment)
- High score celebration (mastery moment)

Each Lab should create specific moment types through spatial design—Breeding Lab creates anticipation and surprise, Evolution Lab creates power fantasy, Collection Lab creates pride.

### Lens #79: The Lens of Freedom

Schell asks: When do players feel free, and when constrained? Are constraints productive?

**SupaSnake Applications**:
- Collection Lab: Maximum freedom (browse any order)
- Breeding Lab: Guided freedom (clear workflow, but experimental choices)
- Evolution Lab: Focused freedom (single snake, but meaningful options)
- Constraints (DNA cost, dynasty compatibility) create meaningful choices

### Additional Spatial Lenses

**Lens of Flow**: Does the space create smooth progression or jarring interruptions?
**Lens of Clarity**: Can players understand the space without explanation?
**Lens of Comfort**: Does navigation feel natural or awkward?
**Lens of Identity**: Does each space have distinct character?

---

## Key Takeaways for SupaSnake

1. **Each Lab is an Architectural Space**: Collection Lab (gallery), Breeding Lab (workshop), Evolution Lab (chamber)—each with distinct identity, materials, lighting, and emotional tone.

2. **Christopher Alexander's Patterns Apply to UI**: Entrance transitions prepare players, sequence of sitting spaces creates comfortable workflows, alcoves highlight special moments, light on two sides prevents visual monotony.

3. **Level Design Goals Guide Lab Design**:
   - Guide: Clear visual hierarchy, obvious next actions
   - Interest: Variety between Labs, surprises in breeding
   - Story: Progression from collection to evolution tells mastery journey
   - Support: UI enables all player abilities (browse, breed, evolve)
   - Challenge: Complexity scales with player growth

4. **Hub-and-Spoke Structure**: Main Menu hub with Lab spokes provides player freedom within structure, clear progression visualization.

5. **Mobile Screens as Rooms**: Each screen designed as coherent space with purpose, focal point, comfortable proportions, and natural navigation.

6. **Spatial Storytelling**: Lab design communicates function without explanation—gallery layout says "browse," workshop layout says "create," chamber layout says "transform."

7. **Memorable Moments Through Space**: Design specific moments into each Lab—Breeding creates anticipation and surprise, Evolution creates power, Collection creates pride.

---

**See Also:**
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_space_design.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_level_design.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_architectural_design.md
- **How-To**: @knowledge_base/game_design/how_to/design_lab_spaces.md
- **Reference**: @knowledge_base/game_design/reference/batch3_chapters/chapter_22_presence_summary.md
