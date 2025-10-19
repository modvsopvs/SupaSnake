# How to Implement the Energy System

**Goal:** Build the Energy system for SupaSnake - a regenerating resource that gates Snake gameplay and enforces the 70/30 Lab/Snake time split.

**Timeline:** 3-5 days (assuming Auth and Backend complete)

**Prerequisites:**
- Auth System operational (@knowledge_base/game/quick_ref/auth_system.md)
- Supabase backend configured (@knowledge_base/game/quick_ref/backend_supabase.md)
- React Native + TypeScript + Zustand installed

---

## Overview

The Energy System transforms Snake from unlimited casual play into a valuable, scarce experience. Players start with 5 energy maximum, spend 1 energy per Classic Mode run, and passively recharge 1 energy every 20 minutes (100 minutes empty-to-full). This creates natural session pacing while supporting F2P viability (22-26 energy daily).

---

## Step 1: Database Schema

Create the `user_energy` table in Supabase to track energy state server-side.

```sql
CREATE TABLE user_energy (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  current_energy INT NOT NULL DEFAULT 5,
  max_energy INT NOT NULL DEFAULT 5,
  last_updated TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  daily_refill_used_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_user_energy_user_id ON user_energy(user_id);

-- Row Level Security
ALTER TABLE user_energy ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own energy"
  ON user_energy FOR SELECT USING (auth.uid() = user_id);
```

**Initialize on user creation:**
```sql
CREATE FUNCTION initialize_user_energy()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO user_energy (user_id, current_energy, max_energy)
  VALUES (NEW.id, 5, 5);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER on_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION initialize_user_energy();
```

**Why server-side?** Energy state must be authoritative on backend to prevent client manipulation.

---

## Step 2: Passive Recharge Logic

Energy regenerates using timestamp-based calculations. This works offline - opening app after 4 hours shows full energy automatically.

```typescript
// /api/energy/recharge.ts
export async function calculateRechargedEnergy(userId: string) {
  const supabase = createClient(/* config */);

  const { data: energy } = await supabase
    .from('user_energy')
    .select('*')
    .eq('user_id', userId)
    .single();

  // Calculate recharge: 1 energy per 20 minutes
  const now = Date.now();
  const lastUpdated = new Date(energy.last_updated).getTime();
  const elapsedMinutes = (now - lastUpdated) / (1000 * 60);
  const rechargedUnits = Math.floor(elapsedMinutes / 20);

  // Cap at max energy
  const newEnergy = Math.min(
    energy.current_energy + rechargedUnits,
    energy.max_energy
  );

  // Update if changed
  if (rechargedUnits > 0) {
    await supabase
      .from('user_energy')
      .update({
        current_energy: newEnergy,
        last_updated: new Date(now).toISOString()
      })
      .eq('user_id', userId);
  }

  return { current_energy: newEnergy, max_energy: energy.max_energy };
}
```

**Formula:** `rechargedUnits = floor((now - last_updated) / 1200s)` where 1200s = 20 minutes.

---

## Step 3: Energy Deduction (Game Start)

Energy is consumed when player starts a run, not when they complete it (prevents quit exploits).

```typescript
// POST /api/game/start
export async function startGame(userId: string, mode: 'classic' | 'tower') {
  // 1. Recharge energy first
  const energy = await calculateRechargedEnergy(userId);

  // 2. Validate energy cost
  const energyCost = mode === 'classic' ? 1 : 2;
  if (energy.current_energy < energyCost) {
    throw new Error('Insufficient energy');
  }

  // 3. Deduct energy
  const newEnergy = energy.current_energy - energyCost;
  await supabase
    .from('user_energy')
    .update({
      current_energy: newEnergy,
      last_updated: new Date().toISOString()
    })
    .eq('user_id', userId);

  // 4. Create game session
  const { data: session } = await supabase
    .from('game_sessions')
    .insert({
      user_id: userId,
      mode: mode,
      energy_cost: energyCost,
      started_at: new Date().toISOString()
    })
    .select()
    .single();

  return { sessionId: session.id, energyRemaining: newEnergy };
}
```

**Client pre-check:** Query energy before showing "Play" button to prevent API rejection (UX optimization, but backend is source of truth).

---

## Step 4: Daily Free Refill

Players receive one free instant refill per 24 hours (resets midnight UTC).

