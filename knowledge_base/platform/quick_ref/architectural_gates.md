# Architectural Quality Gates - Quick Reference

## Overview

5 hooks enforce AAA architecture standards (2026 best practices) for server-authoritative game development.

## The 5 Gates

| Hook | Type | Blocks | Purpose |
|------|------|--------|---------|
| **07-server-authority** | PreToolUse | localStorage for game state | Prevent client-side game data |
| **08-client-db-access** | PreToolUse | Database queries in client code | Force API routes for DB access |
| **09-client-secrets** | PreToolUse | Service keys in client code | Prevent secret exposure |
| **10-config-constants** | PreToolUse | Hard-coded game balance values | Centralize tunable constants |
| **04-architecture-audit** | Stop | N/A (reports only) | Comprehensive violation scan |

## Server Authority (Hook 07)

**Blocks:**
- localStorage.setItem("dna", ...)
- localStorage.setItem("score", ...)
- localStorage.setItem("inventory", ...)

**Allows:**
- localStorage.setItem("theme", ...)
- localStorage.setItem("volume", ...)
- localStorage.setItem("tutorial_seen", ...)

**Rule:** If losing it means losing progress, it belongs on server.

## Client DB Access (Hook 08)

**Blocks in client code:**
```typescript
// ❌ components/PlayerList.tsx
const { data } = await supabase.from('players').select()
```

**Requires:**
```typescript
// ✅ app/api/players/route.ts
export async function GET() {
  const { data } = await supabase.from('players').select()
  return Response.json(data)
}

// ✅ components/PlayerList.tsx
const data = await fetch('/api/players')
```

## Client Secrets (Hook 09)

**Blocks in client:**
- process.env.SUPABASE_SERVICE_ROLE_KEY
- process.env.STRIPE_SECRET_KEY
- Any *_SECRET_KEY or *_PRIVATE_KEY

**Allows in client:**
- NEXT_PUBLIC_* variables
- Publishable keys

## Config Constants (Hook 10)

**Blocks:**
```typescript
const DNA_COST = 50  // Hard-coded
const SPAWN_RATE = 0.3
```

**Requires:**
```typescript
// src/shared/config/game.ts
export const GAME_CONFIG = {
  economy: { dnaCost: 50 },
  spawning: { rate: 0.3 }
}

// Usage
import { GAME_CONFIG } from '@/config/game'
const cost = GAME_CONFIG.economy.dnaCost
```

## Architecture Audit (Hook 04)

**Scans for:**
- localStorage violations
- Client DB access
- Exposed secrets
- Hard-coded constants
- Missing error handling
- Synchronous DB calls
- Mixed client/server concerns

**Runs:** After Claude completes response (comprehensive sweep)

## Quick Diagnosis

**Hook blocked my code:**
1. Read the error message (explains WHY and HOW to fix)
2. Apply the suggested fix
3. Retry

**False positive:**
- Legitimate edge case
- Add comment explaining exception
- Consider if architecture can be improved instead

**See also:**
- @knowledge_base/platform/how_to/maintain_server_authority.md (complete guide)
- @knowledge_base/platform/quick_ref/hook_types.md (hook fundamentals)
