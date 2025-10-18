# Mobile F2P Monetization - Quick Reference

**Source**: Schell Ch. 32 "Games as a Business"

## Core Principle

**Free-to-play is a design pattern, not a business model alone.** F2P games must deliver value to non-payers while offering meaningful purchases to payers—without exploitation.

## F2P Economic Reality (2024)

### Player Spending Distribution

**The 95-5-0.5 Rule:**
- **95%** of players: Never spend (free riders)
- **4.5%** of players: Spend $1-20 total (minnows)
- **0.5%** of players: Spend $50-500+ (whales)

**Implication**: Design must respect 95% who never pay, monetize the 5% who will.

### Mobile F2P Benchmarks

| Metric | Industry Average | SupaSnake Target | Notes |
|--------|------------------|------------------|-------|
| Conversion rate (payer %) | 2-5% | 3-5% | Higher = better monetization |
| ARPU (avg revenue per user) | $0.50-2.00 | $1.00 | Total players (including non-payers) |
| ARPPU (avg revenue per paying user) | $20-50 | $25 | Paying players only |
| Day 1 retention | 30-40% | 35%+ | Critical for monetization funnel |
| Day 7 retention | 10-20% | 15%+ | Monetization kicks in here |
| Day 30 retention | 3-8% | 5%+ | LTV mostly from these players |
| LTV (lifetime value) | $2-10 | $3-5 | Realistic for indie game |

## Mobile Monetization Models

### 1. Premium ($4.99 upfront)

**Pros**:
- One transaction (simple)
- No design compromises for monetization
- Players own game outright

**Cons**:
- Massive discovery barrier (pay before play)
- Mobile users resist upfront cost
- Revenue capped by downloads

**Verdict**: Wrong for SupaSnake (discoverability critical for indie)

### 2. Free-to-Play + IAP (In-App Purchases)

**Pros**:
- Zero barrier to entry (try before buy)
- Unlimited revenue potential (whales)
- Larger audience = more feedback/data

**Cons**:
- Must design around monetization
- Risk of pay-to-win perception
- Requires ongoing balance/content

**Verdict**: SupaSnake choice (matches Duolingo, Candy Crush success)

### 3. Free + Ads Only

**Pros**:
- No user resentment (no purchases)
- Revenue scales with engagement
- Simple implementation

**Cons**:
- Low eCPM ($2-5 per 1000 impressions)
- Intrusive ads hurt retention
- Ad blockers reduce revenue

**Verdict**: SupaSnake hybrid (optional rewarded video only)

## SupaSnake Monetization Strategy

### Core Philosophy: "Never Block Fun"

**Energy System = Pacing Tool, Not Paywall**
- Free players: 5 energy, 1 energy/5min regeneration = ~10-12 games/day
- Purpose: Prevent burnout, encourage return visits
- Not: Force payment to continue playing

**IAP = Convenience, Not Power**
- Energy refills: Skip wait, don't buy wins
- Cosmetic variants: Express identity, don't gain advantage
- Time savers: Accelerate progress players would achieve anyway

### Monetization Mechanics

#### 1. Energy (Consumable IAP)

**Product**: Energy Refill Packs
- Small: 5 energy = $0.99 (1 session)
- Medium: 15 energy = $1.99 (3 sessions)
- Large: 50 energy = $4.99 (10 sessions)

**Psychology**: Impulse buy when "one more game" urge hits

**Schell's Lens #110 (Business Model)**:
- *"What value am I providing?"* → Skip waiting, play now
- *"Is this exploitative?"* → No, free players get 10+ games/day (core experience intact)

#### 2. Cosmetic Variants (Durable IAP)

**Product**: Dynasty Variant Packs (Future)
- Premium variants: $1.99 each (unique skins)
- Dynasty packs: $4.99 for 3 variants
- Collector's bundle: $14.99 for all variants

**Psychology**: "Gotta catch 'em all" + self-expression

**Design constraint**: Variants are visible achievements (earn through breeding) + optional purchase (skip grind)

#### 3. Optional Rewarded Video Ads

**Product**: Watch 30s ad → +20% DNA bonus for next game
- User-initiated (never forced)
- Clear value exchange (time for reward)
- Frequency cap: 3/day max (prevent grind)

**eCPM estimate**: $5-10 per 1000 impressions
**Revenue**: ~$0.10-0.20 per engaged player/month (supplemental, not primary)

### Revenue Projections (Conservative)

**Assumptions**:
- 10,000 downloads (realistic for indie)
- 3% conversion to paying users
- $25 ARPPU (average per payer)

**Monthly Revenue Estimate**:
- IAP: 300 payers × $25 = $7,500/year = $625/month
- Ads: 10,000 users × 0.5 active × $0.15 = $750/month
- **Total**: ~$1,375/month at 10k users

**Scale requirement**: 50-100k users for sustainable indie income ($5-10k/month)

