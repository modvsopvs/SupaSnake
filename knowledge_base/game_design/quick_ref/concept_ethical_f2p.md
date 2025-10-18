# Ethical Free-to-Play Design - Quick Reference

**Source**: Schell Ch. 32 "Ethical Game Design in the F2P Era"

## Core Principle

**"First, do no harm."** F2P monetization is ethical when it respects players, provides value, and avoids exploiting psychological vulnerabilities—especially in children and vulnerable populations.

## The Ethical F2P Framework (Schell)

### 1. The "Aunt Mildred Test"

**Question**: "Would I feel comfortable explaining this monetization to my aunt?"

**SupaSnake examples**:
- ✅ "Energy lets you pace yourself, or buy more if you want to play longer" (Aunt Mildred: "That's reasonable")
- ❌ "Loot boxes have 0.5% chance for rare snake, $2.99 per box" (Aunt Mildred: "That's gambling!")

**Rule**: If you'd be ashamed to explain it to a non-gamer, it's probably unethical.

### 2. The "Kids in the Room" Test

**Question**: "Would this monetization exploit a child's lack of impulse control?"

**Red flags**:
- ❌ One-click purchases (no password)
- ❌ Confusing currencies (100 gems = $4.99 = how much is this hat?)
- ❌ Social pressure ("Everyone else has this!")
- ❌ Artificial urgency ("OFFER EXPIRES IN 5 MINUTES!")

**SupaSnake guardrails**:
- ✅ Clear pricing ($0.99, not "100 gems")
- ✅ Parent gates (if under 13, require password)
- ✅ No FOMO tactics (no expiring offers)
- ✅ No social comparison ("Beat your friends!")

### 3. The "Value Reciprocity" Test

**Question**: "Does the player get fair value for their money?"

**SupaSnake pricing logic**:
- $0.99 = 5 energy = ~30 minutes gameplay = cost of coffee → Fair
- $4.99 = 50 energy = 5+ hours gameplay = cost of movie ticket → Fair
- $9.99 = Cosmetic variant pack = permanent ownership = cost of lunch → Fair

**Anti-pattern**: $4.99 for 1 hour speedup on 24-hour timer → Exploitative (manufactured frustration)

## Ethical vs. Exploitative Mechanics

### Energy Systems

**Ethical (SupaSnake)**:
- Purpose: Pace gameplay, prevent burnout
- Free regeneration: 1 energy/5min = ~10-12 games/day
- Sessions: 2-5 minutes (natural stopping point)
- Purchase: Skip wait, don't buy wins

**Exploitative (Candy Crush clones)**:
- Purpose: Frustrate into payment
- Free regeneration: 1 life/30min = 5 lives/2.5 hours
- Sessions: Fail level → "Buy more lives or wait"
- Purchase: Remove artificial pain point

**Key difference**: SupaSnake's energy limit is "play time" (like gym membership), not "punishment for failing"

### In-App Purchases

**Ethical**:
- ✅ Know exactly what you're buying (5 energy, specific variant)
- ✅ Permanent value (cosmetics you keep forever)
- ✅ Optional shortcuts (skip grind, not skip skill)
- ✅ Clear pricing ($0.99, not obfuscated gems)

