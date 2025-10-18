# Feedback Loops - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 15

## Core Concept

Feedback is information returned to player after actions - it's judgment, reward, instruction, encouragement, and challenge. Quality feedback dramatically affects player experience. Loop flows: player acts → game responds → player sees result → player acts again. Good feedback responds within 0.1 seconds (tenth-second rule) and creates "juicy" interactions with second-order motion.

## Key Principles

**Tenth-Second Rule:** Interface must respond to input within 0.1s or players feel something's wrong
**Juiciness:** "Ripe peach" quality - small player interaction yields continuous delicious reward through second-order motion
**Second-Order Motion:** Motion derived from player action (Swiffer base rotates dramatically from small wrist twist)
**Multiple Rewards:** Juicy systems reward player many ways simultaneously (visual + audio + tactile + progression)

## Application to SupaSnake

**Immediate Feedback (<0.1s):**
- Swipe → Snake direction changes instantly (no wind-up animation)
- Collect DNA → Orb disappears immediately + number appears + sound plays
- Hit wall → Instant game over (no delay)

**Juicy DNA Collection:**
- Visual: DNA orb particle burst + number floats up
- Audio: Pleasant "ting" sound
- Progression: Counter increments visibly
- Tactile (via sound): Simulates "picking up" feeling
- Multiple simultaneous rewards = juicy

**Second-Order Motion Examples:**
- Snake tail follows head with smooth physics (small head turn → dramatic tail whip)
- DNA number floats upward and fades (small collection → satisfying visual flourish)
- Variant unlock celebration: Card flip animation from small tap
- Energy bar drains smoothly (discrete round end → gradual visual depletion)

**Feedback at Every Moment:**
- What does player need to know? (Current score, energy remaining, snake position)
- What does player want to know? (DNA collected this round, high score progress)
- What do you want player to feel? (Satisfaction from collection, tension from high speed)

## Mobile Touch Context

**Touch Needs More Feedback:**
- Physical buttons provide tactile feedback automatically
- Touchscreens need compensating feedback (visual + audio)
- SupaSnake adds sound on every swipe (simulates button click)

**Swiffer Example Applied:**
- Problem: No tactile feedback from touch
- Solution: Sound effect simulates "swish" of movement
- Result: Touch feels responsive and satisfying

## Feedback Types in SupaSnake

**Collection Feedback:**
- DNA orb: Number popup + sound + particle effect + counter increment
- Variant unlock: Celebration animation + Collection Lab notification + "New!" badge

**Session Feedback:**
- Energy depleting: Gradual bar drain (visible progress toward session end)
- Round complete: Score display + DNA total + option to continue or view collection

**Progress Feedback:**
- Collection %: Shows completion toward 100% (like Swiffer's dirty cloth - visible accomplishment)
- High score beaten: Special celebration (exceeded expectations)

**Error Feedback:**
- Wall collision: Visual flash + sound + immediate game over screen
- Energy depleted: Gentle notification + option to watch ad (not punishing, informative)

## Emma vs Tyler Feedback Needs

**Emma (5-10 min sessions):**
- Quick feedback on session progress (energy bar critical)
- Clear round-by-round DNA totals
- Fast restart (skip lengthy animations)

**Tyler (60+ min sessions):**
- Long-term progress visible (collection %, dynasty unlocks)
- High score history graph
- Detailed stats (variants collected per session)

## See Also

- **How-To:** @knowledge_base/game_design/how_to/design_mobile_touch_interface.md
- **SupaSnake Ref:** @knowledge_base/game/quick_ref/core_snake_game.md
- **Lenses:** Lens #63 (Feedback), Lens #64 (Juiciness)
- **Complete:** @knowledge_base/game_design/reference/batch2_chapters/chapter_15_interface_summary.md
