# How to Create React Native Screens

**Goal:** Build new screens for SupaSnake UI Framework following established patterns and performance constraints.

**Timeline:** 2-3 hours per screen (simple), 1-2 days (complex with integrations)

**Prerequisites:**
- React Native development environment set up
- Zustand state management configured
- React Navigation installed
- Component library available

---

## Step 1: Plan Screen Structure

Before coding, define the screen's purpose and layout.

**Questions to Answer:**
- What is the primary user action? (e.g., "Breed two snakes")
- What data does this screen need? (e.g., player collection, DNA balance)
- Is this a stack screen (back button) or modal (close button)?
- What are the performance constraints? (e.g., virtual scrolling for 500+ items)

**Example - Breeding Screen:**
```
Purpose: Allow player to breed two parent snakes
Data needed: Player collection, breeding slots, DNA balance
Navigation: Stack screen (back from Lab)
Performance: Standard (no virtualization, <50 items)
```

**Layout Sketch:**
```
┌───────────────────────────────────┐
│ [Back] Breeding Lab        [Help] │ ← Header
├───────────────────────────────────┤
│ Available Slots:                  │
│ ┌─────────────────────────────┐   │
│ │ Slot 1: [Empty] [Start]     │   │
│ │ Slot 2: [Timer: 12:34]      │   │
│ │ Slot 3: 🔒 Unlock at Lvl 10 │   │
│ └─────────────────────────────┘   │
├───────────────────────────────────┤
│ Recent Offspring:                 │
│ [Grid of last 5 bred snakes]      │
└───────────────────────────────────┘
```

---

## Step 2: Create Screen Component

Use functional components with hooks (React Native best practice).

**File:** `src/screens/BreedingLabScreen.tsx`

```typescript
import React, { useState, useEffect } from 'react';
import { View, Text, ScrollView, StyleSheet } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { useGameStore } from '../state/gameStore';
import { Button, Panel, BreedingSlot } from '../components';

export const BreedingLabScreen: React.FC = () => {
  const navigation = useNavigation();
  const { collection, breedingSlots, dna } = useGameStore();
  const [selectedSlot, setSelectedSlot] = useState<number | null>(null);

  // Component logic
  const handleStartBreeding = (slotIndex: number) => {
    setSelectedSlot(slotIndex);
    navigation.navigate('ParentSelection', { slotIndex });
  };

  return (
    <ScrollView style={styles.container}>
      <View style={styles.header}>
        <Button variant="icon" onPress={() => navigation.goBack()}>
          Back
        </Button>
        <Text style={styles.title}>Breeding Lab</Text>
        <Button variant="icon" onPress={() => showHelpModal()}>
          Help
        </Button>
      </View>

      <Panel style={styles.slotsPanel}>
        <Text style={styles.sectionTitle}>Available Slots</Text>
        {breedingSlots.map((slot, index) => (
          <BreedingSlot
            key={index}
            slot={slot}
            onStart={() => handleStartBreeding(index)}
            onCollect={() => collectOffspring(index)}
          />
        ))}
      </Panel>

      <Panel style={styles.recentPanel}>
        <Text style={styles.sectionTitle}>Recent Offspring</Text>
        {/* Grid of recent snakes */}
      </Panel>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#1A1A2E', // Dark background
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    padding: 16,
    paddingTop: 44, // Safe area for notch
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#FFFFFF',
  },
  slotsPanel: {
    margin: 16,
    padding: 16,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#FFFFFF',
    marginBottom: 12,
  },
  recentPanel: {
    margin: 16,
    padding: 16,
  },
});
```

