# Anti-Toxicity Systems - Quick Reference

**Source:** design/social_systems_aaa.md, design/systems/guild_systems_v2.md

## Core Concept
Proactive toxicity prevention through guild leader moderation tools, player report systems, AI chat filtering, and positive reinforcement mechanics to maintain inclusive AAA community standards.

## Key Points
- **Guild Moderation Tools:**
  - Leader/Officer powers: Kick, mute (1-7 days), promote/demote
  - Guild rules: Custom code of conduct (150 character limit)
  - Audit log: Track all mod actions, appeal system
  - Guild blacklist: Prevent specific players from re-joining (max 50 entries)
- **Player Report System:**
  - Report categories: Harassment, hate speech, cheating, account selling
  - Evidence submission: Screenshot upload, chat log capture
  - Automated triage: AI flags severe cases for immediate review (hate speech = instant temp ban)
  - Human review: Support team reviews reports within 24 hours
  - Action transparency: Reporter notified of action taken (banned/warned/no action)
- **AI Chat Filtering:**
  - Real-time profanity filter (customizable per region)
  - Pattern detection: Slurs, coordinated harassment, phishing links
  - Auto-mute escalation: 1st offense (30 min), 2nd (24 hours), 3rd (7 days), 4th (permaban)
- **Positive Reinforcement:**
  - Commend system: Award "Good Sport" badge to friendly players
  - Honor rewards: Monthly cosmetics for most-commended players
  - Guild reputation: Guilds with low toxicity reports earn prestige bonus

## AAA Standards
- **Zero Tolerance:** Hate speech, doxxing, cheating = immediate permaban
- **Transparency:** Clear ToS, visible enforcement actions, appeal process
- **COPPA/GDPR Compliance:** Age-gating, parental controls, data privacy
- **Cultural Sensitivity:** Localized moderation teams, regional chat norms

## Implementation Priority
- **MVP:** Basic profanity filter, manual report system
- **v1.0:** Full AI filtering, guild moderation tools, commend system
- **v2.0+:** Advanced pattern detection, community moderators program

## See Also
- @design/social_systems_aaa.md (social retention with safety)
- @design/systems/guild_systems_v2.md (guild governance tools)

---

*Word Count: 299 words*
