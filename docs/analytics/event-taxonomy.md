# Analytics Event Taxonomy

**Version:** 1.0
**Last Updated:** 2025-10-19
**Status:** Complete specification, implementation pending
**Coverage:** 35 core events across all game systems

---

## Overview

This document defines all analytics events tracked in SupaSnake for:
- Player behavior analysis (Amplitude)
- A/B testing (Statsig)
- Attribution tracking (Adjust)
- Retention optimization
- Revenue tracking

**Integration:** See `src/lib/analytics/amplitude.ts` for implementation.

---

## Event Categories

| Category | Events | Purpose |
|----------|--------|---------|
| User Lifecycle | 4 | Acquisition, onboarding, retention |
| Gameplay | 4 | Core loop engagement, difficulty tuning |
| Collection | 4 | Collection completion, rarity distribution |
| Breeding | 3 | Breeding engagement, DNA economy |
| Evolution | 2 | Evolution usage (v0.5+) |
| Economy | 4 | DNA flow, IAP tracking |
| Energy | 3 | Session pacing, energy gating |
| Retention | 4 | Daily engagement, streak tracking |
| Social | 3 | Multiplayer features (future) |
| Technical | 4 | Performance, errors, crashes |

**Total:** 35 core events

---

## User Lifecycle Events

### `app_installed`
**When:** First app launch (iOS/Android)
**Purpose:** Track acquisition source, platform distribution
**Properties:**
```typescript
{
  platform: 'ios' | 'android' | 'web',
  version: string, // App version (e.g., '1.0.0')
  attribution_source: string, // From Adjust (e.g., 'organic', 'facebook_ad')
  device_model: string, // e.g., 'iPhone 14 Pro'
  os_version: string, // e.g., 'iOS 17.0'
  install_timestamp: number, // Unix timestamp
}
```
**Amplitude Usage:** Install attribution, platform analysis
**Adjust Integration:** Yes (install event)

---

### `user_registered`
**When:** User completes account creation
**Purpose:** Track registration method, conversion rate
**Properties:**
```typescript
{
  method: 'email' | 'google' | 'apple' | 'guest',
  age_verified: boolean, // Always true (13+ requirement)
  time_to_register_seconds: number, // Time from install to register
  tutorial_completed: boolean, // Did they finish tutorial first?
}
```
**Funnel Tracking:** Install → Register (conversion rate)

---

### `tutorial_started`
**When:** User starts first-time user experience
**Purpose:** Measure tutorial engagement
**Properties:**
```typescript
{
  tutorial_version: string, // For A/B testing ('v1', 'v2_short', etc.)
  started_at: number, // Unix timestamp
}
```
**A/B Testing:** Statsig experiment - tutorial length/style

---

### `tutorial_completed`
**When:** User finishes FTUE
**Purpose:** Measure tutorial completion rate, identify drop-off points
**Properties:**
```typescript
{
  duration_seconds: number,
  steps_completed: number,
  tutorial_version: string,
  skipped: boolean, // Did they skip tutorial?
  completed_at: number, // Unix timestamp
}
```
**Funnel Tracking:** Tutorial Start → Completion (drop-off analysis)

---

## Gameplay Events

### `game_started`
**When:** Player starts a Snake game session
**Purpose:** Track play frequency, mode preferences
**Properties:**
```typescript
{
  mode: 'classic' | 'timed' | 'zen' | 'challenge', // Game mode
  difficulty: 'easy' | 'medium' | 'hard',
  energy_spent: number, // Energy cost (default: 1)
  energy_remaining: number, // Energy after starting
  session_number: number, // Nth game session today
  dna_balance: number, // DNA before game
}
```
**Retention:** Daily active sessions, session frequency

---

### `game_completed`
**When:** Player successfully completes a game (wins or reaches goal)
**Purpose:** Measure skill progression, DNA earning rate
**Properties:**
```typescript
{
  mode: 'classic' | 'timed' | 'zen' | 'challenge',
  score: number,
  dna_earned: number,
  duration_seconds: number,
  food_collected: number,
  max_snake_length: number,
  difficulty: 'easy' | 'medium' | 'hard',
  new_high_score: boolean,
}
```
**Balance Tuning:** DNA earning rate, score distribution, difficulty curve

---

