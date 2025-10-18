# Audio Design - Quick Reference

## Overview

Audio design creates emotional connection and feedback through sound. SupaSnake uses dynasty-specific audio languages and mobile-appropriate sound design to enhance collection, breeding, and gameplay moments.

## Core Audio Principles

**Mobile-First Audio**
- Short sounds (0.5-2 seconds max)
- Works with/without headphones
- Respects silent mode
- Paired with haptic feedback for accessibility

**Dynasty Audio Identity**
- CYBER: Synthetic, digital, modulated
- PRIMAL: Organic, natural, resonant
- COSMIC: Ethereal, reverb-heavy, mysterious

## Audio Categories

### Collection Sounds

**Pull/Reveal Sounds**
- Common: Soft chime (300ms)
- Uncommon: Pleasant tone (500ms)
- Rare: Exciting flourish (800ms) + haptic pulse
- Epic: Dramatic crescendo (1.2s) + strong haptic
- Legendary: Full orchestration (2s) + haptic pattern

**Dynasty-Specific Tones**
- CYBER: Synthesizer notes, digital beeps, glitch effects
- PRIMAL: Drum beats, natural percussion, animal calls
- COSMIC: Bell tones, choir pads, reverb trails

### Breeding Sounds

**Process Audio**
- Breeding start: Dynasty-specific "combining" sound
- Incubation: Subtle ambient loop (dynasty theme)
- Hatch: Reveal sound based on offspring rarity
- Success: Celebration matching dynasty + rarity

**Inheritance Audio Cues**
- Dominant trait transfer: Higher pitch
- Recessive trait transfer: Lower pitch
- Mutation: Unique "sparkle" effect

### UI Sounds

**Navigation**
- Menu open/close: Soft whoosh (100ms)
- Tab switch: Click (50ms)
- Scroll: Subtle friction sound
- Button tap: Satisfying pop (80ms)

**Feedback**
- Success: Bright chime
- Error: Muted tone (not harsh)
- Warning: Attention pulse
- Achievement: Fanfare (dynasty-themed)

## Haptic Feedback Integration

**Touch Feedback**
- Light tap: Single pulse (10ms)
- Important action: Double pulse (10ms + 30ms gap + 10ms)
- Success: Rising pattern (10ms, 20ms, 30ms)
- Rare event: Custom pattern matching rarity

**Dynasty Haptic Patterns**
- CYBER: Sharp, precise pulses
- PRIMAL: Rumbling, organic vibrations
- COSMIC: Gentle, wave-like patterns

## Audio Mixing Priorities

1. **Player actions** (tap, pull) - Immediate, clear
2. **Game events** (hatching, evolution) - Exciting, memorable
3. **Ambient** (menu music, lab sounds) - Subtle, non-intrusive
4. **Background** (game music) - Supports without distracting

## Mobile Audio Constraints

- **File size**: Max 50KB per sound effect
- **Format**: AAC for music, WAV for SFX
- **Ducking**: Lower music during SFX
- **Interruption**: Pause for phone calls, resume gracefully
- **Battery**: Minimize audio processing overhead

## Dynasty Audio Examples

**CYBER Snake Pull (Rare)**
- Digital "power up" sweep (200ms)
- Modulated synthesizer chord (400ms)
- Glitch effect tail (200ms)
- Sharp haptic double-pulse

**PRIMAL Snake Hatch (Epic)**
- Low drum hit (150ms)
- Organic roar/growl (500ms)
- Natural reverb decay (350ms)
- Rumbling haptic pattern

**COSMIC Snake Evolution (Legendary)**
- Ethereal choir swell (300ms)
- Bell cascade (600ms)
- Long reverb tail (1100ms)
- Wave-pattern haptic

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_aesthetic_coherence.md
- **How-To**: @knowledge_base/game_design/how_to/design_supasnake_aesthetics.md
- **Game Spec**: @knowledge_base/game/quick_ref/dynasties.md
- **Game Spec**: @knowledge_base/game/quick_ref/collection_targets.md