**Exploitative**:
- ❌ Random loot boxes (gambling mechanics)
- ❌ "Consumable currency" (100 gems → 50 gems → 10 gems, what's real value?)
- ❌ Paywalls (can't progress without paying)
- ❌ Pay-to-win (better items only for money)

### Advertising

**Ethical (SupaSnake)**:
- ✅ User-initiated (player chooses to watch)
- ✅ Clear reward (20% DNA bonus)
- ✅ Frequency cap (3/day, prevent grind)
- ✅ Rewarded video (user gets value)

**Exploitative**:
- ❌ Forced interstitials (can't skip, no value)
- ❌ Misleading rewards ("Win 1000 gems!" → Actually 10 gems)
- ❌ Unlimited grinding (watch 100 ads for progression)
- ❌ Deceptive close buttons (fake X, hard to close)

### Social Mechanics

**Ethical**:
- ✅ Cooperative (help friends, both benefit)
- ✅ Opt-in sharing (player chooses to post)
- ✅ Positive reinforcement ("Congrats!" not "You're losing")

**Exploitative**:
- ❌ Competitive pressure ("Your friend beat you!")
- ❌ Viral spam (force share to unlock)
- ❌ Leaderboard shaming (public failure)
- ❌ "Whale signaling" (show who spent most)

## The Seven Deadly Sins of F2P (Schell)

### Sin 1: Obfuscated Pricing

**Mechanism**: Virtual currency hides real cost
- $4.99 = 100 gems
- Skin costs 150 gems
- **What's the real price?** (Player can't easily calculate $7.48)

**Why it's wrong**: Intentionally confuses to drive overspending

**SupaSnake alternative**: Real money prices ($0.99, $1.99, $4.99)

### Sin 2: Manufactured Frustration

**Mechanism**: Make game frustrating, sell relief
- 24-hour building timers
- Energy that takes 8 hours to refill
- Difficulty spikes that require premium items

**Why it's wrong**: Game is designed to NOT be fun unless you pay

**SupaSnake alternative**: Game is fun free, IAP adds convenience

### Sin 3: Gambling Mechanics

**Mechanism**: Loot boxes with random rewards
- $2.99 per box
- 0.5% chance for ultra-rare item
- **Average cost for ultra-rare**: $600

**Why it's wrong**: Exploits gambling addiction, especially vulnerable to children

**SupaSnake alternative**: Direct purchases (know what you're buying)

### Sin 4: Infinite Spending

**Mechanism**: No spending cap, whales can spend $10,000+
- Gems/gold with no upper limit
- "Top up" prompts whenever currency low
- Leaderboards dominated by spenders

**Why it's wrong**: Enables gambling-like behavior, no protection for addicts

**SupaSnake alternative**: Natural spending cap (~$50 for all content)

### Sin 5: Exploiting FOMO (Fear of Missing Out)

**Mechanism**: Limited-time offers create urgency
- "This deal expires in 59 minutes!"
- "Last chance for rare item!"
- Countdown timers everywhere

**Why it's wrong**: Pressure tactics override rational decision-making

**SupaSnake alternative**: No artificial urgency, permanent catalog

### Sin 6: Pay-to-Win

**Mechanism**: Paying players have unfair advantage
- Premium weapons are stronger
- Paid items required for competitive play
- Leaderboards are spending contests

**Why it's wrong**: Destroys fairness, reduces game to "who spends most"

**SupaSnake alternative**: Skill determines score, not spending

### Sin 7: Dark Patterns

**Mechanism**: UI tricks to drive accidental purchases
- Huge "BUY NOW" button, tiny "No thanks" link
- Double-negative confirmations ("Don't not buy?")
- Fake close buttons on ads
- Pre-checked "Auto-renew subscription"

**Why it's wrong**: Deception, not value exchange

**SupaSnake alternative**: Clear CTAs, honest UI, informed consent

## Vulnerable Populations

### Children (Under 13)

**Special considerations**:
- Can't distinguish ads from content
- Limited impulse control
- Don't understand money/value
- Susceptible to social pressure

**SupaSnake protections**:
- COPPA compliance (parental consent)
- No targeting children in ads
- Parent gate for purchases (password required)
- No social comparison mechanics

### Addiction-Prone Players

**Red flags**:
- Player spending >$100/month on mobile game
- Playing for hours daily (escape behavior)
- Chasing losses (loot box gambling)

**Ethical response**:
- Spending warnings ("You've spent $50 this month")
- Spending limits (option to cap at $10/month)
- No punishment for taking breaks (no "login streak" loss)
- Resources for problem gambling

**SupaSnake approach**: Natural spending cap ($50 max) prevents whale exploitation

## Schell's Ethical Design Lenses

### Lens #110: The Lens of the Business Model

**Questions for SupaSnake**:
1. *What value am I providing to free players?*
   - Complete snake game, breeding system, collection progress

2. *What value am I providing to paying players?*
   - Convenience (skip waits), self-expression (cosmetics), support indie dev

3. *Would I recommend this game to my own child?*
   - Yes (no gambling, no exploitation, educational snake genetics)

4. *Am I proud of this monetization?*
   - Yes (transparent, fair, optional)

### Lens #111: The Lens of the Player's Journey

**Questions**:
1. *How does monetization affect the new player experience?*
   - Day 1: Free, no purchase pressure, fun immediately
   - Week 1: Optional energy purchase if engaged
   - Month 1: Cosmetics available, but earnable through play

2. *Does paying accelerate or skip the journey?*
   - Accelerate (play more sessions today)
   - NOT skip (can't buy skill or rare snakes directly)

## Metrics for Ethical Monetization

### Healthy F2P Metrics

**Retention**:
- Day 1: 35%+ (game is fun free)
- Day 7: 15%+ (payers emerge, don't quit after buying)
- Day 30: 5%+ (long-term engagement, not churn after spend)

**Monetization**:
- Conversion: 3-5% (most players happy free)
- ARPPU: $20-30 (reasonable spending per payer)
- Refund rate: <2% (players feel they got value)

**Engagement**:
- Session length: 3-5min (natural stopping point, not addictive grinding)
- Sessions/day: 2-4 (healthy habits, not obsessive)
- Churn after payment: <10% (payment didn't ruin experience)

### Warning Signs (Unethical Drift)

**Revenue**:
- ❌ ARPPU >$100 (whale exploitation)
- ❌ Conversion >20% (too aggressive, scared free players into paying)
- ❌ Revenue spike then retention crash (predatory monetization killed game)

**Engagement**:
- ❌ Session length >30min (addictive, not fun)
- ❌ Sessions/day >10 (compulsive behavior)
- ❌ High churn after first purchase (buyer's remorse)

**Player Feedback**:
- ❌ Reviews mention "pay-to-win"
- ❌ Complaints about "forcing payments"
- ❌ Parents reporting unexpected charges

## Real-World Ethical F2P Examples

### ✅ Duolingo (Language Learning)

**Ethical practices**:
- Free tier is complete experience
- Premium removes ads, adds convenience (offline lessons)
- No artificial timers or waiting
- Transparent value ($6.99/month)

**SupaSnake parallel**: Core game free, energy is pacing (not punishment), IAP is convenience

### ✅ Monument Valley (Premium → F2P Hybrid)

**Ethical practices**:
- Originally $3.99 premium
- Expansion packs $1.99 (clear value)
- No consumables, no energy, no ads
- Pay once, own forever

**SupaSnake difference**: F2P model (wider reach), but similar respect for player

### ❌ Clash of Clans (Aggressive F2P)

**Problematic practices**:
- Building timers (24 hours → $9.99 to skip)
- Gem currency obfuscation
- Whale-dominated leaderboards
- FOMO events

**Why it succeeds anyway**: Excellent core gameplay, social mechanics (despite aggressive monetization)

**SupaSnake lesson**: Great gameplay can survive bad monetization, but ethical monetization + great gameplay is better

## Key Takeaways for SupaSnake

1. **Free players are real players** → Design complete experience for $0
2. **Transparency over tricks** → Clear pricing, honest value
3. **Convenience over power** → Energy/cosmetics, not pay-to-win
4. **Respect over exploitation** → No dark patterns, FOMO, or gambling
5. **Long-term thinking** → Healthy retention > short-term revenue spike

**Mantra**: "Would I be proud to show this to Aunt Mildred?" → Yes.

## See Also

- **Concept**: @knowledge_base/game_design/quick_ref/concept_mobile_monetization.md
- **How-To**: @knowledge_base/game_design/how_to/design_ethical_monetization.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_32_business_summary.md
