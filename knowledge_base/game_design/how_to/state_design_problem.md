# How to State Your Design Problem

**Schell's Principle:** "Good problem statements tell both your goal and your constraints. Start design at the problem, not at proposed solutions, to explore broader creative space."

**SupaSnake Context:** Solo/small team devs often jump to solutions too fast ("I'll make a Snake game with X!") without defining the core problem. Clear problem statements open creative space and make design decisions measurable.

---

## Overview

Before brainstorming solutions, state the problem you're solving. Problem statements define WHY you're designing and help you recognize when you're over-constraining yourself. This guide helps solo developers and small teams articulate clear, useful problem statements that lead to better, more innovative designs.

**Goal:** Transform vague design intentions into clear problem statements that open creative space.

**Time:** 30-60 minutes for initial statement, iterate as you learn more.

---

## Step 1: Recognize the Problem vs. Solution

Most designers start with proposed solutions, not problems.

### Solution-First Thinking (Common But Limited)

❌ "I want to make a Snake game"
❌ "I'll add collection mechanics to Snake"
❌ "A mobile game with breeding"

**Why Limiting:** You've already decided HOW (Snake, collection, breeding) before understanding WHAT problem you're solving.

### Problem-First Thinking (Opens Creative Space)

✅ "How can I make player skill have lasting value in a mobile game?"
✅ "How can I combine nostalgia with progression systems?"
✅ "How can I differentiate from pay-to-win mobile games?"

**Why Better:** Starts with the goal, allows multiple solution paths. Maybe the solution isn't Snake at all!

### Exercise: Identify Your Starting Point

**Write down your current game concept in one sentence.**

Now analyze it:
- Does it mention specific mechanics? (Solution-first)
- Does it mention what players will feel/achieve? (Problem-first)
- Does it constrain technology/platform? (Check if necessary)

**Example Analysis:**
- "A Snake game with Pokemon-style collection" → Solution-first (assumes Snake, assumes Pokemon-style)
- "A mobile game where arcade skill unlocks collection progress" → Better (opens space, still clear)

---

## Step 2: Ask "What's the Real Problem?"

Use the 5 Whys technique to get at root problem.

### Example: SupaSnake Problem Discovery

**Initial idea:** "I want to make a Snake game"

**Why?** "Because Snake is fun and simple"
→ **Reframe:** Not "make Snake," but "capture what makes Snake fun"

**Why is Snake fun?** "Immediate skill expression, flow state, visible improvement"
→ **Reframe:** Problem is "create immediate skill expression on mobile"

**Why on mobile?** "Reach large audience, sessions fit mobile context"
→ **Constraint identified:** Mobile platform (but not a constraint on mechanics)

**Why add collection?** "Skill alone isn't sticky, need long-term goals"
→ **Root problem:** "Skill games lack retention without progression systems"

**Why matters?** "Players want their skill to mean something lasting"
→ **Core problem:** "Mobile games don't reward skill with permanent value"

**Final Problem Statement:** "How can I create a mobile game where moment-to-moment skill expression leads to lasting, meaningful achievements?"

---

## Step 3: Define Goal and Constraints

Good problem statements have two parts:

**Goal:** What you're trying to achieve for players
**Constraints:** Limitations you must work within

### Template

"How can I [ACTION] that [GOAL] within [CONSTRAINTS]?"

### SupaSnake Examples at Different Specificity Levels

**Too Vague:**
"How can I make a fun game?"
- Goal unclear (what kind of fun?)
- No constraints (any genre? any platform?)

**Too Solution-Constrained:**
"How can I make a Snake game with Pokemon breeding on iOS?"
- Assumes Snake (may not be best solution)
- Assumes Pokemon-style breeding (may not fit)
- Locks into iOS only (why not Android?)

**Better (Opens Creative Space):**
"How can I create a mobile game where player skill creates lasting, collectible achievements?"
- Goal clear: skill → lasting achievements
- Constraint: mobile platform
- Open: mechanics, story, aesthetics flexible

**Even Better (Adds Key Constraint):**
"How can I create a mobile game where player skill creates lasting, collectible achievements, within solo developer constraints (art, scope, timeline)?"
- Adds realistic constraint (solo dev)
- Now you know: must be simple art, manageable scope
- Still open on mechanics, style

---

## Step 4: Use Tetrad to Check Constraints

**Elemental Tetrad:** Technology / Mechanics / Story / Aesthetics

For each element, ask: "Is this constrained by the problem, or is this open creative space?"

### SupaSnake Tetrad Analysis

**Problem:** "Mobile game where skill creates lasting, collectible achievements (solo dev)"

**Technology:**
- Platform: Mobile (iOS/Android) → **Constrained** (part of problem statement)
- Language/Engine: Not specified → **Open**
- Online/Offline: Not specified → **Open**
- Verdict: Platform constrained, implementation open

**Mechanics:**
- Core gameplay: Not specified → **Open** (Snake is ONE option, not the only option)
- Progression: Must involve collection → **Somewhat constrained**
- Skill-based: Must reward skill → **Constrained** (core to problem)
- Verdict: Skill requirement constrained, specific mechanics open

**Story:**
- Theme: Not specified → **Open**
- Setting: Not specified → **Open**
- Characters: Not specified → **Open**
- Verdict: Totally open creative space

