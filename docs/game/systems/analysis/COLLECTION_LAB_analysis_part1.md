# Collection Lab System: 8-Level Consequence Analysis (Part 1: Levels 1-4)

**System:** Collection Lab (Snake Collection Browser & Management)
**Tier:** Tier 2 (Meta-Game Core)
**Status:** THE GAME - 70% of player session time
**Analysis Date:** 2025-10-14
**Word Count:** ~4,200 words (Part 1)

---

## System Overview

### Purpose and Role

The Collection Lab is **NOT a feature - it IS the game**. Per constraint CE-001, players must spend 70% of their session time here, browsing their snake collection, planning breeding strategies, and managing their genetic empire.

**Core Paradigm Shift:**
- Traditional Snake game: Play Snake, check score, replay
- SupaSnake: Play Snake 30% → **Browse Collection 70%** → Plan next breed

**Collection Lab Position:**
This is the META-GAME HUB where:
- Players browse 20-500+ snake variants (v0.1 → v1.0 scale)
- Filters organize collection by dynasty, rarity, generation, favorites
- Sorting enables discovery (newest, rarity, stats, generation)
- Search allows instant variant lookup
- Set tracking shows completion progress (4-6 piece sets)
- Detail views display full variant stats, lineage, offspring count

### Dependencies

**Depends on:**
- Backend (Supabase): snakes table, user_snakes ownership
- UI Framework: Grid/list views, modal screens, navigation
- Auth: User identity, collection ownership

**Depended on by:**
- Breeding Lab: Select parents from collection
- Evolution Lab: Select variant to evolve from collection
- Gallery: Showcase selected variants from collection
- Shop: Display purchasable variants not yet in collection

**Build Priority:** Week 5-6 (Tier 2, after core loop operational)

### Critical Constraints

**CE-001: 70/30 Time Split (CRITICAL)**
- Collection browsing must be compelling enough for 70% of session time
- If players spend <60% in Lab, paradigm shift FAILS
- Must provide depth: filters, sorts, lineage views, set tracking, planning

**PR-003: Collection Depth by Day 30**
- Target: 20+ variants for average engaged player
- Requires scalable UI (20 → 100 → 500 variants)
- Collection milestones must feel satisfying (5 → 10 → 20 → 50)

**CO-001: Visual Variety**
- 500+ unique variants at v1.0
- Rarity tiers: Common (40%), Uncommon (30%), Rare (20%), Epic (8%), Mythic (2%)
- Dynasty themes must be visually distinct (CYBER, NEBULA, MECHA, etc.)

**BA-004: No Inventory Tedium**
- Unlimited snake storage (no "inventory full" frustration)
- Auto-sort, smart filters required
- No manual cleanup, no storage limit purchases

---

## Level 1: Direct Implementation

### 1.1 Core UI Components

#### Component 1: Collection Grid View (Primary Display)

**Purpose:** Visual gallery of owned snakes, primary browsing interface

**Layout:**
```
┌─────────────────────────────────────────┐
│  MY COLLECTION  [Grid] [List]  [Search] │
│  Filters: [Dynasty▼] [Rarity▼] [Gen▼]   │
│  Sort: [Newest] Selected                 │
├─────────────────────────────────────────┤
│  ┌─────┐  ┌─────┐  ┌─────┐  ┌─────┐    │
│  │ 🐍  │  │ 🐍  │  │ 🐍  │  │ 🐍  │    │
│  │CYBER│  │CYBER│  │NEBUL│  │MECHA│    │
│  │ G5  │  │ G3  │  │ G4  │  │ G2  │    │
│  │ ⭐  │  │Common│  │ Rare│  │Uncomm│   │
│  └─────┘  └─────┘  └─────┘  └─────┘    │
│  ┌─────┐  ┌─────┐  ┌─────┐  ...        │
│  │ 🐍  │  │ 🐍  │  │ 🐍  │             │
│  └─────┘  └─────┘  └─────┘             │
├─────────────────────────────────────────┤
│  23 Variants  |  5 Dynasties  |  Gen 7  │
└─────────────────────────────────────────┘
```

**Card Design (Individual Variant):**
```typescript
interface VariantCard {
  thumbnail: string;           // 128×128 snake visual
  name: string;                // "Cyber Starlight"
  dynasty: Dynasty;            // CYBER, NEBULA, etc.
  generation: number;          // Gen 1-∞
  rarity: Rarity;              // Common → Mythic
  isFavorite: boolean;         // ⭐ star indicator
  isNew: boolean;              // "NEW" badge (acquired <24h)
  onClick: () => void;         // Open detail modal
}
```

**Grid Specs:**
- Desktop: 4 columns, 200px cards
- Tablet: 3 columns, 180px cards
- Mobile: 2 columns, 160px cards
- Infinite scroll (virtualized list for performance)
- Lazy load thumbnails (visible viewport only)

**Implementation:**
```typescript
class CollectionGrid extends Component {
  private virtualScroll: VirtualScrollController;

  render() {
    const { variants, filters, sortOrder } = this.props;

    // Apply filters
    const filtered = this.applyFilters(variants, filters);

    // Apply sort
    const sorted = this.applySorting(filtered, sortOrder);

    return (
      <VirtualScroll
        items={sorted}
        itemHeight={220}  // Card + margin
        renderItem={(variant) => <VariantCard {...variant} />}
        bufferSize={10}   // Render 10 off-screen items
      />
    );
  }

  private applyFilters(
    variants: Variant[],
    filters: CollectionFilters
  ): Variant[] {
    return variants.filter(v => {
      if (filters.dynasty && v.dynasty !== filters.dynasty) return false;
      if (filters.rarity && v.rarity !== filters.rarity) return false;
      if (filters.generation && v.generation !== filters.generation) return false;
      if (filters.favoritesOnly && !v.isFavorite) return false;
      return true;
    });
  }

  private applySorting(
    variants: Variant[],
    sortOrder: SortOrder
  ): Variant[] {
    switch (sortOrder) {
      case 'newest':
        return variants.sort((a, b) =>
          b.acquiredAt.getTime() - a.acquiredAt.getTime()
        );
      case 'rarity':
        return variants.sort((a, b) =>
          RARITY_VALUE[b.rarity] - RARITY_VALUE[a.rarity]
        );
      case 'generation':
        return variants.sort((a, b) => b.generation - a.generation);
      case 'name':
        return variants.sort((a, b) => a.name.localeCompare(b.name));
      default:
        return variants;
    }
  }
}
```