```typescript
// POST /api/energy/daily-refill
export async function dailyRefill(userId: string) {
  const { data: energy } = await supabase
    .from('user_energy')
    .select('*')
    .eq('user_id', userId)
    .single();

  // Check if already used today (UTC)
  const now = new Date();
  const lastRefill = energy.daily_refill_used_at
    ? new Date(energy.daily_refill_used_at)
    : null;

  const isSameDay = lastRefill &&
    lastRefill.getUTCDate() === now.getUTCDate() &&
    lastRefill.getUTCMonth() === now.getUTCMonth() &&
    lastRefill.getUTCFullYear() === now.getUTCFullYear();

  if (isSameDay) {
    throw new Error('Daily refill already used today');
  }

  // Grant refill
  await supabase
    .from('user_energy')
    .update({
      current_energy: energy.max_energy,
      daily_refill_used_at: now.toISOString()
    })
    .eq('user_id', userId);

  return { success: true, energy: energy.max_energy };
}
```

**Reset logic:** Always use UTC for reset logic, convert to local time for display only.

---

## Step 5: Client State (React Native + Zustand)

```typescript
// src/stores/energyStore.ts
import create from 'zustand';

interface EnergyStore {
  currentEnergy: number;
  maxEnergy: number;
  fetchEnergy: () => Promise<void>;
  useEnergy: (cost: number) => Promise<void>;
}

export const useEnergyStore = create<EnergyStore>((set, get) => ({
  currentEnergy: 0,
  maxEnergy: 5,

  fetchEnergy: async () => {
    const response = await fetch('/api/energy/status');
    const data = await response.json();
    set({
      currentEnergy: data.current_energy,
      maxEnergy: data.max_energy
    });
  },

  useEnergy: async (cost: number) => {
    // Optimistic update
    set(state => ({ currentEnergy: Math.max(0, state.currentEnergy - cost) }));

    try {
      await fetch('/api/game/start', {
        method: 'POST',
        body: JSON.stringify({ mode: 'classic' })
      });
    } catch (error) {
      // Revert on failure
      get().fetchEnergy();
      throw error;
    }
  }
}));
```

---

## Step 6: UI Component

```tsx
// src/components/EnergyDisplay.tsx
import React, { useEffect, useState } from 'react';
import { View, Text } from 'react-native';
import { useEnergyStore } from '../stores/energyStore';

export const EnergyDisplay: React.FC = () => {
  const { currentEnergy, maxEnergy } = useEnergyStore();
  const [timeToNext, setTimeToNext] = useState<string>('');

  useEffect(() => {
    const interval = setInterval(() => {
      // Calculate time until next energy recharge
      const secondsUntilNext = 1200; // 20 minutes (simplified)
      const minutes = Math.floor(secondsUntilNext / 60);
      const seconds = Math.floor(secondsUntilNext % 60);
      setTimeToNext(`${minutes}:${seconds.toString().padStart(2, '0')}`);
    }, 1000);

    return () => clearInterval(interval);
  }, []);

  return (
    <View>
      <Text>⚡ {currentEnergy}/{maxEnergy}</Text>
      {currentEnergy < maxEnergy && (
        <Text>Next in {timeToNext}</Text>
      )}
    </View>
  );
};
```

---

## Tips for Success

✅ **DO:**
- Calculate recharge server-side using timestamps (prevents manipulation)
- Deduct energy on game start, not completion (prevents quit exploits)
- Cap passive recharge at max energy (no overflow from idle time)
- Show countdown timers for next energy and daily refill reset
- Pre-check energy client-side before API calls (better UX)

❌ **DON'T:**
- Trust client for energy calculations (server is source of truth)
- Allow negative energy (validation required)
- Forget offline recharge (timestamps enable passive accumulation)
- Make energy required for Lab activities (only Snake gameplay)

---

## Common Mistakes

**Mistake:** Deducting energy on game completion instead of start.
**Fix:** Move deduction to POST /api/game/start to prevent quit exploits.

**Mistake:** Allowing energy to overflow past max from passive recharge.
**Fix:** Use `Math.min(current + recharged, max)` to cap at maximum.

**Mistake:** Not handling timezone edge cases for daily refill.
**Fix:** Always use UTC for reset logic, convert to local for display only.

---

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/energy_system.md (system overview)
- **Quick Ref**: @knowledge_base/game/quick_ref/classic_mode.md (energy cost per mode)
- **Quick Ref**: @knowledge_base/game/quick_ref/backend_supabase.md (database setup)
- **How-To**: @knowledge_base/game/how_to/setup_supabase_backend.md (Supabase config)
- **How-To**: @knowledge_base/game/how_to/tune_classic_mode.md (balance energy costs)