**Aesthetics:**
- Visual style: Must be achievable solo → **Somewhat constrained** (realistic scope)
- Audio: Must support skill focus → **Somewhat constrained** (can't be distracting)
- Feel: Should emphasize collection joy → **Somewhat constrained**
- Verdict: Some constraints, but lots of room for creativity

### Insight from Analysis

You thought you were making "a Snake game," but actually:
- Only skill-based gameplay is constrained (Snake is one way to do this)
- Only mobile platform is constrained (iOS/Android both fine)
- Only solo dev scope is constrained (affects art/scope decisions)
- Everything else is OPEN

**This is why problem statements matter:** They show you where you have freedom!

---

## Step 5: Test Your Problem Statement

Good problem statements pass these tests:

### Test 1: Multiple Solutions Possible?

**Bad:** "How can I add breeding to Snake?" → Only one solution path
**Good:** "How can skill create lasting value?" → Many possible solutions (Snake, platformer, puzzle, etc.)

### Test 2: Clear Success Criteria?

**Ask:** "How will I know if I solved this problem?"

**SupaSnake Example:**
- Problem: "Skill creates lasting achievements"
- Success: Skilled players accumulate achievements faster than unskilled players, regardless of time/money spent
- Measurable: Track correlation between skill metrics (average length) and collection progress

### Test 3: Reveals Over-Constraints?

**Exercise:** Look at your statement. Ask "Why?" for each constraint.

**Example:**
- "Must be iOS" → Why? → "I only have iOS dev account" → **Valid constraint**
- "Must be Snake" → Why? → "Because... I like Snake?" → **Over-constraint! Open this up!**

### Test 4: Communicates to Others?

**Test:** Explain problem statement to someone unfamiliar with your project.

**Good sign:** They immediately understand what you're trying to achieve and can suggest ideas.
**Bad sign:** They're confused about the goal or ask "Why not just do X?" and X is actually a better solution.

---

## Step 6: Iterate as You Learn

Problem statements aren't set in stone. As you design, you'll learn more about the real problem.

### When to Restate

**Trigger 1: You keep hitting the same wall**
- Example: Every design feels pay-to-win
- Insight: Real problem is "How to monetize without pay-to-win?"
- Restate: Add constraint "F2P monetization that preserves skill > money"

**Trigger 2: Playtest reveals different problem**
- Example: Testers say "I like Snake, but collection feels tacked on"
- Insight: Integration is the problem, not individual parts
- Restate: "How can skill gameplay and collection feel unified?"

**Trigger 3: Exciting new direction emerges**
- Example: Breeding feels better than collecting
- Insight: Agency (crafting) more fun than completion (collecting)
- Restate: "How can player skill unlock creative breeding possibilities?"

---

## Common Problem Statements for Game Types

### Skill-Based Games

"How can I create [GENRE] where moment-to-moment skill creates [LASTING VALUE] on [PLATFORM]?"

**SupaSnake Example:** "How can I create arcade gameplay where moment-to-moment skill creates lasting collection value on mobile?"

### Collection Games

"How can I make collecting [ITEMS] feel [EMOTION] for [AUDIENCE] within [CONSTRAINTS]?"

**Example:** "How can I make collecting snake variants feel satisfying for casual mobile players within solo dev art constraints?"

### Narrative Games

"How can I help players experience [THEME/EMOTION] through [INTERACTION TYPE] on [PLATFORM]?"

**Example:** "How can I help players experience legacy-building through skill mastery on mobile?"

---

## SupaSnake Case Study: Problem Evolution

### Version 1 (Starting Point)
"I want to make a mobile Snake game"
- **Issue:** Solution-first, no clear goal

### Version 2 (Added Goal)
"How can I make a mobile Snake game that keeps players engaged long-term?"
- **Better:** Has goal (engagement)
- **Issue:** Still assumes Snake, unclear what "engaged" means

### Version 3 (Opened Mechanics, Clarified Goal)
"How can I create a mobile skill game where players feel lasting progress?"
- **Better:** Snake not assumed, goal clearer (lasting progress)
- **Issue:** "Skill game" still somewhat constraining, "lasting progress" vague

### Version 4 (Specific Problem)
"How can I create a mobile game where arcade skill has tangible, collectible value?"
- **Better:** Clear that skill should create collectibles (measurable)
- **Issue:** Still doesn't capture why this matters

### Version 5 (Core Problem Identified)
"How can I create a mobile game where player skill matters more than time or money spent, resulting in lasting achievements players value?"
- **Best:** Gets at core problem (skill > time/money)
- Clear success criteria (can measure this)
- Opens creative space (many ways to do this)

### Version 6 (Added Key Constraint)
"How can I create a mobile game where player skill matters more than time or money spent, resulting in lasting achievements, within solo developer constraints?"
- **Final:** Adds realistic scope constraint
- Now informs art style, complexity, timeline decisions

---

## Tips for Success

✅ **DO:**
- Start every project with explicit problem statement
- Write it down, put it where you'll see it
- Challenge every "must" (Is that really a constraint?)
- Restate when you learn new information
- Use problem to measure idea quality ("Does this solve the problem?")

❌ **DON'T:**
- Confuse problem with solution ("The problem is I need breeding mechanics" ← That's a solution!)
- Over-constrain based on assumptions ("Must be F2P" → Why? Is premium viable?)
- Lock in too early (problem statements evolve)
- Make problem so vague it's useless ("Make a fun game")
- Forget to check if a game is even the right solution

---

## Measuring Success

You have a good problem statement when:

✅ Team members (or future you) can use it to evaluate ideas independently
✅ Multiple solution paths are visible
✅ Clear success criteria exist ("How will I know I solved this?")
✅ Constraints are real, not assumed
✅ The statement explains WHY, not just WHAT

---

## See Also

- **Quick Ref:** @knowledge_base/game_design/quick_ref/concept_problem_statement.md
- **Lens:** @knowledge_base/game_design/quick_ref/lens_12_problem_statement.md
- **Theme:** @knowledge_base/game_design/how_to/apply_theme_to_supasnake.md (theme follows problem)
- **SupaSnake:** @knowledge_base/game/quick_ref/constraints.md
