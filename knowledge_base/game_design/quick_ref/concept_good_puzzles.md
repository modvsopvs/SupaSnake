# Good Puzzle Principles - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 14

## Core Concept

Ten principles guide puzzle design: clear goals, easy start, visible progress, solvability, gradual difficulty, parallelism, pyramid structure, hints, giving answers, and careful use of perceptual shifts. These principles apply to explicit puzzle games and implicit puzzles woven into action games.

## Key Principles

1. **Make Goal Easily Understood** - Players must know what they're trying to achieve
2. **Easy to Get Started** - First move should be obvious (like Sam Loyd's 15 Puzzle)
3. **Give Sense of Progress** - Riddles frustrate because you can't see progress; Rubik's Cube satisfies because each solved side shows advancement
4. **Give Sense of Solvability** - Players must believe solution exists (Rubik's Cube ships solved)
5. **Increase Difficulty Gradually** - Jigsaw puzzles naturally progress: corners → edges → color sorting → assembly
6. **Parallelism Lets Player Rest** - Multiple challenges prevent frustration (crossword has dozens of parallel clues)
7. **Pyramid Structure Extends Interest** - Small puzzles feed into larger puzzle (Jumble word game)
8. **Hints Extend Interest** - Well-timed hints > total abandonment
9. **Give the Answer** - Seeing answer triggers "Aha!" even if you didn't solve it yourself
10. **Perceptual Shifts Are Double-Edged** - "Either you get it or you don't" puzzles frustrate most players

## Application to SupaSnake

**Clear Goals (Principle 1):**
- Classic Mode: "Survive, collect DNA, beat high score"
- Collection Lab: "Fill the Panini book"
- Breeding Lab: "Create new variant combinations"

**Visible Progress (Principle 3):**
- DNA counter increments immediately on collection (visual + audio feedback)
- Collection progress bar fills as variants unlock
- Generation count increases with each breed

**Parallelism (Principle 6):**
- Stuck on high score? Switch to breeding new dynasties
- Tired of Classic? Browse Collection Lab
- Multiple variants to chase prevents "only one solution" frustration

**Pyramid Structure (Principle 7):**
- Small: Each round's DNA collection
- Medium: Unlock full dynasty (8 variants)
- Large: Complete all 3 dynasties (24 variants total in MVP)

**Gradual Difficulty (Principle 5):**
- Early rounds: Slow speed, common variants (easy)
- Mid rounds: Faster speed, rare variants appear (medium)
- Late rounds: High speed, legendary-only spawns (hard)

## Mobile-Specific Implementation

**Touch Makes Goals Clear:**
- Swipe direction = movement (primal, obvious)
- Tap variant card = view details (direct manipulation)

**Short Sessions Need Fast Starts:**
- Round 1 starts easy (Emma can jump in immediately)
- No tutorial walls (learn by playing)

## See Also

- **How-To:** @knowledge_base/game_design/how_to/design_puzzles_for_supasnake.md
- **Lenses:** Lens #54 (Accessibility), Lens #55 (Visible Progress), Lens #56 (Parallelism), Lens #57 (Pyramid), Lens #58 (Puzzle)
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_14_puzzles_summary.md
