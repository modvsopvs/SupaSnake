# Lab UI - Quick Reference

The Lab UI is the primary game interface containing Collection, Breeding, Evolution (v0.5+), and Profile tabs. Players spend 70% of session time here (CE-001 constraint), making UI performance and design critical to retention.

## UI Structure

**Tab Navigation**: 4 main tabs with <300ms transition time
1. **Collection Tab**: Browse and filter owned snake variants
2. **Breeding Tab**: Select parents and manage breeding slots
3. **Evolution Tab**: Transform snakes to higher generations (v0.5+)
4. **Profile Tab**: Player stats, achievements, gallery settings

**Persistent UI Elements**: Always visible across all tabs
- DNA Balance (top-right, real-time updates)
- Energy Indicator (top-left, stamina for Snake runs)
- Settings Button (gear icon, top-right)
- Back/Home Navigation (top-left)

## Key Features

- **Fast Tab Switching**: <300ms perceived transition via optimistic UI updates
- **Real-Time Sync**: DNA balance updates via Supabase Realtime (WebSocket)
- **Responsive Layout**: Adapts to mobile (2-column grid), tablet (3-column), desktop (4-column)
- **Virtual Scrolling**: Maintains 60fps at 500+ collection items
- **Offline Support**: Cached UI state persists via IndexedDB

## 70/30 Time Split (CE-001)

**Lab UI Time**: 70% of session
- Collection browsing: 40%
- Breeding management: 20%
- Evolution/Profile: 10%

**Snake Gameplay**: 30% of session
- Play runs to earn DNA
- Return to Lab UI immediately after run completes

## Performance Targets

| Metric | Target | Why |
|--------|--------|-----|
| Tab transition | <300ms | Feels instant |
| Collection load | <100ms | No perceived wait |
| Search response | <50ms | Real-time feel |
| Scroll frame rate | 60fps | Smooth browsing |
| DNA sync latency | <100ms | Real-time feedback |

## UI Patterns

**Tab Transition**: Fade-out current (150ms) → swap content → fade-in new (150ms) = 300ms total

**Optimistic Updates**: Update UI immediately, sync with server in background
- Breeding start: Show timer immediately, server validates asynchronously
- DNA spend: Deduct balance immediately, rollback if server rejects

**Loading States**: Skeleton screens while data loads (no spinners)

## Quick Facts

- **Default Screen**: Collection Lab (not main menu) - players launch directly into collection
- **Navigation Pattern**: Tab-based (not stacked screens) for fast lateral movement
- **Session Entry**: App opens → Collection Lab → browse/plan → tap "Play Snake" for runs
- **State Persistence**: UI state saved locally, syncs with Supabase on reconnect
- **Framework**: React Native for iOS/Android cross-platform deployment

## See Also

- **How-To**: @knowledge_base/game/how_to/design_lab_ui.md - Lab UI design guide with React Native code
- **Quick Ref**: @knowledge_base/game/quick_ref/collection_lab.md - Collection UI details
- **Quick Ref**: @knowledge_base/game/quick_ref/breeding_lab.md - Breeding UI workflows
- **Complete Spec**: @docs/game/systems/analysis/LAB_UI_analysis.md - Full UI system analysis
- **Quick Ref**: @knowledge_base/game/quick_ref/constraints.md - CE-001 time split constraint
