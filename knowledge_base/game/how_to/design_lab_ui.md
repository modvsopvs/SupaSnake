# How to Design Lab UI Screens

**Goal**: Create intuitive, performant Lab UI screens (Collection, Breeding, Evolution) using React Native with Panini book-style collection browsing and seamless tab navigation.

**Timeline**: 2-3 weeks (UI framework + 3 Lab implementations)

**Prerequisites**:
- React Native development environment set up
- Familiarity with virtual scrolling (FlatList)
- Understanding of Supabase real-time subscriptions
- Knowledge of React Navigation

---

## Overview

The Lab UI System is **the primary game interface** where players spend 70% of their session time (CE-001 constraint). It serves as the persistent "home screen" hosting Collection Lab, Breeding Lab, and Evolution Lab through integrated tab navigation.

**Critical Insight:** Lab UI success is measured by engagement quality during the 70% time allocation, not just functional navigation. The Lab makes the game feel like a genetic empire simulator, not just a Snake game.

---

## Step 1: Set Up Tab Navigation Structure

**Implementation: Bottom Tab Navigator (Mobile-First)**

```typescript
// navigation/LabNavigator.tsx
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';

interface LabTab {
  id: 'collection' | 'breeding' | 'evolution' | 'profile';
  label: string;
  icon: string;
  badge?: number; // Notification count
  disabled?: boolean;
}

const Tab = createBottomTabNavigator();

export function LabNavigator() {
  return (
    <Tab.Navigator
      initialRouteName="Collection"
      screenOptions={{
        tabBarStyle: styles.tabBar,
        tabBarActiveTintColor: '#14B8A6', // Teal accent
        tabBarInactiveTintColor: '#6B7280', // Muted gray
        tabBarLabelStyle: styles.tabLabel,
        headerShown: false, // Custom headers per screen
      }}
    >
      <Tab.Screen
        name="Collection"
        component={CollectionLabScreen}
        options={{
          tabBarIcon: ({ color }) => <GridIcon color={color} />,
          tabBarBadge: newSnakesCount > 0 ? newSnakesCount : undefined,
        }}
      />
      <Tab.Screen
        name="Breeding"
        component={BreedingLabScreen}
        options={{
          tabBarIcon: ({ color }) => <HeartIcon color={color} />,
          tabBarBadge: completedBreeds > 0 ? completedBreeds : undefined,
        }}
      />
      <Tab.Screen
        name="Evolution"
        component={EvolutionLabScreen}
        options={{
          tabBarIcon: ({ color }) => <TrendingUpIcon color={color} />,
          tabBarBadge: readyToEvolve > 0 ? readyToEvolve : undefined,
        }}
      />
      <Tab.Screen
        name="Profile"
        component={ProfileScreen}
        options={{
          tabBarIcon: ({ color }) => <UserCircleIcon color={color} />,
        }}
      />
    </Tab.Navigator>
  );
}
```

**Styling (React Native):**
```typescript
const styles = StyleSheet.create({
  tabBar: {
    position: 'absolute',
    bottom: 0,
    height: 80,
    paddingBottom: 20, // Safe area for iPhone notch
    backgroundColor: '#1F2937', // Dark background
    borderTopWidth: 1,
    borderTopColor: '#374151',
  },
  tabLabel: {
    fontSize: 12,
    fontWeight: '600',
  },
});
```

**Key Design Decision:** Bottom tab bar for thumb-friendly mobile navigation (most important tabs within easy reach).

---

## Step 2: Design Collection Lab Screen (Panini Book Style)

**Implementation: Virtualized Grid with Filters**

```typescript
// screens/CollectionLabScreen.tsx
import { FlatList } from 'react-native';

export function CollectionLabScreen() {
  const [filters, setFilters] = useState<CollectionFilters>({
    dynasty: null,
    rarity: null,
    favoritesOnly: false,
  });
  const [sortOrder, setSortOrder] = useState<SortOrder>('newest');

  // Load collection from Supabase
  const { data: variants, isLoading } = useCollection(userId);

  // Apply filters and sorting (client-side)
  const filteredVariants = useMemo(() => {
    let result = variants || [];

    if (filters.dynasty) {
      result = result.filter(v => v.dynasty === filters.dynasty);
    }
    if (filters.rarity) {
      result = result.filter(v => v.rarity === filters.rarity);
    }
    if (filters.favoritesOnly) {
      result = result.filter(v => v.isFavorite);
    }

    // Sort
    return sortVariants(result, sortOrder);
  }, [variants, filters, sortOrder]);

  const renderItem = useCallback(({ item }: { item: SnakeVariant }) => (
    <SnakeCard
      variant={item}
      onPress={() => openSnakeDetail(item)}
    />
  ), []);

  // Virtual scrolling for performance (60fps at 500+ items)
  return (
    <View style={styles.container}>
      <CollectionHeader
        variantCount={filteredVariants.length}
        totalCount={variants?.length || 0}
      />

      <FilterBar
        filters={filters}
        onFiltersChange={setFilters}
        sortOrder={sortOrder}
        onSortChange={setSortOrder}
      />

      <FlatList
        data={filteredVariants}
        renderItem={renderItem}
        keyExtractor={(item) => item.id}
        numColumns={3} // 3-column grid (mobile)
        getItemLayout={(data, index) => ({
          length: 180, // Fixed item height
          offset: 180 * Math.floor(index / 3),
          index,
        })}
        windowSize={5} // Render 5 screens worth
        maxToRenderPerBatch={15}
        removeClippedSubviews={true} // Unmount off-screen items
        initialNumToRender={15} // First screen only (5 rows × 3 columns)
        contentContainerStyle={styles.grid}
      />
    </View>
  );
}
```

