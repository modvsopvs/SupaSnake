# How to Set Up Supabase Backend

**Goal**: Configure Supabase project for SupaSnake with database tables, Row-Level Security policies, storage buckets, and edge functions.

**Timeline**: 4-6 hours for complete backend setup

**Prerequisites**:
- Supabase account (free tier or Pro plan $25/month)
- Node.js 18+ installed
- Git repository initialized

---

## Step 1: Create Supabase Project

Navigate to [supabase.com/dashboard](https://supabase.com/dashboard) and create new project.

**Project Settings**:
- **Project Name**: "SupaSnake Production" (or "SupaSnake Dev" for development)
- **Database Password**: Generate strong password (save in password manager)
- **Region**: Choose closest to primary user base (e.g., US East for North America)
- **Pricing Plan**: Pro ($25/month) recommended for production (100GB bandwidth, 8GB database, 100GB storage)

**Wait Time**: 2-3 minutes for project provisioning.

After provisioning, note these credentials from Project Settings → API:
- **Project URL**: `https://your-project-id.supabase.co`
- **anon public key**: Client-side API key (safe to expose)
- **service_role key**: Server-side admin key (NEVER expose to client)

---

## Step 2: Configure Database Tables

Navigate to **SQL Editor** in Supabase dashboard and run these table creation scripts:

### Users Table (Extended Supabase Auth)

```sql
-- Users are managed by Supabase Auth (auth.users table)
-- Extend with game-specific profile data
CREATE TABLE public.user_profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  username TEXT UNIQUE NOT NULL CHECK (char_length(username) >= 3 AND char_length(username) <= 16),
  avatar_url TEXT,
  dna_balance INTEGER DEFAULT 0 CHECK (dna_balance >= 0),
  energy INTEGER DEFAULT 100 CHECK (energy >= 0 AND energy <= 100),
  last_energy_update TIMESTAMPTZ DEFAULT NOW(),
  is_guest BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Trigger to auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_user_profiles_updated_at
BEFORE UPDATE ON user_profiles
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
```

### Snake Variants Table (Master List)

```sql
CREATE TABLE public.snake_variants (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  dynasty TEXT NOT NULL CHECK (dynasty IN ('CYBER', 'PRIMAL', 'COSMIC')),
  name TEXT UNIQUE NOT NULL,
  rarity TEXT NOT NULL CHECK (rarity IN ('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary')),
  base_speed INTEGER NOT NULL,
  base_size INTEGER NOT NULL,
  unlock_cost INTEGER NOT NULL,
  artwork_url TEXT,
  description TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for fast dynasty filtering
CREATE INDEX idx_snake_variants_dynasty ON snake_variants(dynasty);
CREATE INDEX idx_snake_variants_rarity ON snake_variants(rarity);
```

### Player Collection Table (Owned Snakes)

```sql
CREATE TABLE public.player_collection (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  variant_id UUID NOT NULL REFERENCES snake_variants(id),
  generation INTEGER DEFAULT 0 CHECK (generation >= 0),
  parent1_id UUID REFERENCES player_collection(id),
  parent2_id UUID REFERENCES player_collection(id),
  acquired_at TIMESTAMPTZ DEFAULT NOW(),
  is_favorited BOOLEAN DEFAULT FALSE
);

-- Index for fast user collection queries
CREATE INDEX idx_player_collection_user_id ON player_collection(user_id);
CREATE INDEX idx_player_collection_variant_id ON player_collection(variant_id);
```

### Breeding History Table (Breeding Records)

```sql
CREATE TABLE public.breeding_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  parent1_id UUID NOT NULL REFERENCES player_collection(id),
  parent2_id UUID NOT NULL REFERENCES player_collection(id),
  offspring_id UUID NOT NULL REFERENCES player_collection(id),
  dna_cost INTEGER NOT NULL,
  bred_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_breeding_history_user_id ON breeding_history(user_id);
```

### Evolution History Table (v0.5+, create for future)

```sql
CREATE TABLE public.evolution_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  snake_id UUID NOT NULL REFERENCES player_collection(id),
  old_variant_id UUID NOT NULL REFERENCES snake_variants(id),
  new_variant_id UUID NOT NULL REFERENCES snake_variants(id),
  dna_cost INTEGER NOT NULL,
  evolved_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_evolution_history_user_id ON evolution_history(user_id);
```

---

## Step 3: Enable Row-Level Security (RLS)

RLS ensures users can only access their own data at the database level. Enable RLS on all tables:

```sql
-- Enable RLS on all user-specific tables
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE player_collection ENABLE ROW LEVEL SECURITY;
ALTER TABLE breeding_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE evolution_history ENABLE ROW LEVEL SECURITY;

-- snake_variants is public (all users can read master list)
-- No RLS needed on snake_variants
```

**Create RLS Policies**:

```sql
-- User Profiles: Users can only see and update their own profile
CREATE POLICY "Users can view own profile"
  ON user_profiles FOR SELECT
  USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
  ON user_profiles FOR UPDATE
  USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile"
  ON user_profiles FOR INSERT
  WITH CHECK (auth.uid() = id);

-- Player Collection: Users can only see their own snakes
CREATE POLICY "Users can view own collection"
  ON player_collection FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own snakes"
  ON player_collection FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own snakes"
  ON player_collection FOR UPDATE
  USING (auth.uid() = user_id);

-- Breeding History: Users can only see their own breeding records
CREATE POLICY "Users can view own breeding history"
  ON breeding_history FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own breeding records"
  ON breeding_history FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Evolution History: Users can only see their own evolution records
CREATE POLICY "Users can view own evolution history"
  ON evolution_history FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own evolution records"
  ON evolution_history FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Snake Variants: Public read access (all users can see master list)
CREATE POLICY "Anyone can view snake variants"
  ON snake_variants FOR SELECT
  TO authenticated, anon
  USING (true);
```

**Test RLS Policies**: Try querying `player_collection` as different users to verify isolation.

---

## Step 4: Set Up Storage Buckets

Navigate to **Storage** in Supabase dashboard.

**Create Buckets**:

1. **snake-artwork** (Public bucket for variant artwork)
   - Bucket Name: `snake-artwork`
   - Public: ✅ Yes
   - File Size Limit: 5MB per file
   - Allowed MIME Types: `image/png`, `image/jpeg`, `image/webp`

2. **user-avatars** (Public bucket for profile pictures)
   - Bucket Name: `user-avatars`
   - Public: ✅ Yes
   - File Size Limit: 2MB per file
   - Allowed MIME Types: `image/png`, `image/jpeg`

3. **gallery-showcases** (Public bucket for gallery screenshots)
   - Bucket Name: `gallery-showcases`
   - Public: ✅ Yes
   - File Size Limit: 3MB per file
   - Allowed MIME Types: `image/png`, `image/jpeg`, `image/webp`

**Upload Initial Artwork**:

Use Supabase Storage API or dashboard UI to upload snake variant artwork (generated via Midjourney):

```bash
# Example: Upload artwork via CLI
supabase storage upload snake-artwork CYBER_SPARK.png ./assets/CYBER_SPARK.png
```

**Storage URLs**: Files are accessible at `https://your-project-id.supabase.co/storage/v1/object/public/snake-artwork/CYBER_SPARK.png`

---

## Step 5: Configure Environment Variables

Create `.env` file in your project root:

```bash
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# Development vs Production
NODE_ENV=development
```

**Security**:
- Add `.env` to `.gitignore` (NEVER commit service_role key)
- Use environment variables in hosting platform (Vercel, Netlify) for production
- Rotate service_role key if accidentally exposed

---

## Step 6: Initialize Supabase Client

Install Supabase JavaScript client:

```bash
npm install @supabase/supabase-js
```

Create `lib/supabase.ts`:

```typescript
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true, // Keep user logged in
    autoRefreshToken: true, // Auto-refresh JWT tokens
    detectSessionInUrl: true // Handle OAuth redirects
  },
  realtime: {
    params: {
      eventsPerSecond: 10 // Rate limit real-time subscriptions
    }
  }
});
```

**Usage Example**:

```typescript
import { supabase } from '@/lib/supabase';

// Query user's snake collection
const { data, error } = await supabase
  .from('player_collection')
  .select(`
    id,
    generation,
    variant:snake_variants(name, dynasty, rarity, artwork_url)
  `)
  .order('acquired_at', { ascending: false });

if (error) console.error('Error fetching collection:', error);
else console.log('User collection:', data);
```

---

## Step 7: Seed Initial Data

Populate `snake_variants` table with 30 MVP variants (10 per dynasty):

```sql
-- CYBER Dynasty (10 variants)
INSERT INTO snake_variants (dynasty, name, rarity, base_speed, base_size, unlock_cost, description) VALUES
('CYBER', 'CYBER SPARK', 'Common', 5, 3, 0, 'Starter snake with neon blue circuitry'),
('CYBER', 'NEON VIPER', 'Common', 5, 3, 100, 'Electric green snake with pulsing lights'),
('CYBER', 'DATA STREAM', 'Common', 6, 3, 100, 'Binary code flows through transparent body'),
('CYBER', 'CIRCUIT RUNNER', 'Uncommon', 6, 4, 300, 'Yellow-orange snake with embedded LEDs'),
('CYBER', 'PIXEL SERPENT', 'Uncommon', 6, 4, 300, 'Retro 8-bit aesthetic, chunky pixels'),
('CYBER', 'QUANTUM GLITCH', 'Uncommon', 7, 4, 300, 'Purple snake that phases between dimensions'),
('CYBER', 'HOLOGRAPHIC COIL', 'Rare', 7, 5, 500, 'Shimmering hologram projections'),
('CYBER', 'MAINFRAME WYRM', 'Rare', 8, 5, 500, 'Massive server-rack-inspired snake'),
('CYBER', 'NEON OVERLORD', 'Epic', 9, 6, 800, 'Multi-colored neon with trailing light'),
('CYBER', 'SINGULARITY', 'Legendary', 10, 7, 1500, 'Black hole core with event horizon glow');

-- PRIMAL Dynasty (10 variants)
INSERT INTO snake_variants (dynasty, name, rarity, base_speed, base_size, unlock_cost, description) VALUES
('PRIMAL', 'FOREST ADDER', 'Common', 5, 3, 0, 'Earthy green with leaf-like scales'),
('PRIMAL', 'STONE PYTHON', 'Common', 4, 4, 100, 'Rock-textured gray snake, slow but sturdy'),
('PRIMAL', 'EMBER SERPENT', 'Common', 6, 3, 100, 'Orange-red with smoldering scales'),
('PRIMAL', 'THORN VIPER', 'Uncommon', 6, 4, 300, 'Spiky green snake with plant growths'),
('PRIMAL', 'LAVA WYRM', 'Uncommon', 7, 4, 300, 'Molten rock body with magma veins'),
('PRIMAL', 'ANCIENT ROOT', 'Uncommon', 5, 5, 300, 'Wooden snake with roots as body'),
('PRIMAL', 'VOLCANIC ASH', 'Rare', 8, 5, 500, 'Charcoal black with glowing cracks'),
('PRIMAL', 'ELDER EARTH', 'Rare', 7, 6, 500, 'Massive earthy snake with moss growth'),
('PRIMAL', 'TITAN MAMBA', 'Epic', 9, 7, 800, 'Colossal primordial snake'),
('PRIMAL', 'GENESIS SERPENT', 'Legendary', 10, 8, 1500, 'Origin of all snakes, glowing runes');

-- COSMIC Dynasty (10 variants)
INSERT INTO snake_variants (dynasty, name, rarity, base_speed, base_size, unlock_cost, description) VALUES
('COSMIC', 'STARLIGHT SERPENT', 'Common', 6, 3, 0, 'Twinkling stars embedded in dark blue body'),
('COSMIC', 'MOON PHASE', 'Common', 5, 3, 100, 'Lunar cycle patterns on silver scales'),
('COSMIC', 'ASTEROID BELT', 'Common', 5, 4, 100, 'Rocky debris orbiting body'),
('COSMIC', 'NEBULA DRIFT', 'Uncommon', 7, 4, 300, 'Swirling pink-purple gas clouds'),
('COSMIC', 'SOLAR FLARE', 'Uncommon', 8, 3, 300, 'Bright orange-yellow with plasma trails'),
('COSMIC', 'COMET TAIL', 'Uncommon', 9, 3, 300, 'Icy blue with trailing debris'),
('COSMIC', 'SUPERNOVA', 'Rare', 8, 5, 500, 'Exploding star energy, multi-colored'),
('COSMIC', 'BLACK HOLE MAMBA', 'Rare', 7, 6, 500, 'Dark void body with light bending'),
('COSMIC', 'PULSAR VIPER', 'Epic', 10, 5, 800, 'Rapidly spinning neutron star energy'),
('COSMIC', 'BIG BANG', 'Legendary', 10, 8, 1500, 'Creation energy, reality-warping snake');
```

**Verification**: Query `snake_variants` to confirm 30 rows inserted.

---

## Tips for Success

✅ **DO**:
- Test RLS policies thoroughly (try querying as different users)
- Use indexes on frequently queried columns (`user_id`, `variant_id`, `dynasty`)
- Monitor database size (Supabase dashboard shows current usage)
- Set up database backups (Supabase Pro includes daily backups)
- Use Supabase CLI for local development (`supabase init`, `supabase start`)

❌ **DON'T**:
- Expose `service_role` key in client-side code (only use in server/edge functions)
- Skip RLS policies (opens massive security vulnerabilities)
- Store large files in database (use Storage buckets instead)
- Hardcode Supabase credentials (use environment variables)
- Ignore database migration scripts (track schema changes in version control)

---

## Common Mistakes

**Mistake 1**: Forgetting to enable RLS on user-specific tables
- **Symptom**: All users can see all data
- **Fix**: Run `ALTER TABLE table_name ENABLE ROW LEVEL SECURITY;`

**Mistake 2**: Using client-side `service_role` key
- **Symptom**: Security vulnerability (users can bypass RLS)
- **Fix**: Only use `anon` key client-side, `service_role` server-side only

**Mistake 3**: Not indexing `user_id` columns
- **Symptom**: Slow queries as user collection grows
- **Fix**: Add `CREATE INDEX idx_table_user_id ON table(user_id);`

**Mistake 4**: Storing artwork URLs as absolute paths
- **Symptom**: URLs break if storage bucket name changes
- **Fix**: Store relative paths (`CYBER_SPARK.png`) and construct full URL at runtime

---

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/backend_supabase.md - Backend overview
- **Quick Ref**: @knowledge_base/game/quick_ref/auth_system.md - Authentication setup
- **How-To**: @knowledge_base/game/how_to/implement_auth.md - Connect auth to backend
- **Complete Spec**: @docs/game/systems/analysis/BACKEND_SUPABASE_analysis_part1.md - Full backend architecture
