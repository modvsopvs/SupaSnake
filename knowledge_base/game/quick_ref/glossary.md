# Glossary - Quick Reference

A distilled reference of key game terminology for SupaSnake. For complete definitions and details, see @docs/game/03_GLOSSARY.md.

---

## Core Currency & Resources

**DNA (Quantum DNA)**
Primary in-game currency earned through gameplay. Used for breeding, unlocks, and progression. Example: "Costs 200 DNA to breed two Gen 0 snakes."

**Materials**
Rare evolution resources (Prismatic Scales, Mythic Catalysts) obtained exclusively from Tower Mode. Required for advanced evolution tiers.

---

## Collection System

**Dynasty**
Collection of 10 thematically-related snake variants. MVP includes 3 dynasties: CYBER, PRIMAL, COSMIC. Creates player identity ("I'm a CYBER specialist").

**Variant**
Individual snake within a dynasty (30 total in MVP: 10×3). Has name, rarity, stats, generation, and dynasty membership. Example: "CYBER SPARK is a Common variant."

**Rarity**
Variant scarcity tier: Common (3) / Uncommon (3) / Rare (2) / Epic (1) / Legendary (1) per dynasty. Affects stats and unlock costs.

**Generation (Gen)**
Breeding depth counter (Gen 0 = starter). Formula: `max(parent1.gen, parent2.gen) + 1`. Example: "Gen 2 snake bred from two Gen 1 parents."

**Collection**
All variants the player owns (can have duplicates). Target: 20+ variants by Day 30.

**Set**
Grouping of related variants (dynasty set, rarity set). Completing a set grants +10% DNA income bonus.

---

## Meta-Game Mechanics

**Breeding (v0.1)**
Combine two snakes (same dynasty only in v0.1) to create offspring. Cost formula: `200 + (avg_generation × 100)` DNA. Example: "Breeding two Gen 0 snakes costs 200 DNA."

**Evolution (v0.5+)**
Transform single snake to higher generation (different from breeding). Exponential cost, linear power. Example: "Gen 1→5: 1,000 DNA total; Gen 5→10: 10,000 DNA total."

**Lab / Snake Lab**
Central hub for collection management, breeding, and evolution. THE core experience (70% of session time).

---

## Gameplay

**Classic Mode**
Primary gameplay mode. 5-minute sessions, predictable DNA collection (50-100 per run). Costs 1 energy per run.

**Tower Mode (v0.5+)**
High-risk 15-45 minute challenges. Higher DNA variance (80-150%) and exclusive rare materials.

**Energy System**
Consumable resource required to play. Starting: 5 units, recharge: 1 per 20 minutes. Free daily refill, clan bonuses available.

---

## Social & Progression

**Clan**
Player organization (20-50 members). Provides energy bonuses, clan wars access, and social features (v0.5+).

**Leaderboard**
Competitive rankings with skill-based brackets (Gen 1-5, 6-10, 11+). Views: Global, Regional, Friends, Clan.

**Prestige (v1.0+)**
Reset collection progress for permanent account-wide bonuses (+5% DNA per prestige). Resets: collection, generations. Persists: bonuses, mastery, exclusive "Reborn" variants.

---

## Monetization

**Premium Currency (Gems)**
Purchasable currency for energy refills, breeding accelerators, exclusive dynasties.

**Starter Bundle**
First-time $2.99 offer (appears Day 3-5). Contains: 20 energy + 1000 DNA + 1 exclusive variant.

**Battlepass (v0.5+)**
28-day seasonal progression track with free and premium tiers.

---

## See Also

**Quick References:**
- @knowledge_base/game/quick_ref/dynasties.md - Dynasty system details
- @knowledge_base/game/quick_ref/breeding_rules.md - Breeding mechanics
- @knowledge_base/game/quick_ref/collection_lab.md - Collection management
- @knowledge_base/game/quick_ref/backend_supabase.md - Backend infrastructure

**Complete Specification:**
- @docs/game/03_GLOSSARY.md - Full glossary with all terms (13,800+ words)

**How-To Guides:**
- @knowledge_base/game/how_to/add_new_dynasty.md - Adding dynasties
- @knowledge_base/game/how_to/setup_supabase_backend.md - Backend setup

---

**Version:** 1.0
**Word Count:** 400
**Purpose:** Quick lookup for common game terminology