**Snake Card Component (Panini Book Style):**
```typescript
// components/SnakeCard.tsx
export function SnakeCard({ variant, onPress }: SnakeCardProps) {
  return (
    <TouchableOpacity
      style={styles.card}
      onPress={onPress}
      activeOpacity={0.8}
    >
      <FastImage
        source={{ uri: variant.thumbnailUrl }}
        style={styles.thumbnail}
        resizeMode="contain"
      />

      {variant.isNew && (
        <View style={styles.newBadge}>
          <Text style={styles.newText}>NEW</Text>
        </View>
      )}

      {variant.isFavorite && (
        <View style={styles.favoriteStar}>
          <Text>⭐</Text>
        </View>
      )}

      <View style={styles.info}>
        <Text style={styles.name} numberOfLines={1}>
          {variant.name}
        </Text>
        <Text style={styles.dynasty}>{variant.dynasty}</Text>
        <View style={styles.stats}>
          <RarityBadge rarity={variant.rarity} />
          <Text style={styles.generation}>Gen {variant.generation}</Text>
        </View>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  card: {
    flex: 1,
    margin: 8,
    backgroundColor: '#374151',
    borderRadius: 12,
    overflow: 'hidden',
    elevation: 4, // Android shadow
    shadowColor: '#000', // iOS shadow
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 4,
  },
  thumbnail: {
    width: '100%',
    aspectRatio: 1, // Square
  },
  newBadge: {
    position: 'absolute',
    top: 8,
    right: 8,
    backgroundColor: '#F59E0B',
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 4,
  },
  // ... rest of styles
});
```

**Key Design Principle:** Virtual scrolling (FlatList with `getItemLayout`) maintains 60fps even with 500+ snakes. Without this, performance drops to 15fps at scale.

---

## Step 3: Implement Filter and Sort System

**Filter Bar Component:**
```typescript
// components/FilterBar.tsx
export function FilterBar({ filters, onFiltersChange, sortOrder, onSortChange }) {
  return (
    <View style={styles.filterBar}>
      <ScrollView horizontal showsHorizontalScrollIndicator={false}>
        {/* Dynasty filter */}
        <FilterChip
          label={filters.dynasty || 'All Dynasties'}
          active={!!filters.dynasty}
          onPress={() => showDynastyPicker(filters, onFiltersChange)}
        />

        {/* Rarity filter */}
        <FilterChip
          label={filters.rarity || 'All Rarities'}
          active={!!filters.rarity}
          onPress={() => showRarityPicker(filters, onFiltersChange)}
        />

        {/* Favorites toggle */}
        <FilterChip
          label="⭐ Favorites"
          active={filters.favoritesOnly}
          onPress={() => onFiltersChange({
            ...filters,
            favoritesOnly: !filters.favoritesOnly
          })}
        />

        {/* Sort dropdown */}
        <SortButton
          sortOrder={sortOrder}
          onSortChange={onSortChange}
        />
      </ScrollView>
    </View>
  );
}
```

**Sorting Logic:**
```typescript
function sortVariants(variants: SnakeVariant[], order: SortOrder): SnakeVariant[] {
  switch (order) {
    case 'newest':
      return [...variants].sort((a, b) =>
        b.acquiredAt.getTime() - a.acquiredAt.getTime()
      );
    case 'rarity':
      const rarityValue = { Common: 1, Uncommon: 2, Rare: 3, Epic: 4, Legendary: 5 };
      return [...variants].sort((a, b) =>
        rarityValue[b.rarity] - rarityValue[a.rarity]
      );
    case 'generation':
      return [...variants].sort((a, b) => b.generation - a.generation);
    case 'name':
      return [...variants].sort((a, b) => a.name.localeCompare(b.name));
    default:
      return variants;
  }
}
```

