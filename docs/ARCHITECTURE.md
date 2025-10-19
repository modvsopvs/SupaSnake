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
    └── API.md                      # API documentation
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

## References

**Documentation:**
- @knowledge_base/platform/how_to/maintain_server_authority.md
- @knowledge_base/platform/quick_ref/architectural_gates.md

**Templates:**
- src/shared/config/game.ts.template (game configuration)

**Platform:**
- CLAUDE.md (platform invariants + server authority rules)
- PLATFORM_STATUS.md (platform status)
