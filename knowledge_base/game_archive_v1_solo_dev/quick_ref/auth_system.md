# Auth System Quick Reference

The Auth System is SupaSnake's identity foundation, enabling cloud save, cross-platform play, social features, and secure purchases. Built on Supabase Auth, it provides JWT token management, OAuth flows, and email verification out-of-the-box.

## Authentication Flow

**Guest Accounts (Zero Friction)**:
- User opens app → plays immediately as anonymous UUID
- No email/password required, progress stored locally
- Limitations: No clans, no leaderboard ranking, no trading, no cloud save
- Conversion trigger: "Save your collection!" (after 10 variants unlocked)

**Email/Password**:
- Registration: Email, password (8+ chars, 1 uppercase, 1 number), username
- Email verification required before full features (clans, leaderboards)
- Password reset via magic link (expires in 1 hour)

**Social Login (Google, Apple)**:
- One-tap authentication via OAuth 2.0
- Auto-account creation on first login
- Profile picture imported from social account
- Email verification not required (trust provider)

## User Model

| Field | Type | Purpose |
|-------|------|---------|
| id | UUID | Unique user identifier (auth.uid()) |
| email | TEXT | Primary contact, must be unique |
| username | TEXT | Display name (3-16 chars, unique) |
| avatar_url | TEXT | Profile picture URL |
| is_guest | BOOLEAN | True for anonymous users |
| email_verified | BOOLEAN | Email verification status |
| dna_balance | INTEGER | Current DNA currency |
| energy | INTEGER | Current energy for gameplay |

## Permissions & Security

- **Row-Level Security (RLS)**: All tables use `WHERE user_id = auth.uid()` policies
- **JWT Tokens**: Access token (1 hour lifespan), refresh token (30 days)
- **Rate Limiting**: Max 5 failed login attempts per 15 minutes
- **Session Management**: Up to 5 concurrent sessions per user across devices
- **Account Recovery**: Self-service password reset, support-assisted recovery with purchase receipts

## Guest → Account Conversion

**Conversion Funnel**:
1. Guest plays 2-5 days, unlocks 10+ variants
2. Trigger: "Create account to save your collection across devices!"
3. User authenticates (email/password or social login)
4. Backend migrates guest progress to authenticated account
5. Welcome bonus: +100 DNA
6. Full features unlocked: Clans, leaderboards, cloud save, gallery

**Target Conversion Rate**: 15-25% within 7 days, 30-50% within 30 days

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/backend_supabase.md - Backend infrastructure
- **How-To**: @knowledge_base/game/how_to/implement_auth.md - Step-by-step auth implementation
- **Complete Spec**: @docs/game/systems/analysis/AUTH_SYSTEM_analysis_part1.md - Full auth architecture (Levels 1-4)
- **Complete Spec**: @docs/game/systems/analysis/AUTH_SYSTEM_analysis_part2.md - Social, technical, retention impact (Levels 5-8)
