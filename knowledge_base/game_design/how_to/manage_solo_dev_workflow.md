# How to Manage Solo Developer Workflow

**Goal**: Ship a mobile game solo while maintaining sustainable pace, avoiding burnout, and delivering quality work.

**Timeline**: Applies throughout entire development cycle (pre-production → launch → post-launch)

**Prerequisites**: None - start using these workflows from day one

---

## Step 1: Set Up Your Workflow Infrastructure (Week 1)

**Goal**: Establish lightweight project management and automation.

### Project Management Setup (30 Minutes)

**GitHub Projects** (Recommended):
1. Create project board: "SupaSnake Development"
2. Create 4 columns:
   - **Backlog** (ideas, future features)
   - **This Week** (current sprint goals)
   - **In Progress** (actively working on)
   - **Done** (completed this week)
3. Create issue templates:
   - Feature template (user story, acceptance criteria, time estimate)
   - Bug template (reproduction steps, expected vs. actual, priority)

**Alternative**: Trello, Notion, or even paper notebook (whatever you'll actually use)

**Key Principle**: Simplicity > features. You need visibility, not complexity.

### Time Tracking Setup (Optional, 15 Minutes)

**Toggl Track** (Free):
1. Create project: "SupaSnake"
2. Create tags: "Code", "Art", "Design", "Testing", "Community", "Marketing"
3. Track first week to baseline time allocation
4. Review weekly: Are you spending time on high-value work?

**Why Track Time**:
- Reveals actual vs. perceived time usage
- Identifies time sinks (e.g., 10 hours/week on Discord = need mods)
- Validates productivity (40 hours tracked = sustainable pace)

**Don't Track Forever**: After 1-2 months, you'll internalize patterns. Stop tracking unless spiraling.

### Automation Setup (1 Hour)

**GitHub Actions** (CI/CD):
```yaml
# .github/workflows/build.yml
name: Build TestFlight

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build iOS
        run: |
          xcodebuild -scheme SupaSnake archive
          # Upload to TestFlight via fastlane
```

**Result**: Every push to `main` auto-builds and deploys to TestFlight (no manual Xcode dancing).

**Discord Webhooks** (Patch Notes):
```bash
# When you tag a release on GitHub, auto-post to Discord
curl -X POST "$DISCORD_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d "{\"content\": \"📱 New build v1.2.3 is live! Changes: [link to release notes]\"}"
```

**Result**: Community notified instantly, no manual Discord posting.

---

## Step 2: Weekly Sprint Planning (30 Minutes Every Monday)

**Goal**: Pick 3 achievable goals for the week, say "no" to everything else.

### Monday Morning Ritual (30 Minutes)

**Review Last Week** (10 minutes):
1. Move completed tasks to "Done" column
2. Celebrate wins (no matter how small):
   - "Shipped breeding UI ✅"
   - "Fixed 5 critical bugs ✅"
   - "Launched Discord community ✅"
3. Move incomplete tasks back to "Backlog"
   - Ask: "Is this still important? Or can I delete it?"
   - Delete ruthlessly (50% of incomplete tasks are no longer relevant)

**Plan This Week** (15 minutes):
1. Pick **exactly 3 goals** for the week:
   - 1 big goal (e.g., "Finish Evolution Lab UI")
   - 1 medium goal (e.g., "Add 5 new Aqualis variants")
   - 1 small goal (e.g., "Fix top 3 bugs from feedback")
2. Move to "This Week" column
3. Estimate hours (be honest, not optimistic):
   - Big: 15-20 hours
   - Medium: 8-12 hours
   - Small: 3-5 hours
   - Total: ~30-35 hours (leaves buffer for interruptions)

**Set Boundaries** (5 minutes):
- What you're NOT doing this week (write it down!)
  - "NOT adding multiplayer this week"
  - "NOT responding to every Discord suggestion"
  - "NOT redesigning Breeding Lab (already shipped v1)"
- Post in Discord: "This week I'm working on X, Y, Z. Everything else is next week or later!"

**Why This Works**:
- Prevents scope creep (you committed publicly to 3 goals)
- Gives community visibility (they know what to expect)
- Creates achievable milestones (better than vague "make progress")

---

## Step 3: Daily Execution (Monday-Friday)

**Goal**: Deep work blocks, minimal context switching, sustainable pace.

### Daily Schedule Template

**Monday/Wednesday/Friday** (Code Days):
```
9:00 AM  - Check Discord for critical bugs (15 min)
9:15 AM  - Deep work: Big goal (3 hours, no interruptions)
12:15 PM - Lunch + walk (1 hour)
1:15 PM  - Deep work: Medium goal (3 hours)
4:15 PM  - Testing + bug fixes (1 hour)
5:15 PM  - Commit code, update GitHub project (15 min)
5:30 PM  - Done for the day

Total: ~7 hours productive work
```

**Tuesday** (Art/Content Day):
```
9:00 AM  - Midjourney prompts: Generate 20 snake variants (1 hour)
10:00 AM - Blender: Polish top 5 variants (3 hours)
1:00 PM  - Lunch (1 hour)
2:00 PM  - Implement new variants in Unity/React Native (2 hours)
4:00 PM  - Test in-game, export assets (1 hour)
5:00 PM  - Done for the day

Total: ~7 hours productive work
```

**Thursday** (Mixed Day):
```
9:00 AM  - Community time: Discord, Reddit, Twitter (1 hour)
10:00 AM - Code: Small goal (2 hours)
12:00 PM - Lunch (1 hour)
1:00 PM  - Code: Finish small goal (2 hours)
3:00 PM  - Marketing: Tweet progress GIF, update subreddit (30 min)
3:30 PM  - Planning: Review backlog, answer questions (1 hour)
4:30 PM  - Buffer time: Catch up on anything urgent (30 min)
5:00 PM  - Done for the day

Total: ~6.5 hours productive work
```

**Key Principles**:
- **No meetings** (you're solo, who would you meet with?)
- **Batch context switches** (all community work on Thursday, not scattered)
- **Hard stop at 5 PM** (40 hours/week is sustainable, 60 is not)
- **Lunch + walk mandatory** (burnout prevention)

### Deep Work Protection

**Eliminate Distractions**:
- Close Discord during deep work blocks
- Phone in airplane mode
- Use website blocker (Freedom, Cold Turkey)
- Headphones + focus music (or silence)

**9:15 AM - 12:15 PM is sacred**:
- This is when your brain is sharpest
- No emails, no Discord, no Twitter
- Only code/design/art
- If you protect this block, you'll ship 2x faster

---

## Step 4: Friday Wrap-Up (1 Hour)

**Goal**: Ship the week's work, document progress, prepare for next week.

### Friday Afternoon Ritual (1 Hour)

**Ship This Week's Build** (15 minutes):
1. Commit all code: `git commit -m "Week 12: Evolution Lab UI + 5 Aqualis variants"`
2. Tag release: `git tag v0.5.12`
3. Push to GitHub (triggers auto-build to TestFlight)
4. Wait 20 minutes for build to process

**Write Release Notes** (15 minutes):
```markdown
# v0.5.12 (Week 12)

## New Features
- Evolution Lab UI complete (breed, view genes, history)
- 5 new Aqualis variants (Tidal, Reef, Abyss, Pearl, Storm)

## Improvements
- Breeding animation 30% faster
- Collection screen loads 2x faster

## Bug Fixes
- Fixed crash when breeding without enough DNA
- Fixed variant preview not showing correctly
- Fixed daily reward not granting DNA

## Next Week
- Add genetic inheritance system
- Polish Evolution Lab animations
- Fix top 5 community-reported bugs
```

**Post to Community** (10 minutes):
- Discord #announcements: "New build v0.5.12 is live! [Release notes link]"
- Subreddit: "Week 12 Update: Evolution Lab + New Variants"
- Twitter: "Shipped Evolution Lab this week! [GIF] Download: [TestFlight link]"

**Weekly Review** (20 minutes):
1. Did I hit my 3 goals?
   - ✅ Big: Evolution Lab UI (complete!)
   - ✅ Medium: 5 Aqualis variants (shipped!)
   - ⚠️ Small: Fixed 2/3 bugs (good enough)
2. What went well?
   - Evolution Lab shipped on time
   - Community loved new variants
3. What went poorly?
   - Underestimated testing time
   - Got distracted by Twitter on Thursday
4. What to improve next week?
   - Budget 2 hours for testing (not 1)
   - Batch Twitter to 15 minutes/day

**Celebrate Wins**:
- Tweet progress: "Shipped Evolution Lab this week! Solo dev life is hard but rewarding 🐍"
- Treat yourself (nice dinner, game night, movie)
- You earned it!

---

## Step 5: Backlog Management (Monthly, 1 Hour)

**Goal**: Prevent backlog from becoming overwhelming graveyard of forgotten dreams.

### First Sunday of Every Month (1 Hour)

**Review Entire Backlog**:
1. Sort by priority:
   - **P0 (Critical)**: Crashes, game-breaking bugs, economy exploits
   - **P1 (This Month)**: Core loop improvements, top player requests
   - **P2 (This Quarter)**: Nice-to-haves, polish
   - **P3 (Someday/Maybe)**: Wild ideas, far-future features

2. **Delete 50% of P3**:
   - If it's been in backlog for 3+ months, you'll never build it
   - Be honest: "Multiplayer trading sounds cool, but I'll never have time"
   - Archive in separate "Archived Ideas" doc (if you feel bad deleting)

3. **Promote/Demote**:
   - P2 items that are now urgent → P1
   - P1 items that are no longer important → P2
   - P1 items that have sat for 3+ months → Delete or P3

4. **Reality Check**:
   - Count P1 items
   - Estimate total hours (be honest)
   - Divide by 30 hours/week (your weekly capacity)
   - That's how many weeks until P1 is empty
   - Example: 20 P1 items × 5 hours each = 100 hours = 3.5 weeks
   - If it's >8 weeks, you have too many P1 items - demote half to P2

**Result**: Backlog reflects reality, not fantasy.

---

## Step 6: Scope Control (Ongoing)

**Goal**: Ship features, not perfect dreams.

### Feature Scoping Framework (5-Minute Decision)

**Before Adding ANY Feature**:

1. **Does this serve the core loop?**
   - SupaSnake core loop: Collect snakes → Breed snakes → Complete collection
   - Does this feature directly support one of these pillars?
   - If NO → P3 backlog (nice-to-have, not core)

2. **Can I ship this in 1 week?**
   - Break down into tasks
   - Estimate hours honestly
   - If >30 hours → Scope down OR break into phases

3. **Will 80% of players use this?**
   - Be honest about usage
   - "Everyone will love custom snake skins!" (Reality: 5% will pay, 95% ignore)
   - If <80% → P2 at best

4. **Can I maintain this long-term?**
   - Does this create ongoing support burden?
   - "Live PvP arena" → Yes, huge burden (servers, matchmaking, cheating)
   - "Async leaderboards" → No, minimal burden (just a database query)
   - If high burden → Reconsider

**Example: "Add Custom Snake Skins" Feature**

1. Core loop? **Kinda** (cosmetic, not essential)
2. Ship in 1 week? **No** (art pipeline = 4 weeks, UI = 1 week, total 5 weeks)
3. 80% use? **No** (maybe 20% care about cosmetics)
4. Maintain long-term? **Yes** (need new skins every month or players complain)

**Verdict**: P3 (Someday/Maybe). Cool idea, but doesn't justify effort.

**Alternative Scoping**: "Add 3 rare cosmetic variants per dynasty"
1. Core loop? **Yes** (collecting rare variants IS the core loop)
2. Ship in 1 week? **Yes** (3 variants = 6 hours Midjourney + 3D)
3. 80% use? **Yes** (everyone wants rare variants)
4. Maintain long-term? **Easy** (already making variants anyway)

**Verdict**: P1 (Do this!)

---

## Step 7: Burnout Prevention (Ongoing)

**Goal**: Ship game without destroying your health, relationships, or sanity.

### Burnout Warning Signs

**Physical**:
- Not sleeping well (up late coding, can't shut off brain)
- Eating poorly (skipping meals, fast food every day)
- No exercise (sitting 12 hours/day)
- Headaches, eye strain, back pain

**Mental**:
- Dreading work (Monday mornings feel awful)
- Can't focus (staring at code for hours, making no progress)
- Snapping at community (every suggestion feels like an attack)
- Perfectionism paralysis (can't ship because it's not perfect)

**Emotional**:
- Guilt about not working (weekends feel wrong)
- Comparison despair (other devs shipping faster, you feel inadequate)
- Impostor syndrome (who am I to make a game?)
- Isolation (no social life, only game dev)

**If You Notice 3+ Signs**: Take action immediately.

### Burnout Recovery Tactics

**Immediate** (Today):
1. Stop working at 5 PM (hard stop, no exceptions)
2. Close laptop, go for 30-minute walk
3. Do something non-game-related (dinner with friends, movie, hobby)
4. Sleep 8 hours (no late-night coding)

**This Week**:
1. Reduce scope (pick 2 goals instead of 3)
2. Take Wednesday off (yes, mid-week break)
3. Delegate moderation (recruit volunteer mod if you haven't)
4. Post in Discord: "Taking a lighter week for mental health. Back to full speed next week!"

**This Month**:
1. "Maintenance mode" - only fix critical bugs, no new features
2. Let community know: "Taking a breather this month. Expect slower updates, back in [Month]."
3. Revisit priorities: Is this game still fun to work on? If not, why?

**Nuclear Option**: Pause development for 1-2 weeks
- Community will survive (you're not a AAA studio with player contracts)
- Your health matters more than shipping v0.5.13 on time
- Better to pause now than burn out permanently

### Sustainable Pace Guidelines

**Daily**:
- 6-8 hours productive work (not 12)
- 1 hour lunch + walk (mandatory)
- Hard stop at 5 PM (no evening coding)

**Weekly**:
- 35-40 hours total (not 60)
- 1 full day off (Sunday = zero game dev)
- Batch community work (2 hours max/week)

**Monthly**:
- 1 week "maintenance mode" every 3 months
- 1 full weekend off (no laptop, no Discord)

**Quarterly**:
- 1 week vacation (yes, even solo devs get breaks)
- Pre-announce to community: "Taking week of [Date] off. No updates, emergency bugs only."

---

## Common Mistakes

### Mistake 1: No Written Plans

**Bad**:
- Vague sense of "I should work on breeding system this week"
- No task breakdown, no time estimate
- End of week: "I made some progress, I think?"

**Good**:
- Monday: Write down 3 specific goals with estimates
- Friday: Review what shipped vs. what didn't
- Concrete progress tracking

---

### Mistake 2: Saying "Yes" to Everything

**Bad**:
```
Player: "Can you add trading?"
Dev: "Sure, I'll look into it!"
[Adds to P1, now backlog is 200 items]
```

**Good**:
```
Player: "Can you add trading?"
Dev: "Cool idea! I've added it to the backlog (P2). No promises on timing, but I'll consider it after core features ship."
```

**Lesson**: "No, but I'll consider it" is better than "Yes" you'll never deliver.

---

### Mistake 3: Perfectionism Paralysis

**Bad**:
- Breeding Lab 90% done, but UI isn't pixel-perfect
- Delay for 2 weeks to polish
- Players get zero value during polish phase

**Good**:
- Breeding Lab 90% done → Ship it!
- Note: "UI polish" in P2 backlog
- Iterate based on player feedback (maybe they don't care about UI?)

**Lesson**: Shipped and imperfect > Unshipped and perfect

---

### Mistake 4: No Breaks

**Bad**:
- Work 7 days/week for 6 months straight
- Burnout at month 7, quit game dev forever

**Good**:
- 40 hours/week, 1 day off, 1 week vacation every 3 months
- Still shipping, but sustainable for years

**Lesson**: Marathon, not sprint.

---

## Tools & Resources

**Project Management**:
- GitHub Projects (free, simple)
- Trello (free, visual)
- Notion (free, flexible)

**Time Tracking**:
- Toggl Track (free)
- RescueTime (automatic, free tier)

**Focus**:
- Freedom (website/app blocker, $40/year)
- Forest (phone app, focus timer, free)

**Automation**:
- GitHub Actions (CI/CD, free)
- Zapier/IFTTT (webhooks, free tier)

**Health**:
- Stretchly (break reminder, free)
- f.lux (blue light filter, free)

---

## Success Metrics

**Weekly**:
- 3/3 goals shipped (or 2/3 with good reason for 3rd)
- 35-40 hours tracked (not 60)
- 1 full day off taken

**Monthly**:
- 12/12 weekly goals shipped (roughly)
- TestFlight build every week
- Backlog shrinking or stable (not growing)

**Quarterly**:
- Major feature shipped (Evolution Lab, new dynasty, etc.)
- Community healthy (players helping each other, not just dev)
- Still enjoying game dev (not dreading work)

**If Metrics Slipping**:
- Reduce scope (2 goals/week instead of 3)
- Take maintenance mode week
- Reassess priorities (is this feature really needed?)

---

## See Also

- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_solo_dev_workflow.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_future_team_planning.md
- **Quick Ref**: @knowledge_base/game_design/quick_ref/concept_moderation_solo_dev.md
- **Complete**: Schell Chapter 26 (Teams - adapted for solo dev)