**Key Patterns:**
- Use `useNavigation()` hook for navigation
- Use `useGameStore()` for state (Zustand selectors)
- StyleSheet for performance (styles compiled once)
- Safe area padding for notch (44px top)
- Dark theme colors (#1A1A2E background, #FFFFFF text)

---

## Step 3: Add Navigation Configuration

Register screen in navigation stack.

**File:** `src/navigation/AppNavigator.tsx`

```typescript
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { BreedingLabScreen } from '../screens/BreedingLabScreen';
import { ParentSelectionScreen } from '../screens/ParentSelectionScreen';

const Stack = createNativeStackNavigator();

export const AppNavigator = () => {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false, // Custom headers
        animation: 'slide_from_right', // iOS-style
        orientation: 'portrait', // Lock portrait
      }}
    >
      <Stack.Screen name="Lab" component={LabScreen} />
      <Stack.Screen name="BreedingLab" component={BreedingLabScreen} />
      <Stack.Screen name="ParentSelection" component={ParentSelectionScreen} />
    </Stack.Navigator>
  );
};
```

**Navigation Call (from Lab):**
```typescript
// In LabScreen.tsx
<Button onPress={() => navigation.navigate('BreedingLab')}>
  Breed
</Button>
```

---

## Step 4: Implement State Management

Connect screen to Zustand store for data.

**State Slice:**
```typescript
// src/state/gameStore.ts
interface GameState {
  // Breeding state
  breedingSlots: BreedingSlot[];
  startBreeding: (slotIndex: number, parent1: Snake, parent2: Snake) => void;
  updateBreedingTimer: (slotIndex: number) => void;
  collectOffspring: (slotIndex: number) => Snake;
}

export const useGameStore = create<GameState>((set, get) => ({
  breedingSlots: [
    { status: 'empty', parent1: null, parent2: null, timeRemaining: 0 },
    { status: 'empty', parent1: null, parent2: null, timeRemaining: 0 },
    { status: 'locked', parent1: null, parent2: null, timeRemaining: 0 },
  ],

  startBreeding: (slotIndex, parent1, parent2) => {
    set((state) => {
      const slots = [...state.breedingSlots];
      slots[slotIndex] = {
        status: 'breeding',
        parent1,
        parent2,
        timeRemaining: 30, // 30 seconds for v0.1
      };
      return { breedingSlots: slots };
    });

    // Start timer countdown
    const interval = setInterval(() => {
      get().updateBreedingTimer(slotIndex);
    }, 1000);
  },

  updateBreedingTimer: (slotIndex) => {
    set((state) => {
      const slots = [...state.breedingSlots];
      slots[slotIndex].timeRemaining -= 1;

      if (slots[slotIndex].timeRemaining <= 0) {
        slots[slotIndex].status = 'ready';
      }

      return { breedingSlots: slots };
    });
  },

  collectOffspring: (slotIndex) => {
    const slot = get().breedingSlots[slotIndex];
    const offspring = generateOffspring(slot.parent1, slot.parent2);

    // Reset slot
    set((state) => {
      const slots = [...state.breedingSlots];
      slots[slotIndex] = { status: 'empty', parent1: null, parent2: null };
      return { breedingSlots: slots };
    });

    // Add to collection
    get().addToCollection(offspring);

    return offspring;
  },
}));
```

**Component Usage:**
```typescript
// In BreedingLabScreen.tsx
const { breedingSlots, startBreeding, collectOffspring } = useGameStore();

// Optimized selector (only re-render on breedingSlots change)
const breedingSlots = useGameStore((state) => state.breedingSlots);
```

---

## Step 5: Add Performance Optimizations

Ensure screen meets <100ms response (UI-003) and 60fps scroll.

**Virtual Scrolling (for large lists):**
```typescript
import { FlatList } from 'react-native';

// For 500+ item collection
<FlatList
  data={collection}
  renderItem={({ item }) => <SnakeTile snake={item} />}
  keyExtractor={(snake) => snake.id}
  initialNumToRender={9}      // 3x3 grid visible
  maxToRenderPerBatch={6}     // Add 6 more on scroll
  windowSize={3}              // Render 1 screen above/below
  removeClippedSubviews={true} // Unmount off-screen
  getItemLayout={(data, index) => ({
    length: 120, // Fixed item height
    offset: 120 * index,
    index,
  })}
/>
```

**Memoization:**
```typescript
const SnakeTile = React.memo(({ snake }) => {
  return <View>...</View>;
}, (prev, next) => prev.snake.id === next.snake.id);
// Only re-render if snake ID changes
```

**Lazy Loading Images:**
```typescript
<FastImage
  source={{ uri: snake.imageURL }}
  style={styles.snakeImage}
  resizeMode="contain"
  priority={FastImage.priority.normal}
/>
```

---

## Step 6: Implement Accessibility

Follow WCAG 2.1 AA standards (CO-003).

**Semantic Labels:**
```typescript
<Button
  accessibilityLabel="Start breeding in slot 1"
  accessibilityHint="Opens parent selection screen"
  accessible={true}
>
  Start Breeding
</Button>
```

**Color Contrast:**
```typescript
// Ensure 4.5:1 minimum contrast
const styles = StyleSheet.create({
  text: {
    color: '#FFFFFF',       // White text
    backgroundColor: '#1A1A2E', // Dark background
    // Contrast ratio: 14.5:1 ✓
  },
});
```

**Text Scaling:**
```typescript
import { useWindowDimensions, PixelRatio } from 'react-native';

const getFontSize = (baseSize: number) => {
  const fontScale = PixelRatio.getFontScale();
  return baseSize * fontScale; // Respect system font size
};

<Text style={{ fontSize: getFontSize(16) }}>
  Breeding Lab
</Text>
```

---

## Step 7: Add Analytics Tracking

Track screen views and user actions.

**Screen View:**
```typescript
import { Analytics } from '../services/analytics';

export const BreedingLabScreen: React.FC = () => {
  useEffect(() => {
    Analytics.screen('BreedingLab', {
      slots_available: 2,
      slots_breeding: 1,
    });
  }, []);

  // ...rest of component
};
```

**Action Tracking:**
```typescript
const handleStartBreeding = (slotIndex: number) => {
  Analytics.track('BREEDING_STARTED', {
    slot_index: slotIndex,
    parent1_id: selectedParent1.id,
    parent2_id: selectedParent2.id,
    dna_cost: 400,
  });

  startBreeding(slotIndex, selectedParent1, selectedParent2);
};
```

---

## Common Patterns

### Modal vs Stack Screen

**Modal (overlays current screen):**
```typescript
<Stack.Screen
  name="EnergyModal"
  component={EnergyModalScreen}
  options={{
    presentation: 'modal',        // iOS modal style
    animation: 'fade',             // Fade in
    gestureEnabled: true,          // Swipe to dismiss
  }}
/>
```

**Stack (pushes onto navigation stack):**
```typescript
<Stack.Screen
  name="BreedingLab"
  component={BreedingLabScreen}
  options={{
    animation: 'slide_from_right', // iOS slide
    gestureEnabled: true,          // Swipe back
  }}
/>
```

### Loading States

```typescript
const [loading, setLoading] = useState(true);

useEffect(() => {
  const loadData = async () => {
    setLoading(true);
    await fetchCollection();
    setLoading(false);
  };
  loadData();
}, []);

if (loading) {
  return (
    <View style={styles.loadingContainer}>
      <ActivityIndicator size="large" color="#4A90E2" />
      <Text>Loading collection...</Text>
    </View>
  );
}
```

### Error Handling

```typescript
const [error, setError] = useState<string | null>(null);

try {
  await startBreeding(slot, parent1, parent2);
} catch (err) {
  setError('Breeding failed. Please try again.');
  Analytics.track('BREEDING_ERROR', { error: err.message });
}

{error && (
  <Toast variant="error" onDismiss={() => setError(null)}>
    {error}
  </Toast>
)}
```

---

## Tips for Success

✅ **DO:**
- Use React Native's built-in components (View, Text, ScrollView)
- Implement virtual scrolling for 500+ items (FlatList)
- Test on physical devices (iOS + Android)
- Respect safe area insets (notch, home indicator)
- Use StyleSheet for performance (not inline styles)
- Add accessibility labels to all interactive elements
- Track screen views and key actions with Analytics

❌ **DON'T:**
- Use web-only components (div, span, etc.)
- Render 500 items without virtualization (crashes)
- Forget dark theme colors (#1A1A2E background)
- Block UI thread with heavy computations
- Skip performance testing on mid-range devices
- Ignore accessibility (WCAG 2.1 AA required)
- Use emulator only (test on real devices)

---

## Common Mistakes

**Mistake 1: Not Using Virtual Scrolling**
```typescript
// BAD - Renders all 500 items immediately
{collection.map(snake => <SnakeTile snake={snake} />)}

// GOOD - Only renders visible items
<FlatList
  data={collection}
  renderItem={({ item }) => <SnakeTile snake={item} />}
/>
```

**Mistake 2: Inline Styles**
```typescript
// BAD - Creates new style object every render
<View style={{ padding: 16, backgroundColor: '#1A1A2E' }}>

// GOOD - StyleSheet compiled once
<View style={styles.container}>
const styles = StyleSheet.create({
  container: { padding: 16, backgroundColor: '#1A1A2E' },
});
```

**Mistake 3: Forgetting Safe Areas**
```typescript
// BAD - Text hidden behind notch
<View style={{ paddingTop: 0 }}>

// GOOD - Respects notch
import { useSafeAreaInsets } from 'react-native-safe-area-context';
const insets = useSafeAreaInsets();
<View style={{ paddingTop: insets.top }}>
```

---

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/ui_framework.md
- **Related**: @knowledge_base/game/quick_ref/core_snake_game.md, @knowledge_base/game/quick_ref/breeding_lab.md
- **Complete Spec**: @docs/game/systems/analysis/UI_FRAMEWORK_analysis_part1.md
- **Platform**: @knowledge_base/platform/how_to/apply_decision_matrix.md
