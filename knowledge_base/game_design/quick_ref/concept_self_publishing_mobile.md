# Self-Publishing on Mobile - Quick Reference

**Source**: Schell Ch. 30 "The Audience is Your Client", Ch. 32 "Indie Business Models"

## Core Principle

**Self-publishing = You are the publisher.** No middleman, no gatekeepers (except Apple/Google), but also no marketing budget, no QA team, no established audience. Trade autonomy for risk.

## Self-Publishing vs. Traditional Publishing

### Traditional Publisher Model

**What they provide**:
- Upfront funding ($50k-500k advance)
- Marketing budget + expertise
- QA/localization/porting services
- Distribution relationships (featured placements)
- Financial risk absorption

**What they take**:
- 30-50% revenue share (perpetual)
- Creative control (approval rights)
- IP ownership (often)
- Publishing rights (multi-year exclusivity)

**When it makes sense**: First-time dev, complex game, need $100k+ budget

### Self-Publishing Model (SupaSnake)

**What you control**:
- 100% creative freedom
- 100% revenue (after platform cut)
- IP ownership
- Release timing
- Pricing strategy

**What you risk**:
- $0 advance (self-funded development)
- $0 marketing budget (organic growth only)
- Solo QA (you are the QA team)
- No guaranteed audience
- Financial risk 100% on you

**When it makes sense**: Solo indie, small scope, testing market, building portfolio

## App Store Economics

### Platform Fees (Non-Negotiable)

**Apple App Store**:
- 30% of revenue (first year)
- 15% after year 1 for subscribers
- $99/year developer account
- **SupaSnake impact**: Keep 70% of all IAP revenue

**Google Play**:
- 30% of revenue (first $1M)
- 15% after $1M annual revenue
- $25 one-time developer account
- **SupaSnake impact**: Same 70/30 split

**Payment processing**:
- Apple/Google handle all payment (no Stripe, PayPal integration)
- No negotiation (platform monopoly)

### Revenue Math (SupaSnake Example)

**Scenario**: 10,000 downloads, 3% conversion, $25 ARPPU

**Gross revenue**:
- Paying users: 10,000 × 3% = 300 users
- Revenue: 300 × $25 = $7,500/year

**Net revenue** (after platform cut):
- Apple/Google take: $7,500 × 30% = $2,250
- Developer keeps: $7,500 × 70% = **$5,250/year**

**Monthly income**: $437.50/month (not sustainable alone)

**Scale needed**: 100k downloads = $43k/year, 500k downloads = $218k/year (full-time indie viable)

## Self-Publishing Requirements

### 1. Developer Accounts

**Apple Developer Program** ($99/year):
- Submit iOS apps to App Store
- TestFlight beta testing (10k external testers)
- App Store Connect analytics
- Push notification certificates

**Google Play Console** ($25 one-time):
- Submit Android apps to Play Store
- Internal/alpha/beta testing tracks
- Play Console analytics
- No annual fee (one-time)

**Total cost**: $124 (Year 1), $99/year after

### 2. Legal Entity (Optional but Recommended)

**Sole proprietorship** (simplest):
- File taxes as individual (Schedule C)
- Personal liability (you = business)
- No setup cost

**LLC** (recommended):
- Limited liability protection
- Professional appearance
- Tax flexibility
- Cost: $50-500 (state dependent) + $800/year (CA)

**SupaSnake approach**: Start sole prop, upgrade to LLC if revenue >$20k/year

### 3. Privacy Policy & Terms of Service

**Legal requirement**: All apps collecting data (even analytics) need privacy policy

**SupaSnake data collected**:
- Email (account creation)
- Gameplay data (scores, collection progress)
- Device ID (analytics, crash reporting)
- Purchase history (IAP)

**Solution**: Use generator (Termly, iubenda) → $0-20/month

**GDPR/COPPA compliance**:
- GDPR (EU): Right to delete data (implement in Supabase)
- COPPA (US children): Parental consent if under 13 (age gate)

### 4. Tax Obligations

