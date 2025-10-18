# How to Design Ethical F2P Monetization (Mobile Indie)

**Goal**: Create a free-to-play monetization model that respects players, generates sustainable revenue, and passes ethical tests.

**Timeline**: 1-2 weeks (design + testing)

**Prerequisites**: Completed game design, understanding of F2P models, willingness to prioritize player trust over short-term revenue

---

## Overview

Free-to-play monetization has a reputation problem: loot boxes, pay-to-win, predatory timers, whale exploitation. But F2P doesn't have to be exploitative.

This guide walks through designing SupaSnake's ethical F2P system as a template for indie devs who want to monetize without manipulation.

---

## Step 1: Define Your Ethical Principles

Before designing monetization mechanics, establish your ethical red lines. These are non-negotiable constraints that protect players.

### The Three Ethical Tests (Schell-Derived)

**Test 1: The "Aunt Mildred" Test**

Ask: *"Would I feel comfortable explaining this monetization to my non-gamer aunt?"*

**SupaSnake examples**:
- ✅ "Energy refills let you play more today for $1" → Aunt Mildred: "That's like a coffee, fair!"
- ❌ "Loot boxes have 0.5% rare drop, $3 per box" → Aunt Mildred: "That's gambling!"

**Use**: If you'd be embarrassed to explain it, don't ship it.

**Test 2: The "Family" Test**

Ask: *"Would I let my 10-year-old niece play this game with IAP enabled?"*

**SupaSnake**:
- ✅ YES (no gambling, transparent pricing, parental password required)

**Considerations for kids**:
- Can they understand what they're buying? (Clear descriptions)
- Is pricing transparent? (Real money, not confusing gems)
- Are there protections? (Parent gate, spending limits)

**Test 3: The "Mirror" Test**

Ask: *"Can I look myself in the mirror knowing how I monetize?"*

**SupaSnake**:
- ✅ YES (energy = pacing tool first, monetization second; no exploitation)

**Red flag**: If you're ashamed of your monetization, players will resent it too.

### SupaSnake Ethical Principles (Non-Negotiable)

1. **Free players get real value** (complete game, no paywalls)
2. **Paying is convenience, not power** (no pay-to-win)
3. **No predatory psychology** (no loot boxes, FOMO, social pressure)
4. **Transparent pricing** (real money, not confusing currencies)
5. **Spending caps** (prevent whale exploitation, ~$50 max)

Write these down. When designing monetization, check every mechanic against these principles.

---

## Step 2: Analyze Your Game's Core Value

F2P monetization works when you clearly separate *free value* (everyone gets) from *paid value* (optional extras).

### SupaSnake Core Value Breakdown

**Free Value (Must be 100% complete)**:
- Classic Snake gameplay (core loop, infinite replayability)
- Breeding system (all mechanics unlocked, no paywalls)
- Collection progress (50-80% achievable without spending)
- Leaderboards (skill-based competition, not pay-to-win)
- Energy regeneration (10-12 games/day = 1-2 hours daily)

**Paid Value (Optional enhancements)**:
- More play sessions TODAY (energy refills)
- Cosmetic expression (exclusive variants)
- Convenience shortcuts (skip breeding RNG)
- Support indie dev (feel-good factor)

**Critical distinction**: Free players play the SAME GAME, paying players play MORE/FASTER (not better).

### The "Would I Play Free?" Test

**Question**: "If I never spent a dollar, would I enjoy this game for weeks/months?"

**SupaSnake**: YES
- 10-12 games/day = 70-80 games/week
- Breeding unlocks new variants (progression)
- Collection completion satisfying (50%+ achievable free)
- High score competition skill-based

**If NO**: You have a paywall problem → Redesign to give more free value.

### Common Indie Mistake: "Choke the Free Players"

**Bad F2P**:
- Free players: 3 energy, 1 energy/hour = 3 games every 3 hours (frustrating)
- Paid players: Unlimited energy for $10/month (only way to play normally)

**Why it fails**: Free players quit (bad retention) → No one to monetize → Death spiral

**Good F2P (SupaSnake)**:
- Free players: 5 energy, 1 energy/5min = 10-12 games/day (satisfying)
- Paid players: +5 energy for $0.99 (more sessions today, but free is enough)

**Why it works**: Free players retained (healthy ecosystem) → Some convert to payers → Sustainable

---

## Step 3: Design Your Monetization Mechanics