---

## Step 4: Design Breeding Lab Screen

**Implementation: Breeding Slots with Parent Selection**

```typescript
// screens/BreedingLabScreen.tsx
export function BreedingLabScreen() {
  const { data: breedingSlots } = useBreedingSlots(userId);
  const [selectedSlot, setSelectedSlot] = useState<number | null>(null);

  return (
    <View style={styles.container}>
      <Text style={styles.header}>Breeding Lab</Text>

      {breedingSlots?.map(slot => (
        <BreedingSlotCard
          key={slot.id}
          slot={slot}
          onStartBreed={() => setSelectedSlot(slot.id)}
          onClaim={slot.isComplete ? () => claimOffspring(slot.id) : undefined}
        />
      ))}

      {selectedSlot && (
        <ParentSelectionModal
          slotId={selectedSlot}
          onClose={() => setSelectedSlot(null)}
        />
      )}
    </View>
  );
}
```

**Breeding Slot States:**
```typescript
// components/BreedingSlotCard.tsx
export function BreedingSlotCard({ slot, onStartBreed, onClaim }) {
  if (slot.status === 'empty') {
    return (
      <TouchableOpacity style={styles.emptySlot} onPress={onStartBreed}>
        <Text style={styles.emptyText}>Empty Slot</Text>
        <Text style={styles.startButton}>+ Start Breeding</Text>
      </TouchableOpacity>
    );
  }

  if (slot.status === 'breeding') {
    return (
      <View style={styles.activeSlot}>
        <View style={styles.parents}>
          <SnakeThumbnail snake={slot.parent1} size={64} />
          <Text style={styles.plusSign}>+</Text>
          <SnakeThumbnail snake={slot.parent2} size={64} />
        </View>

        <EggAnimation pulsing />

        <CountdownTimer
          targetTime={slot.completeTime}
          onComplete={() => refreshSlots()}
        />

        <Text style={styles.offspringPreview}>
          Offspring: Gen {slot.offspringGeneration} {slot.offspringDynasty}
        </Text>
      </View>
    );
  }

  if (slot.status === 'complete') {
    return (
      <TouchableOpacity style={styles.completeSlot} onPress={onClaim}>
        <EggAnimation cracking />
        <Text style={styles.readyText}>READY TO CLAIM! ✨</Text>
        <Button title="Claim Offspring" onPress={onClaim} />
      </TouchableOpacity>
    );
  }
}
```

**Key Design Decision:** Real-time countdown timers using `setInterval` update every second, with Supabase real-time sync to detect completion from server.

---

## Step 5: Design Evolution Lab Screen

**Implementation: Snake Selection with Preview**

```typescript
// screens/EvolutionLabScreen.tsx
export function EvolutionLabScreen({ route }) {
  const selectedSnake = route.params?.snake; // Passed from Collection
  const [confirmEvolution, setConfirmEvolution] = useState(false);

  if (!selectedSnake) {
    return (
      <View style={styles.container}>
        <Text style={styles.instructions}>
          Select a snake from your Collection to evolve
        </Text>
        <Button
          title="Go to Collection"
          onPress={() => navigation.navigate('Collection')}
        />
      </View>
    );
  }

  const cost = selectedSnake.generation * 100;
  const newStats = calculateEvolvedStats(
    selectedSnake.baseStats,
    selectedSnake.generation + 1
  );

  return (
    <View style={styles.container}>
      <Text style={styles.header}>Evolution Lab</Text>

      <View style={styles.comparison}>
        {/* Before */}
        <View style={styles.before}>
          <Text style={styles.label}>Current (Gen {selectedSnake.generation})</Text>
          <SnakeImage snake={selectedSnake} size={128} />
          <StatsDisplay stats={selectedSnake.stats} />
        </View>

        {/* Arrow */}
        <Text style={styles.arrow}>→</Text>

        {/* After */}
        <View style={styles.after}>
          <Text style={styles.label}>After (Gen {selectedSnake.generation + 1})</Text>
          <SnakeImage snake={selectedSnake} size={128} glowing />
          <StatsDisplay stats={newStats} highlightChanges />
        </View>
      </View>

      <View style={styles.cost}>
        <Text style={styles.costLabel}>DNA Cost:</Text>
        <Text style={styles.costAmount}>{cost} DNA</Text>
        <Text style={styles.balance}>
          Your Balance: {userDNA} DNA
        </Text>
      </View>

      <Button
        title="Evolve Now"
        onPress={() => setConfirmEvolution(true)}
        disabled={userDNA < cost}
        style={styles.evolveButton}
      />

      {confirmEvolution && (
        <EvolutionConfirmModal
          snake={selectedSnake}
          cost={cost}
          onConfirm={handleEvolve}
          onCancel={() => setConfirmEvolution(false)}
        />
      )}
    </View>
  );
}
```

