# SupaSnake Architecture

**Standard:** AAA 2026 Server-Authoritative Game Architecture
**Platform:** ZTE (Zero-Touch Engineering) with Deterministic Quality Enforcement
**Last Updated:** 2025-10-19

---

## Core Principles

### 1. Server Authority
**Server is the single source of truth for ALL game state.**

- Client displays UI and collects input
- Server processes ALL game logic
- Client receives results and updates display
- No game state in localStorage (UI preferences only)

### 2. Client/Server Separation
**Clear boundaries between client and server code.**

- Client code: UI components, rendering, input handling
- Server code: Game logic, validation, persistence
- Shared code: Types, utilities, isomorphic functions

### 3. Deterministic Quality
**Hooks enforce architecture automatically.**

- 5 architectural quality gates prevent violations
- Blocks: localStorage for game data, client DB access, exposed secrets, hard-coded constants
- Comprehensive audit on every completion

---

## Directory Structure

```
SupaSnake/
├── src/
│   ├── client/                     # Client-only code
│   │   ├── components/             # React components (UI only)
│   │   ├── hooks/                  # Client hooks
│   │   ├── ui/                     # UI components library
│   │   └── utils/                  # Client utilities
│   │
│   ├── server/                     # Server-only code
│   │   ├── api/                    # API route handlers
│   │   ├── game/                   # Game logic (authoritative)
│   │   │   ├── snake/              # Snake game mechanics
│   │   │   ├── collection/         # Collection system
│   │   │   ├── breeding/           # Breeding logic
│   │   │   └── economy/            # DNA economy
│   │   ├── services/               # Business logic services
│   │   └── db/                     # Database queries
│   │
│   ├── shared/                     # Isomorphic code
│   │   ├── types/                  # TypeScript types
│   │   ├── config/                 # Game configuration
│   │   │   └── game.ts             # GAME_CONFIG (single source)
│   │   └── utils/                  # Shared utilities
│   │
│   └── features/                   # Feature modules (domain-driven)
│       ├── snake/
│       │   ├── components/         # Snake UI components
│       │   ├── api/                # Snake API routes
│       │   └── hooks/              # Snake client hooks
│       ├── collection/
│       └── breeding/
│
├── app/                            # Next.js App Router
│   ├── api/                        # API routes (server-side)
│   │   ├── game/
│   │   │   ├── play/route.ts       # Game session endpoints
│   │   │   └── collect-dna/route.ts
│   │   ├── breeding/route.ts
│   │   └── collection/route.ts
│   ├── (game)/                     # Game routes
│   └── layout.tsx
│
├── src/
│   ├── lib/                        # Infrastructure libraries
│   │   ├── analytics/              # Analytics integrations
│   │   │   ├── amplitude.ts        # Amplitude SDK wrapper
│   │   │   ├── statsig.ts          # Statsig A/B testing
│   │   │   └── adjust.ts           # Adjust attribution
│   │   ├── consent/                # Consent management
│   │   │   └── consent-manager.ts  # Consent state handling
│   │   └── privacy/                # GDPR utilities
│   │       ├── export.ts           # Data export functions
│   │       └── delete.ts           # Data deletion functions
│   │
│   └── components/
│       └── legal/                  # Legal UI components
│           ├── AgeGate.tsx         # Age verification (13+)
│           └── ConsentBanner.tsx   # Cookie consent (planned)
│
├── app/
│   └── api/
│       ├── age-gate/
│       │   └── verify/route.ts     # Age verification endpoint
│       ├── user/
│       │   ├── export-data/route.ts   # GDPR export
│       │   └── delete-account/route.ts # GDPR deletion
│       └── consent/
│           └── update/route.ts     # Consent preferences
│
├── .claude/                        # Platform configuration
│   ├── hooks/                      # Quality enforcement hooks
│   │   ├── pre-tool-use/
│   │   │   ├── 07-enforce-server-authority.sh
│   │   │   ├── 08-block-client-db-access.sh
│   │   │   ├── 09-block-client-secrets.sh
│   │   │   └── 10-enforce-config-constants.sh
│   │   └── stop/
│   │       └── 04-architecture-audit.sh
│   └── agents/                     # Sub-agents for reviews
│
└── docs/                           # Documentation
    ├── ARCHITECTURE.md             # This file
    ├── API.md                      # API documentation
    ├── legal/                      # Legal documentation
    │   ├── terms-of-service.md     # ToS template
    │   ├── privacy-policy.md       # Privacy Policy template
    │   ├── cookie-policy.md        # Cookie Policy template
    │   ├── dpa-template.md         # DPA guide
    │   └── IMPLEMENTATION_GUIDE.md # Implementation roadmap
    └── analytics/                  # Analytics documentation
        └── event-taxonomy.md       # Analytics events (planned)
```