### `game_failed`
**When:** Player loses a game
**Purpose:** Identify difficulty spikes, common failure points
**Properties:**
```typescript
{
  mode: 'classic' | 'timed' | 'zen' | 'challenge',
  score: number,
  reason: 'wall_collision' | 'self_collision' | 'time_expired' | 'quit',
  duration_seconds: number,
  food_collected: number,
  snake_length_at_death: number,
  difficulty: 'easy' | 'medium' | 'hard',
}
```
**UX Improvement:** Where do players struggle? Is difficulty balanced?

---

### `dna_earned`
**When:** Player receives DNA (from gameplay, bonuses, etc.)
**Purpose:** Track DNA sources, economy balance
**Properties:**
```typescript
{
  amount: number,
  source: 'gameplay' | 'daily_bonus' | 'achievement' | 'gift' | 'iap',
  score: number | null, // Score if from gameplay
  new_balance: number,
  multiplier: number, // Collection bonuses (default: 1.0)
}
```
**Economy:** DNA generation rate, inflation tracking

---

## Collection Events

### `variant_viewed`
**When:** Player views variant details in Collection Lab
**Purpose:** Track collection engagement, discovery rate
**Properties:**
```typescript
{
  variant_id: string, // UUID
  dynasty: 'CYBER' | 'PRIMAL' | 'COSMIC',
  rarity: 'common' | 'uncommon' | 'rare' | 'epic' | 'legendary',
  owned: boolean, // Do they own this variant?
  view_duration_seconds: number,
}
```
**Engagement:** Which variants are most interesting?

---

### `variant_unlocked`
**When:** Player acquires a new variant
**Purpose:** Track collection progress, rarity distribution
**Properties:**
```typescript
{
  variant_id: string,
  dynasty: 'CYBER' | 'PRIMAL' | 'COSMIC',
  rarity: 'common' | 'uncommon' | 'rare' | 'epic' | 'legendary',
  method: 'bred' | 'purchased' | 'gift' | 'event',
  generation: number, // 1 = starter, 2+ = bred
  total_variants_owned: number,
  dynasty_progress: number, // % of dynasty collected
  cost_dna: number | null, // If purchased
}
```
**Progression:** Collection velocity, rarity balance, monetization

---

### `dynasty_completed`
**When:** Player collects all variants in a dynasty
**Purpose:** Measure completion rate, time to complete
**Properties:**
```typescript
{
  dynasty: 'CYBER' | 'PRIMAL' | 'COSMIC',
  variants_collected: number, // Should be 10 for starter dynasties
  time_to_complete_days: number, // Days from first variant to completion
  total_dna_spent: number,
  set_bonus_unlocked: string, // Bonus name
}
```
**Retention:** Completionist motivation, goal achievement

---

### `set_bonus_earned`
**When:** Player unlocks a collection set bonus
**Purpose:** Track bonus value, motivational impact
**Properties:**
```typescript
{
  bonus_type: 'dna_multiplier' | 'energy_regen' | 'special_ability',
  bonus_value: number, // e.g., 1.5 for 50% DNA boost
  dynasty: 'CYBER' | 'PRIMAL' | 'COSMIC',
  sets_completed: number, // How many sets do they have?
}
```
**Motivation:** Do set bonuses drive completion?

---

## Breeding Events

### `breeding_started`
**When:** Player initiates breeding process
**Purpose:** Track breeding engagement, pairing preferences
**Properties:**
```typescript
{
  parent1_id: string,
  parent2_id: string,
  parent1_rarity: string,
  parent2_rarity: string,
  dynasty: 'CYBER' | 'PRIMAL' | 'COSMIC',
  cost_dna: number,
  dna_balance_before: number,
  expected_generation: number,
}
```
**Engagement:** Breeding frequency, DNA sink

---

### `breeding_completed`
**When:** Breeding process finishes, offspring revealed
**Purpose:** Track breeding success rate, rarity outcomes
**Properties:**
```typescript
{
  parent1_id: string,
  parent2_id: string,
  offspring_id: string,
  offspring_rarity: string,
  offspring_generation: number,
  dynasty: 'CYBER' | 'PRIMAL' | 'COSMIC',
  breeding_duration_seconds: number,
  new_variant: boolean, // First time getting this variant?
}
```
**Balance:** Breeding formulas, rarity distribution

---