**US-based indie**:
- Quarterly estimated taxes (15.3% self-employment + income tax)
- Track expenses (equipment, software, marketing)
- Use app like QuickBooks Self-Employed ($15/month)

**International sales**:
- Apple/Google handle VAT/sales tax collection (no action needed)
- Report revenue on US tax return

**Tax deductions**:
- Developer accounts ($99-124/year)
- Software subscriptions (Figma, Adobe, etc.)
- Equipment (laptop, phone, tablet)
- Marketing expenses (influencer payments, ads)

## SupaSnake Self-Publishing Roadmap

### Phase 1: Pre-Launch (Months 1-3)

**Development**:
- ✅ Build MVP (Classic Snake + breeding + 3 dynasties)
- ✅ Internal testing (solo dev playtesting)
- ✅ Polish (UI/UX, animations, sound)

**Business setup**:
- [ ] Register Apple Developer ($99)
- [ ] Register Google Play ($25)
- [ ] Generate privacy policy (Termly)
- [ ] Set up analytics (Firebase/Amplitude)

**Marketing prep**:
- [ ] Create social media accounts (Twitter, TikTok)
- [ ] Build landing page (SupaSnake.com or itch.io)
- [ ] Record gameplay videos (screenshots, preview video)
- [ ] Write app description + ASO keywords

**Cost**: $124 (dev accounts) + $20 (privacy policy) = **$144 total**

### Phase 2: Soft Launch (Month 4)

**Testing market**: Canada or Philippines (English, smaller, low risk)

**Objectives**:
- Test ASO (keywords, screenshots convert?)
- Measure retention (Day 1, 7, 30)
- Validate monetization (conversion rate, ARPPU)
- Find critical bugs (real users = real bugs)

**Metrics to hit** (before global launch):
- Day 1 retention: 30%+ (or iterate gameplay)
- Day 7 retention: 12%+ (or improve onboarding)
- Conversion rate: 2%+ (or adjust IAP pricing)
- Crash-free rate: 99%+ (or fix stability)

**Duration**: 2-4 weeks (enough data for decisions)

**Cost**: $0 (using free accounts, no ads)

### Phase 3: Global Launch (Month 5)

**Preparation**:
- Fix issues found in soft launch
- Finalize ASO (proven screenshots, keywords)
- Build launch mailing list (100-500 beta testers)
- Reach out to micro-influencers (free early access)

**Launch day**:
- Submit to App Store + Play Store (2-7 day review)
- Email beta testers (download + review request)
- Post on social media (Twitter, TikTok, Reddit)
- Reach out to press (TouchArcade, Pocket Gamer)

**Goal**: 100+ downloads Day 1 (signals to algorithm)

**Cost**: $0-500 (optional: $500 micro-influencer sponsorship)

### Phase 4: Post-Launch (Month 6+)

**Growth**:
- Daily: Social media posts (breeding combos, player highlights)
- Weekly: ASO iteration (test new screenshots, keywords)
- Monthly: Content updates (new variant, limited event)

**Monetization**:
- Analyze: Which IAP sells? Which doesn't?
- Optimize: Price testing ($0.99 vs $1.99 energy pack)
- Expand: Add cosmetic variants (new revenue stream)

**Community**:
- Discord server (super fans, feedback, beta testing)
- Reply to App Store reviews (build loyalty)
- Feature player creations (social proof)

**Cost**: $0-100/month (optional: Discord Nitro, social media ads)

## Common Self-Publishing Mistakes

### Mistake 1: "I'll market after launch"

**Problem**: No audience = no downloads = invisible in app stores

**Solution**: Build audience DURING development
- Dev blog (share progress)
- Beta testing (100-500 early fans)
- Social media (show behind-the-scenes)

**SupaSnake**: Start Twitter/TikTok 3 months before launch, share breeding reveals

### Mistake 2: "My game will go viral"

**Reality**: <1% of indie games "go viral" organically

**Solution**: Plan for slow, organic growth
- Month 1: 100-500 downloads (beta list)
- Month 3: 1,000-5,000 (ASO, word-of-mouth)
- Month 6: 10,000-50,000 (if retention good, featured possible)

