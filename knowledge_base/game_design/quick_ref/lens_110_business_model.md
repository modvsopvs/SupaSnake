# Lens #110: The Lens of the Business Model - Quick Reference

**Source**: Schell, "The Art of Game Design" (3rd ed.), Chapter 32

## The Lens

**Focus on**: How your game creates value for players AND captures value for you (sustainable business).

**Key Questions**:
1. What *value* are you providing to players (free and paying)?
2. What is the *fair price* for that value?
3. How does your *monetization* affect the player experience?
4. Is your business model *sustainable* long-term?
5. Would you *recommend* this game to your own family with this monetization?

## Purpose

A good business model creates win-win: players get value they're happy to pay for, you earn enough to keep making games. A bad business model extracts money without providing value (unsustainable, unethical).

## SupaSnake Application

### Question 1: Value Provided

**To FREE players (95% of users)**:
- Complete Classic Snake game (core loop, fully playable)
- Breeding system (unlock all mechanics, no paywall)
- Collection progress (50-80% of variants achievable free)
- Energy regeneration (10-12 games/day = 1-2 hours gameplay)
- Leaderboard competition (skill-based, not pay-to-win)

**Value test**: "Would I play this for months if I never spent a dollar?" → **YES** (complete experience)

**To PAYING players (5% of users)**:
- **Energy refills**: Play 20 games today instead of 10 (convenience, not power)
- **Cosmetic variants**: Express identity (show off rare skins)
- **Time savers**: Skip breeding RNG (still achievable free, paying = shortcut)
- **Support indie dev**: Feel-good factor (help solo dev continue updates)

**Value test**: "Do I get $1-5 of value for my money?" → **YES** (comparable to coffee/movie ticket)

### Question 2: Fair Pricing

**Energy pricing logic**:
- $0.99 = 5 energy = ~5 games = ~30 minutes gameplay
- **Comparison**: $0.99 coffee = 10 minutes enjoyment → SupaSnake = 3x better value
- **Fair?** YES (clear exchange: money for time)

