# Puzzle Design - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 14

## Core Concept

Puzzles are games with a dominant strategy - problem-solving activities that make players stop and think. Unlike replayable games, once you solve a puzzle and find the winning approach, it ceases to be fun. Modern games integrate puzzles seamlessly into gameplay rather than presenting them as explicit obstacles.

## Key Points

- **Puzzle Definition:** "A puzzle is a game with a dominant strategy" - it's a problem designed to be solved once
- **Modern Integration:** Best puzzles are woven into game environments, not separate challenges (compare The 7th Guest's incongruous puzzles vs Zelda's environmental puzzles)
- **Good Puzzles Have:** Clear goals, easy starting point, visible progress, sense of solvability, gradual difficulty increase
- **Parallelism Prevents Frustration:** Multiple parallel puzzles let players rest from one while working on another
- **Walk-Throughs Don't Kill Puzzles:** Players still enjoy solving with hints rather than being completely stuck

## Application to SupaSnake

**Snake Gameplay Puzzles:**
- Each round presents mini-puzzle: optimal path to collect maximum DNA while avoiding walls/self
- Strategic decisions: Which variant to target first? When to risk close calls for rare variants?
- Pattern recognition: Learning spawn locations, timing enemy movements

**Collection Lab Puzzles:**
- Breeding puzzle: Which dynasties to combine for desired traits?
- Resource optimization: Limited DNA means choosing which variants to unlock first
- Completion puzzle: Filling Panini book creates natural parallel goals (get all Common, all Rare, all Legendary)

**Energy System as Pacing:**
- 5-7 rounds create natural "puzzle session" - Emma can solve 5-7 mini-puzzles in her commute
- Each session has clear goal (maximize DNA/variant collection before energy depletes)
- Optional ad-continue provides "hint system" equivalent

## Modern Mobile Context

**3rd Edition (2020):** Already discusses mobile puzzle games, walk-through availability, implicit vs explicit puzzles

**SupaSnake Specific:**
- Touch interface makes puzzles more tactile (swipe to navigate, tap to select)
- Short sessions demand quick-to-understand puzzles (clear goals within 30 seconds)
- Parallel progression (Classic Mode score chase + Collection completion + Dynasty breeding)

## See Also

- **How-To:** @knowledge_base/game_design/how_to/design_puzzles_for_supasnake.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/core_snake_game.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/collection_lab.md
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_14_puzzles_summary.md
