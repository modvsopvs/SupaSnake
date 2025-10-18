# Energy System - Quick Reference

## Overview

The Energy System is SupaSnake's engagement gate - a regenerating resource that limits Snake gameplay to create strategic session pacing. Energy transforms Snake from unlimited casual play into a valuable, scarce experience while enforcing the 70/30 Lab/Snake time split (CE-005).

## Core Parameters

**Starting Energy:** 5 units maximum (expandable to 10+ via Lab upgrades in v0.5)
**Recharge Rate:** 1 energy per 20 minutes (100 minutes empty-to-full)
**Classic Mode Cost:** 1 energy per run
**Tower Mode Cost:** 2 energy per run (v0.5)
**Daily Free Refill:** Once per 24 hours (resets midnight UTC), instantly refills to max

## Energy Flow

**Deduction:** Energy consumed on run start (POST /api/game/start), not completion. Backend validates energy balance and rejects requests if insufficient. Client pre-checks locally for instant feedback but backend is source of truth.

**Passive Recharge:** Calculated server-side using timestamps: `rechargedUnits = floor((now - last_updated) / 1200s)`. Works offline - opening app after 4 hours shows full energy. Recharge stops at max capacity (no overflow from passive recharge).

**Clan Bonuses:** Active clan members receive +1 energy every 6 hours (4 bonuses daily, +4 total). Requires clan with 5+ members logged in within 48 hours. Clan bonuses can exceed max capacity temporarily (e.g., 6/5 energy).

## F2P Viability

**Daily F2P Energy Budget:**
- Starting: 5 energy
- Passive recharge (4 hours active): 12 energy
- Daily free refill: 5 energy
- Clan bonus (if member): 4 energy
- **Total:** 22-26 energy daily = 110-130 minutes Snake gameplay

**Monetization:** Energy refill bundles ($0.99 for +3, $2.99 for +10, $4.99 for +20). Premium players gain 32% faster progression (convenience not power, BM-001 compliant). Paid energy creates no gameplay advantage - same DNA per run as F2P.

## Session Pacing

**3+ Sessions Daily:** 5 energy depleted → 100 minutes recharge → Natural breakpoints align with daily schedule (morning session, lunch break, evening session). Recharge creates return triggers supported by push notifications ("Energy Full!").

**70/30 Time Split:** Energy depletion forces Lab time (breeding, collection browsing) while waiting for recharge. Without energy, SupaSnake becomes 0/100 Snake grind. With energy, Lab becomes primary activity.

## Cross-References

- @knowledge_base/game/quick_ref/classic_mode.md - Energy cost per run
- @knowledge_base/game/quick_ref/resource_generation.md - DNA earning rates per energy
- @knowledge_base/game/how_to/implement_energy_system.md - Complete implementation guide
- @knowledge_base/platform/quick_ref/decision_matrix.md - Context management for energy features
- @knowledge_base/game/api/monetization.md - Energy bundle pricing strategy

**Word Count:** 299 words