**Cosmetic variant pricing**:
- $1.99 = 1 exclusive variant = permanent ownership
- **Comparison**: $1.99 Fortnite skin = same, but SupaSnake = also earnable free
- **Fair?** YES (optional, doesn't block content)

**"Whale" cap**:
- Maximum spend: ~$50 for ALL content (3 dynasties, all variants, energy bundles)
- **Prevents**: Gambling-like infinite spending
- **Protects**: Vulnerable players (addictive personalities)

**Schell's "Aunt Mildred test"**: "Would I feel comfortable explaining this to my aunt?"
- "Energy costs $1 for 30 min gameplay" → Aunt Mildred: "That's reasonable!"
- "Loot boxes with 0.5% rare drop" → Aunt Mildred: "That's gambling!" ❌

### Question 3: Monetization Impact on Experience

**Energy system effects**:
- **Positive**: Prevents burnout (natural stopping point), encourages return visits (retention)
- **Negative**: Blocks "binge" sessions (some players want 2-hour marathon)
- **Mitigated**: Free players get 10-12 games/day (enough for casual play), paying players can binge

**Design decision**: Energy = pacing tool FIRST, monetization SECOND
- If we removed IAP, would energy still exist? → **YES** (healthy for retention)
- Is energy timer punishing? → **NO** (5 min regeneration, not 30 min like Candy Crush)

**IAP placement**:
- ✅ Non-intrusive (never interrupt gameplay with "buy now" popups)
- ✅ Optional ("Out of energy" screen shows regen time AND IAP option, equal weight)
- ✅ Transparent (real money prices, not confusing gem currency)

**Player feedback loop**:
- If monetization too aggressive → Retention drops (players quit) → Revenue drops → Bad business
- If monetization too light → Retention high, revenue low → Can't fund updates → Bad business
- **SupaSnake target**: 15% Day 7 retention + 3% conversion (balanced)

### Question 4: Long-Term Sustainability

**Revenue model**: F2P + IAP (energy, cosmetics) + optional ads

**Sustainability math**:
- **Year 1**: 10k users × $1 ARPU = $10k revenue (covers dev accounts, tools, some living expenses)
- **Year 2**: 100k users × $1 ARPU = $100k revenue (sustainable full-time solo indie)
- **Year 3+**: Maintain 100k users, add new dynasties (paid DLC) = $120k+ revenue

**Content pipeline**:
- Monthly: Balance patches, bug fixes (free, builds loyalty)
- Quarterly: New dynasty (3 variants, breeding mechanics) = $4.99 IAP or earnable
- Yearly: Major update (new game mode, multiplayer?) = reinvest revenue

**Churn vs. retention**:
- If churn too high (players quit fast) → Can't monetize (need 7+ days to convert)
- **Target**: Day 30 retention 5%+ (these players = LTV, fund future development)

**Ethical sustainability**:
- Avoid "whale hunting" (exploiting 0.1% spending $500+)
- Prefer "minnows" (5% spending $5-25) = more players, healthier ecosystem
- **SupaSnake**: Cap spending at $50 (protect vulnerable, sustainable on many small purchases)

### Question 5: Family Recommendation Test

**Would I let my 10-year-old niece play SupaSnake with IAP enabled?**

**YES, because**:
- ✅ No gambling mechanics (loot boxes, gacha)
- ✅ No social pressure ("Your friends are beating you!")
- ✅ No FOMO timers ("Offer expires in 5 minutes!")
- ✅ Transparent pricing (knows what she's buying)
- ✅ Parental controls (Apple/Google password gates)
- ✅ Educational (genetics, collection, patience)

**CONCERNS (mitigated)**:
- Energy system could frustrate ("I want to play MORE!") → Teach patience, finite resources
- IAP temptation → Parental password required, discuss value of money

**Schell's ethics**: "First, do no harm"
- SupaSnake designed for FUN, monetization layered on top (not vice versa)

## Business Model Comparison

### SupaSnake (Ethical F2P)

**Model**: Free + Energy + Optional IAP + Ads (rewarded video)

**Player value**:
- Free: Complete game, 10+ sessions/day
- Paying: Convenience (more sessions today), cosmetics (self-expression)

**Developer value**:
- 3% conversion × $25 ARPPU = $0.75 per user LTV
- At 100k users = $75k/year revenue (sustainable)

**Ethics**: ✅ Passes "Aunt Mildred" and "Family" tests

### Candy Crush (Aggressive F2P)

**Model**: Free + Lives (30min regen) + Level paywalls + Boosters

**Player value**:
- Free: Limited play (5 lives/2.5 hours), eventually hit pay-or-wait walls
- Paying: Relief from frustration (manufactured problem)

**Developer value**:
- 5% conversion × $100 ARPPU = $5 per user LTV
- Billions in revenue (but at player frustration cost)

**Ethics**: ⚠️ Controversial (manufactured frustration, some paywalls)

### Monument Valley (Premium)

**Model**: $4.99 upfront + $1.99 DLC

**Player value**:
- Paying: Complete experience, no ads, no timers, own forever

**Developer value**:
- $4.99 per download, but requires strong brand/marketing to overcome "pay before try" barrier
- ~2M downloads = $10M revenue (huge success for premium indie)

**Ethics**: ✅ Transparent, no dark patterns

**Why SupaSnake isn't premium**: Discovery barrier (need mass appeal, not niche)

## Using This Lens

**When to use**: Before finalizing monetization, when revenue is low, when players complain

**How to use**:
1. **List all revenue sources**: Energy IAP, cosmetics, ads, (future: DLC)
2. **For each, ask**: Does this provide value? Is price fair? Does it hurt experience?
3. **Calculate sustainability**: At 10k, 100k, 1M users, can I fund development?
4. **Ethics check**: Aunt Mildred test, Family test
5. **Iterate**: If failing any test, adjust (lower prices, remove dark patterns, add free value)

**Red flags**:
- ❌ Revenue from frustration (pay to remove pain)
- ❌ Obfuscated pricing (gems, gold, confusing currency)
- ❌ Infinite spending (no cap, whales exploited)
- ❌ Pay-to-win (skill doesn't matter, wallet wins)
- ❌ Dark patterns (misleading UI, fake urgency)

**Green flags**:
- ✅ Revenue from value (pay for convenience, expression, support)
- ✅ Transparent pricing (know what you're buying)
- ✅ Spending cap (natural ceiling, protects vulnerable)
- ✅ Skill > wallet (free player can beat paying player)
- ✅ Honest UI (clear CTAs, informed consent)

## SupaSnake Business Model Evolution

### v1.0 (Launch)

**Revenue sources**:
- Energy IAP ($0.99, $1.99, $4.99 packs)
- Rewarded video ads (optional, 3/day cap)

**Projection**: 10k users, 3% conversion, $10k Year 1

**Focus**: Prove retention, validate pricing

### v2.0 (6 months post-launch)

**New revenue**:
- Cosmetic variants ($1.99 each, $4.99 dynasty packs)
- Optional ad removal ($9.99 lifetime)

**Projection**: 50k users, 4% conversion (proven value), $50k Year 2

**Focus**: Expand monetization without hurting experience

### v3.0 (12+ months post-launch)

**New revenue**:
- Paid DLC dynasties ($4.99 for new dynasty, 5 variants, new mechanics)
- Season pass ($4.99/3 months, exclusive variants + energy bundles)

**Projection**: 100k+ users, 5% conversion, $100k+ Year 3

**Focus**: Sustainable content pipeline, convert long-term fans

## Metrics to Validate Business Model

**Monetization health**:
- ARPU (avg revenue per user): $1+ (target)
- Conversion rate: 3-5% (healthy)
- ARPPU (avg revenue per paying user): $20-30 (not exploitative)
- LTV (lifetime value): $3-5 (sustainable)

**Retention health** (required for monetization):
- Day 1: 35%+ (game is fun free)
- Day 7: 15%+ (long enough to convert)
- Day 30: 5%+ (these players drive LTV)

**Ethics health**:
- Refund rate: <2% (players feel they got value)
- 1-star reviews mentioning "pay-to-win": <5% (monetization not breaking game)
- Player spending: 95% spend <$20 (not exploiting whales)

**Warning signs** (bad business model):
- High revenue, dropping retention (too aggressive)
- High retention, low revenue (undermonetizing)
- Whale concentration (10% of revenue from 0.1% players = exploitative)

## Key Takeaways

1. **Value FIRST, monetization SECOND** (make great free game, layer IAP on top)
2. **Transparent pricing** (no confusing currencies, know what you're buying)
3. **Ethical limits** (spending caps, no gambling, no dark patterns)
4. **Sustainable math** (need 3-5% conversion at $20-30 ARPPU to fund development)
5. **Family test** (if you wouldn't recommend to family, fix monetization)

**SupaSnake mantra**: "Create value, capture value fairly, sustain development ethically."

## See Also

- **Concept**: @knowledge_base/game_design/quick_ref/concept_mobile_monetization.md
- **Concept**: @knowledge_base/game_design/quick_ref/concept_ethical_f2p.md
- **How-To**: @knowledge_base/game_design/how_to/design_ethical_monetization.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_32_business_summary.md