---

## Data Flow

### Client → Server → Database → Client

```
1. User Action (Client)
   ↓
   React Component calls API endpoint

2. API Route (Server)
   ↓
   Validates request
   ↓
   Processes game logic
   ↓
   Updates database

3. Database (Supabase)
   ↓
   Persists state
   ↓
   Triggers realtime updates

4. Client (Realtime)
   ↓
   Receives update
   ↓
   Updates UI
```

### Example: Collecting DNA

```typescript
// 1. CLIENT: User collects DNA
// components/SnakeGame.tsx
async function handleGameComplete(score: number) {
  const response = await fetch('/api/game/collect-dna', {
    method: 'POST',
    body: JSON.stringify({ sessionId, score })
  });
  const { newDNA } = await response.json();
  setPlayerDNA(newDNA); // Update UI
}

// 2. SERVER: Validate and process
// app/api/game/collect-dna/route.ts
export async function POST(req: Request) {
  const { sessionId, score } = await req.json();

  // Validate session
  const session = await validateSession(sessionId);
  if (!session) {
    return Response.json({ error: 'Invalid session' }, { status: 401 });
  }

  // Calculate DNA (server-side formula)
  const dnaEarned = Math.floor(score * GAME_CONFIG.economy.dna.scoreMultiplier);

  // Update database
  const { data } = await supabase
    .from('player_stats')
    .update({ dna: session.player.dna + dnaEarned })
    .eq('id', session.player.id)
    .select()
    .single();

  return Response.json({ newDNA: data.dna });
}

// 3. DATABASE: Supabase persists and broadcasts
// (Automatic with realtime subscription)

// 4. CLIENT: Realtime update (optional)
supabase
  .channel('player_stats')
  .on('postgres_changes', {
    event: 'UPDATE',
    schema: 'public',
    table: 'player_stats',
    filter: `id=eq.${playerId}`
  }, (payload) => {
    setPlayerDNA(payload.new.dna);
  })
  .subscribe();
```

---

## Architectural Quality Gates

### Hook 07: Server Authority
**Blocks:** localStorage for game state (DNA, score, inventory, etc.)
**Allows:** localStorage for UI preferences (theme, volume, tutorial flags)

### Hook 08: Client Database Access
**Blocks:** Direct `supabase.from()` calls in client code (components/, hooks/, ui/)
**Requires:** All database access through API routes

### Hook 09: Client Secrets
**Blocks:** SERVICE_ROLE_KEY, PRIVATE_KEY, SECRET_KEY in client code
**Allows:** NEXT_PUBLIC_* variables only

### Hook 10: Config Constants
**Blocks:** Hard-coded game balance values (const DNA_COST = 50)
**Requires:** All constants in src/shared/config/game.ts

### Hook 04: Architecture Audit
**Scans:** Comprehensive violations check (runs when Claude stops)
**Reports:** localStorage violations, client DB access, exposed secrets, hard-coded constants

---

## localStorage Policy

