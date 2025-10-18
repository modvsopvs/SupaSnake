# Space Mechanic - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 12

## Core Concept

Space is the "magic circle" where gameplay happens - the mathematical construct of where things exist and how places relate. Stripped of aesthetics, game spaces can be discrete or continuous, have different dimensions, and feature bounded or connected areas.

## Key Points

**Discrete vs Continuous:**
- Discrete: Specific positions matter (grid cells, board squares)
- Continuous: Precise position matters (pool table, soccer field)

**Dimensionality:**
- Can be 0D (single point), 1D (line), 2D (plane), or 3D (volume)
- Same game can be viewed different ways depending on design needs

**Nested Spaces:**
- Spaces within spaces (outdoor map with interior dungeons)
- Matches mental models (inside/outside separation)

## Application to SupaSnake

**SupaSnake uses discrete 2D space:**
- Grid: 15×20 cells (discrete positions)
- Snake head occupies one cell at a time
- Movement: 4 directions (up, down, left, right) between adjacent cells
- DNA pickups spawn at specific grid coordinates
- Collision: Happens when two objects occupy same cell

**Why discrete works for SupaSnake:**
- Mobile touch controls benefit from snap-to-grid movement
- Clear hit detection for collision (no pixel-perfect timing needed)
- Predictable for skill-based play (players know exact snake position)
- Classic Snake tradition (honors the original game's design)

**Functional space diagram:**
```
Each cell = 0D point
Connected in 2D grid (15 wide × 20 tall)
Boundaries: Walls on all four sides
```

## Modern Mobile Context (2020 Edition)

**Schell's 2020 Examples:** Uses tic-tac-toe, chess, Monopoly board as discrete space examples
**SupaSnake Specific:** Mobile screens are continuous pixels, but we implement discrete grid for gameplay clarity. Classic Snake proves discrete space works perfectly on touch devices.

## See Also

- **How-To:** @knowledge_base/game_design/how_to/balance_supasnake_mechanics.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/core_snake_game.md
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_12_mechanics_summary.md
