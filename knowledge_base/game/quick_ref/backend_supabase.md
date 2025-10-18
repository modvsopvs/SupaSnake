# Backend - Supabase Quick Reference

SupaSnake uses Supabase as its Backend-as-a-Service (BaaS) platform, providing PostgreSQL database, real-time subscriptions, file storage, and serverless functions in one integrated platform. This choice accelerates development by 2-3 months compared to building custom backend infrastructure.

## Key Features

- **PostgreSQL Database**: Stores all game data (users, snake_variants, player_collection, breeding_history, evolution_history)
- **Row-Level Security (RLS)**: Database-level access control ensures users only see their own data
- **Real-Time Subscriptions**: WebSocket connections for live updates (breeding timers, clan chat, leaderboard changes)
- **Storage Buckets**: CDN-backed file storage for snake artwork, user avatars, gallery showcases
- **Edge Functions**: Serverless TypeScript/JavaScript functions for complex business logic
- **Built-in Auth**: JWT-based authentication with email/password, Google OAuth, Apple OAuth

## Database Schema Overview

| Table | Purpose | Key Columns |
|-------|---------|-------------|
| users | Player accounts | id, email, username, dna_balance, energy |
| snake_variants | Master variant list | id, dynasty, rarity, base_stats |
| player_collection | User's owned snakes | id, user_id, variant_id, generation |
| breeding_history | Breeding records | id, user_id, parent1_id, parent2_id, offspring_id |
| evolution_history | Evolution records (v0.5+) | id, user_id, snake_id, old_rarity, new_rarity |

## Quick Facts

- **Tier**: 0 (Foundation) - Must be functional Week 1-2
- **Cost**: $25/month for Pro plan (100GB bandwidth, 8GB database, 100GB storage)
- **Performance**: <100ms API latency (globally distributed edge functions)
- **Scale Target**: 100k DAU supported on Pro plan
- **RLS Enforcement**: All queries automatically filtered by `auth.uid()` (user_id from JWT)
- **Real-Time**: Supabase Realtime uses PostgreSQL replication for <50ms update propagation

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/auth_system.md - Authentication flow
- **Quick Ref**: @knowledge_base/game/quick_ref/dynasties.md - Dynasty data model
- **How-To**: @knowledge_base/game/how_to/setup_supabase_backend.md - Step-by-step setup
- **Complete Spec**: @docs/game/systems/analysis/BACKEND_SUPABASE_analysis_part1.md - Full backend architecture
- **Complete Spec**: @docs/game/systems/analysis/BACKEND_SUPABASE_analysis_part2.md - Advanced features and scaling