#### Component 2: Filter System (Discovery Tools)

**Filter Options:**

**Dynasty Filter:**
```
[All Dynasties ▼]
├─ All (23 variants)
├─ CYBER (8 variants)
├─ NEBULA (6 variants)
├─ MECHA (5 variants)
├─ NATURE (4 variants)
└─ [Other dynasties...]
```

**Rarity Filter:**
```
[All Rarities ▼]
├─ All (23 variants)
├─ Common (12 variants)
├─ Uncommon (7 variants)
├─ Rare (3 variants)
├─ Epic (1 variant)
└─ Mythic (0 variants) [grayed out]
```

**Generation Filter:**
```
[All Generations ▼]
├─ All (23 variants)
├─ Gen 1 (3 variants)
├─ Gen 2-3 (8 variants)
├─ Gen 4-5 (10 variants)
└─ Gen 6+ (2 variants)
```

**Special Filters:**
```
[⭐ Favorites Only]  [Toggle button]
[✨ New Variants]    [Toggle button]
[📊 Set Incomplete] [Toggle button]
```

**Multi-Filter Combination:**
```typescript
interface CollectionFilters {
  dynasty?: Dynasty | null;        // null = all dynasties
  rarity?: Rarity | null;          // null = all rarities
  generationMin?: number | null;   // null = no minimum
  generationMax?: number | null;   // null = no maximum
  favoritesOnly: boolean;          // default false
  newOnly: boolean;                // acquired <24h
  setIncompleteOnly: boolean;      // part of incomplete set
}

// Example: "Show Rare CYBER snakes Gen 5+"
const filters: CollectionFilters = {
  dynasty: Dynasty.CYBER,
  rarity: Rarity.RARE,
  generationMin: 5,
  favoritesOnly: false,
  newOnly: false,
  setIncompleteOnly: false
};
// Result: 2 variants match
```

#### Component 3: Sort System (Organization)

**Sort Options:**
```
[Sort by: Newest ▼]
├─ Newest First      (acquired_at DESC)
├─ Oldest First      (acquired_at ASC)
├─ Rarity (High→Low) (Mythic → Common)
├─ Rarity (Low→High) (Common → Mythic)
├─ Generation (High) (Gen 10 → Gen 1)
├─ Generation (Low)  (Gen 1 → Gen 10)
├─ Name (A→Z)        (alphabetical)
└─ Dynasty           (grouped by dynasty)
```

**Default Sort Logic:**
```typescript
// v0.1: Collection is small (20-30 variants)
// Default: Newest first (see new acquisitions)

// v0.5+: Collection is large (100+ variants)
// Smart default based on last action:
//   - Just bred? Sort by Generation (see offspring)
//   - Just unlocked rare? Sort by Rarity (admire achievement)
//   - Just completed set? Sort by Dynasty (see set progress)
```

#### Component 4: Search Functionality

**Search Bar:**
```
┌────────────────────────────────────┐
│  🔍 Search collection...           │
└────────────────────────────────────┘
```

**Search Scope:**
- Variant name: "Cyber Starlight" → matches
- Dynasty: "CYBER" → matches all CYBER variants
- Rarity: "rare" → matches all Rare variants
- Generation: "Gen 5" or "G5" → matches Gen 5 variants
- Fuzzy match: "star" → "Cyber Starlight"

**Search Implementation:**
```typescript
class CollectionSearch {
  search(variants: Variant[], query: string): Variant[] {
    const lowerQuery = query.toLowerCase().trim();

    if (!lowerQuery) return variants; // Empty search = show all

    return variants.filter(v => {
      // Name match
      if (v.name.toLowerCase().includes(lowerQuery)) return true;

      // Dynasty match
      if (v.dynasty.toLowerCase().includes(lowerQuery)) return true;

      // Rarity match
      if (v.rarity.toLowerCase().includes(lowerQuery)) return true;

      // Generation match (handle "Gen 5" or "G5")
      const genMatch = lowerQuery.match(/(?:gen|g)\s*(\d+)/i);
      if (genMatch && v.generation === parseInt(genMatch[1])) return true;

      return false;
    });
  }
}
```

**Search Performance:**
- Client-side search (no server calls)
- Instant results (<50ms for 500 variants)
- Debounced input (300ms) to prevent lag during typing

#### Component 5: Favorites System

**Favorite Toggle:**
```typescript
interface FavoriteSystem {
  toggleFavorite(variantId: string, userId: string): Promise<void>;
  getFavorites(userId: string): Promise<Variant[]>;
  isFavorite(variantId: string, userId: string): boolean;
}

class FavoriteButton extends Component {
  async handleClick() {
    const { variantId, userId } = this.props;

    // Optimistic UI update
    this.setState({ isFavorite: !this.state.isFavorite });

    try {
      await supabase.from('user_snake_favorites').upsert({
        user_id: userId,
        variant_id: variantId,
        favorited_at: new Date()
      });
    } catch (error) {
      // Rollback on error
      this.setState({ isFavorite: !this.state.isFavorite });
      showError('Failed to favorite snake');
    }
  }

  render() {
    return (
      <button
        className={`favorite-btn ${this.state.isFavorite ? 'active' : ''}`}
        onClick={() => this.handleClick()}
      >
        {this.state.isFavorite ? '⭐' : '☆'}
      </button>
    );
  }
}
```

**Favorite Use Cases:**
- Mark best snakes for quick access
- Flag breeding candidates
- Highlight showcase snakes for Gallery
- Create personal "Hall of Fame"

**Database Schema:**
```sql
CREATE TABLE user_snake_favorites (
  user_id UUID NOT NULL REFERENCES users(id),
  variant_id UUID NOT NULL REFERENCES snakes(id),
  favorited_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  PRIMARY KEY (user_id, variant_id),
  INDEX idx_user_favorites (user_id)
);
```

#### Component 6: Set Tracking (Collections Within Collection)

**CRITICAL DEPENDENCY: Dynasty System UNDEFINED (BLOCKER)**

Per 03_GLOSSARY.md, "Set / Set Bonus" is **UNDEFINED - HIGH PRIORITY**.

**Unknown Questions:**
1. What defines a "set"? (Dynasty-based? Rarity-based? Curated groups?)
2. How many pieces per set? (4-piece vs 6-piece mentioned in PLAYER_JOURNEY)
3. What bonuses do sets provide? ("+10% DNA" mentioned in MVP_SCOPE)
4. Are sets dynasty-specific or cross-dynasty?
5. Do set bonuses stack?

