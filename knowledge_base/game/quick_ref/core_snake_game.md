# Core Snake Game - Quick Reference

## Overview

The Core Snake Game is the foundational gameplay loop of SupaSnake - a grid-based action game where players control a snake that grows by collecting food while avoiding collisions. It serves as the DNA farming engine and the 30% gameplay component of the 70/30 Lab/Snake time split.

## Core Mechanics

**Movement:** Snake moves continuously on a 20×35 grid (portrait mode). Arrow keys or swipe controls change direction. Direction changes queue for next grid movement (prevents sharp 180° turns that cause instant collision).

**Growth:** Each food item consumed adds 1 body segment behind the snake's tail. Snake starts at length 3, grows indefinitely with no max length cap.

**Collision Detection:** Game ends on wall collision (hitting grid edges) or self-collision (head touches any body segment). No forgiveness mechanics - precision required.

**Food Spawn:** 1 food item spawns randomly on empty grid cells. New food appears instantly after collection. Food never spawns on snake body segments.

**Victory Condition:** Classic Mode uses hybrid victory - complete 5 minutes OR reach 200 score (whichever comes first). Tower Mode uses progressive floors with increasing difficulty.

## Technical Implementation

**Grid System:** 20 columns × 35 rows = 700 cells total. Coordinate system (0,0) at top-left. Snake represented as array of {x, y} coordinates with head at index 0.

**Frame Rate:** Target 60fps with 6 cells/second base speed (configurable per mode). Frame budget: 16.67ms. Render optimizations required for 200+ body segments.

**State Management:** Game state tracked in `GameSession` object containing snake position, food location, score, combo multiplier, elapsed time. State persisted server-side for crash recovery.

## Integration Points

**Energy System:** 1 energy consumed on run start (not completion). Player cannot start game with 0 energy. Energy deducted via POST /api/game/start before game loads.

**DNA Economy:** Score converts to DNA via formula: `baseDNA = floor(score / 50) * 2`. Average run yields 50-100 DNA (Classic Mode). See @knowledge_base/game/quick_ref/resource_generation.md for complete earning mechanics.

**Variant System:** Selected variant determines visual appearance (skin) and special VFX. Variants have no gameplay impact - purely cosmetic (BM-001 compliance).

**Cross-References:**
- @knowledge_base/game/quick_ref/classic_mode.md - Primary game mode configuration
- @knowledge_base/game/quick_ref/energy_system.md - Session gating mechanics
- @knowledge_base/game/quick_ref/resource_generation.md - DNA earning formulas
- @knowledge_base/game/how_to/implement_energy_system.md - Energy integration guide
- @knowledge_base/game/how_to/tune_classic_mode.md - Balance configuration

**Word Count:** 298 words
