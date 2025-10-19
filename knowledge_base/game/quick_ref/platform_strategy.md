# Platform Strategy - Quick Reference

**Source:** vision/vision_statement_aaa.md, design/core_loop_aaa.md

## Core Concept
Mobile-first competitive game (iOS/Android) targeting 10M MAU Year 1, with esports-ready infrastructure and potential PC/console expansion post-launch leveraging touch-optimized controls and cross-platform cloud saves.

## Key Points
- **Launch Platforms (Year 1):**
  - **iOS:** iPhone 12+ (2020 devices), target 60fps on iPhone 12/13/14 series
  - **Android:** Samsung Galaxy S21+ equivalent (2021 mid-range), 60fps performance
  - **Minimum Specs:** 3GB RAM, OpenGL ES 3.0, 2GB storage
  - **Stores:** Apple App Store (Global), Google Play (Global excluding China)
- **Technical Standards:**
  - **60fps Gameplay:** Hard requirement (competitive advantage over 30fps competitors)
  - **Sub-100ms Input Latency:** Touch to screen response (esports-critical)
  - **Offline Mode:** Practice vs AI, breeding/collection accessible offline
  - **Cross-Save:** Cloud sync via Apple/Google accounts (switch devices seamlessly)
- **Future Platform Expansion (Post-Launch):**
  - **PC (Steam):** Mouse/keyboard support, higher resolution, unlocked framerate
  - **Consoles (Switch, Xbox, PlayStation):** Controller support, TV-friendly UI
  - **Cross-Platform Play:** Mobile vs PC matchmaking (opt-in for mobile players)
- **Regional Strategy:**
  - **Year 1:** NA, EU, LATAM (English, Spanish, Portuguese)
  - **Year 2:** ASIA (China via licensed publisher, Japan, Korea, SEA)
  - **Localization:** 10 languages (EN, ES, PT, FR, DE, ZH, JA, KR, RU, AR)

## AAA Standards
- **Performance Budget:** Max 50k triangles per snake, 60fps locked on target devices
- **Server Infrastructure:** AWS global regions (sub-50ms latency for 90% of players)
- **Anti-Cheat:** Server-authoritative gameplay, encrypted client-server communication
- **Data Privacy:** GDPR/CCPA compliant, SOC 2 certified backend

## Implementation Priority
- **MVP:** iOS only, English language, NA region
- **v1.0:** iOS + Android, 3 languages (EN/ES/PT), NA + EU + LATAM
- **v2.0+:** PC/console ports, full 10-language localization, China expansion

## See Also
- @vision/vision_statement_aaa.md (platform vision, 10M MAU target)
- @design/core_loop_aaa.md (60fps technical requirements)
- @design/systems/competitive_systems_v2.md (esports infrastructure needs)

---

*Word Count: 299 words*