### `breeding_failed`
**When:** Breeding attempt fails (insufficient DNA, etc.)
**Purpose:** Identify friction points in breeding flow
**Properties:**
```typescript
{
  reason: 'insufficient_dna' | 'incompatible_variants' | 'cooldown_active',
  required_dna: number,
  current_dna: number,
  parent1_id: string,
  parent2_id: string,
}
```
**UX:** Where do players get stuck?

---

## Evolution Events (v0.5+)

### `evolution_started`
**When:** Player initiates evolution (rarity upgrade)
**Purpose:** Track evolution usage, upgrade velocity
**Properties:**
```typescript
{
  variant_id: string,
  current_rarity: string,
  target_rarity: string,
  cost_dna: number,
  required_duplicates: number,
  current_duplicates: number,
}
```
**Economy:** DNA sink, progression gating

---

### `evolution_completed`
**When:** Variant successfully evolves to higher rarity
**Purpose:** Measure evolution impact, player satisfaction
**Properties:**
```typescript
{
  variant_id: string,
  from_rarity: string,
  to_rarity: string,
  cost_dna: number,
  dna_balance_after: number,
  total_evolutions: number, // Player's total evolved variants
}
```
**Retention:** Does evolution drive engagement?

---

## Economy Events

### `dna_spent`
**When:** Player spends DNA on any purchase
**Purpose:** Track DNA sinks, spending patterns
**Properties:**
```typescript
{
  amount: number,
  purpose: 'breeding' | 'evolution' | 'shop_item' | 'energy_refill',
  item_id: string | null,
  new_balance: number,
  transaction_id: string, // UUID for tracking
}
```
**Economy:** DNA sinks, inflation control

---

### `shop_item_purchased`
**When:** Player buys item from shop (DNA or IAP)
**Purpose:** Track shop engagement, popular items
**Properties:**
```typescript
{
  item_id: string,
  item_type: 'variant' | 'energy' | 'dna_pack' | 'cosmetic',
  cost_dna: number | null,
  cost_usd: number | null, // If IAP
  payment_method: 'dna' | 'iap',
  new_dna_balance: number,
}
```
**Monetization:** What sells? What doesn't?

---

### `iap_initiated`
**When:** Player starts IAP flow (opens purchase modal)
**Purpose:** Track purchase funnel, conversion rate
**Properties:**
```typescript
{
  product_id: string, // e.g., 'dna_pack_1000'
  price_usd: number,
  currency: string,
  dna_amount: number, // DNA in pack
  source: 'shop' | 'low_balance_prompt' | 'breeding_prompt',
}
```
**Funnel:** Initiated → Completed (conversion)

---

### `iap_completed`
**When:** IAP successfully processed
**Purpose:** Track revenue, ARPU, conversion
**Properties:**
```typescript
{
  product_id: string,
  price_usd: number,
  currency: string,
  dna_amount: number,
  transaction_id: string, // Apple/Google transaction ID
  new_dna_balance: number,
  is_first_purchase: boolean,
}
```
**Revenue:** ARPU, LTV, payer conversion rate

---

## Energy Events

### `energy_depleted`
**When:** Player's energy reaches 0
**Purpose:** Track session pacing, energy gating effectiveness
**Properties:**
```typescript
{
  energy_before: number,
  games_played_this_session: number,
  session_duration_minutes: number,
  next_regen_in_minutes: number, // 20 minutes per energy
}
```
**Retention:** Does energy gating work? Too restrictive?

---

### `energy_regenerated`
**When:** Energy regenerates (every 20 minutes)
**Purpose:** Track return sessions, energy system engagement
**Properties:**
```typescript
{
  energy_before: number,
  energy_after: number,
  time_since_last_game_minutes: number,
  user_online: boolean, // Did they come back to play?
}
```
**Retention:** Does energy regen bring players back?

---

### `energy_refilled`
**When:** Player refills energy (via DNA or IAP)
**Purpose:** Track energy refill usage, monetization
**Properties:**
```typescript
{
  method: 'dna' | 'iap' | 'ad_watch' | 'daily_bonus',
  energy_before: number,
  energy_after: number,
  cost_dna: number | null,
  cost_usd: number | null,
}
```
**Monetization:** Energy refill as revenue source

---

## Retention Events

### `daily_bonus_claimed`
**When:** Player claims daily login bonus
**Purpose:** Track daily active users, streak motivation
**Properties:**
```typescript
{
  day_streak: number,
  bonus_amount_dna: number,
  bonus_type: 'dna' | 'energy' | 'variant',
  total_bonuses_claimed: number,
  days_since_last_claim: number,
}
```
**Retention:** DAU, streak engagement, lapsed players