### ✅ Allowed
- UI preferences: theme, volume, language
- Input settings: control sensitivity, button layout
- Tutorial state: tutorial_seen, tips_shown
- Analytics: consent, device_id (anonymous)
- Session: temp_session_id (not auth token)

### ❌ Never Allowed
- Player stats: DNA, score, level, XP
- Inventory: variants, collection, unlocks
- Economy: currency, purchases, transactions
- Progress: achievements, milestones, quests
- Multiplayer: leaderboard, guild, friends

### Rule of Thumb
**If losing it means losing progress → Server**
**If losing it means re-selecting preferences → localStorage**

---

## API Design

### REST Conventions

```
GET    /api/collection           # Read collection
POST   /api/collection           # Add to collection
DELETE /api/collection/:id       # Remove from collection

GET    /api/breeding/pairs       # Get available pairs
POST   /api/breeding/breed       # Breed two variants

POST   /api/game/play            # Start game session
POST   /api/game/collect-dna     # Collect DNA from score
```

### Request/Response Format

```typescript
// Request
{
  "sessionId": "uuid",
  "score": 120
}

// Success Response
{
  "success": true,
  "data": {
    "newDNA": 1250,
    "earned": 12
  }
}

// Error Response
{
  "error": "Invalid session",
  "code": "INVALID_SESSION",
  "status": 401
}
```

### Error Handling

All API routes must have try-catch:

```typescript
export async function POST(req: Request) {
  try {
    // ... logic
  } catch (error) {
    console.error('API Error:', error);
    return Response.json(
      { error: 'Internal server error' },
      { status: 500 }
    );
  }
}
```

---

## Database Schema

### Core Tables

```sql
-- Player data
CREATE TABLE players (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id),
  username TEXT UNIQUE NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Player stats (server-authoritative)
CREATE TABLE player_stats (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  player_id UUID REFERENCES players(id) ON DELETE CASCADE,
  dna INTEGER DEFAULT 0,
  level INTEGER DEFAULT 1,
  experience INTEGER DEFAULT 0,
  energy INTEGER DEFAULT 5,
  energy_last_regen TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Variant collection
CREATE TABLE player_variants (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  player_id UUID REFERENCES players(id) ON DELETE CASCADE,
  variant_id UUID REFERENCES variants(id),
  acquired_at TIMESTAMPTZ DEFAULT NOW(),
  rarity TEXT NOT NULL,
  generation INTEGER DEFAULT 1
);

-- Game sessions (for validation)
CREATE TABLE game_sessions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  player_id UUID REFERENCES players(id) ON DELETE CASCADE,
  started_at TIMESTAMPTZ DEFAULT NOW(),
  completed_at TIMESTAMPTZ,
  score INTEGER,
  dna_earned INTEGER,
  valid BOOLEAN DEFAULT TRUE
);
```

### Row Level Security

```sql
-- Players can only read/update their own data
ALTER TABLE player_stats ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Players can view own stats"
  ON player_stats FOR SELECT
  USING (auth.uid() = (SELECT user_id FROM players WHERE id = player_id));

CREATE POLICY "Players can update own stats"
  ON player_stats FOR UPDATE
  USING (auth.uid() = (SELECT user_id FROM players WHERE id = player_id));
```

---

## Security

### Authentication
- Supabase Auth (JWT tokens)
- Client uses anon key (NEXT_PUBLIC_SUPABASE_ANON_KEY)
- Server uses service role key for admin operations

### Authorization
- Row Level Security (RLS) on all tables
- API routes validate user ownership
- Session validation for game endpoints

### Secrets Management
- Environment variables for all keys
- NEXT_PUBLIC_* prefix for client-safe variables
- Service keys only in server code

---

## Performance

### Client-Side
- React Server Components for initial render
- Optimistic UI updates for instant feedback
- Realtime subscriptions for live data

### Server-Side
- API route caching where appropriate
- Database connection pooling (Supabase)
- Efficient queries (select only needed columns)

