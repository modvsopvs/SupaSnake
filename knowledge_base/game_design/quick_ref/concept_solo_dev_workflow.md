# Solo Developer Workflow - Quick Reference

**Reality**: Solo devs are designer, programmer, artist, marketer, and community manager simultaneously. Ruthlessly prioritize, automate, and scope down.

## Core Principles

**Focus Over Features**:
- Ship 3 polished systems > 10 half-baked systems
- "No" is the most important word in solo dev vocabulary
- Vertical slice beats horizontal sprawl (one complete dynasty > three incomplete)

**Batch Context Switching**:
- Monday: Code (6 hours deep work)
- Tuesday: Art/content (3 hours Midjourney + 3D)
- Wednesday: Code (6 hours)
- Thursday: Community + marketing (2 hours Discord/Twitter, 4 hours code)
- Friday: Testing + planning (4 hours QA, 2 hours roadmap)

**Automate Repetitive Work**:
- CI/CD for builds (GitHub Actions auto-builds TestFlight)
- Patch notes auto-post to Discord (webhook)
- Analytics dashboards (auto-update daily, no manual reports)

## Solo Dev Agile (Adapted)

### Weekly Sprints (Not Daily Standups)

**Monday Morning (30 minutes)**:
- Review last week's accomplishments
- Pick 3 goals for this week (e.g., "Finish breeding UI", "Add 5 new variants", "Fix top 3 bugs")
- Log in Notion/Trello/GitHub Projects

**Friday Afternoon (30 minutes)**:
- Check off completed goals
- Move incomplete items to backlog
- Celebrate wins (shipped TestFlight build, positive player feedback)

**No Daily Rituals** - Overhead too high for solo dev

### Backlog Management

**Priority Tiers**:
1. **P0 (Blockers)** - Game crashes, cannot progress, economy exploits
2. **P1 (This Month)** - Core loop improvements, top player requests
3. **P2 (This Quarter)** - Nice-to-haves, quality-of-life features
4. **P3 (Someday/Maybe)** - Cool ideas, future dynasties, multiplayer dreams

**Ruthless Cutting**:
- Review P2/P3 monthly, delete 50% that no longer matter
- If feature not shipped in 3 months, either promote to P1 or delete
- Player requests go to P2 by default (not P1)

## Time Allocation (40-Hour Week)

| Activity | Hours/Week | % of Time |
|----------|------------|-----------|
| **Core Development** | 24 hours | 60% |
| **Art/Content Creation** | 6 hours | 15% |
| **Testing/QA** | 4 hours | 10% |
| **Community/Marketing** | 3 hours | 7.5% |
| **Planning/Admin** | 3 hours | 7.5% |

**Reality Check**: This assumes NO emergencies. Budget 20% slack time for firefighting.

## Tools & Automation

**Essential Stack** (all free or <$20/month):
- **Code**: VS Code + GitHub Copilot ($10/month)
- **Project Management**: GitHub Projects (free)
- **Communication**: Discord (free), Twitter/X (free)
- **Analytics**: Firebase Analytics (free), Mixpanel (free tier)
- **CI/CD**: GitHub Actions (free for public repos)
- **Art**: Midjourney ($30/month), Blender (free)

**Avoid**:
- Heavyweight project management (Jira, Monday.com) - overkill for 1 person
- Paid community platforms (Discourse, Circle) - Discord is sufficient
- Custom analytics dashboards - Firebase is enough for v1.0

## Decision Framework (5-Minute Test)

**Before Adding Any Feature**:
1. **Does this serve the core loop?** (If no → P3 backlog)
2. **Can I ship this in 1 week?** (If no → scope down or P3)
3. **Will 80% of players use this?** (If no → P2 at best)
4. **Can I maintain this long-term?** (If no → don't build)

**Examples**:
- "Add PvP arena" → No (doesn't serve collection loop, huge scope, 20% use case) → P3
- "Add breeding calculator UI" → Yes (serves core, 1 week, 80% use, easy to maintain) → P1
- "Custom snake animations per variant" → Maybe (serves core, 2 weeks, 60% notice, maintenance burden) → P2

## Scope Control Tactics

**Feature Creep Prevention**:
- Lock feature set 2 weeks before launch, only fix bugs
- Community suggestions default to "post-launch" (be honest)
- Use "v2.0" bucket liberally - most features never need to ship

**MVP Mindset**:
- Breeding Lab v1.0 = basic crossing, no genes/traits
- Breeding Lab v2.0 = add genetic inheritance
- Breeding Lab v3.0 = add mutation chances
- Ship v1.0, iterate based on player feedback

**Technical Debt Budget**:
- Allow 10% "quick hacks" for rapid prototyping
- Refactor when hack blocks new feature (not before)
- Document hacks with TODO comments for future self

## Burnout Prevention

**Sustainable Pace**:
- 40 hours/week maximum during development
- 30 hours/week post-launch (community runs itself)
- 1 week vacation every 3 months (pre-announce to community)

**Red Flags**:
- Working nights/weekends regularly → Scope is too large
- Dreading community check-ins → Need volunteer moderators
- Skipping testing to hit deadlines → Recipe for disaster

**Recovery Tactics**:
- "Maintenance mode" weeks (only fix bugs, no new features)
- Delegate moderation to volunteers
- Push launch date if needed - better late than broken

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_moderation_solo_dev.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_future_team_planning.md
- **How-To**: @knowledge_base/game_design/how_to/manage_solo_dev_workflow.md
- **Complete**: Schell Chapter 26 (Teams - adapted for solo)