**Proposed Set System (REQUIRES CONFIRMATION):**

**Dynasty Sets (Primary):**
```
CYBER Set (6 pieces):
├─ Cyber Starter (Common) ✓
├─ Cyber Flare (Uncommon) ✓
├─ Cyber Pulse (Uncommon) ✗
├─ Cyber Starlight (Rare) ✓
├─ Cyber Nexus (Epic) ✗
└─ Cyber Prime (Mythic) ✗
Progress: 3/6 (50%)
Bonus: +10% DNA income (unlocks at 6/6)
```

**Rarity Sets (Secondary):**
```
Rare Collection (All Rare variants):
├─ Need 10 Rare variants total
├─ Current: 4/10 (40%)
└─ Bonus: +5% breeding speed
```

**Set Tracking UI:**
```
┌─────────────────────────────────┐
│  SETS & BONUSES                 │
│  ┌───────────────────────────┐  │
│  │ CYBER Dynasty Set         │  │
│  │ ██████░░░░  60% (6/10)    │  │
│  │ Missing: Cyber Nexus,     │  │
│  │          Cyber Prime,     │  │
│  │          Cyber Sentinel   │  │
│  │ Bonus: +10% DNA (locked)  │  │
│  └───────────────────────────┘  │
│  ┌───────────────────────────┐  │
│  │ Rare Collection ✓         │  │
│  │ ██████████  100% (10/10)  │  │
│  │ Bonus: +5% breed speed    │  │
│  │        (ACTIVE)            │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

**Implementation (BLOCKED):**
Cannot implement until Dynasty System defines:
- Set structure per dynasty
- Variants per set
- Bonus formulas
- Cross-dynasty set rules

#### Component 7: Completion % Tracking

**Collection Stats Display:**
```typescript
interface CollectionStats {
  totalVariantsOwned: number;      // 23
  totalVariantsAvailable: number;  // 100 (v0.5) or 500 (v1.0)
  completionPercent: number;       // 23%

  // By Dynasty
  dynastyProgress: {
    [dynasty: string]: {
      owned: number;
      available: number;
      percent: number;
    }
  };

  // By Rarity
  rarityBreakdown: {
    [rarity: string]: number;
  };

  // Generation stats
  highestGeneration: number;       // Gen 7
  averageGeneration: number;       // Gen 4.2
}
```

**Stats Panel:**
```
┌─────────────────────────────────┐
│  COLLECTION PROGRESS            │
│  23 / 100 Variants (23%)        │
│  ████░░░░░░░░░░░░░░░░░░░░░░     │
│                                 │
│  Dynasties: 5 / 8 unlocked      │
│  Highest Gen: 7                 │
│  Avg Gen: 4.2                   │
│                                 │
│  Rarity Breakdown:              │
│  Common:   12  ████████         │
│  Uncommon:  7  ████░░░          │
│  Rare:      3  ██░░░░           │
│  Epic:      1  █░░░░░           │
│  Mythic:    0  ░░░░░░           │
└─────────────────────────────────┘
```

**Milestones:**
```typescript
const COLLECTION_MILESTONES = [
  { count: 5,   title: 'Collector',           reward: '500 DNA' },
  { count: 10,  title: 'Snake Enthusiast',    reward: '1,000 DNA' },
  { count: 20,  title: 'Genetic Researcher',  reward: 'Exclusive Variant' },
  { count: 50,  title: 'Master Breeder',      reward: '5,000 DNA' },
  { count: 100, title: 'Dynasty Lord',        reward: 'Prestige Dynasty' }
];
```

#### Component 8: Variant Detail Screen (Modal)

**Triggered by:** Tap/click on variant card in grid

**Detail View Layout:**
```
┌───────────────────────────────────────┐
│  ← Back            [⭐ Favorite] [⚙]  │
├───────────────────────────────────────┤
│                                       │
│         [Large Snake Visual]          │
│          256×256 render               │
│                                       │
├───────────────────────────────────────┤
│  CYBER STARLIGHT                      │
│  Generation 5  |  Rare                │
│  Dynasty: CYBER                       │
├───────────────────────────────────────┤
│  STATS                                │
│  Speed:    ████████░░  80%            │
│  Power:    ██████░░░░  60%            │
│  Defense:  █████░░░░░  50%            │
├───────────────────────────────────────┤
│  LINEAGE                              │
│  Parents: Cyber Flare (G4) ×          │
│           Cyber Pulse (G3)            │
│  Offspring: 2 snakes bred             │
├───────────────────────────────────────┤
│  ACQUIRED                             │
│  Bred on: Oct 14, 2025                │
│  Breeding Cost: 500 DNA               │
├───────────────────────────────────────┤
│  [Breed] [Evolve] [Showcase]          │
└───────────────────────────────────────┘
```

**Detail Data:**
```typescript
interface VariantDetail {
  // Identity
  id: string;
  name: string;
  dynasty: Dynasty;
  generation: number;
  rarity: Rarity;

  // Stats
  stats: {
    speed: number;      // 0-100
    power: number;      // 0-100
    defense: number;    // 0-100
    special?: number;   // 0-100 (dynasty-specific)
  };

  // Lineage
  parents: {
    father?: Variant;
    mother?: Variant;
  };
  offspring: Variant[];
  breedCount: number;   // Times used for breeding

  // Acquisition
  acquiredAt: Date;
  acquiredVia: 'breed' | 'evolve' | 'shop' | 'reward';
  cost?: number;        // DNA cost if bred/evolved

