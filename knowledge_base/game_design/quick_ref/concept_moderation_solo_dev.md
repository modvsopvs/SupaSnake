# Moderation for Solo Developers - Quick Reference

**Reality**: Solo devs cannot moderate 24/7. Design for minimal moderation while maintaining healthy community.

## Moderation Philosophy

**Lightweight by Design**:
- Community self-moderates through good culture, not heavy enforcement
- Automate what's automatable (spam filters, link restrictions)
- Empower volunteer moderators from founding players
- Set clear expectations: "I check Discord once per day, mods handle urgent issues"

**Time Budget**: 1-2 hours/week maximum for moderation

## Three-Tier Moderation System

### Tier 1: Automated (0 dev time)

**Discord AutoMod**:
- Block spam links automatically
- Filter profanity (configurable)
- New member restrictions (can't post for 10 minutes)
- Rate limiting (max 5 messages per minute)

**Subreddit AutoModerator**:
- Karma thresholds (minimum 10 karma to post)
- Keyword filters (block "free DNA hack" spam)
- Auto-flair posts by content type

### Tier 2: Volunteer Moderators (2-3 people)

**Recruit from Founding Players**:
- Active, helpful community members
- Diverse time zones for coverage
- No payment, but exclusive "Moderator" variant as thank-you

**Mod Powers**:
- Timeout users (1 hour to 1 week)
- Delete spam/off-topic posts
- Pin important guides/announcements
- Escalate major issues to developer

**Mod Guidelines**:
- Written rules document (what's bannable, timeout lengths)
- Weekly mod sync (async via Discord mod channel)
- Developer has final say on bans

### Tier 3: Developer Intervention (1-2 hours/week)

**Dev-Only Actions**:
- Permanent bans (cheating, harassment, doxxing)
- Policy decisions (new rules, feature requests)
- Crisis management (exploit discovery, server downtime)
- Community events (announce new dynasties, run competitions)

## Common Issues & Responses

| Issue | Response | Time Cost |
|-------|----------|-----------|
| **Spam bot** | AutoMod blocks, mods delete | 0 minutes (automated) |
| **Mild toxicity** | Mod timeout 1 hour, warning | 2 minutes (mod handles) |
| **Repeated offense** | Mod timeout 1 week, escalate | 5 minutes (dev reviews) |
| **Harassment** | Immediate permanent ban | 10 minutes (dev investigates) |
| **False ban appeal** | Review logs, uphold or reverse | 15 minutes (dev decides) |
| **Exploit report** | Thank player, fix bug, patch | 1-4 hours (dev work) |

## Red Flags (Unsustainable)

❌ **Developer as Only Moderator** - Leads to burnout, slow response times
❌ **No Written Rules** - Arbitrary decisions, community frustration
❌ **Reactive Moderation** - Only act after crisis, not preventive culture
❌ **Mod Drama** - Mods fighting publicly, undermining authority
❌ **Pay-to-Moderate** - Paid mods create conflicts of interest

## Healthy Boundaries

**Say "No" to**:
- 24/7 community management expectations
- Players demanding instant dev responses
- Feature requests as moderation issues ("ban players who don't X")
- Community drama derailing development time

**Say "Yes" to**:
- Weekly community update posts (10 minutes)
- Monthly "Developer Q&A" (30 minutes, async via Reddit)
- Celebrating community achievements (retweet fan art, pin guides)
- Transparent roadmap (no specific dates, just themes)

## Tool Stack (All Free)

- **Discord AutoMod** - Built-in spam/profanity filtering
- **Discord Webhooks** - Auto-post patch notes from GitHub releases
- **Reddit AutoModerator** - Karma thresholds, keyword filters
- **Google Forms** - Bug reports, ban appeals (async, trackable)

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_community_health.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_solo_dev_workflow.md
- **How-To**: @knowledge_base/game_design/how_to/build_mobile_game_community.md
- **Complete**: Schell Chapter 25 (Community Management)
