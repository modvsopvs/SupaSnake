# Objects Mechanic - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 12

## Core Concept

Objects are the "nouns" of game mechanics - characters, props, tokens, anything that can be seen or manipulated. Each object has attributes (categories of information) with states (current values). Dynamic attributes change during gameplay and drive meaningful gameplay decisions.

## Key Points

**Object Structure:**
- Objects have attributes (speed, health, position)
- Each attribute has a state (current value)
- States can be static (never change) or dynamic (change during play)

**State Machines:**
- Diagram possible states and transitions
- Prevents illegal state changes
- Critical for complex behaviors (AI, power-ups, modes)

**Information Design:**
- If objects behave the same, they should look the same
- If objects behave differently, they should look different
- State changes should be communicated clearly to players

## Application to SupaSnake

**Core Objects:**

1. **Snake (player avatar)**
   - Position attribute: (x, y) grid coordinates
   - Length attribute: Number of body segments
   - Direction attribute: Up, down, left, right
   - Alive/dead state: Boolean

2. **DNA (collectible currency)**
   - Position: Fixed grid cell
   - Value: 1 DNA (may vary by rarity later)
   - Collected state: True/false

3. **Variant Snakes (collection items)**
   - Dynasty: Viper, Serpent, or Naga
   - Rarity: Common (10%), Rare (1%), Mythic (0.1%)
   - Generation: G0-G3 (breeding tier)
   - Owned state: In collection or not

4. **Food (spawn triggers)**
   - Position: Random grid cell
   - Active state: Available or consumed

**State Machine Example (Snake):**
```
[Moving] → Eat DNA → [Growing] → Complete growth → [Moving]
[Moving] → Hit wall/self → [Dead] → Respawn → [Moving]
[Moving] → Collect variant → [Moving] (no state change, external event)
```

**Visual Feedback:**
- Different dynasty snakes have distinct visual styles
- Rarity indicated by color/effects (common=normal, rare=shimmer, mythic=glow)
- DNA count displayed prominently (HUD)
- Collection Lab shows owned vs missing variants (greyscale for locked)

## Modern Mobile Context (2020 Edition)

**Schell's 2020 Updates:** Discusses state machines with Pac-Man ghost AI as example
**SupaSnake Specific:** Mobile F2P games need clear object state communication (what's owned, what's achievable, what's locked behind progression). Collection Lab UI must show all states at a glance.

## See Also

- **How-To:** @knowledge_base/game_design/how_to/balance_supasnake_mechanics.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/collection_lab.md
- **Lens:** Lens #28 (State Machine) from Chapter 12
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_12_mechanics_summary.md