  // Metadata
  isFavorite: boolean;
  isNew: boolean;       // <24h old
}
```

### 1.2 Technical Implementation Estimates

**Backend (Supabase):**
- snakes table schema: 3 hours
- user_snakes ownership: 2 hours
- Favorites system: 2 hours
- Set tracking queries: 4 hours (BLOCKED by Dynasty definition)
- Stats aggregation: 3 hours
- **Total Backend:** 14 hours (18h if Dynasty defined)

**Frontend (UI):**
- Grid view component: 8 hours
- Filter system: 6 hours
- Sort system: 4 hours
- Search functionality: 5 hours
- Favorites UI: 3 hours
- Set tracking UI: 6 hours (BLOCKED)
- Stats panel: 4 hours
- Detail modal: 8 hours
- Responsive layouts: 6 hours
- **Total Frontend:** 50 hours (56h if Dynasty defined)

**Testing:**
- Filter combinations: 4 hours
- Sort accuracy: 2 hours
- Search edge cases: 3 hours
- Performance (500 variants): 4 hours
- Mobile responsive: 3 hours
- **Total Testing:** 16 hours

**TOTAL IMPLEMENTATION:** ~80 hours (10 days for one developer)
**BLOCKED TIME:** +10 hours if Dynasty System undefined

---

## Level 2: Immediate System Effects

### 2.1 Backend Integration (Supabase)

**Database Schema:**

```sql
-- Core snakes table (all possible variants in game)
CREATE TABLE snakes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(100) NOT NULL,
  dynasty VARCHAR(50) NOT NULL,      -- CYBER, NEBULA, MECHA, etc.
  rarity VARCHAR(20) NOT NULL,       -- Common, Uncommon, Rare, Epic, Mythic
  base_stats JSONB NOT NULL,         -- { speed, power, defense, special }
  visual_key VARCHAR(100) NOT NULL,  -- Asset reference
  set_id UUID REFERENCES snake_sets(id),  -- Set membership

  INDEX idx_dynasty (dynasty),
  INDEX idx_rarity (rarity)
);

-- User ownership (which snakes player owns)
CREATE TABLE user_snakes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES users(id),
  snake_id UUID NOT NULL REFERENCES snakes(id),
  generation INTEGER NOT NULL DEFAULT 1,
  acquired_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  acquired_via VARCHAR(20) NOT NULL,  -- 'breed', 'evolve', 'shop', 'reward'
  parent_1_id UUID REFERENCES user_snakes(id),  -- Breeding lineage
  parent_2_id UUID REFERENCES user_snakes(id),
  breed_count INTEGER NOT NULL DEFAULT 0,       -- Times used for breeding
  is_favorite BOOLEAN NOT NULL DEFAULT FALSE,

  INDEX idx_user_collection (user_id, acquired_at DESC),
  INDEX idx_user_dynasty (user_id, snake_id),
  INDEX idx_favorites (user_id) WHERE is_favorite = true
);

-- Set definitions (BLOCKED by Dynasty System)
CREATE TABLE snake_sets (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(100) NOT NULL,
  dynasty VARCHAR(50),               -- Dynasty-specific set
  required_count INTEGER NOT NULL,   -- 4 or 6 pieces
  bonus_type VARCHAR(50) NOT NULL,   -- 'dna_income', 'breed_speed', etc.
  bonus_value NUMERIC NOT NULL,      -- Bonus amount

  INDEX idx_dynasty_sets (dynasty)
);
```

**Query: Get User Collection**
```sql
-- Get all snakes for user with stats
SELECT
  us.id,
  us.generation,
  us.acquired_at,
  us.acquired_via,
  us.is_favorite,
  us.breed_count,
  s.name,
  s.dynasty,
  s.rarity,
  s.base_stats,
  s.visual_key,
  s.set_id
FROM user_snakes us
JOIN snakes s ON us.snake_id = s.id
WHERE us.user_id = $1
ORDER BY us.acquired_at DESC;
```

**Query: Collection Stats**
```sql
-- Get collection statistics
SELECT
  COUNT(*) as total_owned,
  COUNT(DISTINCT s.dynasty) as dynasties_unlocked,
  MAX(us.generation) as highest_generation,
  AVG(us.generation) as average_generation,
  COUNT(*) FILTER (WHERE s.rarity = 'Common') as common_count,
  COUNT(*) FILTER (WHERE s.rarity = 'Uncommon') as uncommon_count,
  COUNT(*) FILTER (WHERE s.rarity = 'Rare') as rare_count,
  COUNT(*) FILTER (WHERE s.rarity = 'Epic') as epic_count,
  COUNT(*) FILTER (WHERE s.rarity = 'Mythic') as mythic_count
FROM user_snakes us
JOIN snakes s ON us.snake_id = s.id
WHERE us.user_id = $1;
```

**Query: Set Progress (BLOCKED)**
```sql
-- CANNOT IMPLEMENT until Dynasty System defines set structure
-- Example placeholder:
SELECT
  ss.name as set_name,
  ss.required_count,
  COUNT(us.id) as owned_count,
  ss.bonus_type,
  ss.bonus_value
FROM snake_sets ss
LEFT JOIN snakes s ON s.set_id = ss.id
LEFT JOIN user_snakes us ON us.snake_id = s.id AND us.user_id = $1
GROUP BY ss.id;
```

### 2.2 UI Framework Integration

**Collection Screen as Primary Screen:**

Per CE-001, Collection Lab must be default screen (not main menu). Player launches app → immediately in Collection Lab.

**Navigation Structure:**
```
App Launch
    ↓
┌─────────────────────────┐
│  COLLECTION LAB (Home)  │  ← Default screen (70% time)
└─────────────────────────┘
    │
    ├─→ [Play Snake] Button → Core Snake Game (30% time)
    ├─→ [Breeding Lab] Tab → Breeding System
    ├─→ [Evolution Lab] Tab → Evolution System
    ├─→ [Shop] Tab → Shop System
    └─→ [Gallery] Tab → Showcase System
```

**Screen Transitions:**
```typescript
class AppNavigation {
  // Default route
  defaultScreen = '/collection';

  // After Snake run completes
  onSnakeRunComplete(results: RunResults): void {
    // Award DNA
    await this.awardDNA(results);

    // Return to Collection Lab (NOT Snake game)
    this.navigate('/collection', {
      showDNAAnimation: true,
      highlightNewVariants: true
    });
  }
}
```

### 2.3 Breeding Lab Integration

**Dependency:** Breeding Lab selects parents FROM Collection

**Integration Flow:**
```
Collection Lab → [Breed] button on variant detail
    ↓
Breeding Lab opens with selected variant as Parent 1
    ↓
"Select Parent 2" from Collection (filtered by dynasty rules)
    ↓
Breeding completes → NEW variant added to Collection
    ↓
Return to Collection Lab, new variant highlighted
```

**Parent Selection from Collection:**
```typescript
class BreedingLab {
  async selectParent(position: 1 | 2): Promise<Variant> {
    // Open Collection in "selection mode"
    const selected = await CollectionModal.open({
      mode: 'select',
      filters: {
        // Only show valid breeding partners
        excludeVariants: [this.parent1?.id],  // Can't breed with self
        dynasty: this.parent1?.dynasty,       // Same dynasty only (ASSUMPTION)
        minGeneration: 1                      // All generations valid
      },
      title: `Select Parent ${position}`
    });

    return selected;
  }
}
```

### 2.4 Evolution Lab Integration

**Dependency:** Evolution Lab evolves variants FROM Collection

**Integration Flow:**
```
Collection Lab → [Evolve] button on variant detail
    ↓
