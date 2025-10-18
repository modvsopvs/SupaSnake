# Chapter 26: The Team - Summary

**Source**: Jesse Schell, "The Art of Game Design" (3rd Edition, 2020), Chapter 26

**Adaptation Note**: Schell assumes 10-100 person teams at professional studios. This summary radically adapts principles for solo developers and future 2-3 person teams.

---

## Core Concept

**Schell's Thesis**: "Great games come from great teams. Team chemistry, communication, and culture matter more than individual talent."

**Solo Dev Adaptation**: "Great games come from focused individuals who know their limits. Solo dev requires ruthless prioritization, automation, and knowing when to grow."

---

## Team Roles (Schell's AAA Model vs. Solo Reality)

### Schell's AAA Team Structure

**Typical 50-Person Game Team** (Schell's Example):
- 1 Creative Director
- 1 Producer
- 5 Designers (systems, level, UI, combat, progression)
- 15 Engineers (gameplay, engine, tools, networking, backend)
- 10 Artists (character, environment, UI, VFX, animation)
- 5 Animators
- 3 Sound designers
- 2 Writers
- 3 QA testers
- 1 Community manager
- 4 Management/support staff

**Total**: 50 people, each specialized.

### Solo Dev Reality

**Team of 1** (You):
- Designer (you)
- Engineer (you)
- Artist (you, with Midjourney/AI assist)
- Animator (you, with procedural/tweening)
- Sound (stock audio libraries)
- Writer (you)
- QA (you + 10 beta testers)
- Community manager (you, 1-2 hours/week)
- Producer (you)

**Total**: 1 person, many hats.

**Key Insight**: You can't compete on team size. You compete on focus (3 polished systems beat 10 half-baked systems).

---

## Solo Dev Workflow (Schell's Team Coordination Adapted)

### Schell's Scrum/Agile for Large Teams

**Daily Standup** (15 minutes):
- What did you do yesterday?
- What will you do today?
- What's blocking you?

**Sprint Planning** (2 hours every 2 weeks):
- Backlog grooming
- Estimate story points
- Commit to sprint goals

**Sprint Review** (1 hour):
- Demo shipped features
- Stakeholder feedback

**Sprint Retrospective** (1 hour):
- What went well?
- What to improve?

**Total Overhead**: ~4 hours/week for meetings (acceptable for 10-person team, insane for solo dev).

### Solo Dev Adaptation

**No Daily Standups** - You know what you're doing.

**Weekly Sprint** (30 minutes Monday morning):
- Pick 3 goals for the week (1 big, 1 medium, 1 small)
- Estimate hours (be honest)
- Write down what you're NOT doing (scope control)

**Weekly Ship** (30 minutes Friday afternoon):
- Commit code, tag release, push to TestFlight
- Write release notes
- Post to community (Discord, Reddit, Twitter)

**Monthly Review** (1 hour first Sunday):
- Review backlog, delete 50% of P3 items
- Celebrate shipped features
- Adjust priorities for next month

**Total Overhead**: 2 hours/month (1% of work time vs. 10% for large teams).

---

## Communication (Schell's Focus)

### Schell's Communication Principles

1. **Overcommunicate**: "Say things 3 times in 3 different ways to ensure everyone hears."
2. **Write It Down**: "Verbal agreements disappear. Written docs persist."
3. **Regular Syncs**: "Weekly meetings keep everyone aligned."

**Why It Matters**: In 50-person team, information silos are deadly. Designer assumes engineer knows X, engineer assumes designer knows Y, nothing gets built.

### Solo Dev Adaptation

**You can't miscommunicate with yourself** - This is your superpower!

**Challenges**:
1. **Context Switching**: Switching from code to art to marketing is exhausting.
2. **Decision Fatigue**: Every decision is on you (no one to debate with).
3. **Loneliness**: No teammates to celebrate wins or commiserate losses.

**Solutions**:
1. **Batch Work**: Code Mondays/Wednesdays, art Tuesdays, community Thursdays.
2. **Decision Framework**: "Does this serve core loop?" (quick decisions, less fatigue).
3. **Solo Dev Community**: Join Discord servers for indie devs, share progress, get feedback.

---

## When to Grow (Schell's Hiring Triggers Adapted)

### Schell's Hiring Philosophy

**Schell**: "Hire when you have a clear, recurring need that can't be met by current team."

**Examples** (AAA context):
- "We need a dedicated combat designer because our systems designer is overwhelmed."
- "We need a network engineer because gameplay engineers don't know multiplayer."

### Solo Dev Hiring Triggers (Wait for All Three)

1. **Revenue Threshold**: $5,000+/month consistent for 3+ months
2. **Time Bottleneck**: Consistently working 50+ hours/week, still can't keep up
3. **Clear Role Need**: Specific, recurring work that can't be automated

**Don't Hire Because**:
- "It would be nice to have help" (costs > benefits)
- Community suggests it (they don't see your finances)
- Competitor has bigger team (they may have VC funding)

### First Three Hires (In Order)

**Hire #1: Artist/Content Creator** (Part-Time, $1,000-2,000/month)
- **Why First**: Frees you to code (highest value work for solo dev)
- **What They Do**: 5 new variants/month, UI polish, promotional art
- **When**: Revenue $5,000+/month, art bottlenecking releases

**Hire #2: Community Manager** (Part-Time, $2,000-3,000/month)
- **Why Second**: Community engagement drives retention > new features at scale
- **What They Do**: Daily Discord moderation, weekly events, monthly surveys
- **When**: 10,000+ players, moderation taking 10+ hours/week

**Hire #3: Engineer** (Part-Time or Equity, $4,000-8,000/month)
- **Why Third**: Code is least urgent bottleneck (you got this far alone)
- **What They Do**: Backend systems, platform ports, major refactors
- **When**: Technical debt crisis or multiplayer needed

**Schell's Warning**: "Hire slow, fire fast. Bad hires are poison."

---

## Team Culture (Schell's Principles for 2-3 Person Teams)

### Schell's Culture Pillars

1. **Trust**: Hire people you trust, then trust them.
2. **Communication**: Overcommunicate early, establish rituals.
3. **Ownership**: Clear roles, no stepping on toes.
4. **Celebration**: Celebrate wins together.
5. **Honesty**: Honest feedback, no sugarcoating.

### Solo → Small Team Transition

**Async by Default**:
- Loom videos > meetings (5-minute async walkthrough > 30-minute call)
- Written docs in Notion > verbal agreements (searchable, persistent)
- Pull requests with context > "check this out?"

**Weekly Sync** (30 Minutes, Only Meeting):
1. What shipped last week?
2. What's blocking you?
3. Priorities this week?
4. Quick decisions on small items

**No Daily Standups** - Overhead too high for 2-3 people.

**Clear Ownership**:
- Developer (you): Core systems, architecture, final say
- Artist: All visual content, no code changes
- Community Manager: Discord/Reddit, no game design decisions

**Tools** (All Free or Cheap):
- Discord (team channel)
- GitHub Projects (shared board)
- Notion (shared docs)
- Loom (async videos)
- Google Meet (weekly sync, free)

---

## Collaboration Challenges (Schell's Insights Adapted)

### Schell's "Two-Pizza Rule" (Amazon)

**Principle**: "If you can't feed the team with two pizzas, the team is too large."

**Schell's Interpretation**: Teams >8 people suffer from communication overhead. Ideal team: 5-7 people.

**Solo Dev Interpretation**: Team of 1 is simplest. Team of 2-3 is manageable. Team of 5+ requires management overhead you probably don't want.

**Lesson**: Stay small as long as possible.

### Schell's "Brook's Law" (Mythical Man-Month)

**Brook's Law**: "Adding people to a late project makes it later."

**Why**: Onboarding takes time, communication overhead grows exponentially.

**Solo Dev Lesson**: If you're behind schedule, hiring won't fix it. Cutting scope will.

**Example**:
- Bad: "I'm 3 months behind, I'll hire an engineer to catch up."
- Good: "I'm 3 months behind, I'll cut 50% of features and ship v1.0 on time."

---

## Decision-Making (Schell's Models)

### Schell's Decision Spectrum

```
Autocratic ←──────────────────→ Democratic
(Boss decides)              (Team votes)
```

**Schell's Recommendation**: "Most decisions should be made by the person closest to the problem."

**Examples**:
- Combat designer decides combo timings (not creative director)
- Engineer decides code architecture (not producer)
- Artist decides color palette (not CEO)

**Solo Dev Reality**: You ARE the person closest to every problem. Decision-making is fast (no committees), but exhausting (decision fatigue).

**Mitigation**: Decision frameworks reduce fatigue.

**Example Framework**:
```
Before adding any feature:
1. Does this serve core loop? (If no → P3)
2. Can I ship in 1 week? (If no → Scope down or P3)
3. Will 80% of players use this? (If no → P2 at best)
```

**Result**: 90% of decisions made in 5 minutes (framework filters).

---

## Remote Teams (Schell's Pre-2020 Skepticism)

### Schell's Original View (2008 Edition)

**Schell (2008)**: "Remote teams are difficult. Co-location is best for creative work."

**Schell (2020 Edition Update)**: "COVID proved remote works. But communication must be intentional."

### Solo Dev Reality

**You're Always Remote** (even if you have a team):
- Artist is contractor in different city
- Community manager is part-time, works from home
- You work from home office

**Schell's Remote Best Practices** (Adapted):
1. **Overcommunicate**: Write detailed specs, record Loom videos.
2. **Async First**: Don't assume instant replies.
3. **Weekly Sync**: 30-minute video call for alignment.
4. **Written Decisions**: All decisions in Notion, not Slack.
5. **Celebrate Remotely**: Shoutouts in Discord, GIFs, emoji reactions.

---

## Playtesting (Schell's Focus)

### Schell's Playtesting Philosophy

**Schell**: "Your team is the worst playtester. You know the game too well."

**AAA Approach**:
- Dedicated QA team (5-10 people)
- External playtest sessions (50-100 players)
- Usability labs (cameras, eye-tracking, surveys)

### Solo Dev Playtesting

**No QA Team** - You are QA.

**Small Closed Beta** (10-20 Friends/Family):
- TestFlight invite (iOS) or APK (Android)
- Google Form for feedback ("What confused you? What was fun?")
- Watch them play if possible (Zoom screen share, or in-person)

**Why Friends/Family**:
- Honest (they'll tell you it sucks)
- Free (no payment needed)
- Available (they'll test on short notice)

**Schell's Warning**: "Don't explain the game while they play. Watch silently and take notes."

**Why**: If you have to explain, the game isn't teaching well enough.

**Open Beta** (100-500 Strangers):
- Public TestFlight link via Twitter/Reddit
- Discord for feedback (players self-organize discussions)
- Analytics (Firebase) to see where players drop off

**Why Strangers**:
- Unbiased (no personal relationship)
- Diverse (different play styles, devices, expectations)
- Scale (100 players find bugs 1 tester won't)

---

## Crunch and Burnout (Schell's Realism)

### Schell's Crunch Critique

**Schell**: "Crunch is a sign of poor planning, not passion. Sustainable pace wins long-term."

**Industry Reality**: Many studios crunch (60-80 hour weeks) before launch.

**Schell's Warning**: "Crunch destroys creativity, health, and relationships. Avoid it."

### Solo Dev Burnout

**Worse Than AAA Crunch**:
- No team to share load (all pressure on you)
- No separation of work/life (home office)
- No external accountability (can work 100 hours or 0 hours, no one stopping you)

**Schell's Advice (Adapted)**:
1. **40-Hour Week Maximum**: More hours ≠ more output (diminishing returns after 6 hours/day).
2. **Hard Stop at 5 PM**: Close laptop, no evening coding.
3. **1 Full Day Off**: Sunday = zero game dev (mandatory).
4. **1 Week Vacation Every 3 Months**: Pre-announce to community, actually take it.

**Burnout Warning Signs**:
- Dreading work (Monday mornings feel awful)
- Can't focus (staring at code for hours, no progress)
- Physical symptoms (headaches, poor sleep, back pain)
- Snapping at community (every suggestion feels like an attack)

**Recovery**:
- Immediate: Stop working at 5 PM today, take tomorrow off.
- This week: Reduce scope (2 goals instead of 3), take Wednesday off.
- This month: "Maintenance mode" (only fix bugs, no new features).
- Nuclear: Pause development 1-2 weeks (community will survive).

---

## Lenses from Chapter 26

### Lens #110: The Lens of the Team

**Ask yourself** (Solo Dev Adaptation):
- Am I the right person to build this game alone? (Skills, passion, stamina)
- What parts am I bad at? (Can I outsource, automate, or scope out?)
- When would I need help? (What triggers hiring?)
- How can I preserve solo dev benefits while growing? (Speed, flexibility, simplicity)

**SupaSnake Example**:
- Right person? Yes (systems design, coding, game economy are strengths).
- Bad at? 3D art, marketing (outsource art first, automate marketing via Twitter scheduler).
- Need help? When revenue $5k+/month AND art bottlenecks releases (hire artist).
- Preserve benefits? Keep team tiny (2-3 people max), async workflow, no meetings.

---

## Key Takeaways for Solo Mobile Dev

1. **Solo is Viable Long-Term**:
   - Many successful mobile games are 1-person teams for years
   - Don't hire because "real companies have teams"
   - Hire only when revenue supports it AND clear role need exists

2. **Workflow Simplicity**:
   - No daily standups, no sprint retrospectives, no 4-hour planning sessions
   - Weekly sprints (3 goals, 30 minutes planning, 30 minutes shipping)
   - Monthly backlog review (1 hour, delete 50% of P3 items)

3. **Batch Context Switching**:
   - Code days (Monday/Wednesday/Friday)
   - Art day (Tuesday)
   - Community/marketing day (Thursday)
   - Reduces mental fatigue from constant role-switching

4. **Decision Frameworks Reduce Fatigue**:
   - "Does this serve core loop?" (quick filter)
   - "Can I ship in 1 week?" (scope control)
   - 90% of decisions in 5 minutes (vs. agonizing for hours)

5. **Hiring Order Matters**:
   - Artist first (frees you to code)
   - Community manager second (frees you from moderation)
   - Engineer third (code is least urgent bottleneck)
   - All require revenue $5k+/month minimum

6. **Sustainable Pace is Non-Negotiable**:
   - 40 hours/week maximum (not 60)
   - 1 day off per week (not negotiable)
   - 1 week vacation every 3 months (pre-announce, actually take it)
   - Burnout ends careers - pace yourself

7. **Solo Dev Superpowers**:
   - Speed (no committees, no buy-in needed)
   - Flexibility (pivot instantly, no team to convince)
   - Simplicity (no HR, no management, no politics)
   - **Don't lose these when growing** (keep team tiny, preserve autonomy)

---

## Schell's Final Team Wisdom (Adapted)

**Schell**: "The best teams have three things: clear vision, mutual respect, and joy in the work."

**Solo Dev Translation**:
- **Clear vision**: You know exactly what you're building (no design-by-committee).
- **Mutual respect**: Respect your own limits (don't work yourself to death).
- **Joy in the work**: If you're not having fun, why are you doing this?

**Schell's Quote**: "Make games you'd want to play. Work with people you'd want to have dinner with. Everything else is secondary."

**Solo Dev Version**: "Make games you'd want to play. Work at a pace you'd want to sustain for years. Hire people you'd trust with your creation. Everything else is secondary."

---

## See Also

- **Quick Refs**: concept_solo_dev_workflow.md, concept_future_team_planning.md, concept_moderation_solo_dev.md
- **How-To**: manage_solo_dev_workflow.md
- **Lens**: lens_110_team.md
- **Previous**: Chapter 25 (Communities)
