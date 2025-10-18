# How to Apply Five Listenings to SupaSnake

**Schell's Principle:** Game designers must master five listening modes—Team, Audience, Game, Client, Self—to build great games.

**SupaSnake Context:** As a mobile indie developer (solo or small team), these five listening modes are your quality assurance system. You lack the budget for extensive QA, user research, or market analysis—deep listening compensates by extracting maximum insight from limited resources.

---

## Overview

The Five Listenings framework turns game development from "building what you think is cool" into "discovering what actually works through systematic observation." For SupaSnake, a mobile F2P game combining Snake gameplay with collection mechanics, each listening mode reveals different truths:

- **Team**: Even solo devs have an internal "team" (designer-you vs. programmer-you vs. business-you)
- **Audience**: Mobile players are ruthless—they'll uninstall within 90 seconds if your game doesn't hook them
- **Game**: SupaSnake's systems (energy, breeding, DNA economy) "speak" through player behavior
- **Client**: Your "client" is the App Store algorithm, monetization model, and business sustainability
- **Self**: Your creative instincts and passion are SupaSnake's competitive advantage

---

## Step 1: Listen to Your Team

**What this means**: If you work with others (artist, programmer, marketer), listen deeply to resolve conflicts and align vision. If you're solo, recognize you contain multiples: designer-you wants complexity, programmer-you wants simplicity, business-you wants monetization.

**SupaSnake Application**:

**Scenario - Small Team**:
Your artist delivers 20 variant sprites and says "These are ready to ship." Surface listening: Great, check that box. **Deep listening**: You notice they submitted at 11 PM on a Friday. The sprites look rushed—colors are vibrant but lack the subtle gradients you discussed. What you heard: "I'm overworked and cutting corners to hit your deadline."

**Response**:
- Don't ship rushed assets—players notice, and first impressions determine retention
- Talk to your artist: "These look good, but I see you're swamped. Let's prioritize: which 5 variants are critical for MVP?"
- Adjust scope: Ship with fewer, polished variants rather than many mediocre ones

**Scenario - Solo Dev**:
Designer-you: "Breeding should require Generation 1 + Generation 1 to produce Generation 2, with inheritance RNG."
Programmer-you: "That's a complex state machine with edge cases (what if G1 + G2?). Ship simpler: flat RNG, no inheritance."

**Deep listening to internal conflict**:
- Designer-you wants depth because Pokémon breeding is beloved
- Programmer-you wants speed because you launch in 6 weeks
- **Resolution**: Ship flat RNG for MVP, add inheritance in v0.5 after validating players care about breeding at all

**Tips**:
- Write down internal conflicts—externalizing them clarifies priorities
- Use "listening to team" to negotiate scope realistically
- When someone (including yourself) says "It's fine," probe: "What would make it *great*?"

---

## Step 2: Listen to Your Audience

**What this means**: Your audience determines if SupaSnake succeeds. Listen to what they say, but more importantly, observe what they **do**. Words lie; behavior reveals truth.

**SupaSnake Application**:

**Analytics as Audience Voice**:
- **What they say**: Playtest feedback: "I like the Collection Lab!"
- **What they do**: Analytics: 70% of players never open the Collection Lab after tutorial

**Deep listening**: The Lab concept is likable, but something blocks engagement. Investigate:
- Is the Lab button visible? (UI/UX issue)
- Is DNA income too low to afford Lab pulls? (Economy issue)
- Is the Lab explained poorly? (Tutorial issue)

**Solution**: You discover the Lab button is buried in a submenu. Move it to the home screen. Lab engagement jumps to 40%.

**Reddit/Community Listening**:
- **Surface comment**: "SupaSnake is chill and relaxing"
- **Deep listening**: This is positive, but also a red flag—"chill" games have lower retention because they lack urgency
- **Action**: Add Daily Missions system (light urgency) while preserving chill core loop

**Playtesting Scenarios**:

**Scenario 1 - The Silent Quitter**:
Player says nothing but stops playing after 3 rounds. Surface: They're bored. **Deep listening**: Watch their session recording—they died in Classic Mode, respawned with 0 energy, and couldn't figure out how to refill energy without waiting.

**Solution**: Add "Watch Ad to Refill 1 Energy" button prominently after death.