Now that you have free value defined, layer on monetization mechanics that respect your ethical principles.

### Mechanic 1: Consumable IAP (Energy Refills)

**What it is**: Spend real money for limited-use resources (energy, extra lives, etc.)

**SupaSnake Implementation**:

**Product tiers**:
- Small: $0.99 = 5 energy (1 session)
- Medium: $1.99 = 15 energy (3 sessions)
- Large: $4.99 = 50 energy (10 sessions)

**Psychology**: Impulse buy when "I want to play more NOW" urge hits

**Ethical checks**:
- ✅ Aunt Mildred: "$1 for 30 min gameplay = coffee price, fair"
- ✅ Family test: 10-year-old can understand "buy more energy to play more"
- ✅ Mirror test: Energy exists for pacing (prevents burnout), IAP is optional shortcut

**Design principles**:
- Free regeneration is FAST (5 min, not 30 min) → Free players don't feel punished
- Prices are CLEAR ($0.99, not "100 gems")
- Purchases are INSTANT (no artificial delays after buying)
- No psychological pressure ("LAST CHANCE!" timers) → User decides calmly

**Revenue model**: Targets "minnows" (casual spenders, $1-5/month) not whales

### Mechanic 2: Durable IAP (Cosmetic Variants)

**What it is**: Spend real money for permanent content (skins, levels, features)

**SupaSnake Implementation**:

**Product tiers** (future, post-MVP):
- Single variant: $1.99 (one exclusive snake skin)
- Dynasty pack: $4.99 (3 variants, discounted)
- Collector's bundle: $14.99 (all current variants, best value)

**Psychology**: "Gotta catch 'em all" + self-expression (show off rare snake)

**Ethical checks**:
- ✅ Aunt Mildred: "$2 for a skin = reasonable, like DLC"
- ✅ Family test: Cosmetics don't give unfair advantage (purely visual)
- ✅ Mirror test: Variants are ALSO earnable free (IAP = skip grind, not exclusive)

**Design principles**:
- Variants don't affect gameplay (no stat bonuses) → No pay-to-win
- Variants are visible (other players see your cosmetics) → Social signaling value
- Variants are also EARNABLE (breeding RNG) → IAP is shortcut, not paywall
- Clear ownership (buy once, keep forever) → No subscription anxiety

**Revenue model**: Targets collectors (3-5% conversion, $5-20 LTV)

### Mechanic 3: Optional Ads (Rewarded Video)

**What it is**: Player chooses to watch 30s ad for in-game reward

**SupaSnake Implementation**:

**Mechanic**:
- After finishing a game, offer: "Watch ad for +20% DNA bonus?"
- User chooses YES (watch ad) or NO (skip, no penalty)
- If YES: 30s video ad → +20% DNA for that game

**Ethical checks**:
- ✅ Aunt Mildred: "Watch ad for bonus = fair trade (time for reward)"
- ✅ Family test: User-initiated (not forced), clear value exchange
- ✅ Mirror test: Ads are OPTIONAL (never interrupts gameplay)

**Design principles**:
- User-initiated ONLY (never forced interstitials)
- Clear reward BEFORE watching (no bait-and-switch)
- Frequency cap (3/day max) → Prevents grinding exploitation
- Can decline with ZERO penalty (not "lose 50% DNA if you don't watch")

**Revenue model**: Supplemental (~$0.10-0.20 per active user/month, eCPM $5-10)

**Why rewarded video is ethical**: Value exchange is transparent (30s of your time = bonus), user always in control.

---

## Step 4: Balance Free vs. Paid Progression

The most common F2P failure: Free players hit paywalls, quit, never convert. Ethical F2P keeps free progression satisfying.

### SupaSnake Progression Balance

**Free player progression** (no spending):

**Week 1**:
- Play 10-12 games/day (70-80 games total)
- Unlock breeding (Day 3)
- Breed first variant (Day 5)
- Collection: 5-8 snakes (out of 60 total)

**Month 1**:
- 300+ games played
- 15-20 snakes collected (25-30% completion)
- High score plateau (skill-based, not spend-based)

**Month 3**:
- 900+ games
- 30-40 snakes collected (50-65% completion)
- Considering IAP (want to speed up collection for last 30%)

**Key**: Month 3 free player has 50%+ content unlocked → Satisfying, not paywalled

**Paying player progression** ($5-10 spent):