Evolution Lab opens with selected variant
    ↓
Confirm DNA cost → Evolution processing
    ↓
Variant updated (Generation +1, stats increased)
    ↓
Return to Collection Lab, evolved variant highlighted
```

**Evolution Impact on Collection:**
```typescript
class EvolutionSystem {
  async evolveVariant(
    userSnakeId: string,
    dnaCost: number
  ): Promise<Variant> {
    // Update user_snakes record
    const { data } = await supabase
      .from('user_snakes')
      .update({
        generation: generation + 1,
        // Stats recalculated server-side
      })
      .eq('id', userSnakeId)
      .select()
      .single();

    // Collection auto-updates via Supabase realtime
    return data;
  }
}
```

### 2.5 Gallery Integration

**Dependency:** Gallery showcases variants FROM Collection

**Integration Flow:**
```
Collection Lab → [⭐ Favorite] multiple variants
    ↓
Gallery Tab → Select up to 6 favorites for public showcase
    ↓
Other players browse Gallery → see your Collection highlights
```

**Showcase Selection:**
```typescript
class GalleryShowcase {
  async selectForShowcase(userId: string): Promise<Variant[]> {
    // Get user's favorite variants
    const favorites = await supabase
      .from('user_snakes')
      .select('*, snakes(*)')
      .eq('user_id', userId)
      .eq('is_favorite', true)
      .limit(6);  // Max 6 showcase slots

    return favorites.data;
  }
}
```

### 2.6 Shop Integration

**Dependency:** Shop displays purchasable variants NOT in Collection

**Integration Flow:**
```
Shop Tab → Show all variants player does NOT own
    ↓
Filter: Available for purchase (DNA cost or premium)
    ↓
Purchase variant → Added to Collection
    ↓
Shop updates (variant no longer shown as available)
```

**Shop Inventory Query:**
```sql
-- Get snakes user doesn't own yet
SELECT s.*
FROM snakes s
WHERE s.id NOT IN (
  SELECT snake_id
  FROM user_snakes
  WHERE user_id = $1
)
AND s.available_for_purchase = true
ORDER BY s.rarity DESC, s.name ASC;
```

---

## Level 3: Game Balance

### 3.1 Collection Size Scaling

**Collection Growth Targets:**

**v0.1 (20-30 variants available):**
```
Day 1:   2-3 variants    (tutorial + first breed)
Day 7:   6-8 variants    (1 per day average)
Day 14:  12-15 variants  (building collection)
Day 30:  20-25 variants  (PR-003 target met)

Feel: "I'm making progress, but there's more to get"
```

**v0.5 (100 variants available):**
```
Day 1:   2-3 variants    (same start)
Day 30:  25-30 variants  (30% of total)
Day 60:  45-55 variants  (50% of total)
Day 90:  70-80 variants  (70-80% of total)

Feel: "Long-term collection goals, satisfying completion"
```

**v1.0 (500+ variants available):**
```
Day 1:   2-3 variants    (same start)
Day 30:  25-30 variants  (5% of total)
Day 90:  70-90 variants  (15% of total)
Day 180: 150-200 variants (30% of total)
Year 1:  300-400 variants (60-80% of total)

Feel: "Endless pursuit, never truly 'complete'"
```

**Design Validation:**
- Early game: 1 variant per day (rapid dopamine)
- Mid game: 1 variant per 2-3 days (sustained progress)
- Late game: 1 variant per week (aspirational completionism)

### 3.2 Rarity Distribution Balance

**Rarity Tiers (CO-001):**
```
Common:    40% of drops
Uncommon:  30% of drops
Rare:      20% of drops
Epic:       8% of drops
Mythic:     2% of drops
```

**Collection Composition by Day 30 (20 variants):**
```
Expected distribution:
Common:    8 variants   (40%)
Uncommon:  6 variants   (30%)
Rare:      4 variants   (20%)
Epic:      2 variants   (10%) [slightly above 8% due to low sample]
Mythic:    0 variants   (0%)  [2% chance = low probability in 20 trials]

Feel: "I have mostly commons, a few rares, working toward epic/mythic"
```

**Rarity Value Perception:**
```
Common:    "Building blocks" - abundant, low DNA cost
Uncommon:  "Solid collection" - frequent enough to feel progress
Rare:      "Achievement!" - notable milestone, celebration
Epic:      "Major flex" - rare enough to feel special
Mythic:    "Ultimate goal" - aspirational, long-term pursuit
```

**Balance Check:**
- Common should NOT feel worthless (useful for breeding chains)
- Rare should NOT be unobtainable (achievable by Day 7-14)
- Mythic should NOT be mandatory (optional prestige goal)

### 3.3 Unlocking Pace Validation

**Current System (Resource Generation Analysis):**
```
Average player:
- 800 DNA/day (5 runs)
- 24,000 DNA by Day 30

Variant costs (estimated):
- Common breed:    200 DNA   (4 per week)
- Uncommon breed:  350 DNA   (2 per week)
- Rare breed:      500 DNA   (1.6 per week)
- Epic breed:      1,000 DNA (0.8 per week)
- Shop purchase:   300-800 DNA (varies)
```

**Unlocking Cadence:**
```
Week 1: 5,600 DNA available
- 4 common breeds (800 DNA)
- 2 uncommon breeds (700 DNA)
- 2 shop purchases (1,000 DNA)
- Total: 8 variants, 3,100 DNA remaining

Week 2: 5,600 + 3,100 = 8,700 DNA
- 3 uncommon breeds (1,050 DNA)
- 2 rare breeds (1,000 DNA)
- 3 shop purchases (1,500 DNA)
- Total: 8 variants, 5,150 DNA remaining

Week 3: 5,600 + 5,150 = 10,750 DNA
- 4 rare breeds (2,000 DNA)
- 1 epic breed (1,000 DNA)
- Total: 5 variants, 7,750 DNA remaining

Week 4: 5,600 + 7,750 = 13,350 DNA
- 2 epic breeds (2,000 DNA)
- 4 rare breeds (2,000 DNA)
- Total: 6 variants, 9,350 DNA banked