**Scenario 2 - The Polite Liar**:
Player says "The breeding system is cool." But their tone is flat, they change the subject quickly, and they haven't touched breeding in their last 5 sessions.

**Deep listening**: They don't understand breeding, or they tried once and the outcome felt unrewarding. **Action**: Simplify breeding tutorial, increase Generation 2 stat bonuses from +5% → +15% to make outcomes feel impactful.

**Target Audience for SupaSnake**:
- **Demographics**: 18-35, mobile-first, plays during commute/downtime
- **Psychographics**: Collectors (Panini psychology), casual skill expression (Snake mastery), low-stress entertainment
- **Listening strategy**: They won't tell you they want "Pokémon but Snake"—but if you watch them play, you'll see them light up when unlocking a rare variant

---

## Step 3: Listen to Your Game

**What this means**: Your game is a machine. Like a mechanic listening to an engine, you can hear what's wrong by observing how it runs. Is it smooth? Where does it stutter? What feels broken?

**SupaSnake Application**:

**Playing Your Own Game**:
Play 20 rounds of SupaSnake without stopping to "fix" anything. Just listen:

- **Round 5**: You want to try a new variant but can't remember which ones you own. **Game is saying**: "Collection screen needs better UI."
- **Round 12**: You have 80 DNA and nothing to spend it on because Lab pulls cost 20 DNA but you've unlocked most commons. **Game is saying**: "Endgame DNA sink missing."
- **Round 18**: You're bored but keep playing out of habit. **Game is saying**: "Core loop lacks escalation."

**Listening to System Interactions**:

**Energy + DNA Economy**:
- Play until energy depleted. How does it feel? Frustrated? Relieved (natural break)? Punished?
- **What the game says**: If you feel punished, your players will uninstall. If you feel relieved, the gate is working as intended.

**Breeding + Collection**:
- Breed two Neon Dynasty snakes. Get Generation 2 Neon with +5% speed. Does this feel exciting or negligible?
- **What the game says**: If you (the designer) don't feel excited by the outcome, your players won't either. Increase stat bonuses or add visual flair to G2 variants.

**Listen for "Dead Air"**:
Dead air = moments where nothing happens and the player is waiting/confused.

**Example**: Player taps "Breed Snakes" → 2 seconds of loading → New snake appears with no fanfare → Player: "Did anything happen?"

**Solution**: Add animation, SFX, and "NEW GENERATION 2!" popup to fill dead air with feedback.

**Listening During Iteration**:
Change one variable (e.g., DNA earn rate: 20 → 30 per round). Play 10 rounds. **Listen**: Does progression feel better or worse? Trust your gut—if it feels off, revert and try something else.

---

## Step 4: Listen to Your Client

**What this means**: The "client" pays you. For traditional devs, it's a publisher or employer. For indie mobile devs, your "client" is the App Store ecosystem, the F2P business model, and financial sustainability.

**SupaSnake Application**:

**App Store Algorithm as Client**:
- **What it wants**: High Day-1 retention, low uninstall rate, strong engagement metrics (DAU/MAU)
- **Deep listening**: Your "client" doesn't care if your game is artistically brilliant—it cares if players return tomorrow
- **Action**: Prioritize onboarding, first-session hook, and D1 retention above all else in MVP

**F2P Monetization Model as Client**:
- **What it wants**: 2-5% of players spending money, ethical gates that don't alienate the 95% who never pay
- **Deep listening**: Your "client" demands balance—too aggressive (players quit), too generous (no one pays)
- **Action**: Test energy gates with yourself: If you'd pay to skip them, they're well-designed. If you'd uninstall, they're too harsh.

**Business Sustainability as Client**:
- **What it wants**: You sustaining development long enough to iterate post-launch
- **Deep listening**: If you burn out designing 100 variants for MVP, you won't be around to update the game
- **Action**: Ship 15 variants in MVP, add 5/month post-launch—sustainable pace beats heroic sprint

**Example Conflict - Client vs. Self**:

**Self says**: "I want breeding to use a complex inheritance system with Mendelian genetics."
**Client says**: "Players will uninstall if they can't understand breeding in 30 seconds."

**Deep listening**: Your passion for genetics is valuable, but the client's need (retention) trumps your desires. **Resolution**: Ship simple breeding (G1 + G1 = G2 with stat bonus), add "Genetics Mode" as optional complexity later if players engage with basic breeding.