### Database
- Indexed foreign keys
- Materialized views for aggregations
- Supabase Edge Functions for complex operations

---

## Testing

### Unit Tests
- Game logic (server/game/)
- Utilities (shared/utils/)
- Configuration (shared/config/)

### Integration Tests
- API endpoints (app/api/)
- Database queries
- Authentication flow

### E2E Tests
- Critical user flows
- Cross-device sync
- Offline behavior

---

## Deployment

### Environments
- Development: localhost:3000
- Staging: TBD
- Production: Vercel

### CI/CD
- GitHub Actions
- Automated tests on PR
- Deploy on merge to main

### Monitoring
- Sentry for error tracking
- Analytics for user behavior
- Database performance monitoring

---

## Legal & Compliance Architecture

**Standard:** AAA 2026 Global Compliance (GDPR, CCPA, COPPA)
**Status:** Foundation complete, implementation in progress

### Age Verification System

**Requirement:** COPPA compliance - block users <13

**Flow:**
```
1. User opens app for first time
   ↓
2. AgeGate component shown (blocks access)
   ↓
3. User enters birth year
   ↓
4. Client calculates age
   ↓
   If age < 13:
   → UnderageScreen shown
   → App access blocked
   → Parent contact email provided
   ↓
   If age ≥ 13:
   → Birth year hashed (SHA-256 + salt)
   → POST /api/age-gate/verify
   → Server stores hash + timestamp
   → localStorage backup (age_verified: true)
   → App access granted
```

**Implementation:**
```typescript
// src/components/legal/AgeGate.tsx
export default function AgeGate({ onVerified, onUnderage }) {
  const handleSubmit = async (e) => {
    const year = parseInt(birthYear);
    const age = currentYear - year;

    if (age < MIN_AGE) {
      await handleUnderage(year);
      return;
    }

    // Hash birth year (privacy-first)
    const hashedYear = await hashBirthYear(year);

    // Save to server
    await fetch('/api/age-gate/verify', {
      method: 'POST',
      body: JSON.stringify({
        ageVerified: true,
        verificationHash: hashedYear,
        verifiedAt: new Date().toISOString()
      })
    });

    onVerified(true);
  };

  const hashBirthYear = async (year) => {
    const salt = 'supasnake-age-gate';
    const data = `${year}-${salt}`;
    const hashBuffer = await crypto.subtle.digest('SHA-256', encoder.encode(data));
    return Array.from(new Uint8Array(hashBuffer))
      .map(b => b.toString(16).padStart(2, '0')).join('');
  };
}
```

**Privacy Design:**
- Never store raw birth date
- SHA-256 hash is one-way (non-reversible)
- Server-side verification (client cannot bypass)
- localStorage backup for offline check

### GDPR Compliance

**Requirements:** EU General Data Protection Regulation
- Right to access (Article 15)
- Right to deletion (Article 17)
- Right to portability (Article 20)
- Right to correction (Article 16)

**Endpoints:**

```typescript
// GET /api/user/export-data
// Returns all user data in JSON format
{
  "request_id": "uuid",
  "user_id": "uuid",
  "exported_at": "2025-10-19T12:00:00Z",
  "data": {
    "profile": { username, email, created_at },
    "game_data": { dna, level, variants_collected },
    "analytics_events": [...],
    "consent_history": [...]
  }
}

// DELETE /api/user/delete-account
// Hard deletes all user data (not soft delete)
Process:
1. Verify user identity (require re-authentication)
2. Delete from player_profiles
3. Delete from player_stats
4. Delete from player_variants
5. Delete from age_verifications
6. Call Amplitude GDPR API (delete events)
7. Call Adjust API (delete attribution data)
8. Send confirmation email
9. Return success
```

**Database Schema:**