## Ethical F2P Design Principles (Schell-Derived)

### Principle 1: Free Players Get Real Value

**Rule**: 95% who never pay must have complete, satisfying experience

**SupaSnake implementation**:
- ✅ Classic Snake fully playable (core loop)
- ✅ Breeding system unlocks through play
- ✅ Collection progress achievable (50-80% collection free)
- ❌ No "paywall" levels or locked core features

**Test**: "Would I enjoy this game if I never spent a dollar?" → YES

### Principle 2: Purchases Are Convenience, Not Power

**Rule**: Paying doesn't make you win, it makes you progress faster

**SupaSnake implementation**:
- ✅ Energy refills: Play more now vs. later (not better)
- ✅ Variant purchases: Skip breeding RNG (variants also earnable)
- ❌ No "golden snake that scores 2x points" (pay-to-win)

**Test**: "Can free player beat paying player's high score?" → YES (skill > money)

### Principle 3: No Predatory Psychology

**Red flags to avoid** (Schell's warnings):
- ❌ Loot boxes with unknown odds (gambling)
- ❌ Social pressure ("Your friend is beating you, buy gems!")
- ❌ Fear of loss ("This deal expires in 59 minutes!")
- ❌ Infinite spending ("Top up your gems!")

**SupaSnake guardrails**:
- ✅ Transparent pricing (know what you get)
- ✅ No social shaming mechanics
- ✅ No artificial urgency timers
- ✅ Spending caps (energy packs, not infinite gems)

### Principle 4: Respect Player Time

**Rule**: Don't waste player time to force payment

**Anti-patterns**:
- ❌ 24-hour timers on trivial actions (FarmVille style)
- ❌ "Instant complete for 100 gems!" (manufactured frustration)
- ❌ Grind walls (10,000 battles to progress)

**SupaSnake approach**:
- ✅ Energy regeneration: 5 minutes (coffee break, not overnight)
- ✅ Breeding: 30-60 seconds (watch it happen, not wait hours)
- ✅ Progression: Achievable in weeks, not months

### Principle 5: Clear Value Exchange

**Rule**: Players should understand what they're buying and why

**SupaSnake transparency**:
- Energy refill: "5 energy = 5 more games right now" (clear)
- Variant purchase: "Unlock this snake skin immediately" (clear)
- NOT: "100 gems for $4.99" (obfuscated value)

## Monetization Psychology (Schell Ch. 32)

### The "Sunk Cost" Trap

**Mechanism**: Players who spend feel invested, harder to quit

**Ethical use**:
- ✅ Small first purchase ($0.99) lowers barrier, creates payer identity
- ❌ Exploit sunk cost to drive more spending ("You've spent $50, don't waste it!")

**SupaSnake**: Offer $0.99 "starter pack" (5 energy + 1 variant), but don't pressure follow-up

### The "Whale" Dilemma

**Reality**: 0.5% of players drive 50%+ of revenue

**Ethical question**: Is it okay to take $500 from one player?

**Schell's framework**:
- ✅ Whale gets value for money (exclusive content, recognition)
- ✅ Whale's spending doesn't hurt other players (no pay-to-win)
- ❌ Whale is exploited (gambling addiction, unclear value)

**SupaSnake approach**:
- Cap maximum spend ($50 = all current content)
- No infinite gem treadmill
- Whales support development, get early access to new dynasties (value exchange)

## Common F2P Mistakes (Indie Devs)

**Mistake 1: "I'll figure out monetization later"**
- F2P monetization must be designed from day 1
- Retrofitting IAP breaks game balance
- SupaSnake: Energy system IS the core pacing, designed for F2P from start

**Mistake 2: "I'll copy Candy Crush"**
- Copying mechanics without understanding psychology fails
- SupaSnake: Learn from Candy Crush (energy pacing), but don't clone (different audience)

**Mistake 3: "More monetization = more revenue"**
- Aggressive monetization kills retention
- Dead players spend $0
- SupaSnake: Light monetization, high retention > heavy monetization, low retention

**Mistake 4: "Ads are easy money"**
- Intrusive ads destroy UX (players quit)
- Low eCPM ($2-5) = need massive scale
- SupaSnake: Rewarded video only (user choice)

## Success Metrics to Track

**Monetization Health**:
- ARPU (avg revenue per user): Want $1-5 LTV
- Conversion rate: Want 3-5% paying
- Day 7 retention: Want 15%+ (payers emerge here)

**Warning Signs**:
- High revenue but dropping retention (too aggressive)
- High retention but low revenue (undermonetizing)
- Players quit after first purchase (bad value)

## See Also

- **Concept**: @knowledge_base/game_design/quick_ref/concept_ethical_f2p.md
- **How-To**: @knowledge_base/game_design/how_to/design_ethical_monetization.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_32_business_summary.md
