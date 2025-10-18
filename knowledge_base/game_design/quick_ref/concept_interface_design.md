# Interface Design - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 15

## Core Concept

Interface is the membrane between player and game world. Good interface makes players feel in control, becomes invisible with practice (transparency), and consists of six data flows: Physical Input → World, World → Physical Output, Physical Input → Virtual Interface, Virtual Interface → World, World → Virtual Interface, Virtual Interface → Physical Output. Goal: players feel powerful and immersed.

## Key Components

**Physical Interface:** What player touches (phone touchscreen, swipe gestures)
**Virtual Interface:** On-screen UI elements (score displays, buttons, menus)
**Mapping:** How inputs translate to actions (swipe left → snake moves left)
**Feedback Loop:** Continuous information flow (player acts → game responds → player acts)
**Modes:** Changes in mapping (Classic Mode vs Collection Lab mode)

## Interface Design Process

1. **List & Prioritize Information** - What must player see every moment? Occasionally?
2. **List Channels** - Where can info go? (Top of screen, avatar, sound effects, border)
3. **Map Info to Channels** - Match important info to best channels
4. **Review Dimensions** - Each channel has multiple dimensions (color, size, position, sound)

## Application to SupaSnake

**Physical Interface (Touch):**
- Swipe gestures control snake (primal, no buttons needed)
- Tap to select variants in Collection Lab
- No controller clutter on screen (full-screen Snake grid)

**Virtual Interface (Minimal):**
- DNA counter (top corner - glanceable)
- Energy bar (bottom - shows session limit)
- Variant preview (center when collected - brief celebration)
- No HUD clutter during gameplay (transparency)

**Feedback Loops:**
- Swipe → Snake turns immediately (<0.1s response - tenth-second rule)
- Collect DNA → Number popup + sound effect (juicy)
- Unlock variant → Celebration animation + Collection Lab update
- Hit wall → Game over + score display + retry option

**Modes (Distinct Visuals):**
- **Classic Mode:** Dark grid, neon snake, DNA orbs floating
- **Collection Lab:** Bright UI, Panini book aesthetic, tap-based navigation
- **Breeding Lab:** Lab equipment visuals, combination interface
- Each mode looks completely different (Mode Tip #3)

## Mobile Touch Interface Principles

**Primality:** Touch is primal (300+ million years old vs 3 million for tool use)
- Swipe to move = direct manipulation (not tool-mediated)
- Tap to select = primal touch interaction
- No abstract controller metaphors

**Transparency:** Interface disappears with practice
- After 3 rounds, Emma doesn't think "swipe left" - she just moves
- Controls become second nature
- Full immersion in Snake gameplay

## Design Tips for SupaSnake

1. **Steal (Top-Down):** Copy Snake classics for movement, innovate on collection/breeding UI
2. **Design Around Touch:** Swipe = movement (not d-pad emulation)
3. **Theme Interface:** Collection Lab uses Panini book aesthetic (unification)
4. **Sound Maps to Touch:** DNA collect sound simulates tactile "pick up" feeling
5. **Balance Simplicity with Layers:** Classic gameplay simple, Collection/Breeding in separate modes

## See Also

- **How-To:** @knowledge_base/game_design/how_to/design_mobile_touch_interface.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/lab_ui.md
- **SupaSnake Ref:** @knowledge_base/game/how_to/create_react_native_screens.md
- **Lenses:** Lens #59 (Control), Lens #60 (Physical Interface), Lens #61 (Virtual Interface), Lens #62 (Transparency), Lens #63 (Feedback), Lens #64 (Juiciness), Lens #65 (Primality)
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_15_interface_summary.md
