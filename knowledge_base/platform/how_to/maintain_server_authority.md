# How to Maintain Server Authority in AAA Game Development

**Goal:** Build server-authoritative architecture that prevents cheating, enables multiplayer, and ensures data integrity.

**Time required:** Architecture foundation (ongoing practice)

---

## Overview

Server authority means the server is the **single source of truth** for all game state. Client code displays state but cannot modify it directly. This is the AAA standard for 2026 and prevents:

- **Cheating** (players can't modify localStorage to give themselves DNA)
- **Data loss** (localStorage cleared = progress lost)
- **Multiplayer conflicts** (no sync mechanism)
- **Validation bypass** (client can't skip server rules)

Our 5 architectural quality gates **enforce** server authority deterministically.

---

## The 4 Core Principles

### Principle 1: Client Displays, Server Decides

**What this means:**
- Client shows UI and collects input
- Server processes all game logic
- Client receives results and updates display

**Example - DNA Collection:**
```typescript
// ❌ BAD (Client Authority)
// components/SnakeGame.tsx
function collectDNA() {
  const currentDNA = localStorage.getItem('dna')
  localStorage.setItem('dna', currentDNA + 10)  // Client decides!
}

// ✅ GOOD (Server Authority)
// components/SnakeGame.tsx
async function collectDNA() {
  // Client requests DNA collection
  const response = await fetch('/api/game/collect-dna', {
    method: 'POST',
    body: JSON.stringify({ sessionId, score })
  })
  const { newDNA } = await response.json()
  // Server decided, client displays
  setPlayerDNA(newDNA)
}

// app/api/game/collect-dna/route.ts
export async function POST(req: Request) {
  const { sessionId, score } = await req.json()

  // Server validates and calculates
  const dnaEarned = calculateDNA(score)  // Server-side formula
  const newTotal = await updatePlayerDNA(sessionId, dnaEarned)

  return Response.json({ newDNA: newTotal })
}
```

**Hook enforcement:** Hook 07 blocks localStorage for game state

### Principle 2: API Routes for All Mutations

**What this means:**
- Never mutate game state in client code
- All state changes go through API routes
- API routes validate, process, persist

**Example - Breeding Snakes:**
```typescript
// ❌ BAD (Client Mutation)
// components/BreedingLab.tsx
async function breedSnakes(parent1: string, parent2: string) {
  // Direct database access from client
  const { data } = await supabase
    .from('variants')
    .insert({ parent1_id: parent1, parent2_id: parent2 })
  return data
}

// ✅ GOOD (API Route Mutation)
// components/BreedingLab.tsx
async function breedSnakes(parent1: string, parent2: string) {
  const response = await fetch('/api/breeding/breed', {
    method: 'POST',
    body: JSON.stringify({ parent1, parent2 })
  })
  return response.json()
}

// app/api/breeding/breed/route.ts
export async function POST(req: Request) {
  const { parent1, parent2 } = await req.json()

  // Server validates breeding rules
  if (!canBreed(parent1, parent2)) {
    return Response.json({ error: 'Invalid breeding' }, { status: 400 })
  }

  // Server applies game logic
  const offspring = generateOffspring(parent1, parent2)

  // Server persists
  const { data } = await supabase
    .from('variants')
    .insert(offspring)

  return Response.json({ variant: data })
}
```

**Hook enforcement:** Hook 08 blocks client DB access

### Principle 3: Secrets Stay Server-Side

**What this means:**
- Service role keys never in client code
- Client uses public anon keys only
- Sensitive operations in API routes

**Example - Admin Operations:**
```typescript
// ❌ BAD (Secret in Client)
// components/AdminPanel.tsx
const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY  // Exposed to client!
)

// ✅ GOOD (Secret in Server)
// components/AdminPanel.tsx
async function deletePlayer(playerId: string) {
  await fetch('/api/admin/delete-player', {
    method: 'DELETE',
    body: JSON.stringify({ playerId })
  })
}

// app/api/admin/delete-player/route.ts
const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY  // Safe on server
)

export async function DELETE(req: Request) {
  // Server checks admin auth
  const session = await getServerSession(req)
  if (!session?.user?.isAdmin) {
    return Response.json({ error: 'Unauthorized' }, { status: 403 })
  }

  const { playerId } = await req.json()
  await supabase.from('players').delete().eq('id', playerId)

  return Response.json({ success: true })
}
```

**Hook enforcement:** Hook 09 blocks client secrets

### Principle 4: Config-Driven Balance

**What this means:**
- Game constants in centralized config
- Can tune without code changes
- Can A/B test values
- Can hot-fix in production

**Example - DNA Costs:**
```typescript
// ❌ BAD (Hard-Coded)
// features/breeding/BreedButton.tsx
function BreedButton() {
  const DNA_COST = 50  // Hard-coded!
  // ...
}

// ✅ GOOD (Centralized Config)
// src/shared/config/game.ts
export const GAME_CONFIG = {
  economy: {
    dnaCost: {
      breeding: 50,
      evolution: 100,
      unlockSlot: 25
    },
    dnaReward: {
      scoreMultiplier: 0.1,
      completionBonus: 10
    }
  },
  spawning: {
    foodRate: 0.3,
    powerupRate: 0.1
  }
} as const

// features/breeding/BreedButton.tsx
import { GAME_CONFIG } from '@/config/game'

function BreedButton() {
  const cost = GAME_CONFIG.economy.dnaCost.breeding
  // ...
}

// Can update config without touching component code
// Can load from database for A/B testing
// Can override in admin panel for live tuning
```

**Hook enforcement:** Hook 10 blocks hard-coded constants

---

## Directory Structure (AAA 2026 Standard)

```
src/
├── client/                 # Client-only code
│   ├── components/         # React components
│   ├── hooks/              # Client hooks (useLocalStorage OK)
│   ├── ui/                 # UI components
│   └── utils/              # Client utilities
│
├── server/                 # Server-only code
│   ├── api/                # API route logic
│   ├── game/               # Game logic (authoritative)
│   ├── services/           # Business logic
│   └── db/                 # Database queries
│
├── shared/                 # Isomorphic code
│   ├── types/              # TypeScript types
│   ├── config/             # Game config (constants)
│   └── utils/              # Shared utilities
│
└── features/               # Feature modules
    ├── snake/              # Snake feature
    │   ├── components/     # UI components
    │   ├── api/            # API routes
    │   └── config.ts       # Feature config
    └── collection/
        └── ...
```

**Rules:**
- Code in `client/` CANNOT access database or secrets
- Code in `server/` has full access
- Code in `shared/` must be isomorphic (works both sides)
- Features organize by domain, maintain client/server split within

---

## localStorage Policy

### ✅ Allowed (UI State)

- Theme/appearance settings
- Input preferences (control sensitivity)
- Audio volume
- Tutorial completion flags
- Last selected options (UI convenience)
- Analytics consent
- Session identifier (not auth token)

### ❌ Never Allowed (Game State)

- Player stats (DNA, score, level)
- Inventory/collection
- Unlocks/achievements
- Currency/economy
- Game progress
- Leaderboard data
- Multiplayer state

### Rule of Thumb

**If losing it means losing progress → Server**
**If losing it means re-selecting preferences → localStorage**

---

## Common Patterns

### Pattern: Optimistic UI Updates

Show instant feedback while waiting for server:

```typescript
async function collectDNA(amount: number) {
  // Optimistically update UI
  setLocalDNA(prev => prev + amount)

  try {
    // Server confirms
    const { newDNA } = await fetch('/api/collect-dna', {
      method: 'POST',
      body: JSON.stringify({ amount })
    }).then(r => r.json())

    // Sync with server truth
    setLocalDNA(newDNA)
  } catch (error) {
    // Revert on error
    setLocalDNA(prev => prev - amount)
    showError('Failed to collect DNA')
  }
}
```

### Pattern: Real-Time Sync

Use Supabase realtime for live updates:

```typescript
// Server updates database
await supabase.from('player_stats').update({ dna: newDNA })

// Client subscribes to changes
supabase
  .channel('player_stats')
  .on('postgres_changes', {
    event: 'UPDATE',
    schema: 'public',
    table: 'player_stats'
  }, (payload) => {
    setPlayerDNA(payload.new.dna)
  })
  .subscribe()
```

### Pattern: Offline Queue

Queue mutations when offline, sync when online:

```typescript
const mutationQueue = []

async function queueMutation(mutation) {
  if (!navigator.onLine) {
    mutationQueue.push(mutation)
    localStorage.setItem('queue', JSON.stringify(mutationQueue))
    return
  }

  await sendToServer(mutation)
}

window.addEventListener('online', async () => {
  const queue = JSON.parse(localStorage.getItem('queue') || '[]')
  for (const mutation of queue) {
    await sendToServer(mutation)
  }
  localStorage.removeItem('queue')
})
```

---

## Testing Server Authority

**Verify your architecture:**

1. **Disable JavaScript in browser** - Game should fail gracefully (no localStorage fallback)
2. **Clear localStorage** - Should not lose game progress
3. **Modify localStorage manually** - Should not affect game state
4. **Test with multiple devices** - Should sync seamlessly
5. **Run architecture audit** - Hook 04 scans for violations

---

## Troubleshooting

**Hook blocked my localStorage usage:**
- Is it game state? → Move to database
- Is it UI preference? → Keep in localStorage but name clearly (no game terms)

**Hook blocked my database access:**
- Are you in client code? → Move to API route
- Are you in API route? → Ensure file path includes `/api/` or `/server/`

**Hook blocked my secret:**
- Are you in client code? → Move to API route
- Need public key? → Use NEXT_PUBLIC_* prefix

**Hook blocked my constant:**
- Is it game balance? → Move to src/shared/config/game.ts
- Is it UI constant? → OK to keep inline

---

## Quick Reference

**4 Principles:**
1. Client displays, server decides
2. API routes for all mutations
3. Secrets stay server-side
4. Config-driven balance

**5 Hooks:**
1. Server authority (localStorage)
2. Client DB access
3. Client secrets
4. Config constants
5. Architecture audit

**Directory rules:**
- client/ = UI only
- server/ = full access
- shared/ = isomorphic

**localStorage rule:**
- Progress = server
- Preferences = localStorage

---

**See also:**
- @knowledge_base/platform/quick_ref/architectural_gates.md (hook summary)
- @docs/ARCHITECTURE.md (complete architecture guide)
- src/shared/config/game.ts.template (config structure)
