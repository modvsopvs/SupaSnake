# Introspection for Game Design - Quick Reference

**Source:** Jesse Schell, "The Art of Game Design" (2008), Chapter 2

## Core Concept

Introspection—examining your own thoughts, feelings, and experiences—is a core tool for game designers. You can never truly know another's experience, but you can deeply know your own. By observing your experiences during play, you make rapid judgments about what works and why. Two perils exist: (1) introspection can lead to false conclusions about reality (but designers care about "what feels true," not "what is true"), and (2) what's true for you may not be true for others (solve this by listening to others and using empathy). Techniques to avoid tainting your experience: **analyze memories** (after play), **two passes** (play untainted, then replay analyzing), **sneak glances** (quick mental checks mid-experience), **observe silently** (Zen-like dual-consciousness observing yourself).

## Key Points

- **Your experience is knowable**: Unlike others' minds, you can directly observe your own feelings and thoughts
- **Peril #1 (false reality) doesn't hurt designers**: Scientists need objective truth; designers need subjective truth ("feels true")
- **Peril #2 (subjectivity) requires empathy**: Your tastes ≠ your audience's—listen to others, put yourself in their place
- **Dissect your feelings**: Don't just say "this is bad"—articulate *why* (too slow? too punishing? unclear?)
- **Four introspection techniques**: Analyze memories, two passes, sneak glances, observe silently

## Application to SupaSnake

Introspection is critical for solo/small-team mobile devs because you **are** your first playtester, and early decisions shape everything.

**Applying Introspection to SupaSnake Balancing**:

**Scenario**: You're testing the energy system. Play 5 rounds, then introspect:

**Bad introspection** (surface):
- "The energy system feels bad."

**Good introspection** (dissected):
- "After Round 3, I wanted to try Classic Mode but had 0 energy left. I felt frustrated—not 'I'll come back tomorrow' frustrated, but 'screw this, I'm uninstalling' frustrated. The **5-minute refill timer** feels punitive when I'm engaged. But when I played yesterday and had 2 energy left, I quit naturally because I was bored anyway—so maybe 5-minute refill is fine when players are *disengaging*, but brutal when they're *engaged*."

**Actionable insight from dissection**: Separate "hot energy" (fast refill while playing) from "cold energy" (slow refill when idle).

**Techniques in Practice**:

1. **Analyze memories**: After a play session, write down 3 feelings you had and why
2. **Two passes**: Play SupaSnake for fun (don't analyze). Next day, replay analyzing every decision
3. **Sneak glances**: Mid-game, quick mental check: "Am I having fun? Yes. Why? The speed feels tight."
4. **Observe silently**: Play while "watching yourself"—notice tension in your shoulders when DNA feels scarce

**Warning: Subjectivity Peril**:
- **You**: Love optimizing breeding formulas, play for 30-minute sessions
- **Target audience**: Casual mobile players, play for 3-minute sessions

**Solution**: After introspecting on your own experience, **listen to others**. Show your 30-minute breeding session to a casual player. They quit after 5 minutes. Empathy: "My target player wants quick dopamine, not spreadsheet optimization."

## Modern Context

**2008 Context:** Schell discusses phenomenology vs. behaviorism in psychology (academic split)
**2025 Mobile F2P:** Introspection now competes with **data-driven design** (A/B tests, analytics). Best practice: Use both. Introspection generates hypotheses ("energy refill feels punishing"), analytics validates them (retention drops 15% when energy = 5-minute refill).

## See Also

- **How-To:** @knowledge_base/game_design/how_to/apply_to_supasnake/apply_experience_design_to_collection_lab.md
- **Related:** @knowledge_base/game_design/quick_ref/principles/principle_listening.md
- **SupaSnake Ref:** @knowledge_base/game/how_to/balance_progression.md
- **Complete:** @knowledge_base/game_design/reference/batch1_chapters/chapter_02_experience_summary.md
