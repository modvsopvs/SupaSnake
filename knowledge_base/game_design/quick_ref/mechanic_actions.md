# Actions Mechanic - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 12

## Core Concept

Actions are the "verbs" of game mechanics. Basic actions are what players can physically do. Strategic actions are higher-level moves that use basic actions to achieve goals. The ratio of strategic to basic actions indicates emergent gameplay depth - elegant games have few basic actions but many strategic possibilities.

## Key Points

**Two Types of Actions:**
- **Basic Actions:** Direct player inputs (move, jump, shoot)
- **Strategic Actions:** Meaningful combinations toward goals (flanking, baiting, controlling space)

**Emergent Gameplay (5 Tips):**
1. Add more verbs (but keep elegant - quality over quantity)
2. Verbs that act on many objects (gun shoots enemies, locks, windows)
3. Goals achievable multiple ways (defeat boss = shoot OR drop chandelier OR avoid)
4. Many subjects (multiple pieces that can coordinate)
5. Side effects that change constraints (every move changes board state)

**Action Gap:**
- Games have fewer verbs than stories
- Must simulate actions on the fly
- Strategic actions bridge this gap
- Innovative games introduce new action types

## Application to SupaSnake

**SupaSnake Basic Actions:**
1. **Move snake** (swipe or tap direction)
2. **Eat DNA** (automatic when moving over DNA)
3. **Pull gacha** (Collection Lab - spend DNA)
4. **Breed snakes** (Breeding Lab - combine variants)

**SupaSnake Strategic Actions:**
1. **Combo chaining** - Eat multiple DNA in sequence without pausing (risk management)
2. **Perfect runs** - Complete level without hitting walls (skill showcase)
3. **DNA farming** - Optimize routes for maximum collection per minute
4. **Variant targeting** - Save DNA for specific dynasty gacha
5. **Generation planning** - Breed strategically for G1/G2/G3 progression
6. **Risk vs safety** - Chase high-value DNA spawns vs safe collection
7. **Energy management** - When to play vs when to wait for regen
8. **Dynasty specialization** - Focus on one dynasty vs complete all three

**Emergent Gameplay in SupaSnake:**
- Basic action count: 4 (intentionally minimal for mobile)
- Strategic action count: 8+ (excellent ratio ~2:1)
- **Emergence sources:**
  - Move action works on DNA, food, and space itself
  - Goals achievable multiple ways (complete collection via gacha OR breeding)
  - Multiple snakes in collection (coordinate dynasty progression)
  - Snake growth changes board constraints (longer snake = tighter navigation)

**Action Innovation:**
- Classic Snake: Move + Eat (2 basic actions)
- SupaSnake: Move + Eat + Gacha + Breed (4 basic actions)
- New strategic depth comes from collection/breeding systems, not just movement

## Modern Mobile Context (2020 Edition)

**Schell's 2020 Updates:** Discusses massively multiplayer games expanding verb count, text adventures' verb discovery challenges
**SupaSnake Specific:** Mobile F2P design constrains basic actions (touch controls limit complexity) but expands strategic actions through metagame systems (collection, breeding, energy). Classic Snake movement + modern collection mechanics = simple to learn, deep to master.

## See Also

- **How-To:** @knowledge_base/game_design/how_to/balance_supasnake_mechanics.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/core_snake_game.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/breeding_lab.md
- **Lens:** Lens #30 (Emergence), Lens #31 (Action) from Chapter 12
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_12_mechanics_summary.md