---

### `session_started`
**When:** Player opens app (new session)
**Purpose:** Track session frequency, engagement patterns
**Properties:**
```typescript
{
  session_number: number, // Total sessions
  sessions_today: number,
  time_since_last_session_minutes: number,
  days_since_install: number,
  platform: 'ios' | 'android' | 'web',
}
```
**Retention:** Session frequency, app stickiness

---

### `session_ended`
**When:** Player closes app or goes idle
**Purpose:** Measure session length, engagement time
**Properties:**
```typescript
{
  session_duration_minutes: number,
  games_played: number,
  dna_earned: number,
  actions_taken: number, // Breeding, collecting, etc.
}
```
**Engagement:** Average session length, activity per session

---

### `player_returned`
**When:** Lapsed player (7+ days) returns to app
**Purpose:** Measure re-engagement campaigns, retention
**Properties:**
```typescript
{
  days_lapsed: number,
  return_source: 'push_notification' | 'email' | 'organic',
  campaign_id: string | null,
  dna_balance: number, // Did they keep progress?
}
```
**Retention:** Winback success, lapsed player behavior

---

## Social Events (Future - Multiplayer)

### `friend_added`
**When:** Player adds a friend
**Purpose:** Track social features engagement
**Properties:**
```typescript
{
  friend_id: string,
  method: 'search' | 'invite' | 'suggestion',
  total_friends: number,
}
```

---

### `gift_sent`
**When:** Player sends DNA/variant gift to friend
**Purpose:** Track social economy, virality
**Properties:**
```typescript
{
  recipient_id: string,
  gift_type: 'dna' | 'variant' | 'energy',
  gift_amount: number,
  cost_dna: number,
}
```

---

### `leaderboard_viewed`
**When:** Player views leaderboard
**Purpose:** Track competitive engagement
**Properties:**
```typescript
{
  leaderboard_type: 'global' | 'friends' | 'dynasty',
  player_rank: number,
  top_player_score: number,
  player_score: number,
}
```

---

## Technical Events

### `performance_issue`
**When:** Frame rate drops below 30fps for >1 second
**Purpose:** Identify performance bottlenecks
**Properties:**
```typescript
{
  avg_fps: number,
  duration_seconds: number,
  device_model: string,
  particle_count: number,
  scene: 'game' | 'collection' | 'breeding',
}
```

---

### `error_occurred`
**When:** JavaScript error or API error
**Purpose:** Track error rates, stability
**Properties:**
```typescript
{
  error_type: string, // Error.name
  error_message: string,
  stack_trace: string, // First 500 chars
  endpoint: string | null, // If API error
  user_action: string, // What were they doing?
}
```
**Integration:** Also sent to Sentry

---

### `app_crashed`
**When:** App force closes
**Purpose:** Track crash rate, stability issues
**Properties:**
```typescript
{
  crash_reason: string,
  device_model: string,
  os_version: string,
  app_version: string,
  memory_usage_mb: number,
}
```
**Integration:** Sentry primary, Amplitude backup

---

### `load_time_measured`
**When:** App launch or scene load
**Purpose:** Monitor performance, optimize loading
**Properties:**
```typescript
{
  load_type: 'app_launch' | 'scene_change' | 'asset_load',
  duration_ms: number,
  scene: string,
  asset_count: number | null,
}
```

---

## Event Implementation

### Server-Side Tracking (Recommended)

```typescript
// app/api/game/collect-dna/route.ts
import { trackEvent } from '@/lib/analytics/amplitude';

export async function POST(req: Request) {
  const { sessionId, score } = await req.json();

  // Process DNA collection...
  const dnaEarned = calculateDNA(score);

  // Track event (server-side)
  await trackEvent('dna_earned', {
    amount: dnaEarned,
    source: 'gameplay',
    score: score,
    new_balance: playerDNA + dnaEarned,
    multiplier: getCollectionBonus(playerId)
  });

  return Response.json({ dna: playerDNA + dnaEarned });
}
```

### Client-Side Tracking (For UI events)

