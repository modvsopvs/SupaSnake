# Audio Identities - Quick Reference

**Source:** design/systems/audio_strategy_v2.md

## Core Concept
Dynasty-specific soundscapes with adaptive dynamic music, signature audio cues, and AAA sound design (Supercell quality bar) to reinforce visual identity and create memorable emotional moments.

## Key Points
- **Audio Pillars:**
  1. **Dynasty Soundscapes:** Each dynasty has unique instrument palette and musical theme
  2. **Adaptive Music:** Dynamic layers respond to gameplay intensity (calm → tense → climax)
  3. **Signature Audio Cues:** Instantly recognizable dynasty-specific sounds
  4. **AAA Production:** Professional composers, live orchestral recording for key themes
- **Dynasty Audio Examples:**
  - **Venom Dynasty:** Tribal drums, shakuhachi flute, poison drip SFX
  - **Inferno Dynasty:** Electric guitar riffs, roaring flames, sizzle SFX
  - **Frost Dynasty:** Crystalline chimes, wind howl, ice crack SFX
  - **Celestial Dynasty:** Ethereal choir, harp, celestial shimmer SFX
- **Dynamic Music System:**
  - Layer 1 (Exploration): Ambient melody, low intensity
  - Layer 2 (Combat): Drums and bass kick in, rising tension
  - Layer 3 (Climax): Full orchestra, high-energy finale
  - Smooth crossfades between layers based on match state

## AAA Standards
- **Audio Quality:** 48kHz 24-bit, professional mixing/mastering
- **Adaptive Implementation:** FMOD or Wwise middleware for dynamic music
- **Accessibility:** Separate volume sliders (music, SFX, voice), visual sound indicators
- **Localization:** Voiceover support for 10+ languages (English, Spanish, Mandarin, etc.)

## Implementation Priority
- **MVP:** Stock music library, basic SFX, no dynasty-specific audio
- **v1.0:** Custom dynasty themes (synthesized), dynamic music system
- **v2.0+:** Fully orchestral recordings, voiceover narrative, signature audio branding

## See Also
- @design/systems/audio_strategy_v2.md (complete audio design guide)
- @design/systems/aesthetics_strategy_v2.md (audio reinforces visual identity)
- @design/systems/dynasty_system_v2.md (dynasty thematic foundations)

---

*Word Count: 292 words*