**SupaSnake**: Assume 10k downloads Year 1 (conservative), plan for 100k Year 2 (if iterating)

### Mistake 3: "I don't need analytics"

**Problem**: Can't improve what you don't measure

**Solution**: Implement analytics Day 1
- Firebase Analytics (free, 500 events)
- Mixpanel (generous free tier)
- Track: Retention, session length, monetization, funnels

**SupaSnake**: Track breeding frequency, energy usage, IAP triggers (data-driven iteration)

### Mistake 4: "One-and-done launch"

**Problem**: App Store is crowded, launch spike fades in 2-3 days

**Solution**: Treat launch as beginning, not end
- Monthly content updates (new variants, events)
- Seasonal events (Holiday dynasty, Summer skins)
- Community challenges (breed X snake, leaderboard)

**SupaSnake**: Plan 12-month content roadmap (new dynasty every 3 months)

### Mistake 5: "Ignore negative reviews"

**Problem**: Unaddressed issues fester, ratings drop, downloads crater

**Solution**: Respond to ALL reviews (positive + negative)
- Thank positive reviewers
- Fix bugs mentioned in negative reviews
- Explain misunderstandings (if user confused)
- Update review reply when fixed ("Fixed in v1.2!")

**SupaSnake**: Weekly review monitoring, 48-hour response time

## Self-Publishing Success Metrics

### Downloads

**Indie benchmarks**:
- Month 1: 100-1,000 (organic + beta)
- Month 6: 1,000-10,000 (if ASO working)
- Year 1: 10,000-100,000 (if featured or viral)

**SupaSnake target**: 10k Year 1 (conservative), 50k Year 2 (stretch)

### Revenue

**Indie benchmarks**:
- ARPU: $0.50-2.00 (avg all users)
- ARPPU: $20-50 (avg paying users)
- LTV: $2-10 (lifetime value)

**SupaSnake target**:
- ARPU: $1.00 (10k users × $1 = $10k Year 1)
- ARPPU: $25 (3% conversion)
- LTV: $3-5 (achievable with updates)

### Retention

**Indie benchmarks**:
- Day 1: 25-35% (great games: 40%+)
- Day 7: 10-15% (great games: 20%+)
- Day 30: 3-8% (great games: 10%+)

**SupaSnake target**: Hit "great game" benchmarks (breeding hook drives retention)

## Tools for Self-Publishers

**App Store Optimization**:
- App Annie (keyword research, competitor analysis)
- Sensor Tower (ASO tracking, market intelligence)
- Cost: Free tier available, $50-100/month pro

**Analytics**:
- Firebase Analytics (free, deep integration)
- Mixpanel (free up to 100k events/month)
- Amplitude (generous free tier)

**Marketing**:
- Mailchimp (email list, free up to 500 subscribers)
- Buffer/Hootsuite (social media scheduling, free tier)
- Canva (graphics for social media, free)

**Community**:
- Discord (free server, Nitro $10/month optional)
- Reddit (free, organic reach)
- Twitter/X (free)

**Total cost**: $0-100/month (mostly free tools)

## Key Takeaway

**Self-publishing is DIY publishing.**

You gain:
- Creative control
- 100% revenue (post-platform cut)
- IP ownership
- Flexibility

You lose:
- Advance funding
- Marketing support
- Established audience
- Safety net

**SupaSnake fit**: Perfect for self-publishing (small scope, solo dev, testing market, building portfolio)

**Breakeven**: ~5k downloads at 3% conversion = ~$3,750/year (covers dev account + tools)

**Sustainable**: ~100k downloads = ~$45k/year (full-time indie income possible)

**Path**: Launch → Iterate → Grow → Sustain (or pivot to publisher for sequel if successful)

## See Also

- **Concept**: @knowledge_base/game_design/quick_ref/concept_app_store_presence.md
- **Concept**: @knowledge_base/game_design/quick_ref/concept_indie_funding.md
- **How-To**: @knowledge_base/game_design/how_to/optimize_app_store_presence.md
- **Reference**: @knowledge_base/game_design/reference/batch4_chapters/chapter_30_clients_summary.md
