# UI Framework - Quick Reference

The UI Framework is the comprehensive interface layer hosting all game screens and interactions in SupaSnake. This is not "just menus" - with players spending **70% of time in Snake Lab** (CE-001), the UI Framework IS the primary game experience.

## Key Components

**Core Structure:**
- **React Native** - Cross-platform mobile-first framework
- **Screen Manager** - Stack-based navigation (15-20 screens in v0.1)
- **Component Library** - 25+ reusable components (buttons, panels, progress bars)
- **Zustand State** - Lightweight state management
- **React Navigation** - Native gesture handling and transitions

**Critical Screens:**
- Snake Lab (Hub) - Collection grid, active snake, breeding slots, DNA counter
- Breeding Interface - Parent selection, timer display, offspring reveal
- HUD (Gameplay) - Score, DNA, timer, energy (minimal overlay during play)
- Energy Modal - Depletion dialog with Wait/Ad/Purchase options
- Shop - Energy bundles, IAP integration
- Collection Detail - Expanded snake stats, rarity, generation, actions

## Screen Organization

**Hub-and-Spoke Pattern:**
```
Snake Lab (Default) ↔ Collection Detail
     ↓
  Play Snake ↔ Pause Menu ↔ Settings
     ↓
End-of-Run → Back to Lab
```

**Lab as Root:** App launches directly into Snake Lab (not main menu). This reinforces the paradigm shift - Lab is the game, Snake gameplay accessed FROM Lab via "Play" button.

## Technical Constraints

| Constraint | Requirement | Implementation |
|------------|-------------|----------------|
| UI-001 | Portrait one-handed | All screens portrait-locked |
| UI-002 | Thumb-reachable | Primary buttons in bottom 40% |
| UI-003 | <100ms response | Event-driven updates, virtualized lists |
| CE-001 | 70% Lab time | Lab must be engaging, not utilitarian |
| TE-001 | <300MB RAM | Virtual scrolling for 500+ variants |

## Performance Budget

**Screen Render Times:**
- Lab initial: <200ms (acceptable)
- Collection scroll: 60fps (virtualized, critical)
- HUD updates: <1ms per event
- Screen transitions: <100ms (instant feel)
- Breeding timer: <5ms per second
- Energy display: <2ms per update

## Integration Points

**Depends on:** None (Tier 0 Foundation)

**Depended on by:** 14+ systems - Core Snake, Energy, Breeding, Collection, Shop, Tutorial, Leaderboards, Clans, Gallery, Settings, Analytics

## Design Philosophy

**Lab-as-Default:** Paradigm shift requires Lab to be compelling destination, not submenu. Visual discovery, progression visibility, and social features are core Lab gameplay.

**Progressive Disclosure:** Show essential info immediately, hide complexity until requested. Breeding flows through 5 steps (1 decision each) vs single overwhelming screen.

**Minimal HUD:** During gameplay, UI is non-intrusive. Players' eyes are on snake, not counters. Event-driven updates only.

## See Also

- **How-To**: @knowledge_base/game/how_to/create_react_native_screens.md
- **Related Systems**: @knowledge_base/game/quick_ref/core_snake_game.md, @knowledge_base/game/quick_ref/collection_lab.md, @knowledge_base/game/quick_ref/breeding_lab.md
- **Complete Spec**: @docs/game/systems/analysis/UI_FRAMEWORK_analysis_part1.md, @docs/game/systems/analysis/UI_FRAMEWORK_analysis_part2.md
- **Platform Docs**: @knowledge_base/platform/quick_ref/decision_matrix.md