```sql
-- Age verification
ALTER TABLE player_profiles ADD COLUMN age_verified BOOLEAN DEFAULT FALSE;
ALTER TABLE player_profiles ADD COLUMN age_verification_hash TEXT;
ALTER TABLE player_profiles ADD COLUMN age_verified_at TIMESTAMPTZ;

CREATE TABLE age_verifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  session_id TEXT NOT NULL,
  age_verified BOOLEAN NOT NULL,
  verification_hash TEXT NOT NULL,
  verified_at TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT NOW() + INTERVAL '7 days'
);

-- Consent management
CREATE TABLE user_consents (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  consent_type TEXT NOT NULL, -- 'analytics', 'marketing', 'functional'
  consented BOOLEAN NOT NULL,
  consented_at TIMESTAMPTZ NOT NULL,
  withdrawn_at TIMESTAMPTZ,
  ip_address INET,
  user_agent TEXT,
  consent_version TEXT NOT NULL
);

-- GDPR request logs (audit trail)
CREATE TABLE gdpr_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  request_type TEXT NOT NULL, -- 'export', 'delete', 'correct'
  requested_at TIMESTAMPTZ DEFAULT NOW(),
  completed_at TIMESTAMPTZ,
  status TEXT NOT NULL, -- 'pending', 'completed', 'failed'
  request_data JSONB,
  response_data JSONB
);
```

### Consent Management

**Requirement:** ePrivacy Directive (EU Cookie Law)

**Categories:**
1. **Strictly Necessary** (no consent required)
   - Session management (auth tokens)
   - CSRF protection
   - Security features

2. **Functional** (consent recommended)
   - UI preferences (theme, language)
   - Game settings (sound, controls)

3. **Analytics** (consent required - EU)
   - Amplitude (gameplay analytics)
   - Sentry (crash reporting)

4. **Marketing/Attribution** (consent required)
   - Adjust (install attribution)
   - IDFA/AAID tracking

**Flow:**
```
1. First app launch (EU users)
   ↓
2. ConsentBanner shown (after age gate)
   ↓
3. User choices:
   - Accept All
   - Reject All
   - Customize (granular consent)
   ↓
4. POST /api/consent/update
   ↓
5. Consent stored:
   - Server (user_consents table)
   - localStorage (backup)
   ↓
6. Analytics SDK initialized based on consent
```

**Integration:**
```typescript
// src/lib/consent/consent-manager.ts
export class ConsentManager {
  async updateConsent(consent: {
    analytics: boolean;
    marketing: boolean;
    functional: boolean;
  }) {
    // Save to server
    await fetch('/api/consent/update', {
      method: 'POST',
      body: JSON.stringify({
        consents: [
          { type: 'analytics', consented: consent.analytics },
          { type: 'marketing', consented: consent.marketing },
          { type: 'functional', consented: consent.functional }
        ],
        consentVersion: '1.0',
        ipAddress: await getClientIP(),
        userAgent: navigator.userAgent
      })
    });

    // Save to localStorage (backup)
    localStorage.setItem('consent', JSON.stringify(consent));

    // Initialize analytics based on consent
    if (consent.analytics) {
      initAmplitude();
      initSentry();
    }
  }
}
```

### Data Processing Agreements (DPAs)

**Requirement:** GDPR Article 28 - Controller-Processor contracts

**Vendors requiring DPA:**
- Supabase (database, hosting) - All user data
- Amplitude (analytics) - Events, device info
- Statsig (A/B testing) - Feature flags, events
- Adjust (attribution) - Device IDs, install source
- Sentry (error tracking) - Crash logs, stack traces
- OneTrust (consent management) - Consent records

**Compliance Checklist:**
- [ ] Request DPA from each vendor
- [ ] Lawyer review of all DPAs
- [ ] Sign DPAs via vendor process
- [ ] Store executed copies in docs/legal/executed-dpas/
- [ ] Track renewals (annual review)
- [ ] Monitor sub-processor changes

**Budget:** Included in $10k-15k legal budget

---

## Analytics Architecture

