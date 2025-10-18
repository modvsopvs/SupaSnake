# How to Apply Experience Design to Collection Lab

**Schell's Principle:** Design for the experience, not the artifact. Use the Lens of Essential Experience: (1) What experience do I want? (2) What's essential to it? (3) How can my game capture that essence?

**SupaSnake Context:** The Collection Lab is SupaSnake's core retention driver—the Pokémon/Panini sticker book fantasy that keeps players returning. Getting the **experience** right matters more than getting the **mechanics** right. A perfectly balanced gacha system that feels unrewarding will fail; a slightly unbalanced system that delivers joy will succeed.

---

## Overview

The Collection Lab enables players to unlock snake variants using DNA (earned from gameplay). It's a gacha-lite system inspired by Pokémon collection and Panini sticker album psychology. The challenge: mobile players encounter hundreds of collection systems—yours must feel special, rewarding, and respectful of their time.

**Current Artifact** (what you're building):
- Spend DNA → Random variant unlock → Add to collection → View in Lab UI

**Desired Experience** (what players should feel):
- Anticipation → Surprise → Delight → Progress → Desire to continue

This guide applies experience design principles to ensure the artifact generates the intended experience.

---

## Step 1: Define Your Essential Experience

**Use Lens of Essential Experience**:

**Question 1: What experience do I want the player to have?**

**Target Experience for Collection Lab**:
"I just opened a pack of Pokémon cards and pulled a holographic Charizard—I'm thrilled, my heart is racing, I want to show my friends, and I immediately want to open another pack to see if I can get more rare cards."

**Unpack that experience**:
- **Anticipation**: The moment before you see what you got
- **Surprise**: You didn't know what was coming
- **Rarity high**: Knowing this is rare makes it feel valuable
- **Visual wow**: The card *looks* special (holographic, unique art)
- **Social proof**: You want to show off your rare pull
- **Immediate desire to repeat**: The dopamine hit makes you crave another pull

**Question 2: What is essential to that experience?**

**Essential elements** (must have):
1. **Delayed reveal**: Anticipation requires waiting, even briefly
2. **Rarity tiers**: "Rare" only matters if "common" exists
3. **Visual distinction**: Rare variants must *look* better, not just have better stats
4. **Progression feedback**: Seeing your collection grow
5. **RNG surprise**: Deterministic unlocks lack the emotional spike

**Incidental elements** (nice to have, not core):
- Exact DNA cost (20 vs. 25 doesn't change experience essence)
- Whether unlocks happen in "Lab" vs. "Shop" vs. "Egg Hatch" (branding/UI, not essence)
- Whether snakes are called "variants" vs. "skins" (terminology doesn't affect feel)

**Question 3: How can my game capture that essence?**

This is the rest of this guide—specific implementations to capture each essential element.

---

## Step 2: Design for Anticipation

**Essential Element**: Players need a moment of "What will I get?" before the reveal.

**SupaSnake Implementation**:

**Bad (no anticipation)**:
- Player taps "Unlock Variant" → Instant reveal: "You got Neon Dynasty Variant #3!" → Done

**Good (builds anticipation)**:
- Player taps "Spend 20 DNA to Open Egg" → 2-second animation: egg shakes, cracks → Screen flashes → Reveal: "RARE: Crystal Dynasty!"

**Techniques to Build Anticipation**:

1. **Delayed reveal** (2-3 seconds)
   - Egg-hatching animation (Pokémon GO style)
   - Spinner wheel (gacha style)
   - Card flip animation (pack opening style)

2. **Audio cues**
   - Rising pitch SFX during animation (builds tension)
   - Triumphant fanfare on reveal (releases tension)
   - Different SFX for common vs. rare (you hear rarity before you see it)

3. **Visual buildup**
   - Screen darkens during animation (focus narrows)
   - Particle effects intensify (sparkles for common, lightning for rare)
   - Camera zooms in on egg/card/spinner

**SupaSnake-Specific Choice**: Use **egg-hatching** metaphor (fits with "dynasties" and "generations" theme). Egg shakes 2x, cracks, reveals snake with VFX matching rarity tier.

**Avoid**: Skippable animations on first-time unlocks. Let players skip *after* they've seen the animation once, but force the first unlock to be ceremonious—that's where the experience lives.

---

## Step 3: Design for Rarity & Surprise

**Essential Element**: Rarity creates value; surprise creates emotional spikes.

**SupaSnake Implementation**:

**Rarity Tiers** (suggested):
- **Common (60%)**: Neon Dynasty, Desert Dynasty (basic colors, no VFX)
- **Uncommon (30%)**: Sky Dynasty, Jungle Dynasty (gradients, subtle particle trails)
- **Rare (8%)**: Crystal Dynasty, Shadow Dynasty (animated textures, prominent VFX)
- **Epic (2%)**: Mythic Dynasty (unique animations, screen-wide VFX on unlock)

**Why These Percentages**:
- **Common (60%)**: Feels like base case—not frustrating
- **Uncommon (30%)**: Frequent enough to feel "I'm making progress"
- **Rare (8%)**: Rare enough to feel special, common enough to not feel impossible (1 in 12.5 pulls)
- **Epic (2%)**: Ultra-rare for long-term chase (1 in 50 pulls)

**Surprise Mechanics**:

1. **Guarantee system** (pity timer):
   - After 15 pulls without a Rare or Epic, guarantee next pull is Rare
   - Prevents frustration from bad RNG streaks
   - Maintains surprise (you don't know *which* pull will be the guaranteed one)

2. **Duplicate handling**:
   - **Bad**: "You already own this variant. Nothing happens."
   - **Good**: Convert duplicates to "DNA Shards" → 3 Shards = 1 free pull
   - Maintains value even on unlucky pulls

3. **Streak bonuses**:
   - Pull 5 variants in one session → 6th pull has 2× Rare chance
   - Rewards engaged players without punishing casuals

**Visual Communication of Rarity**:
- **Common**: Standard color palette, no glow
- **Uncommon**: Subtle glow aura, particle trail during movement
- **Rare**: Bright glow, animated texture (scales shimmer), thick particle trail
- **Epic**: Screen-shake on reveal, unique idle animation (breathes fire, sparks electricity), persistent VFX

**Experience Check**: Show a Rare variant to someone who hasn't played. Can they tell it's rare without being told? If not, increase visual distinction.

---

## Step 4: Design for Progression Feedback

**Essential Element**: Players need to *see* their collection growing.

**SupaSnake Implementation**:

**Collection Screen Design**:

**Layout**:
- Grid of all variants (locked + unlocked)
- Locked variants: Silhouette + "?" + dynasty name
- Unlocked variants: Full-color sprite + star rating (Gen 1-5)
- Progress bar: "15 / 40 Variants Unlocked (37.5%)"

**Grouping Options**:
- By Dynasty (all Neon variants together)
- By Rarity (all Rares together)
- By Generation (all G2 snakes together)

**Why This Works**:
- **Silhouettes create desire**: You see *what you're missing*, not just "40 variants exist"
- **Percentage tracking**: Numbers scratch completionist itch
- **Visual density**: A full screen of sprites = "I've accomplished something"

**Progress Milestones** (triggers for celebration):
- **First variant unlocked**: Tutorial celebrates this ("Welcome to the Lab!")
- **10 variants**: "Novice Collector" badge + 50 DNA bonus
- **25 variants**: "Expert Collector" badge + unlock "Breeding Lab"
- **40 variants (all)**: "Master Collector" badge + exclusive Mythic Dynasty unlock

**Daily Check-In Ritual**:
- Open Collection Lab → See shiny new variant from yesterday's session → Feel pride → Play more to unlock next one

**Experience Check**: After unlocking 10 variants, does the Collection Screen feel satisfyingly full? Or does it feel like "I've barely made a dent"? Adjust total variant count if needed.

---

## Step 5: Design for Immediate Desire to Repeat

**Essential Element**: One successful pull should make players crave another.

**SupaSnake Implementation**:

**Post-Unlock Flow**:

**Bad**:
- Unlock variant → Back to main menu → DNA balance shown → Player forgets about Lab

**Good**:
- Unlock variant → "You have 35 DNA remaining. Want to try again?" → [Pull Again] [View Collection] [Back]

**Psychological Hooks**:

1. **Near-miss feedback**:
   - On Common unlock: "So close! Next pull could be Rare!"
   - On Rare unlock: "Amazing! Only 2% chance of Epic—will you get lucky?"

2. **Resource visibility**:
   - Show DNA balance **prominently** post-unlock
   - If DNA > pull cost: Green text ("Enough for another pull!")
   - If DNA < pull cost: Show timer ("Play 2 more rounds to afford next pull")

3. **Streak tracking**:
   - "You've pulled 3 variants today! Pull 2 more for a streak bonus!"
   - Creates mini-goals within the Lab session

**Preventing Frustration** (critical for F2P):
- **Never show "You need to pay"**: If DNA is too low, show "Play to earn more DNA" (action), not "Buy DNA" (paywall)
- **First pull is always free**: Tutorial gives enough DNA for 1 pull—player experiences the joy before committing time
- **Daily free pull**: Log in → 1 free Lab pull → Hooks players even on zero-energy days

**Example Session Flow**:
1. Player finishes game with 40 DNA earned
2. Lab button glows: "You can unlock 2 variants!"
3. Player taps Lab → Unlocks Uncommon (dopamine hit)
4. "Pull again? (20 DNA remaining)" → Player pulls → Unlocks Common (mild disappointment but still progress)
5. "Not enough DNA for another pull. Play 1 more round!" → Player re-engages with core Snake gameplay

**Experience Check**: After unlocking one variant, do you (the designer) immediately want to unlock another? If not, something's broken. Fix it before shipping.

---

## Step 6: Test the Artifact Against the Experience

**Validation Process**:

**Internal Testing** (you):
1. Reset your progress, unlock 5 variants. How do you feel?
2. Rate each essential element (1-10):
   - Anticipation (egg animation): ___/10
   - Surprise (rarity reveal): ___/10
   - Visual distinction (Common vs. Rare): ___/10
   - Progression (collection screen): ___/10
   - Desire to repeat (post-unlock flow): ___/10
3. If any score < 7, that element needs work.

**External Testing** (playtesters):
1. Watch 3 players unlock their first 10 variants (no instructions).
2. Observe:
   - Do they smile/react during reveals? (Anticipation + Surprise working)
   - Do they open the Collection Screen unprompted? (Progression feedback working)
   - Do they pull again immediately? (Desire to repeat working)
3. Ask: "On a scale of 1-10, how exciting was unlocking variants?" Target: 7+.

**Analytics Validation** (post-launch):
- **Lab engagement rate**: % of players who open Lab after tutorial (target: 60%+)
- **Pulls per session**: Average pulls per Lab visit (target: 2.5+)
- **Return rate**: % of players who return to Lab within 24 hours (target: 40%+)

**If Experience Fails**:
- **Low anticipation**: Animation too fast or skippable too early
- **Low surprise**: Rarity feels flat (common vs. rare not distinct enough)
- **Low progression**: Collection screen unclear or doesn't celebrate milestones
- **Low desire**: Post-unlock flow drops player back to menu (friction kills momentum)

---

## SupaSnake-Specific Considerations

**Integration with Energy System**:
- **Problem**: If Lab pulls cost DNA but gameplay requires energy, players may feel "I can't play AND collect."
- **Solution**: Energy refills while viewing Collection Screen—"idle engagement" counts as session time.

**Integration with Breeding**:
- **Problem**: If breeding produces better snakes than Lab, Lab becomes obsolete.
- **Solution**: Breeding requires 2 unlocked variants—Lab unlocks fuel breeding, not compete with it.

**Monetization Tie-In**:
- **Ethical F2P**: Never sell variants directly ("Pay $5 for Crystal Dynasty"). Always sell pulls ("$5 for 5 pulls, 2× Rare chance").
- **Why**: Preserves RNG excitement; whales can spend, but can't skip the experience.

---

## Iterate Based on Experience, Not Artifact

**Common Trap**:
"Lab pulls cost 20 DNA, that's balanced because players earn 20 DNA per round."

**Better Thinking**:
"Does spending 20 DNA *feel* like a reasonable cost? When I spend it, am I excited or resentful?"

**Example Iteration**:
- **Version 1**: 20 DNA/pull. Feels grindy. Players complain.
- **Version 2**: 10 DNA/pull. Feels trivial. No excitement.
- **Version 3**: 15 DNA/pull. Feels balanced. BUT players still don't engage.
- **Root cause discovered**: Not the cost—Lab button is hidden in submenu.
- **Fix**: Move Lab button to home screen. Engagement spikes even at 20 DNA/pull.

**Lesson**: The artifact (DNA cost) wasn't the issue; the experience (discoverability) was.

---

## Tips for Success

✅ **DO:**
- Playtest with sound on—audio carries 50% of anticipation/surprise
- Watch others play without guiding them—if they miss the Lab, it's a UX failure
- Celebrate every unlock, even Commons—progression must always feel positive
- Tune rarity rates based on emotion, not math (2% Epic feels right, even if 1% is "balanced")

❌ **DON'T:**
- Skip animations to "speed up" gameplay—anticipation *is* the gameplay
- Balance rarity purely on math—10% Rare might be "fair" but feel too generous (cheapens rarity)
- Punish players for bad RNG—guarantee systems are mandatory in F2P gacha
- Design Lab in isolation—it must integrate with energy, breeding, and core loop

---

## See Also

- **Quick Ref:** @knowledge_base/game_design/quick_ref/concepts/concept_essential_experience.md
- **Related Concept:** @knowledge_base/game_design/quick_ref/concepts/concept_experience_vs_game.md
- **SupaSnake Systems:** @knowledge_base/game/quick_ref/collection_lab.md, @knowledge_base/game/quick_ref/dynasties.md
- **Progression:** @knowledge_base/game/how_to/balance_progression.md