**Evolution Animation (Instant, No Timer):**
```typescript
async function handleEvolve(snakeId: string) {
  // Server-side evolution
  const result = await supabase.rpc('evolve_snake_atomic', {
    user_id: userId,
    snake_id: snakeId,
    dna_cost: cost,
  });

  if (result.error) {
    showError(result.error.message);
    return;
  }

  // Show evolution animation (5 seconds)
  await playEvolutionAnimation(selectedSnake);

  // Navigate back to Collection
  navigation.navigate('Collection', {
    highlightSnake: snakeId,
    showEvolutionSuccess: true,
  });
}
```

---

## Step 6: Add Persistent UI Elements

**Persistent Header (Overlays All Tabs):**
```typescript
// components/PersistentHeader.tsx
export function PersistentHeader() {
  const { data: user } = useUser();

  return (
    <View style={styles.header}>
      <View style={styles.dnaBalance}>
        <DNAIcon />
        <AnimatedNumber value={user?.dnaBalance || 0} />
      </View>

      <View style={styles.energyIndicator}>
        <EnergyIcon />
        <Text>{user?.energyLevel}/{user?.energyMax}</Text>
      </View>

      <TouchableOpacity onPress={openSettings}>
        <SettingsIcon />
      </TouchableOpacity>
    </View>
  );
}
```

**Real-Time DNA/Energy Updates:**
```typescript
// hooks/useUser.ts
export function useUser(userId: string) {
  const [user, setUser] = useState<User | null>(null);

  useEffect(() => {
    // Subscribe to real-time updates
    const subscription = supabase
      .channel(`user:${userId}`)
      .on('postgres_changes', {
        event: 'UPDATE',
        schema: 'public',
        table: 'users',
        filter: `id=eq.${userId}`,
      }, (payload) => {
        setUser(payload.new as User);

        // Animate DNA change
        if (payload.new.dnaBalance !== user?.dnaBalance) {
          showDNAChangeAnimation(payload.new.dnaBalance - (user?.dnaBalance || 0));
        }
      })
      .subscribe();

    return () => subscription.unsubscribe();
  }, [userId]);

  return { data: user };
}
```

---

## Tips for Success

**DO:**
- Use virtual scrolling (FlatList with `getItemLayout`) for 500+ items
- Cache images aggressively (react-native-fast-image)
- Debounce filter changes (300ms) to prevent lag during typing
- Test performance at 500+ variants (target 60fps scroll)
- Use Supabase Realtime for live DNA/energy/breeding updates
- Make tab badges pulse when count > 0 (attention-grabbing)

**DON'T:**
- Render all 500 items at once (use virtual scrolling)
- Use client-side routing for heavy operations (server-side calculations)
- Forget to handle offline state (cache last collection)
- Skip loading states (show skeletons while fetching)
- Ignore safe areas (iPhone notch, Android gestures)

---

## Common Mistakes

**Mistake 1: Naive Rendering (All Items)**
```typescript
// DON'T: Renders all 500 snakes at once (kills performance)
{variants.map(snake => <SnakeCard key={snake.id} variant={snake} />)}

// DO: Virtual scrolling (only renders visible items)
<FlatList
  data={variants}
  renderItem={renderItem}
  getItemLayout={getItemLayout}
  windowSize={5}
/>
```

**Mistake 2: Client-Side Breeding Calculation**
```typescript
// DON'T: Client calculates offspring (exploitable)
const offspring = calculateOffspring(parent1, parent2);

// DO: Server calculates, client displays
const { data } = await supabase.rpc('start_breeding', {
  parent_1_id: parent1.id,
  parent_2_id: parent2.id,
});
```

**Mistake 3: No Loading States**
```typescript
// DON'T: Show empty screen while loading
{variants?.map(snake => <SnakeCard snake={snake} />)}

// DO: Show skeletons during load
{isLoading ? (
  <SkeletonGrid count={15} />
) : (
  <FlatList data={variants} renderItem={renderItem} />
)}
```

---

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/lab_ui.md - Lab UI system overview
- **Quick Ref**: @knowledge_base/game/quick_ref/collection_lab.md - Collection Lab specifics
- **Quick Ref**: @knowledge_base/game/quick_ref/ui_framework.md - React Native UI patterns
- **How-To**: @knowledge_base/game/how_to/create_react_native_screens.md - React Native screen patterns
- **Complete Spec**: @docs/game/systems/analysis/LAB_UI_analysis.md - Full Lab UI analysis (5,800 words)
- **Complete Spec**: @docs/game/systems/analysis/COLLECTION_LAB_analysis_part1.md - Collection Lab details