Total by Day 30: 27 variants ✓ (exceeds PR-003 target of 20)
```

**Pacing Feel:**
- Weeks 1-2: Rapid unlocks (2-3 per day) → excitement
- Weeks 3-4: Steady progress (1 per day) → satisfaction
- Banking DNA: Creates "purchasing power" feeling

**Risk: Too Fast?**
If players reach 27 variants by Day 30 in v0.1 (30 available), they hit 90% completion too quickly.

**Mitigation:**
- v0.1: 20-30 variants = 90% completion OK (drives retention for v0.5)
- v0.5: 100 variants = 27% completion (healthy)
- v1.0: 500 variants = 5% completion (endless pursuit)

### 3.4 Set Bonus Power (BLOCKED)

**CRITICAL DEPENDENCY: Dynasty System UNDEFINED**

Cannot design set bonus power until Dynasty System specifies:
1. Set structure (4-piece? 6-piece? Variable?)
2. Bonus types (+DNA? +breed speed? +stats?)
3. Bonus magnitude (+5%? +10%? +20%?)
4. Stacking rules (multiple sets active simultaneously?)

**Placeholder Example (REQUIRES CONFIRMATION):**
```
CYBER Dynasty 6-Piece Set:
- Bonus: +10% DNA income
- Impact: 800 DNA/day → 880 DNA/day (+80 DNA)
- Monthly: +2,400 DNA = 2-3 extra variants

