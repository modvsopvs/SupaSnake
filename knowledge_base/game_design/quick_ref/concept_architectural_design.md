# Architectural Design - Quick Reference

## Core Concept

Architectural design applies principles from physical architecture to game spaces, creating environments that are both functional and emotionally resonant. Christopher Alexander's pattern language provides a framework for designing spaces that feel right—applicable to both 3D worlds and 2D mobile interfaces.

## Christopher Alexander's Influence

**A Pattern Language**
Alexander's work identifies timeless design patterns that create harmonious, livable spaces. Key patterns applicable to game UI:

- **Entrance Transition**: Prepare users for new context
- **Light on Two Sides**: Avoid visual monotony, create depth
- **Alcove**: Special places for focused activity
- **Sequence of Sitting Spaces**: Comfortable flow through areas
- **Things from Your Life**: Personal connection to space

**Application to Mobile UI**
Though abstract, these patterns translate to screen design:
- Visual variety prevents flatness
- Special UI moments create memorable alcoves
- Navigation flow mimics comfortable movement
- Personalization (your collection) creates ownership

## Emotional Architecture

**Spaces Communicate Feeling**
- **Vast spaces**: Freedom, possibility, sometimes overwhelming
- **Intimate spaces**: Focus, safety, sometimes confining
- **Vertical spaces**: Aspiration, challenge, hierarchy
- **Horizontal spaces**: Exploration, equality, wandering

**SupaSnake Lab Emotions**
- Collection Lab: Pride, abundance, completeness
- Breeding Lab: Creativity, anticipation, experimentation
- Evolution Lab: Power, transformation, achievement

## Design Elements

**Scale and Proportion**
- Snake size relative to screen communicates importance
- Grid size affects perceived abundance vs scarcity
- Button size establishes action hierarchy
- Whitespace creates breathing room or tension

**Materials and Texture**
- Visual materials convey Lab identity
- Collection Lab: Clean, gallery-like (white/light blue)
- Breeding Lab: Experimental, creative (purple gradients)
- Evolution Lab: Mysterious, powerful (gold/dark)

**Lighting and Color**
- Brighter = welcoming, accessible
- Darker = mysterious, advanced, special
- Color temperature affects mood
- Consistent lighting per Lab creates identity

## Organizing Principles

**Focal Points**
Every space needs a visual anchor:
- Collection Lab: Featured snake or achievement
- Breeding Lab: Combination preview area
- Evolution Lab: The snake being evolved

**Symmetry vs Asymmetry**
- Symmetrical: Stable, formal, predictable
- Asymmetrical: Dynamic, interesting, natural
- SupaSnake uses balanced asymmetry (visual interest within stable framework)

**Paths and Barriers**
- Open paths: Encourage exploration (Collection Lab)
- Guided paths: Direct toward goal (Breeding Lab workflow)
- Soft barriers: Visual boundaries without hard blocks
- Clear affordances: What's clickable vs decorative

## Mobile-Specific Architecture

**Screen as Room**
- Each screen is a designed space
- Corners and edges are walls
- Center is main floor space
- Top/bottom are ceiling/floor (navigation zones)

**Transitions as Doorways**
- Slide transitions: Moving between adjacent rooms
- Fade transitions: Teleporting to different context
- Modal overlays: Temporary room within room
- Tab switches: Rooms within same building

## Design Checklist

Good architectural design in mobile UI:
- **Clear purpose**: Space function is obvious
- **Comfortable proportions**: Not cramped or empty
- **Visual hierarchy**: Eyes naturally flow to important elements
- **Emotional resonance**: Space feels appropriate to function
- **Memorable identity**: Each space is distinctive
- **Ease of navigation**: Movement feels natural

**See Also:**
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_space_design.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_level_design.md
- **How-To**: @knowledge_base/game_design/how_to/design_lab_spaces.md
- **Reference**: @knowledge_base/game_design/reference/batch3_chapters/chapter_21_spaces_summary.md
- **Game Docs**: @knowledge_base/game/quick_ref/lab_ui.md