**Standard:** AAA Mobile F2P Analytics Stack
**Status:** Planned, not yet implemented

### Analytics Stack

**Core Analytics - Amplitude**
- Purpose: Retention, engagement, revenue tracking
- Events: 30-50 tracked events across all systems
- Cost: Free tier (10M events/month) → $995/month at 50k MAU
- Integration: src/lib/analytics/amplitude.ts

**A/B Testing - Statsig**
- Purpose: Feature flags, experiments, dynamic config
- Use cases: Balance tuning, UI variations, onboarding tests
- Cost: Free tier (1M events/month) → $50/month
- Integration: src/lib/analytics/statsig.ts

**Attribution - Adjust**
- Purpose: Track install source (ads, organic, referrals)
- Critical for: Marketing ROI, user acquisition
- Cost: Custom pricing (~$1k-3k/month)
- Integration: src/lib/analytics/adjust.ts

**Error Tracking - Sentry** (already configured)
- Purpose: Crash reporting, performance monitoring
- Cost: $26/month
- Integration: Already in .env

### Event Taxonomy

**User Lifecycle:**
```typescript
trackEvent('app_installed', {
  platform: 'ios' | 'android',
  version: '1.0.0',
  attribution_source: 'organic' | 'ad_campaign'
});

trackEvent('user_registered', {
  method: 'email' | 'google' | 'apple',
  age_verified: true
});

trackEvent('tutorial_completed', {
  duration_seconds: 120,
  steps_completed: 5
});
```

**Gameplay:**
```typescript
trackEvent('game_started', {
  mode: 'classic' | 'timed' | 'zen',
  energy_spent: 1
});

trackEvent('game_completed', {
  score: 450,
  dna_earned: 45,
  duration_seconds: 180,
  food_collected: 23
});

trackEvent('game_failed', {
  score: 120,
  reason: 'wall_collision' | 'self_collision',
  duration_seconds: 60
});
```

**Collection:**
```typescript
trackEvent('variant_unlocked', {
  variant_id: 'uuid',
  dynasty: 'CYBER',
  rarity: 'rare',
  method: 'bred' | 'purchased' | 'event'
});

trackEvent('dynasty_completed', {
  dynasty: 'CYBER',
  variants_collected: 10,
  time_to_complete_days: 14
});

trackEvent('set_bonus_earned', {
  bonus_type: 'dna_multiplier',
  bonus_value: 1.5
});
```

**Economy:**
```typescript
trackEvent('dna_earned', {
  amount: 45,
  source: 'gameplay' | 'daily_bonus' | 'achievement',
  new_balance: 1250
});

trackEvent('dna_spent', {
  amount: 200,
  purpose: 'breeding' | 'evolution' | 'shop_item',
  new_balance: 1050
});

trackEvent('iap_completed', {
  product_id: 'dna_pack_1000',
  price_usd: 4.99,
  currency: 'USD'
});
```

**Retention:**
```typescript
trackEvent('daily_bonus_claimed', {
  day_streak: 7,
  bonus_amount: 100
});

trackEvent('session_started', {
  session_number: 42,
  days_since_install: 14
});
```

**Total:** 30-50 events covering all game systems

### Analytics Integration

```typescript
// src/lib/analytics/amplitude.ts
import * as amplitude from '@amplitude/analytics-browser';

export const initAmplitude = () => {
  amplitude.init(process.env.NEXT_PUBLIC_AMPLITUDE_API_KEY!, {
    defaultTracking: {
      sessions: true,
      pageViews: true,
      formInteractions: false,
      fileDownloads: false
    }
  });
};

export const trackEvent = (eventName: string, properties?: Record<string, any>) => {
  amplitude.track(eventName, properties);
};

export const setUserId = (userId: string) => {
  amplitude.setUserId(userId);
};

export const setUserProperties = (properties: Record<string, any>) => {
  const identifyEvent = new amplitude.Identify();
  Object.entries(properties).forEach(([key, value]) => {
    identifyEvent.set(key, value);
  });
  amplitude.identify(identifyEvent);
};

// Usage in game code:
// app/api/game/collect-dna/route.ts
export async function POST(req: Request) {
  const { sessionId, score } = await req.json();

  // Process DNA collection...

  // Track analytics event (server-side)
  trackEvent('dna_earned', {
    amount: dnaEarned,
    source: 'gameplay',
    score: score,
    new_balance: newDNA
  });

  return Response.json({ newDNA });
}
```

