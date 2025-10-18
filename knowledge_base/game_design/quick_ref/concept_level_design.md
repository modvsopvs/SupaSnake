# Level Design - Quick Reference

## Core Concept

Level design orchestrates player experience through spatial organization, navigation flow, and progressive disclosure. In mobile games like SupaSnake, "levels" are UI screens and navigation paths—each Lab is a level in the meta-game of snake collection and breeding.

## Key Principles

**Player Flow**
- Linear: Single path (Evolution Lab sequence)
- Branching: Multiple paths (Collection Lab exploration)
- Hub: Central space with spoke access (Main menu to Labs)
- Network: Interconnected areas (Lab-to-Lab navigation)

**Level Design Goals (Schell's Framework)**
1. **Guide the player** (clear next steps, minimize confusion)
2. **Create interest** (variety, surprise, discovery)
3. **Tell a story** (progression reveals narrative)
4. **Support abilities** (UI enables all player actions)
5. **Present challenge appropriately** (complexity scales with mastery)

**Landmarks and Wayfinding**
- Visual anchors help players know where they are
- Consistent UI patterns across Labs (navigation bar)
- Color coding per Lab (Collection = blue, Breeding = purple, Evolution = gold)
- Memorable visual moments (special animations, celebrations)

## SupaSnake Navigation Architecture

**Hub-and-Spoke Model**
```
Main Menu (Hub)
├── Collection Lab (Gallery level)
├── Breeding Lab (Workshop level)
├── Evolution Lab (Chamber level)
└── Classic Game (Action level)
```

**Within-Lab Navigation**
- Collection Lab: Grid/carousel browsing (open exploration)
- Breeding Lab: Linear workflow (select → select → combine)
- Evolution Lab: Focused single-entity interaction
- Each Lab has clear entry/exit transitions

## Mobile-Specific Considerations

**Thumb Zones**
- Critical actions in comfortable reach zones
- Bottom third of screen for primary actions
- Top for navigation/context (less critical)

**Progressive Disclosure**
- Don't overwhelm with all options at once
- Collection Lab: Show subset, reveal more on scroll
- Breeding Lab: Step-by-step revelation
- Evolution Lab: Gradual option expansion

**Spatial Memory**
- Consistent placement builds muscle memory
- "Back" always in same location
- Primary action button in predictable spot
- Filter/sort controls in expected positions

## Design Patterns

**Good Level Design (Mobile UI)**
- Clear visual hierarchy
- Maximum 3-4 navigation choices per screen
- Obvious interactive elements
- Smooth transitions between spaces
- Consistent spatial logic

**Poor Level Design (Mobile UI)**
- Cluttered screens (too many options)
- Hidden navigation (mystery meat)
- Inconsistent layouts between similar screens
- Disorienting transitions
- No clear path forward

## SupaSnake Application

Each Lab as a Level:
- **Entry point**: Recognizable, welcoming
- **Main space**: Purpose-aligned layout
- **Sub-areas**: Detail views, selection interfaces
- **Exit/completion**: Clear success state, natural return to hub

**See Also:**
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_space_design.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_architectural_design.md
- **How-To**: @knowledge_base/game_design/how_to/design_lab_spaces.md
- **Reference**: @knowledge_base/game_design/reference/batch3_chapters/chapter_21_spaces_summary.md
- **Game Docs**: @knowledge_base/game/quick_ref/lab_ui.md