Rare Collection 10-Piece Set:
- Bonus: +5% breeding speed
- Impact: 30s breed timer → 28.5s timer
- Feel: Quality of life, not mandatory
```

**Balance Concerns:**
- Too powerful: Set bonuses become mandatory → frustration if incomplete
- Too weak: Set bonuses feel meaningless → no motivation to complete
- Recommendation: +5-10% bonuses (meaningful but not mandatory)

### 3.5 Duplicate Handling (Breeding Economics)

**Question:** Can players own multiple copies of same variant?

**Scenario 1: No Duplicates (Collection = Set)**
```
Pros:
- Clean UX (1 card per variant in Collection)
- Easy to track completion (own it or don't)
- Simpler database (user_snakes = owned snakes)

Cons:
- Breeding produces variants player already owns (wasted?)
- Cannot breed same combo twice (limits experimentation)
```

**Scenario 2: Allow Duplicates**
```
Pros:
- Breeding always produces NEW snake instance
- Can breed same combo multiple times
- Supports "breeding for perfect stats" (if stats vary)

Cons:
- Collection UI cluttered (23 variants → 45 instances)
- Duplicate management tedium (violates BA-004)
- Players hoard duplicates "just in case"
```

**Recommended Approach: Hybrid System**
```
- Collection displays UNIQUE variants (1 card per variant type)
- "Owned: 3" badge if player has duplicates
- Breeding with duplicates possible (select which instance)
- Automatic duplicate consolidation (keep highest Gen version)

Example:
┌─────────────────┐
│ Cyber Starlight │
│ Gen 5  Rare     │
│ Owned: 3        │  ← Player has 3 instances (Gen 3, Gen 5, Gen 5)
│ [View All] →    │
└─────────────────┘
```

**Balance Impact:**
- Breeding cost unchanged (200-500 DNA per breed)
- Duplicates provide breeding options (flexibility)
- No "duplicate problem" in Collection UI (clean)

---

## Level 4: Economy/Progression

### 4.1 DNA Cost per Variant Tier

**Acquisition Costs (Estimated, REQUIRES BALANCING):**

**Breeding Costs:**
```
Common breed:     200 DNA    (5 runs to afford)
Uncommon breed:   350 DNA    (2.2 runs)
Rare breed:       500 DNA    (3.1 runs)
Epic breed:       1,000 DNA  (6.3 runs)
Mythic breed:     2,000 DNA  (12.5 runs)

Rationale: Exponential cost matches rarity exponential drop rate
```

**Shop Purchase Costs:**
```
Common variant:   300 DNA    (instant unlock, skip breeding)
Uncommon variant: 600 DNA
Rare variant:     1,200 DNA
Epic variant:     3,000 DNA
Mythic variant:   5,000 DNA  (15+ days savings for F2P)

Rationale: Shop costs 1.5-2.5× breeding cost (convenience premium)
```

**Cost Validation:**
```
Average player (800 DNA/day):
- Can afford 4 common breeds per day
- Can afford 2 uncommon breeds per day
- Can afford 1 rare breed every 1-2 days
- Can afford 1 epic breed per week
- Can afford 1 mythic breed every 2-3 weeks (endgame goal)

Feel: "I can always afford SOMETHING, but big purchases require planning"
```

### 4.2 Acquisition Methods

**Method 1: Breeding (Primary)**
```
Frequency: 70% of variants acquired via breeding
DNA cost: 200-2,000 DNA per breed
Time cost: 30s-3min breeding timer
Skill cost: Requires understanding breeding mechanics

Pros: Most economical, teaches meta-game
Cons: Requires 2 parent snakes, RNG outcome
```

**Method 2: Shop Purchase (Secondary)**
```
Frequency: 20% of variants acquired via shop
DNA cost: 300-5,000 DNA per purchase
Time cost: Instant (no breeding timer)
Skill cost: None (just DNA)

Pros: Guaranteed outcome, no RNG
Cons: More expensive than breeding
```

**Method 3: Evolution (Tertiary)**
```
Frequency: 5% of variants (transforms existing snake)
DNA cost: 500-2,000 DNA per evolution
Time cost: Instant transformation
Skill cost: Requires evolved snake form unlocked

Pros: Upgrades existing snake (Gen +1)
Cons: Doesn't ADD to collection (transforms, not creates)
```

**Method 4: Rewards (Rare)**
```
Frequency: 5% of variants acquired via rewards
Sources: Achievements, milestones, events, daily login streaks
DNA cost: Free
Time cost: Gated by achievement progress

Pros: Free variants, feels like bonus
Cons: Limited availability, not primary method
```

**Acquisition Balance:**
```
By Day 30 (20 variants):
- Breeding: 14 variants (70%)
- Shop: 4 variants (20%)
- Evolution: 1 variant (5%)
- Rewards: 1 variant (5%)

Feel: "Breeding is main path, but shop offers shortcuts"
```

### 4.3 Collection Value (Stats vs. Cosmetic)

**CRITICAL DESIGN DECISION: Do variants have gameplay impact?**

**Option A: Stats Matter (Gameplay Impact)**
```
Each variant has unique stats:
- Speed: Affects Snake movement speed
- Power: Affects score multiplier
- Defense: Affects collision forgiveness

Result:
- Players optimize collection for gameplay advantage
- Rare variants have BETTER stats (power creep risk)
- Collection becomes competitive advantage

Concerns:
- Violates BM-001 (no pay-to-win) if shop variants have best stats
- Creates "meta" builds (everyone wants same variants)
- Cosmetic variety loses value (players only use "best" snake)
```

**Option B: Cosmetic Only (No Gameplay Impact)**
```
All variants have SAME stats (cosmetic only):
- Visual variety only
- Collection is self-expression, not power

Result:
- Players collect for aesthetics, not advantage
- No power creep risk
- All variants equally viable for gameplay

Concerns:
- Less motivation to collect (no gameplay benefit)
- "Just skins" perception (reduced value)
- Breeding feels cosmetic-focused (less strategy)
```

**Recommended Approach: Hybrid (Minimal Stats)**
```
Variants have MINOR stat differences:
- Speed: ±5% variance (not ±50%)
- Power: ±5% variance
- Visual theme matters more than stats

Example:
Common Cyber:     Speed 50, Power 50 (baseline)
Rare Cyber:       Speed 52, Power 53 (+4-6% better)
Mythic Cyber:     Speed 55, Power 55 (+10% better)

Result:
- Rare variants SLIGHTLY better (motivation to collect)
- Difference small enough to not break BM-001 (no pay-to-win)
- Visual variety still primary value (aesthetic > stats)

Balance Check:
- 10% stat advantage = expert player with Common beats beginner with Mythic
- Skill > Collection (maintains BM-001 compliance)
```

### 4.4 Progression Gates (Collection Unlocks)

**Collection Milestones Gate Content:**

**Gate 1: Unlock Breeding (5 variants)**
```
Requirement: Collect 5 variants
Unlock: Breeding Lab access
Rationale: Players need variety to breed (can't breed 2 variants)
Timeline: Day 2-3
```

**Gate 2: Unlock Evolution (10 variants)**
```
Requirement: Collect 10 variants
Unlock: Evolution Lab access
Rationale: Evolution is advanced meta-game (needs collection foundation)
Timeline: Day 7-10
```

**Gate 3: Unlock Gallery (15 variants)**
```
Requirement: Collect 15 variants
Unlock: Public Gallery showcase
Rationale: Need sizable collection to showcase
Timeline: Day 14-20
```

**Gate 4: Unlock Prestige (50 variants, v1.0)**
```
Requirement: Collect 50 variants
Unlock: Prestige system access
Rationale: Prestige resets collection (must have built substantial collection first)
Timeline: Day 60-90
```

**Gate Validation:**
- Early gates (5, 10) are achievable Week 1-2 (rapid unlock feel)
- Mid gates (15, 20) pace content unlock with progression
- Late gates (50+) are aspirational (long-term goals)

**Risk:** Gates that are TOO strict feel frustrating
**Mitigation:** All gates are 50-75% of natural acquisition pace (reach before feeling blocked)

---

## Critical Findings (Part 1)

### Finding 1: Dynasty System is CRITICAL BLOCKER

**Impact:** High
**Urgency:** Critical

Per 03_GLOSSARY.md, Dynasty System is **UNDEFINED** (mentioned 20+ times, zero specification).

**Collection Lab Blocking Dependencies:**
1. Set tracking requires dynasty-based set definitions
2. Filters require dynasty list and visual themes
3. Breeding parent selection requires cross-dynasty rules
4. Shop inventory requires dynasty unlock progression

**Recommendation:** Cannot finalize Collection Lab design until Dynasty Design Sprint completes (Week 1-2).

**Fallback:** If Dynasty undefined, defer set tracking and dynasty-specific filters to v0.5.

### Finding 2: Collection Lab IS THE GAME (70% Time)

**Impact:** Critical
**Design Imperative:** CE-001

Collection Lab must be compelling enough for 70% of session time. This is NOT negotiable.

**Required Features for 70% Engagement:**
- Visual variety (500+ unique variants at v1.0)
- Depth (filters, sorts, search, lineage, sets)
- Goals (set completion, milestones, progression)
- Rewards (unlocks, bonuses, achievements)
- Social (comparison, showcase, competition)

**Risk:** If Collection Lab is shallow (just a list), players spend <50% time here → paradigm shift FAILS.

**Mitigation:**
- v0.1: 20-30 variants with full feature set (filters, sorts, sets, stats)
- v0.5: 100 variants (depth increases)
- v1.0: 500+ variants (endless content)

### Finding 3: Set Bonus System Requires Specification

**Impact:** High
**Urgency:** High (Week 2-3)

"Set / Set Bonus" is **UNDEFINED - HIGH PRIORITY** per 03_GLOSSARY.md.

**Unknown Questions:**
1. Set structure (dynasty-based? rarity-based? curated?)
2. Set size (4-piece? 6-piece? variable?)
3. Bonus type (+DNA? +breed speed? +stats?)
4. Bonus magnitude (+5%? +10%? +20%?)
5. Stacking rules (multiple sets active?)

**Blocking:** Set tracking UI cannot be implemented without this.

**Recommendation:** Define set system in Week 2-3 (after Dynasty defined, before Collection implementation).

### Finding 4: Duplicate Handling Needs Decision

**Impact:** Medium
**Design Question:** Open

**Question:** Can players own multiple instances of same variant?

**Options:**
- No duplicates: Clean UX, simpler database, but limits breeding flexibility
- Allow duplicates: Breeding flexibility, but cluttered UI (violates BA-004)
- Hybrid: Collection shows unique variants, "Owned: N" badge for duplicates

**Recommended:** Hybrid approach (best of both worlds).

**Decision Needed:** Week 5 (before Collection Lab implementation).

### Finding 5: Stats vs. Cosmetic Collection Value

**Impact:** High
**Design Decision:** Critical for BM-001

**Question:** Do variants have gameplay impact (stats) or are they cosmetic only?

**Options:**
- Stats matter: Competitive advantage, risk of pay-to-win (BM-001 violation)
- Cosmetic only: No advantage, reduced collection motivation
- Minimal stats: ±5-10% variance, preserves BM-001, maintains motivation

**Recommended:** Minimal stats approach (±5-10% variance).

**Rationale:**
- Rare variants SLIGHTLY better (motivation)
- Difference small (skill > collection, maintains BM-001)
- Visual variety primary value (aesthetic focus)

**Decision Needed:** Week 5 (before Collection Lab implementation).

---

## Dynasty System BLOCKER

### Impact on Collection Lab Design

**CRITICAL:** Per 03_GLOSSARY.md, Dynasty System is **UNDEFINED - CRITICAL BLOCKER**.

**Collection Lab Features Blocked by Undefined Dynasty:**

1. **Dynasty Filters:**
   - Cannot create dynasty dropdown without dynasty list
   - Cannot display dynasty visual themes without theme specification
   - Cannot implement dynasty-based sorting without dynasty definitions

2. **Set Tracking:**
   - Dynasty-based sets require knowing variants per dynasty
   - Set bonuses require knowing bonus structure per dynasty
   - Cannot implement set progress tracking without set definitions

3. **Breeding Integration:**
   - Parent selection from Collection requires cross-dynasty rules
   - "Can CYBER breed with NEBULA?" → Unknown
   - Cannot filter valid breeding partners without dynasty breeding rules

4. **Shop Integration:**
   - Dynasty unlock progression unknown
   - Which dynasties available at start? Which unlock later?
   - Cannot display "Locked Dynasty" states without unlock progression

5. **Collection Stats:**
   - "Dynasties: 5/8 unlocked" requires knowing total dynasty count
   - Dynasty-specific completion % requires knowing variants per dynasty

### Fallback Plan (If Dynasty Undefined)

**v0.1 Without Dynasty:**
```
Remove Dynasty-Dependent Features:
✗ Dynasty filters (use rarity/generation only)
✗ Set tracking (defer to v0.5)
✗ Dynasty completion % (show total only)
✓ Collection grid (works without dynasties)
✓ Rarity filters (independent of dynasties)
✓ Generation sorting (independent of dynasties)
✓ Search functionality (reduced scope)
✓ Favorites system (independent of dynasties)

Result: Functional but SHALLOW Collection Lab (risks failing CE-001)
```

**Risk of Fallback:**
If Collection Lab ships without dynasty features, 70% time split may not be achievable (Collection too shallow).

**Recommendation:** BLOCK Collection Lab implementation until Dynasty System defined (Week 1-2 Dynasty Design Sprint).

---

## Open Questions (Part 1)

### Question 1: Dynasty System Specification

**Status:** CRITICAL BLOCKER
**Decision Needed:** Week 1-2
**Owner:** Game Designer + PM

**Questions:**
1. How many dynasties exist? (8? 10? 15?)
2. What are dynasty names and visual themes?
3. How do players unlock dynasties? (Play-based? DNA cost? Purchase?)
4. Can dynasties cross-breed? (CYBER + NEBULA = offspring?)
5. Do dynasties have stat differences or just visual themes?
6. How many variants per dynasty? (50+? 100+?)

**Blocking:** Collection filters, set tracking, breeding integration, shop inventory.

### Question 2: Set Bonus Structure

**Status:** HIGH PRIORITY
**Decision Needed:** Week 2-3
**Owner:** Game Designer

**Questions:**
1. What defines a "set"? (All variants in dynasty? Rarity groups? Curated collections?)
2. Set size: 4-piece or 6-piece? (PLAYER_JOURNEY mentions "4 vs 6 for first tier")
3. Bonus types: +DNA income? +breed speed? +stats? (MVP_SCOPE mentions "+10% DNA")
4. Bonus magnitude: +5%? +10%? +20%?
5. Do bonuses stack if multiple sets completed?
6. Are sets dynasty-specific or cross-dynasty?

**Blocking:** Set tracking UI, collection milestones, progression rewards.

### Question 3: Duplicate Handling Policy

**Status:** MEDIUM PRIORITY
**Decision Needed:** Week 5
**Owner:** UX Designer + PM

**Questions:**
1. Can players own multiple instances of same variant?
2. If yes, how does Collection UI display duplicates?
3. If no, what happens when breeding produces variant player already owns?
4. Do duplicates serve any purpose? (Breeding fuel? Trading? Dismantling?)

**Blocking:** Collection database schema, breeding result handling, UI card display.

### Question 4: Stats vs. Cosmetic Collection Value

**Status:** HIGH PRIORITY
**Decision Needed:** Week 5
**Owner:** Game Designer + Balancing Lead

**Questions:**
1. Do variants have gameplay impact (stats affect Snake gameplay)?
2. If yes, how much variance? (±5%? ±20%? ±50%?)
3. Does rarity correlate with stats? (Mythic = best stats?)
4. Does this violate BM-001 (no pay-to-win) if shop variants have better stats?
5. How do we balance collection value vs. BM-001 constraint?

**Blocking:** Collection detail screen stats display, shop value proposition, breeding strategy depth.

### Question 5: Progression Gate Thresholds

**Status:** MEDIUM PRIORITY
**Decision Needed:** Week 6
**Owner:** Game Designer + Balancing Lead

**Questions:**
1. At what collection size do players unlock Breeding Lab? (5 variants?)
2. At what collection size do players unlock Evolution Lab? (10 variants?)
3. At what collection size do players unlock Gallery? (15 variants?)
4. Are gates too strict (frustrating) or too loose (trivial)?
5. Do gates feel natural or arbitrary?

**Blocking:** Tutorial flow, feature unlock progression, player onboarding.

---

## Next Steps

**Week 1-2: Dynasty Design Sprint (CRITICAL)**
- Define dynasty count, names, visual themes
- Specify dynasty unlock progression
- Define cross-dynasty breeding rules
- Deliver Dynasty System specification document

**Week 2-3: Set Bonus System Design**
- Define set structure (dynasty-based, rarity-based, curated)
- Specify set sizes (4-piece, 6-piece, variable)
- Define bonus types and magnitudes
- Deliver Set Bonus specification document

**Week 5-6: Collection Lab Implementation (AFTER Dynasty Defined)**
- Implement Collection grid view
- Implement filter system (dynasty, rarity, generation)
- Implement sort system (newest, rarity, generation, name)
- Implement search functionality
- Implement favorites system
- Implement set tracking UI (after Set Bonus defined)
- Implement variant detail screen
- Implement collection stats panel

**Week 6: Balancing Pass**
- Validate collection size scaling (20 → 100 → 500)
- Tune rarity distribution (40% Common, 2% Mythic)
- Validate unlocking pace (1-2 variants per day)
- Test 70% time split (CE-001 validation)

---

**Part 1 Complete**
**Word Count:** ~4,200 words
**Levels Covered:** 1-4 (Implementation, System Effects, Balance, Economy)
**Part 2 Preview:** Levels 5-8 will cover Social Systems, Technical Architecture, Content Creation, Meta-game Integration

**STATUS:** BLOCKED by Dynasty System (CRITICAL - Week 1-2 resolution required)