### A/B Testing with Statsig

```typescript
// src/lib/analytics/statsig.ts
import { StatsigClient } from '@statsig/js-client';

const statsig = new StatsigClient(
  process.env.NEXT_PUBLIC_STATSIG_CLIENT_KEY!,
  { userID: userId }
);

export const getFeatureGate = (gateName: string): boolean => {
  return statsig.checkGate(gateName);
};

export const getExperiment = (experimentName: string): any => {
  return statsig.getExperiment(experimentName).get();
};

// Usage examples:
// Test DNA costs
const breedingCost = getExperiment('breeding_cost_test'); // 200 vs 250

// Test UI variations
const showNewLabUI = getFeatureGate('new_lab_ui'); // true/false

// Test onboarding flow
const ftueVariant = getExperiment('ftue_variant'); // 'short' vs 'long'
```

### Attribution with Adjust

```typescript
// src/lib/analytics/adjust.ts
import Adjust from '@adjustcom/adjust-web-sdk';

export const initAdjust = () => {
  Adjust.initSdk({
    appToken: process.env.NEXT_PUBLIC_ADJUST_APP_TOKEN!,
    environment: 'production'
  });
};

export const trackInstall = () => {
  Adjust.trackEvent({
    eventToken: 'install_event_token'
  });
};

export const trackRevenue = (amount: number, currency: string) => {
  Adjust.trackEvent({
    eventToken: 'revenue_event_token',
    revenue: amount,
    currency: currency
  });
};
```

### Privacy Integration

**Analytics requires consent (EU):**

```typescript
// Initialize analytics only if consent given
if (await ConsentManager.hasConsent('analytics')) {
  initAmplitude();
  initSentry();
}

if (await ConsentManager.hasConsent('marketing')) {
  initAdjust();
}
```

**GDPR data deletion:**

```typescript
// DELETE /api/user/delete-account/route.ts
async function deleteUserData(userId: string) {
  // Delete from Supabase
  await supabase.from('player_profiles').delete().eq('user_id', userId);

  // Delete from Amplitude (GDPR API)
  await fetch('https://amplitude.com/api/2/deletions/users', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${process.env.AMPLITUDE_SECRET_KEY}`
    },
    body: JSON.stringify({
      user_ids: [userId],
      requester: 'gdpr_deletion'
    })
  });

  // Delete from Adjust (GDPR API)
  await fetch('https://gdpr.adjust.com/forget_device', {
    method: 'POST',
    body: JSON.stringify({
      app_token: process.env.ADJUST_APP_TOKEN,
      device_id: userDeviceId
    })
  });
}
```

---

## References

**Documentation:**
- @knowledge_base/platform/how_to/maintain_server_authority.md
- @knowledge_base/platform/quick_ref/architectural_gates.md
- docs/legal/IMPLEMENTATION_GUIDE.md (legal/analytics roadmap)
- docs/legal/privacy-policy.md (privacy policy template)
- docs/legal/dpa-template.md (DPA vendor guide)

**Templates:**
- src/shared/config/game.ts.template (game configuration)

**Platform:**
- CLAUDE.md (platform invariants + server authority rules)
- PLATFORM_STATUS.md (platform status)

**Legal & Compliance:**
- Budget: $10k-15k legal (one-time) + $2.5k-5k/month at scale
- Timeline: 4 weeks to production-ready
- Status: Foundation complete, implementation in progress