---

## Step 5: Listen to Your Self

**What this means**: Your creative instincts, feelings, and passion are your unique advantage. No one else will make SupaSnake—trust your vision while tempering it with the other four listenings.

**SupaSnake Application**:

**Listening to Your Passion**:
- **What excites you most about SupaSnake?** For you, it might be designing dynasties, balancing progression, or creating variant art.
- **Action**: Double down on your passion—it'll shine through in the game. If you love dynasty lore, write flavor text for each variant. Players will feel your enthusiasm.

**Listening to Your Intuition**:
- You playtest DNA costs: 20 DNA/pull feels grindy, 10 DNA/pull feels trivial, 15 DNA/pull feels... right. You can't articulate why, but your gut says "15."
- **Trust it**: Intuition is subconscious pattern recognition. Your brain has processed thousands of hours of mobile games—it knows what "feels right."

**Listening to Your Limits**:
- **Awareness**: You're great at systems design, mediocre at art, terrible at marketing.
- **Action**: Focus on systems (breeding, balance), outsource art (Fiverr), partner for marketing (Reddit, Twitter outreach). Playing to your strengths is self-listening.

**Example - Self vs. Audience Conflict**:

**Self says**: "I want SupaSnake to be hardcore—fast snake speed, instant death, high skill ceiling."
**Audience data**: 80% of mobile players are casual—they want forgiving, low-stress gameplay.

**Deep listening to self**: Why do you want hardcore? Is it ego ("I'm a skilled player")? Or genuine belief ("Skill mastery is SupaSnake's differentiator")?

**Resolution**:
- If ego: Let it go, build for your audience
- If genuine belief: Add difficulty modes (Chill Mode for casuals, Classic Mode for hardcore)—serve both

**Daily Self-Check**:
Every morning, before opening code/design docs, ask:
1. "What excites me about SupaSnake today?"
2. "What drains me?"
3. "Am I still in love with this project?"

If answers drift toward burnout, **listen to yourself**: take a break, cut scope, or delegate.

---

## SupaSnake-Specific Integration

**Collection Lab** (Audience + Game + Self):
- **Audience**: Wants dopamine from unlocking variants
- **Game**: Current Lab feels grindy (DNA costs too high)
- **Self**: You love the Panini sticker book fantasy
- **Integration**: Lower DNA costs (audience), add rarity tiers (self's passion), ensure pull animations feel juicy (game smoothness)

**Energy System** (Client + Audience + Game):
- **Client**: Needs monetization gate to drive IAP
- **Audience**: Will tolerate 5-minute refill if it feels fair
- **Game**: 5 energy cap feels stingy, 10 feels generous
- **Integration**: 7 energy cap, 3-minute refill, option to watch ad for +2 energy (balances all three)

**Breeding Mechanics** (Self + Team + Game):
- **Self**: Wants deep inheritance system
- **Team** (programmer-you): Wants simple implementation
- **Game**: Complexity adds replayability but risks confusion
- **Integration**: MVP ships simple breeding (G1 + G1 = G2 with fixed stat bonus), post-launch adds "Advanced Breeding" for engaged players

---

## Tips for Success

✅ **DO:**
- Cycle through all five listenings daily—don't fixate on one
- Write down what each "voice" is telling you (journal, notes)
- Use analytics to validate intuition, not replace it
- Trust yourself (Self) but validate with others (Audience)
- Recognize when listenings conflict and negotiate trade-offs

❌ **DON'T:**
- Ignore your Client (business reality) for artistic purity
- Ignore your Self (creative vision) for audience pandering
- Confuse "listening to audience" with "doing what they ask"—listen to behavior, not words
- Burn out by ignoring Self-listening ("I need a break")
- Ship features that fail Game-listening ("This feels broken") because Deadline-pressure says "ship it"

---

## See Also

- **Quick Refs:** @knowledge_base/game_design/quick_ref/principles/principle_five_listenings.md
- **Related Principle:** @knowledge_base/game_design/quick_ref/principles/principle_listening.md
- **SupaSnake Systems:** @knowledge_base/game/quick_ref/energy_system.md, @knowledge_base/game/quick_ref/collection_lab.md
- **Balancing:** @knowledge_base/game/how_to/balance_progression.md