```typescript
// src/components/CollectionLab.tsx
import { trackEvent } from '@/lib/analytics/amplitude';

const handleVariantView = (variant: Variant) => {
  const startTime = Date.now();

  // Show variant details...

  trackEvent('variant_viewed', {
    variant_id: variant.id,
    dynasty: variant.dynasty,
    rarity: variant.rarity,
    owned: playerVariants.includes(variant.id),
    view_duration_seconds: (Date.now() - startTime) / 1000
  });
};
```

---

## Privacy & Consent

**All analytics events require user consent (GDPR):**

```typescript
// src/lib/analytics/amplitude.ts
import { ConsentManager } from '@/lib/consent/consent-manager';

export const trackEvent = async (eventName: string, properties?: any) => {
  // Check consent before tracking
  if (!await ConsentManager.hasConsent('analytics')) {
    console.log('Analytics tracking disabled - no consent');
    return;
  }

  amplitude.track(eventName, properties);
};
```

**User can withdraw consent:** All analytics stop, GDPR deletion request sent to Amplitude.

---

## A/B Testing Integration

Use Statsig to vary event properties based on experiments:

```typescript
import { getExperiment } from '@/lib/analytics/statsig';

// Vary breeding cost in A/B test
const breedingCost = getExperiment('breeding_cost_test'); // 200 vs 250

trackEvent('breeding_started', {
  cost_dna: breedingCost,
  ab_test: 'breeding_cost_test',
  ab_variant: breedingCost === 200 ? 'A' : 'B'
});
```

---

## Amplitude Dashboards

**Recommended Dashboards:**

1. **Acquisition Dashboard**
   - `app_installed` by source
   - Install → Register conversion
   - Platform distribution

2. **Engagement Dashboard**
   - DAU/MAU
   - `session_started` frequency
   - Average session length
   - Games played per session

3. **Retention Dashboard**
   - D1, D7, D30 retention curves
   - `daily_bonus_claimed` streak distribution
   - Lapsed player return rate

4. **Economy Dashboard**
   - `dna_earned` by source
   - `dna_spent` by purpose
   - DNA balance distribution
   - Inflation metrics

5. **Monetization Dashboard**
   - `iap_initiated` → `iap_completed` funnel
   - ARPU, ARPPU, ARPDAU
   - First-time payer rate
   - Product mix (which IAPs sell?)

6. **Collection Dashboard**
   - `variant_unlocked` velocity
   - Rarity distribution
   - Dynasty completion rate
   - Time to complete dynasty

---

## Success Metrics (KPIs)

| Metric | Target | Event |
|--------|--------|-------|
| D1 Retention | >40% | `session_started` D0 → D1 |
| D7 Retention | >20% | `session_started` D0 → D7 |
| D30 Retention | >10% | `session_started` D0 → D30 |
| Daily Sessions | >2 | `session_started` count |
| Session Length | >10 min | `session_ended` duration |
| Install → Register | >60% | `user_registered` / `app_installed` |
| Tutorial Completion | >70% | `tutorial_completed` / `tutorial_started` |
| IAP Conversion | >2% | `iap_completed` / `app_installed` |
| ARPU Day 30 | >$1.00 | Sum `iap_completed` / DAU |
| Collection Rate | 1 variant/day | `variant_unlocked` frequency |

---

## Testing & Validation

**Before launch:**

1. **Event Firing:** Verify each event fires correctly
2. **Properties:** Check all properties have correct values
3. **User ID:** Ensure userId is set (not anonymous)
4. **Consent:** Verify events respect consent settings
5. **Amplitude Debug:** Use Amplitude debug mode to see real-time events

**Tools:**
- Amplitude Debugger: `amplitude.setOptOut(false)` in console
- Chrome DevTools: Network tab → filter `amplitude`
- Test user: Create test account, trigger all events

---

## References

**Integration:**
- src/lib/analytics/amplitude.ts (implementation)
- src/lib/analytics/statsig.ts (A/B testing)
- src/lib/consent/consent-manager.ts (GDPR compliance)

**Documentation:**
- docs/ARCHITECTURE.md (Analytics Architecture section)
- docs/legal/IMPLEMENTATION_GUIDE.md (Analytics setup)

**External:**
- Amplitude Taxonomy Guide: https://www.docs.developers.amplitude.com/
- Statsig Events: https://docs.statsig.com/client/jsClientSDK

---

**Version:** 1.0 - Complete taxonomy (35 events)
**Status:** Ready for implementation
**Next Steps:** Implement Amplitude integration, set up dashboards