**Week 1**:
- Play 15-20 games/day (bought energy refills 2-3 times)
- Same breeding unlock (no paywall skipping)
- Breed 2-3 variants (more attempts from more energy)
- Collection: 10-15 snakes (faster, but not exclusive)

**Month 1**:
- 500+ games (vs 300 free)
- 25-35 snakes (vs 15-20 free)
- Bought 1-2 cosmetic variants (showing off)

**Month 3**:
- 1500+ games
- 45-55 snakes (75-90% completion, close to 100%)
- Happy they supported dev, sped up collection

**Key**: Paying player is AHEAD, but free player isn't BLOCKED.

### The "6-Month Free Player" Test

**Question**: "Can a dedicated free player unlock most content in 6 months?"

**SupaSnake**: YES (50-80% of snakes achievable)

**Industry benchmark**:
- Good F2P: 60%+ content free (Duolingo, Pokémon GO)
- Aggressive F2P: 20-30% content free (some gacha games)
- Predatory F2P: <10% content free (pay-or-quit)

**If your free player unlocks <50% in 6 months**: You have a paywall problem.

---

## Step 5: Avoid Dark Patterns

Dark patterns are UI/UX tricks that manipulate players into spending. They're unethical and damage trust.

### Dark Pattern Checklist (What NOT to Do)

**Dark Pattern 1: Obfuscated Pricing**

**Mechanism**: Virtual currency hides real cost
- Buy 100 gems for $4.99
- Skin costs 150 gems
- **Real price**: $7.48 (but player can't easily calculate)

**Why it's wrong**: Intentionally confuses to drive overspending

**SupaSnake alternative**: Real money prices ($0.99, $1.99, $4.99) → Always know what you're paying

**Dark Pattern 2: False Scarcity**

**Mechanism**: "OFFER EXPIRES IN 59 MINUTES!" countdown

**Why it's wrong**: Creates artificial urgency, overrides rational decision-making (FOMO exploitation)

**SupaSnake alternative**: No time-limited offers, permanent catalog

**Dark Pattern 3: Misleading Buttons**

**Mechanism**:
- Huge "BUY NOW $9.99" button (bright, center screen)
- Tiny "No thanks" link (gray, bottom corner)

**Why it's wrong**: UI designed to trick accidental purchases

**SupaSnake alternative**: Equal-sized buttons, clear CTAs ("Buy Energy" vs. "Wait 5 min")

**Dark Pattern 4: Bait-and-Switch Ads**

**Mechanism**:
- "Watch ad for 1000 gems!"
- After ad: "You got 10 gems" (fine print: "up to 1000")

**Why it's wrong**: Deception, player wasted 30 seconds for false promise

**SupaSnake alternative**: Exact reward stated upfront ("Watch for +20% DNA"), delivered exactly

**Dark Pattern 5: Social Pressure**

**Mechanism**:
- "Your friend John just beat your high score!"
- "Buy gems to beat him!"

**Why it's wrong**: Exploits social comparison anxiety

**SupaSnake alternative**: No social shaming, only positive reinforcement ("You're in top 10%!")

**Dark Pattern 6: Infinite Spending**

**Mechanism**: No cap on gem purchases, whales can spend $1000+

**Why it's wrong**: Enables gambling-like behavior, no protection for vulnerable players

**SupaSnake alternative**: Natural cap (~$50 for all content), no infinite currency

### How to Audit Your Monetization for Dark Patterns

**Process**:
1. Take screenshots of all IAP prompts
2. Ask: "Is this UI honest and clear, or trying to trick?"
3. Show to non-gamer friend: "Do you feel manipulated?"
4. If ANY answer is "trick" or "yes" → Redesign

**Red flags**:
- Different button sizes (large buy, small decline)
- Urgent language ("LAST CHANCE!", "LIMITED TIME!")
- Confusing currency (gems, gold, crystals)
- Misleading rewards (up to X, but usually Y)

**Green flags**:
- Equal-sized buttons, clear labels
- No urgency, player decides calmly
- Real money prices, exact rewards
- Can always decline with zero penalty

---

## Step 6: Test with Real Players (Soft Launch)

Before global launch, test monetization with real players in a small market (Canada, Philippines, etc.)

### SupaSnake Soft Launch Test Plan

**Metrics to track**:
- Conversion rate (% who make first purchase)
- ARPPU (avg revenue per paying user)
- Day 7 retention (payers vs. non-payers)
- Refund rate (buyers regretting purchase?)
- Reviews mentioning monetization (positive vs. negative)

**Success criteria**:
- Conversion: 2-4% (healthy range)
- ARPPU: $10-30 (not exploitative)
- Retention: Payers ≥ non-payers (monetization not hurting experience)
- Refunds: <2% (players feel they got value)
- Reviews: <5% mention "pay-to-win" or "greedy"

**Failure signals**:
- Conversion <1% (too expensive or too little value)
- ARPPU >$100 (whale exploitation)
- Retention: Payers < non-payers (buying ruined experience?!)
- Refunds >5% (buyer's remorse, misleading value)
- Reviews: >10% mention "money grab"

**Iteration**: If metrics fail, adjust pricing/value/UI and re-test

---

## Step 7: Monitor Long-Term Health

Monetization isn't "set and forget." Monitor metrics monthly, adjust as needed.

### Monthly Monetization Health Check

**Revenue metrics**:
- ARPU (avg revenue per user): Target $1-2/month
- Conversion rate: Target 3-5%
- ARPPU: Target $20-30
- LTV (lifetime value): Target $3-5

**Engagement metrics** (monetization affects these):
- Day 1 retention: Target 35%+ (game fun free)
- Day 7 retention: Target 15%+ (long enough to convert)
- Day 30 retention: Target 5%+ (drive LTV)
- Session length: Target 3-5 min (healthy, not addictive grinding)

**Ethics metrics**:
- Refund rate: <2%
- 1-star reviews mentioning monetization: <5%
- Whale concentration (top 1% of spenders = X% of revenue): <30% (healthy distribution)

**Warning signs**:
- ❌ Revenue up, retention down (monetization too aggressive → players quitting)
- ❌ ARPPU >$50 (whale exploitation)
- ❌ Refunds >5% (value perception problem)

**Healthy signs**:
- ✅ Revenue and retention both stable/growing (balanced)
- ✅ Conversion 3-5% (enough payers without pressure)
- ✅ Positive reviews mention "fair F2P"

---

## Common Ethical Monetization Mistakes

### Mistake 1: "I'll copy Candy Crush"

**Problem**: Copying mechanics without understanding context fails
- Candy Crush has King's marketing budget (you don't)
- Candy Crush has 10 years of retention data (you don't)
- Candy Crush is criticized for aggressive monetization (do you want that reputation?)

**Fix**: Learn from Candy Crush (energy pacing works), but adapt to YOUR ethics and audience

### Mistake 2: "More monetization = more revenue"

**Problem**: Aggressive monetization kills retention
- Add 10 IAP prompts → Players feel pressured → Quit
- Dead players spend $0

**Fix**: Light touch monetization, high retention > heavy monetization, low retention

**SupaSnake**: 2 IAP types (energy, cosmetics), no interruptions → High retention → Sustainable revenue

### Mistake 3: "I'll figure out monetization later"

**Problem**: Retrofitting monetization breaks game balance
- Design game without energy → Add energy later → Feels tacked on, frustrating

**Fix**: Design monetization from Day 1 (energy IS pacing, not punishment layer)

**SupaSnake**: Energy designed upfront as pacing tool → Monetization is natural extension

### Mistake 4: "Whales will fund the game"

**Problem**: Whale-dependent monetization = exploitative
- 0.1% spending $500+ = 50% of revenue
- If whales quit, game dies

**Fix**: Design for "minnows" (5% spending $5-25) = healthier, more sustainable

**SupaSnake**: $50 spending cap → Can't become whale-dependent → Must serve broader audience

---

## Key Takeaways

1. **Ethics first**: Aunt Mildred, Family, Mirror tests → Non-negotiable
2. **Free value is real**: 50%+ content free, complete experience
3. **Paid = convenience**: Skip waits, not skip skill
4. **No dark patterns**: Transparent UI, clear pricing, no FOMO
5. **Monitor health**: Revenue + retention + ethics metrics → Adjust monthly

**SupaSnake F2P philosophy**: "Respect players, provide value, sustain development ethically."

**Mantra**: "If I wouldn't want my family playing it, I won't ship it."

---

## See Also

- **Concept**: @knowledge_base/game_design/quick_ref/concept_ethical_f2p.md
- **Concept**: @knowledge_base/game_design/quick_ref/concept_mobile_monetization.md
- **Lens**: @knowledge_base/game_design/quick_ref/lens_110_business_model.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_32_business_summary.md
