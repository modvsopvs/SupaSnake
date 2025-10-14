# Auth System - 8-Level Consequence Analysis (Part 1: Levels 1-4)

## System Overview

The Auth System is the identity foundation of SupaSnake. Every feature, progression state, and social interaction depends on user authentication. Without Auth, there is no cloud save, no cross-platform play, no clans, no leaderboards—there is no persistent game.

**Critical Role:** Auth is Tier 0 (Foundation) - it must exist before users can save any progress. It's the invisible infrastructure that enables constraints SO-001 (cross-platform play requires cloud accounts) and TE-002 (data persistence for accounts).

**Technology Choice:** Supabase Auth (built into Supabase platform). This accelerates development by 2-3 months vs building custom auth, provides JWT token management, social OAuth out-of-the-box, and handles email verification natively.

**Security Posture:** Auth is security-critical. A compromised auth system means unauthorized access to player accounts, lost progress, stolen purchases, and violated privacy regulations (GDPR, COPPA). This system must be bulletproof from day one.

## Dependencies

**Depends on:** Backend (Supabase platform)
**Depended on by:** Everything - all systems requiring user identity (Collection, Clans, Leaderboards, Purchases, Progress)

**Build Priority:** Tier 0, Week 1-2 - must be functional before any user-specific features can be tested

**Critical Path:** Auth → Collection → Breeding → All other features

## Level 1: Direct Implementation

### Overview

The Auth System scope spans two layers: Supabase Auth features (provided) and custom Auth features (to build). Supabase provides the heavy lifting—JWT tokens, OAuth flows, email verification—while custom features handle game-specific needs like guest accounts, account linking, and ban systems.

**Total Auth Scope: ~2-3 weeks for 1 backend engineer + 1 frontend engineer**

**Philosophy:** Lower friction to play, higher value to create an account. Players start as guests (zero barrier), engage with the game, then convert when they realize they're building something worth saving.

### Auth Providers

#### Email/Password (Core Provider)

**Registration Flow:**
1. User enters email, password, username
2. Frontend validates:
   - Email format (RFC 5322 compliant)
   - Password strength (minimum 8 chars, 1 uppercase, 1 number)
   - Username uniqueness (API check)
3. Backend creates account via Supabase Auth
4. Supabase sends verification email automatically
5. User clicks email link → account verified
6. User can now log in

**Email Verification Requirement:**
- **Required** before account is fully functional
- Unverified accounts: Can play as limited guest (no clan join, no leaderboard ranking)
- Verification email: Resend available once every 60 seconds
- Expiration: Verification link valid for 24 hours

**Password Strength Requirements:**
- Minimum 8 characters
- At least 1 uppercase letter
- At least 1 number
- Optional: 1 special character (recommended, not required)
- No common passwords (check against list: "password123", "12345678", etc.)

**Password Reset Flow:**
1. User clicks "Forgot Password"
2. Enters email
3. Supabase sends password reset email
4. User clicks link → redirected to reset form
5. Enters new password (must meet strength requirements)
6. Password updated, user logged in automatically

**Rate Limiting:**
- Max 3 password reset emails per hour per email address
- Max 5 login attempts per 15 minutes per IP address

**Why Email/Password Matters:**
- Universal (works on any platform)
- Player owns the credential (not tied to Apple/Google account)
- Enables account recovery (password reset)
- Required for COPPA compliance (parental consent for <13)

**Implementation Time:** 3-5 days (Supabase handles most complexity)

#### Google Sign-In (Social Provider)

**OAuth 2.0 Flow:**
1. User taps "Sign in with Google"
2. Redirect to Google OAuth consent screen
3. User approves (or already logged into Google)
4. Google returns auth code
5. Backend exchanges code for access token via Supabase Auth
6. Supabase creates/updates user account
7. User logged in, profile picture from Google avatar

**Auto-Account Creation:**
- First Google login → New account created automatically
- Google email becomes primary email
- Username: Generated from Google name (e.g., "JohnDoe" or "JohnDoe1234" if taken)
- User can change username once created

**Profile Picture:**
- Google avatar imported automatically
- Stored as URL (not duplicated locally)
- Updated on each login (if Google avatar changes)

**Email Considerations:**
- Google accounts always have verified emails (trust Google's verification)
- No email verification step required for Google sign-ins

**Why Google Sign-In:**
- Largest user base (70%+ of mobile users have Google account)
- One-tap login (no password typing on mobile)
- Reduces registration friction (40%+ conversion increase vs email/password)
- Cross-platform (Android primary, iOS secondary)

**Implementation Time:** 2-3 days (Supabase OAuth integration + frontend)

#### Apple Sign-In (Social Provider, iOS Required)

**Required for iOS App Store:** Apple mandates "Sign in with Apple" for apps offering third-party social logins (Google, Facebook, etc.). Non-negotiable for App Store approval.

**OAuth Flow:**
1. User taps "Sign in with Apple"
2. Redirect to Apple authentication (Face ID or Touch ID)
3. User approves
4. Apple returns token + optional email
5. Backend exchanges token via Supabase Auth
6. Account created/updated
7. User logged in

**"Hide My Email" Feature:**
- Apple allows users to hide real email
- Apple generates relay email (e.g., "abc123@privaterelay.appleid.com")
- Relay forwards to user's real email
- SupaSnake only sees relay email
- **Implication:** Password reset emails go to relay, Apple forwards to user

**Profile Picture:**
- Apple does not provide profile pictures via OAuth
- Use default avatar or prompt user to upload
- No automatic import (unlike Google)

**Auto-Account Creation:**
- Same as Google: First login → new account
- Email: Apple ID email or relay email
- Username: Generated from Apple name

**Why Apple Sign-In:**
- Required for iOS App Store compliance
- High trust (Apple's privacy reputation)
- Face ID/Touch ID convenience (no password typing)
- ~30% of iOS users prefer Apple sign-in over Google

**Implementation Time:** 2-3 days (similar to Google OAuth)

### Guest Accounts

**Play Without Registration:**
- User opens app → Immediately playable as guest
- No email, password, or OAuth required
- Backend creates anonymous user (UUID-based)
- Local storage only (progress not synced to cloud)

**Guest Limitations (Incentivize Conversion):**
- No clan participation (can view clans, cannot join)
- No leaderboard ranking (can view leaderboards, cannot compete for top spots)
- No trading (v1.0+ feature, guests excluded)
- No cloud save (progress tied to device only, uninstall = lose everything)

**Why These Limitations:**
- Create clear value proposition for account creation
- Prevent guest account farming (DNA transfer to main accounts)
- Encourage conversion at natural milestones (unlock 10 variants → "Save your collection!")

**Guest → Full Account Conversion Flow:**
1. Guest reaches conversion trigger:
   - Unlock 10 variants: "Save your collection!"
   - Out of energy: "Sign in to get bonus energy!"
   - Try to join clan: "Create account to join clans."
   - View leaderboards: "Sign in to compete!"
   - First purchase attempt: "Create account to protect your purchase."
2. User taps "Create Account" or "Sign In"
3. Options:
   - **Convert to Email/Password:** Enter email, password, username → Guest progress migrates to new account
   - **Convert to Google/Apple:** Authenticate via OAuth → Guest progress migrates to social account
4. Backend merges guest UUID with new account ID
5. Progress preserved: All snakes, DNA, purchases transfer
6. Welcome bonus: +100 DNA for creating account
7. Full features unlocked: Clans, leaderboards, cloud save now available

**Guest Progress Preservation:**
- Guest data stored locally: `localStorage` on web, `SharedPreferences` (Android), `UserDefaults` (iOS)
- On conversion: Local data uploaded to Supabase backend
- Merging logic: Guest UUID → authenticated user_id
- Race condition handling: If guest played on 2 devices, merge most recent state (timestamp comparison)

**Conversion Triggers (When to Prompt):**
- After 10 variants unlocked (engagement demonstrated)
- When energy depletes (moment of need)
- When attempting clan join (blocked feature)
- When viewing leaderboards (aspirational)
- Before first purchase (protect investment)

**Conversion Metrics:**
- Target: 15-25% guest → account conversion
- Average time to conversion: 2-5 days
- Primary trigger: Clan join (35%), energy depletion (30%), collection save (20%), other (15%)

**Why Guest Accounts:**
- Lower initial friction (70% of mobile users drop off at registration)
- "Try before you commit" → Higher D1 retention
- Conversion happens when user is engaged (not at first open)
- Industry best practice for mobile F2P games

**Implementation Time:** 3-5 days (guest UUID generation, conversion flow, progress migration)

### Account Linking

**Connect Multiple Auth Providers:**
- Primary account: Email/password OR Google OR Apple
- Link additional providers to same account
- Example: Created with email, later link Google for convenience
- Single account, multiple login options

**Linking Flow:**
1. User logged in with Provider A (e.g., email/password)
2. User navigates to Settings → Account → Link Accounts
3. User selects Provider B (e.g., "Link Google")
4. OAuth flow for Provider B
5. Backend checks:
   - Is Provider B already linked to different account? → Error: "This Google account is already linked to another account"
   - Is Provider B email same as Provider A email? → Auto-link
   - Is Provider B email different? → Warning: "This will use Google email for login. Continue?" → Link
6. Provider B credentials linked to user account
7. User can now log in with Provider A or Provider B

**Primary Email for Communication:**
- Account has one primary email (used for password reset, notifications)
- If Google linked: Google email becomes primary (unless overridden)
- If Apple linked: Apple email (or relay) becomes primary
- User can change primary email in Settings (with verification)

**Unlinking Providers:**
- Cannot unlink last provider (must have at least 1 way to log in)
- Cannot unlink primary email provider unless another email is set
- Unlinking: Settings → Account → Unlink Google → Confirmation → Provider removed

**Why Account Linking:**
- Convenience: Log in with any linked provider
- Account recovery: If password forgotten, use Google/Apple
- Cross-platform: Link Google on Android, Apple on iOS → same account
- Flexibility: Start with email, link social later (or vice versa)

**Implementation Time:** 3-5 days (linking API, unlinking flow, primary email management)

### JWT Token Management

**Session Security via JSON Web Tokens:**
- **Access Token:** Short-lived (1 hour), proves user is authenticated
- **Refresh Token:** Long-lived (30 days), used to get new access tokens
- **Token Rotation:** Each refresh generates new refresh token (security best practice)
- **Secure Storage:** iOS Keychain, Android Keystore (encrypted, OS-protected)

**Token Flow:**
1. User logs in → Supabase returns access token + refresh token
2. App stores both tokens securely (Keychain/Keystore)
3. API requests include access token in header: `Authorization: Bearer <access_token>`
4. Backend verifies access token (signature, expiration)
5. Access token expires after 1 hour
6. App detects expiration → sends refresh token to Supabase
7. Supabase validates refresh token → returns new access token + new refresh token
8. App updates stored tokens
9. Repeat

**Why Short-Lived Access Tokens:**
- Security: If access token stolen, it expires in 1 hour (limited damage)
- Performance: Backend doesn't need to check database on every request (JWT is self-contained)
- Revocation: Revoke refresh tokens to force re-login (ban enforcement)

**Token Storage Security:**
- **iOS Keychain:** Hardware-encrypted, survives app uninstall, protected by device passcode
- **Android Keystore:** Hardware-backed (if available), encrypted, protected by device lock
- **Never store in:** LocalStorage (web), unencrypted SharedPreferences (Android), UserDefaults unencrypted (iOS)

**Token Expiration Handling:**
- Access token expires → App automatically refreshes (user never notices)
- Refresh token expires (after 30 days inactive) → User must log in again
- Refresh token revoked (user logged out, password changed, account banned) → Force re-login

**Implementation Time:** 1-2 days (Supabase handles token generation, frontend implements storage/refresh)

### Security Features

#### Rate Limiting (Prevent Brute Force)

**Login Rate Limiting:**
- Max 5 login attempts per 15 minutes per IP address
- After 5 failed attempts → "Too many attempts. Try again in 15 minutes."
- Sliding window: 15 minutes from first failed attempt
- Successful login resets counter

**Password Reset Rate Limiting:**
- Max 3 password reset emails per hour per email address
- After 3 requests → "Too many reset requests. Try again in 1 hour."
- Prevents email spam attacks

**Account Creation Rate Limiting:**
- Max 1 account creation per IP per day
- Prevents bot account generation
- Exception: VPN/public WiFi IPs (use device fingerprint instead)

**Why Rate Limiting:**
- Prevents brute force password guessing
- Prevents account enumeration (attacker checking which emails have accounts)
- Prevents spam/bot account creation
- Industry standard for auth security

**Implementation:** Supabase provides rate limiting out-of-the-box, configure limits in dashboard

#### Multi-Account Detection (Prevent Smurf Accounts)

**Problem:** Players create multiple accounts to:
- Farm DNA on guest accounts, transfer to main via trading (v1.0)
- Smurf in leaderboards (high-skill player on new account dominates beginners)
- Exploit referral bonuses (v1.0+ feature)

**Detection Methods:**

**Device Fingerprinting:**
- Collect device attributes: OS version, screen resolution, timezone, language, installed fonts
- Generate device fingerprint hash
- Track: How many accounts created from this device?
- Limit: 3 accounts per device (strict), 5 accounts per device (lenient)
- **Pro:** Identifies same device across account creations
- **Con:** VPN/emulator users flagged incorrectly (allow manual appeals)

**IP Address Tracking:**
- Track: How many accounts from this IP address?
- Soft limit: Flag if >5 accounts per IP (don't block, just flag for review)
- Don't block: Shared WiFi (dorms, cafes), VPNs, corporate networks create false positives
- **Pro:** Simple, catches bot farms (100+ accounts from single IP)
- **Con:** High false positive rate (families, roommates, public WiFi)

**Email Verification Required:**
- Unverified email accounts: Limited features (no clans, no leaderboard ranking)
- Prevents disposable email abuse (e.g., "10minutemail.com")
- Check email domain against disposable email list: Block common disposable domains
- **Pro:** Raises barrier for mass account creation
- **Con:** Legitimate users may use disposable emails (allow, just limit features)

**Guest Account Limitations:**
- Guest accounts cannot trade (prevents DNA laundering)
- Guest accounts cannot join clans (prevents clan point farming)
- Guest accounts don't appear on leaderboards (prevents guest smurf farming)
- **Pro:** Removes guest account abuse vectors entirely
- **Con:** Reduces guest feature access (acceptable trade-off)

**Decision: Moderate Multi-Account Prevention**
- Limit 3 accounts per device (strict enough to prevent most abuse)
- Soft-flag >5 accounts per IP (review, don't auto-ban)
- Require email verification for full features
- Guest accounts cannot trade/rank/clan
- No IP bans (too many false positives)

**Implementation Time:** 3-4 days (device fingerprinting library, IP tracking, disposable email check)

#### Ban/Suspension System (Moderation)

**Ban Table Schema:**
```sql
CREATE TABLE bans (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  reason TEXT NOT NULL,
  severity TEXT NOT NULL CHECK (severity IN ('warning', 'suspension', 'permanent')),
  expires_at TIMESTAMP, -- NULL for permanent bans
  created_at TIMESTAMP DEFAULT NOW(),
  banned_by UUID REFERENCES admin_users(id)
);
```

**Ban Types:**

**Warning (First Offense):**
- No gameplay restriction
- Banner message on login: "Warning: [Reason]. Further violations may result in suspension."
- Recorded in ban table for escalation tracking
- Example: Toxic chat (first time), account sharing (first time)

**Temporary Suspension (Second/Moderate Offense):**
- Login blocked for duration (7 days, 14 days, 30 days)
- User sees: "Your account is suspended until [Date]. Reason: [Reason]"
- Can view ban details but cannot play
- Example: Toxic chat (repeat), cheating (first detection), account sharing (repeat)

**Permanent Ban (Third/Severe Offense):**
- Login blocked forever
- User sees: "Your account is permanently banned. Reason: [Reason]. To appeal, contact support@supasnake.com"
- Account cannot be recovered without appeal approval
- Example: Cheating (confirmed), harassment (severe), RMT (real-money trading)

**Ban Enforcement:**
1. User attempts login
2. Backend checks ban table: `SELECT * FROM bans WHERE user_id = ? AND (expires_at IS NULL OR expires_at > NOW())`
3. If banned → Return 403 Forbidden with ban details
4. Frontend shows ban screen (reason, expiration, appeal link)
5. User cannot access game until ban expires or is lifted

**Ban Appeal Process:**
1. User emails support@supasnake.com with appeal
2. Support reviews case:
   - False positive? (Anti-cheat error, mistaken identity) → Lift ban immediately
   - First offense severe? (Toxic chat but apologetic) → Reduce suspension to warning
   - Repeat offender? (Multiple bans, no remorse) → Uphold ban
3. Support updates ban table: `UPDATE bans SET expires_at = NOW() WHERE user_id = ?` (lifts ban)
4. User notified via email: Ban lifted or appeal denied

**Ban Reasons (Examples):**
- "Cheating detected: Modified game client"
- "Toxic chat: Harassment and hate speech"
- "Account sharing: Multiple logins from different countries within 1 hour"
- "RMT: Real-money trading detected (selling DNA for cash)"

**Why Graduated Punishments:**
- Fair: First-time mistakes don't result in permanent ban
- Deterrent: Warnings signal consequences before severe action
- Reversible: Temporary suspensions allow redemption
- Defensible: Clear escalation path for appeals and legal compliance

**Implementation Time:** 3-4 days (ban table, enforcement logic, frontend ban screen, appeal workflow)

### Implementation Estimates

**Total Auth System Implementation:**

**Supabase Auth Setup:** 1-2 days
- Configure Supabase project
- Enable email/password provider
- Set up OAuth providers (Google, Apple)
- Configure email templates (verification, password reset)
- Test token generation/refresh

**Custom Auth Flows:** 3-5 days
- Guest account creation (UUID generation)
- Guest → account conversion (progress migration)
- Account linking (multi-provider support)
- Primary email management

**Frontend UI Screens:** 5-7 days (2 frontend engineers)
- Login screen (email/password, Google, Apple, Guest buttons)
- Registration screen (email, password, username, terms acceptance)
- Password reset screen (email input, reset form)
- Account settings screen (link accounts, change email, change password, delete account)
- Profile screen (username, avatar, account info display)

**Security Features:** 3-5 days
- Rate limiting configuration (Supabase dashboard)
- Device fingerprinting (library integration)
- IP tracking (backend logging)
- Disposable email check (API or library)
- Ban system (table, enforcement, frontend)

**Testing:** 3-5 days
- Unit tests (auth API endpoints)
- Integration tests (login flows, OAuth flows, guest conversion)
- Security tests (rate limiting, token expiration, ban enforcement)
- Cross-platform tests (iOS, Android, Web)
- Edge cases (expired tokens, network failures, simultaneous logins)

**Total Estimate: 2-3 weeks, 2 engineers (1 backend, 1 frontend)**

**Risk Level: Low-Medium**
- Supabase handles most complexity (JWT, OAuth, email) → Reduces risk
- Custom features (guest accounts, linking) are well-understood patterns → Medium risk
- Security features (rate limiting, bans) are standard implementations → Low risk
- Primary risk: OAuth provider changes (Google/Apple API updates) → Mitigated by Supabase updates

### Critical Technical Decisions

#### Decision 1: Guest Accounts - Yes or No?

**Option A: Guest Accounts (Chosen)**
- **Pro:** Lower friction → 70% of users don't register on first open → Guest removes barrier → Higher D1 retention
- **Pro:** "Try before commit" → Users engage before registration → Higher conversion when they convert (they're already invested)
- **Pro:** Industry best practice for mobile F2P → Pokemon GO, Clash Royale, Candy Crush all use guest accounts
- **Con:** More complex implementation (guest UUID, conversion flow, progress migration)
- **Con:** Guest account abuse risk (farming, smurfing) → Mitigated by guest limitations (no trade, no leaderboard rank)

**Option B: No Guest Accounts**
- **Pro:** Simpler implementation (no guest logic, no conversion flow)
- **Pro:** Every user has verified account from start → Better data quality, less spam
- **Con:** Higher initial friction → 70% registration drop-off → Lower D1 retention
- **Con:** Users lost during registration never engage with game → Can't demonstrate value before asking for commitment

**Decision: YES to Guest Accounts**
- Rationale: D1 retention is critical (target 50%+). Guest accounts reduce initial friction, allowing users to engage before committing. Conversion triggers (clan join, energy depletion) capitalize on demonstrated engagement. Guest limitations (no trade, no leaderboard) prevent abuse. Trade-off (implementation complexity) is acceptable for retention gain.

#### Decision 2: Social Login Providers - Which Ones?

**Google Sign-In:**
- **Status:** MUST HAVE
- **Rationale:** 70%+ mobile users have Google accounts, cross-platform (Android primary, iOS secondary), one-tap login, reduces registration friction by 40%+
- **Implementation:** Required for v0.1

**Apple Sign-In:**
- **Status:** MUST HAVE (for iOS App Store)
- **Rationale:** Apple mandates "Sign in with Apple" if offering Google/Facebook login. Non-negotiable for App Store approval. ~30% iOS users prefer Apple over Google (privacy-conscious users).
- **Implementation:** Required for v0.1

**Facebook Login:**
- **Status:** Optional (NOT included in v0.1)
- **Rationale:** Declining trust after privacy scandals, younger audience prefers Google/Apple, adds complexity (3rd OAuth provider), diminishing returns (most users already covered by Google/Apple)
- **Decision:** Defer to v1.0+ if user research shows demand

**Decision: Google + Apple Only for v0.1**
- Rationale: Google (largest user base) + Apple (required by App Store) cover 90%+ of social login demand. Facebook adds complexity with minimal benefit. Can add later if data shows need.

#### Decision 3: Email Verification - Required or Optional?

**Option A: Email Verification Required (Chosen)**
- **Pro:** Prevents spam accounts (bots, throwaway emails)
- **Pro:** Ensures valid email for account recovery (password reset requires email)
- **Pro:** Compliance-friendly (GDPR requires valid contact method for data deletion requests)
- **Con:** Higher friction (user must check email, click link before full features)

**Option B: Email Verification Optional**
- **Pro:** Lower friction (register and play immediately)
- **Con:** Spam/bot accounts proliferate (no barrier to mass account creation)
- **Con:** Account recovery fails (password reset impossible if email invalid)
- **Con:** Compliance risk (GDPR data deletion requests sent to invalid emails)

**Decision: Email Verification REQUIRED**
- Rationale: Account recovery (password reset) requires valid email. Without verification, users lose accounts permanently if they forget passwords. Spam prevention is secondary benefit. Friction is acceptable because guest accounts exist for zero-friction onboarding. Users only verify email when converting (already engaged).

**Mitigation:** Unverified accounts can play as limited guest (no clans, no leaderboard) until verification completes. This reduces friction while maintaining security.

#### Decision 4: Multi-Account Prevention - How Strict?

**Option A: Strict (Limit 1 account per device + IP ban)**
- **Pro:** Maximum abuse prevention (smurfing, farming eliminated)
- **Con:** High false positive rate (families, roommates, VPNs, public WiFi all flagged)
- **Con:** Frustrates legitimate users (siblings playing on same device)

**Option B: Moderate (Limit 3 accounts per device, soft-flag IPs) (Chosen)**
- **Pro:** Balances abuse prevention with legitimate use (families can have 3 accounts)
- **Pro:** Lower false positive rate (VPNs, public WiFi not blocked)
- **Con:** Allows limited smurfing (3 accounts per device)

**Option C: Lenient (No device limit, rely on guest restrictions only)**
- **Pro:** Zero false positives (never block legitimate users)
- **Con:** Smurfing and farming unchecked (leaderboard manipulation, DNA farming)

**Decision: Moderate (3 accounts per device, soft-flag IPs)**
- Rationale: 3 accounts per device allows families/siblings while preventing mass farming. IP soft-flagging (no auto-ban) identifies bot farms without false positives. Guest account limitations (no trade, no leaderboard) remove abuse vectors entirely. Acceptable trade-off between security and user experience.

#### Decision 5: Password Strength Requirements - How Strict?

**Option A: Lenient (6+ characters, no other requirements)**
- **Pro:** Lower friction (easy to create password)
- **Con:** Weak passwords → Account takeover → Lost progress, stolen purchases

**Option B: Moderate (8+ chars, 1 uppercase, 1 number) (Chosen)**
- **Pro:** Balances security with usability (memorable but secure)
- **Con:** Slight friction (users must think about password)

**Option C: Strict (12+ chars, 1 uppercase, 1 number, 1 special char, no common passwords)**
- **Pro:** Maximum security (very hard to brute force)
- **Con:** High friction (users frustrated, often forget complex passwords)

**Decision: Moderate (8+ chars, 1 uppercase, 1 number)**
- Rationale: 8 characters with uppercase + number provides strong security (2.8 trillion possible combinations) while remaining memorable. Special characters add friction without significant security gain (phishing is bigger threat than brute force). Common password check prevents "Password1" (low-hanging fruit).

#### Decision 6: Account Deletion Flow - GDPR Compliance

**GDPR Requirement:** Users must be able to request permanent account deletion.

**Implementation:**
1. Settings → Account → Delete Account
2. Warning: "This will permanently delete your account, snakes, purchases, and progress. This cannot be undone."
3. Confirmation: "Type DELETE to confirm"
4. User types "DELETE" → Taps Confirm
5. Backend marks account for deletion: `deleted_at = NOW()`
6. Account disabled immediately (cannot login)
7. Data deletion job runs nightly:
   - Delete user data (snakes, DNA, purchases)
   - Anonymize user references (e.g., clan member → "Deleted User")
   - Retain analytics data (aggregated only, no PII)
8. Deletion complete after 30 days (GDPR compliance)

**Why 30-Day Delay:**
- GDPR allows reasonable delay (up to 30 days) for deletion
- Protects against accidental deletion (user has 30 days to contact support to recover)
- Allows database cleanup in batches (more efficient than real-time deletion)

**Implementation Time:** 2-3 days (deletion flow, backend job, GDPR compliance documentation)

#### Decision 7: Username Change Policy - Free or Paid?

**Option A: Free Once (Chosen)**
- Users can change username once for free, subsequent changes cost premium currency
- Rationale: Allows fixing typos/regrets without monetization aggression

**Option B: Always Free**
- Unlimited free username changes
- Rationale: User-friendly, no friction
- Con: Username abuse (impersonation, trolling, confusion in clans)

**Option C: Always Paid**
- First change costs premium currency
- Rationale: Monetization opportunity
- Con: Punishes users for typos, frustrating experience

**Decision: Free Once, Then Paid**
- First username change: Free (within 7 days of account creation)
- Subsequent changes: 100 gems ($0.99)
- Rationale: Balances user-friendliness (free correction) with abuse prevention (paid changes reduce frivolous changes). Provides minor monetization vector without being predatory.

**Implementation:** Track `username_changes` count in user table, enforce limit in API.

#### Decision 8: Referral System in v1.0? (Affects Multi-Account Detection Complexity)

**Referral System:** User shares referral link → Friend signs up → Both get rewards (e.g., +500 DNA, exclusive variant)

**Complexity Impact:**
- Multi-account detection must prevent self-referral abuse
- Device fingerprinting + IP tracking required to identify same person
- Referral rewards must be delayed (e.g., after friend reaches Day 7) to prevent throwaway accounts

**Decision: Defer Referral System to v1.0+**
- Rationale: Adds significant anti-fraud complexity to Auth System. v0.1 focus is core loop, not viral growth. Referral systems are v1.0 growth features. Can design robust anti-fraud when implementing referrals later.
- Impact: Auth System v0.1 design doesn't need to accommodate referral abuse prevention (simpler implementation).

## Level 2: Immediate System Effects

### Integration Points

The Auth System is the identity foundation—every system that needs to know "who is this player?" depends on Auth.

#### Backend (Supabase)

**Users Table:**
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  username TEXT UNIQUE NOT NULL,
  avatar_url TEXT,
  is_guest BOOLEAN DEFAULT FALSE,
  email_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  last_login TIMESTAMP DEFAULT NOW(),
  device_fingerprint TEXT, -- For multi-account detection
  ip_address TEXT, -- For multi-account detection
  username_changes INT DEFAULT 0 -- Track free username change
);
```

**Auth Providers Table** (Supabase built-in, tracks linked accounts):
- Email/password
- Google OAuth
- Apple OAuth

**Row-Level Security (RLS) Policies:**
- All user-specific data tables use `WHERE user_id = auth.uid()` policies
- Example: `SELECT * FROM snakes WHERE user_id = auth.uid()` → User can only see their own snakes
- Example: `UPDATE snakes SET name = ? WHERE id = ? AND user_id = auth.uid()` → User can only edit their own snakes
- RLS enforced at database level (impossible to bypass, even with SQL injection)

**Session Management:**
- Supabase Auth handles sessions via JWT tokens
- Backend verifies JWT signature on every API request
- No session table needed (JWT is self-contained)

**Integration:** Auth provides `user_id` (UUID) that all other tables use as foreign key.

#### UI Framework

**Login Screen:**
- Email/password input fields
- "Sign in with Google" button (OAuth)
- "Sign in with Apple" button (OAuth)
- "Play as Guest" button (anonymous UUID)
- "Forgot Password?" link

**Registration Screen:**
- Email, password, username input fields
- Terms of Service checkbox (required)
- "Sign up" button
- "Already have an account? Log in" link
- Social signup: "Sign up with Google/Apple" (same buttons as login)

**Password Reset Screen:**
- Email input field
- "Send Reset Email" button
- Confirmation message: "Check your email for reset link"

**Account Settings Screen:**
- Display: Username, email, avatar
- Change username (free once, paid after)
- Change email (requires verification)
- Change password (requires current password)
- Link accounts: "Link Google", "Link Apple"
- Delete account (with confirmation)

**Profile Screen:**
- Display: Username, avatar, account creation date
- Collection stats (# snakes, highest Gen)
- Clan affiliation (if in clan)
- Public profile (visible to other players)

**Integration:** Auth state determines which UI screens are accessible. Unauthenticated users see only login/register. Authenticated users see game UI.

#### All Game Systems (User ID as Foreign Key)

Every feature that saves player-specific data depends on Auth to provide `user_id`:

**Collection Lab:**
- `snakes` table: `user_id` foreign key
- Query: `SELECT * FROM snakes WHERE user_id = auth.uid()`
- User-specific snake collection (cannot see other players' snakes)

**Breeding Lab:**
- `breeding_queue` table: `user_id` foreign key
- User's breeding slots (3 free slots)

**Evolution Lab:**
- `evolution_history` table: `user_id` foreign key
- Track which snakes user has evolved

**Leaderboards:**
- `leaderboard_entries` table: `user_id` foreign key
- Display username, avatar, score
- User identity required for ranking

**Clans:**
- `clan_members` table: `user_id` foreign key
- User identity for clan membership
- Guest users blocked (RLS policy checks `is_guest = false`)

**Shop:**
- `purchases` table: `user_id` foreign key
- Payment account linking (Google Play, App Store)
- Purchase history tied to user_id

**Gallery:**
- `showcases` table: `user_id` foreign key
- User's curated snake collection display

**Analytics:**
- `events` table: `user_id` foreign key
- User cohort tracking (Day 1, Day 7, Day 30 retention)

**Push Notifications:**
- `device_tokens` table: `user_id` foreign key
- Associate push token with user account
- Send personalized notifications ("Your breeding is complete!")

**Integration Pattern:** All game systems assume `user_id` exists. Auth provides this identity via JWT tokens decoded on backend (`auth.uid()`).

### Data Flow Diagram

```
┌─────────┐
│  User   │
└────┬────┘
     │
     ▼
┌────────────────────────┐
│  Login (Frontend)      │
│  - Email/password OR   │
│  - Google OAuth OR     │
│  - Apple OAuth OR      │
│  - Guest (anonymous)   │
└────────┬───────────────┘
         │
         ▼
┌──────────────────────────────┐
│  Supabase Auth (Backend)     │
│  - Verify credentials        │
│  - Generate JWT tokens       │
│    - Access token (1hr)      │
│    - Refresh token (30d)     │
│  - Return tokens + user_id   │
└────────┬─────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│  Frontend (Store Tokens)        │
│  - iOS Keychain (encrypted)     │
│  - Android Keystore (encrypted) │
│  - localStorage (web, less secure)
└────────┬────────────────────────┘
         │
         ▼
┌──────────────────────────────────┐
│  API Requests (Include JWT)      │
│  Header: Authorization: Bearer   │
│  <access_token>                  │
└────────┬─────────────────────────┘
         │
         ▼
┌───────────────────────────────────┐
│  Backend (Verify JWT)             │
│  - Check signature (Supabase key) │
│  - Check expiration               │
│  - Extract user_id from payload   │
│  - auth.uid() = user_id           │
└────────┬──────────────────────────┘
         │
         ▼
┌────────────────────────────────────────┐
│  Database Query (RLS Enforcement)      │
│  SELECT * FROM snakes                  │
│  WHERE user_id = auth.uid()            │
│  ↓                                     │
│  RLS Policy: User sees only own snakes │
└────────────────────────────────────────┘
```

**Key Insight:** JWT token contains `user_id` in payload. Backend extracts `user_id` via `auth.uid()` and uses it in database queries. Row-Level Security (RLS) policies enforce "users can only access their own data" at database level, making unauthorized access impossible even if application logic has bugs.

### Blocking Relationships

**What can't be built without Auth?**

Almost everything that persists user-specific data:

1. **Collection Lab:** Cannot save snakes without user_id (who owns this snake?)
2. **Breeding Lab:** Cannot track breeding slots without user_id (whose breeding queue?)
3. **Evolution Lab:** Cannot record evolution history without user_id
4. **Leaderboards:** Cannot rank players without user identity (who is this score from?)
5. **Clans:** Cannot assign clan membership without user_id
6. **Shop:** Cannot process purchases without user_id (who bought this?)
7. **Gallery:** Cannot display showcases without user_id (whose collection?)
8. **Analytics:** Cannot track retention without user_id (Day 1, Day 7, Day 30 for whom?)
9. **Push Notifications:** Cannot send personalized notifications without user_id (which device?)
10. **Cross-platform progress:** Cannot sync progress without user_id (which account to sync?)

**Answer: Everything except offline Snake gameplay (single-player with no persistence).**

### Build Order Implications

**Auth must be functional Week 1-2 for any user-specific features to work.**

**Development Sequence:**
1. **Week 1:** Supabase Auth setup (email/password, Google, Apple)
2. **Week 1:** JWT token management (secure storage, refresh logic)
3. **Week 2:** Guest accounts (UUID generation, conversion flow)
4. **Week 2:** Account linking (multi-provider support)
5. **Week 2:** Security features (rate limiting, bans, multi-account detection)
6. **Week 3+:** All other systems can now use `user_id` for data persistence

**Critical Path:** Auth → Backend (users table) → Collection (user_id FK) → Breeding (user_id FK) → All other features.

**Blocker Risk:** If Auth delayed, entire project timeline slips. Auth is non-negotiable Week 1-2 priority.

## Level 3: Game Balance

### Multi-Account Prevention

**Problem:** Players create multiple accounts to exploit game systems:

**Smurf Accounts (Leaderboard Manipulation):**
- High-skill player creates new account ("smurf")
- Dominates beginner leaderboards (unfair competition)
- New players discouraged ("I can never win")
- Solution: Skill-based brackets (Gen 1-5, Gen 6-10, Gen 11+) per BA-001

**DNA Farming (Economic Exploitation):**
- Player creates 10 guest accounts
- Farms DNA on all accounts
- Transfers DNA to main account via trading (v1.0 Corp Marketplace)
- Main account progresses without playing
- Solution: Guest accounts cannot trade (SO-003)

**Referral Bonus Abuse (v1.0+):**
- Player creates 20 accounts, refers self
- Collects 20× referral bonuses (e.g., +500 DNA each = 10,000 DNA free)
- Breaks progression economy
- Solution: Referral rewards delayed until Day 7 (throwaway accounts won't reach), device fingerprinting identifies self-referral

**Mitigation Strategies:**

#### Device Fingerprinting (Primary Defense)

**How It Works:**
1. Collect device attributes: OS version, screen resolution, timezone, language, installed fonts, hardware specs
2. Generate fingerprint hash: SHA256 of concatenated attributes
3. Store fingerprint in users table: `device_fingerprint` column
4. On account creation: Check `SELECT COUNT(*) FROM users WHERE device_fingerprint = ?`
5. If count ≥ 3 → Block account creation: "Maximum accounts per device reached"

**Limit:** 3 accounts per device
- Allows: Families/siblings sharing device
- Prevents: Mass account farming (100+ accounts)

**False Positives:**
- Emulators: Same fingerprint across all instances → Flagged (acceptable, emulators often used for cheating)
- Factory reset: Device fingerprint unchanged → Still counts toward limit (prevents reset abuse)
- VPN: Doesn't affect device fingerprint (only changes IP) → Not flagged

**Bypass Risk:**
- User can modify device attributes to generate new fingerprint (requires technical skill)
- Mitigation: Combine with IP tracking (user unlikely to change both device AND IP)

**Implementation:** Use library (e.g., FingerprintJS) for web, custom implementation for mobile (access device APIs directly).

#### IP Tracking (Secondary Defense, Soft Limit)

**How It Works:**
1. Capture IP address on account creation: `ip_address` column
2. Check: `SELECT COUNT(*) FROM users WHERE ip_address = ? AND created_at > NOW() - INTERVAL '7 days'`
3. If count >5 → Flag (don't block): "Multiple accounts detected from this IP. Under review."
4. Manual review: Support checks if bot farm (100+ accounts from single IP) or legitimate (public WiFi, VPN)

**Why Soft Limit (No Auto-Ban):**
- Public WiFi: Coffee shop, library, campus → 100s of users share 1 IP
- VPN: All VPN users appear as same IP
- ISP NAT: Entire neighborhood shares 1 IP (common in mobile networks)
- False positive rate: 30-40% if auto-ban on IP

**Review Process:**
1. Automated flag: System detects >5 accounts from IP in 7 days
2. Support review: Check account names (similar?), creation pattern (all at once?), behavior (all farming DNA?)
3. If bot farm: Ban all accounts from IP
4. If legitimate: Clear flag, allow accounts

**Implementation:** Log IP address on registration, background job flags anomalies daily.

#### Email Verification Requirement (Barrier to Entry)

**How It Works:**
1. Account creation requires email
2. Email verification email sent automatically (Supabase)
3. Unverified accounts: Limited features (no clans, no leaderboard ranking)
4. Check email domain against disposable email list (e.g., "10minutemail.com", "guerrillamail.com")
5. If disposable domain → Block registration OR allow but mark as "disposable" (never fully verify)

**Disposable Email List:**
- Maintain list of 1000+ known disposable email domains
- Sources: Public lists (GitHub), commercial APIs (Block-Disposable-Email)
- Update monthly (new disposable services appear constantly)

**Why This Works:**
- Raises barrier: Creating 100 email accounts is tedious
- Valid email required for account recovery (prevents throwaway accounts)
- Disposable emails blocked → Attacker must use real emails (finite resource)

**False Positives:**
- User legitimately uses disposable email (privacy-conscious)
- Mitigation: Allow disposable emails but limit features (same as unverified) → User can upgrade to real email later

**Implementation:** Check email domain on registration, compare to disposable email list (database table or API call).

#### Guest Account Limitations (Abuse Vector Removal)

**Rationale:** If guest accounts can't do valuable things, there's no point creating 100 guest accounts.

**Limitations:**
1. **No trading (v1.0):** Guest accounts cannot list/buy on Corp Marketplace → Cannot transfer DNA to main account
2. **No leaderboard ranking:** Guest scores don't appear on leaderboards → Cannot smurf rankings
3. **No clan participation:** Cannot join clans, cannot farm clan points → Cannot exploit clan rewards
4. **No cloud save:** Progress tied to device only → Creating guest account on new device = start from zero (no farming benefit)

**Why This Works:**
- Removes economic incentive for multi-accounting
- Guest accounts become "demo mode" (try game, then convert to full account)
- Legitimate users convert quickly (clan invite, leaderboard aspirations trigger conversion)

**Trade-Off:**
- Guest conversion rate may decrease if limitations too harsh (balance needed)
- Current design: Limitations incentivize conversion without being punishing (guests can still play, breed, collect)

**Implementation:** RLS policies check `is_guest = false` for clans, leaderboards, trading. Guest accounts flagged in database.

### Ban System Balance

**Philosophy:** Fair enforcement. First-time mistakes get warnings, repeat offenses escalate, severe violations result in permanent bans.

#### Ban Types & Escalation

**Warning (First Offense, Minor Violation):**
- **Violations:** Toxic chat (mild), account sharing (first detection), username violation (offensive name)
- **Action:** Banner message on login: "Warning: [Reason]. Further violations may result in suspension."
- **Duration:** Permanent record, no gameplay restriction
- **Escalation:** Second warning → 7-day suspension

**7-Day Suspension (Second Offense OR Moderate Violation):**
- **Violations:** Toxic chat (repeat), cheating (first detection, unclear if intentional), account sharing (repeat)
- **Action:** Login blocked for 7 days
- **User Experience:** "Your account is suspended until [Date]. Reason: [Reason]. To appeal, contact support."
- **Escalation:** Third violation → 30-day suspension

**30-Day Suspension (Third Offense OR Serious Violation):**
- **Violations:** Cheating (confirmed), harassment (severe), account sharing (third time), exploiting bugs (intentional)
- **Action:** Login blocked for 30 days
- **User Experience:** Same as 7-day, longer duration
- **Escalation:** Fourth violation → Permanent ban

**Permanent Ban (Fourth Offense OR Critical Violation):**
- **Violations:** Cheating (repeat/confirmed), harassment (hate speech), RMT (real-money trading for DNA/snakes), account takeover (stealing others' accounts)
- **Action:** Login blocked forever
- **User Experience:** "Your account is permanently banned. Reason: [Reason]. To appeal, contact support@supasnake.com"
- **Escalation:** None (final action)

#### Ban Reason Examples (Clarity for Users)

**Good Ban Reasons (Specific, Actionable):**
- "Cheating detected: Modified game client to generate unlimited DNA"
- "Toxic chat: Repeated harassment and hate speech in clan chat"
- "Account sharing: Multiple logins from USA and China within 1 hour (impossible travel)"
- "RMT: Selling DNA for real money on external website (violates Terms of Service)"
- "Exploiting bugs: Intentionally duplicated DNA via game bug (confirmed)"

**Bad Ban Reasons (Vague, Confusing):**
- "Violation of Terms of Service" (what did I do?)
- "Cheating" (how? what evidence?)
- "Inappropriate behavior" (what behavior? where?)

**Rationale:** Specific reasons allow user to understand what happened, appeal if false positive, and avoid repeat violations. Vague reasons frustrate users and increase support tickets.

#### Ban Appeal Process

**Appeal Workflow:**
1. **User submits appeal:** Email support@supasnake.com with subject "Ban Appeal - [Username]"
2. **Support reviews case:**
   - Pull ban record: user_id, reason, severity, timestamp
   - Review evidence: Anti-cheat logs, chat logs, IP logs
   - Check user history: Previous bans? First offense?
3. **Support decision:**
   - **False positive:** Anti-cheat error, mistaken identity, bug in detection → Lift ban immediately, apologize, compensate (e.g., +500 DNA)
   - **First offense, minor:** Toxic chat but user apologizes, account sharing but didn't know rules → Reduce suspension to warning, educate user
   - **Repeat offender:** Multiple bans, no remorse, clear pattern → Uphold ban, deny appeal
   - **Severe violation:** Confirmed cheating, harassment, RMT → Uphold ban, no reduction
4. **User notified:** Email response within 48 hours (SLA)
   - Appeal approved: "Your ban has been lifted. We've reviewed your case and determined [reason]. Your account is now active."
   - Appeal denied: "Your appeal has been denied. After review, we've confirmed [reason]. This ban will remain in effect."

**Appeal Success Rates:**
- False positives: 5-10% of bans (anti-cheat errors, IP misattribution)
- First offense leniency: 20-30% of suspensions reduced to warnings
- Repeat offender upheld: 60-70% of bans upheld (legitimate violations)

**Why Appeals Matter:**
- False positives happen (anti-cheat not perfect)
- Restores user trust (fair process, mistakes corrected)
- Reduces churn (wrongly banned users return)
- Legal compliance (EU right to contest automated decisions)

**Implementation:** Support email monitored by 1 CS rep, ban table has `appeal_status` column (pending/approved/denied), support can update `expires_at` to lift bans.

### Account Recovery

**Philosophy:** Don't punish forgotten passwords. Make recovery easy (but secure) to prevent progress loss.

#### Password Reset Flow (Detailed)

**User Flow:**
1. User clicks "Forgot Password?" on login screen
2. Enters email address
3. Taps "Send Reset Email"
4. Frontend validates: Email format correct? → Yes → Send request to backend
5. Backend checks: Does email exist in users table?
   - **Yes:** Send password reset email via Supabase
   - **No:** Send email anyway (security: don't reveal which emails have accounts)
6. User sees: "Check your email for reset instructions"
7. User opens email, clicks "Reset Password" link
8. Link redirects to reset form (frontend)
9. User enters new password (must meet strength requirements)
10. Taps "Reset Password"
11. Backend updates password hash
12. User automatically logged in with new password
13. Old refresh tokens revoked (all devices logged out, user must re-login with new password)

**Security Measures:**
- Reset link expires after 24 hours (prevents old links from being used)
- Reset link single-use (clicking twice invalidates link)
- Rate limiting: Max 3 reset emails per hour per email (prevents spam)
- All devices logged out after reset (prevents attacker using old session)

**Recovery Time:** <5 minutes (email delivery is bottleneck, Supabase sends instantly)

#### Account Recovery via Support

**Scenario:** User forgets email AND password (can't use automated reset).

**Support Recovery Process:**
1. User emails support@supasnake.com: "I can't access my account, username is [Username]"
2. Support verifies identity:
   - Username matches account? → Check
   - User provides purchase receipts? (proves ownership) → Strong evidence
   - User provides device info? (last login device, IP) → Moderate evidence
   - User answers security questions? (if implemented) → Strong evidence
3. Support decision:
   - **Strong evidence:** Reset password manually, send new temporary password via email
   - **Moderate evidence:** Ask for more proof (screenshot of purchases, last login date)
   - **Weak evidence:** Cannot verify identity → Deny recovery (security risk)
4. User logs in with temporary password, forced to change password immediately

**Recovery Time:** 48 hours (support response SLA)

**Why This Matters:**
- Players invest hours/days into SupaSnake (20+ snakes, Gen 5+)
- Losing account = losing investment → Churn
- Easy recovery = player continues playing → Retention

**False Recovery Risk:** Attacker impersonates user to steal account. Mitigation: Require purchase receipts (only real owner has receipts from App Store/Google Play).

### Guest Account Exploitation

**Problem:** Players abuse guest accounts for farming, smurfing, or progression exploits.

#### Exploitation Vectors & Mitigations

**Vector 1: DNA Farming via Guests**
- **Attack:** Create 10 guest accounts, farm DNA on all, transfer to main account via trading (v1.0)
- **Impact:** Main account progresses without playing (economic imbalance)
- **Mitigation:** Guest accounts cannot trade (blocked at RLS policy level). Trading requires verified account.
- **Result:** Farming guests pointless (DNA trapped on guest account, cannot transfer)

**Vector 2: Clan Point Farming**
- **Attack:** Create 20 guest accounts, join clan, contribute points, inflate clan ranking
- **Impact:** Clans artificially boosted, legitimate clans disadvantaged
- **Mitigation:** Guest accounts cannot join clans (blocked at join API). Clan membership requires verified account.
- **Result:** Guest farming doesn't benefit clans

**Vector 3: Leaderboard Smurfing**
- **Attack:** High-skill player creates guest account, dominates beginner leaderboards
- **Impact:** New players discouraged, perceive game as "pay-to-win" or "impossible"
- **Mitigation:** Guest accounts don't appear on leaderboards (scores tracked but not ranked). Leaderboards show only verified accounts.
- **Result:** Guest smurfing invisible, no impact on leaderboard integrity

**Vector 4: Local Save Manipulation (Cheating)**
- **Attack:** Guest progress stored locally → Player edits local storage (e.g., set DNA to 999,999)
- **Impact:** Guest has unlimited resources, breaks progression balance
- **Mitigation:** Guest accounts cannot trade/rank/clan → Cheated progress doesn't affect others. If guest converts, server validates progress before migration (flag impossible values like 999,999 DNA after 1 hour playtime).
- **Result:** Guest cheating self-contained, no multiplayer impact

#### Guest Limitations Summary (Abuse Prevention)

**What Guests CANNOT Do:**
1. Join clans (social restriction)
2. Rank on leaderboards (competitive restriction)
3. Trade DNA/materials (economic restriction)
4. Cloud save progress (portability restriction)

**What Guests CAN Do:**
1. Play Snake (all modes: Classic, Tower)
2. Collect DNA (resource collection)
3. Breed snakes (meta-game core loop)
4. Evolve snakes (progression)
5. View leaderboards (aspiration, conversion trigger)
6. View clans (aspiration, conversion trigger)

**Conversion Incentives:**
- "Save your collection!" (unlock 10 variants → at-risk progress)
- "Join clans!" (blocked feature, social FOMO)
- "Compete on leaderboards!" (competitive FOMO)
- "Protect your purchases!" (bought energy bundle → need account to keep it)

**Balance:** Guest limitations strict enough to prevent abuse, lenient enough to allow meaningful gameplay (guests can experience full core loop before converting).

## Level 4: Economy/Progression

### Cloud Save Benefits

**Philosophy:** "Create an account to protect your progress" is the conversion hook. Cloud save is the invisible value that players only appreciate after almost losing it.

#### Cross-Platform Progress

**Use Cases:**
1. **Device Upgrade:** Player gets new iPhone → Logs in → All snakes, DNA, purchases restored
2. **Platform Switch:** Play on iPhone, switch to iPad → Same account, same progress
3. **Multi-Platform:** Play on Android phone during commute, play on Android tablet at home → Progress syncs
4. **Device Lost/Stolen:** Phone stolen → Buy new phone → Log in → Progress intact (not lost)

**Technical Implementation:**
- User logs in → Backend fetches latest state from Supabase
- User makes change (breed snake, spend DNA) → API request updates backend
- Backend writes to database → Progress saved
- User logs out → State persisted
- User logs in on different device → Backend fetches saved state → Same progress appears

**Sync Frequency:**
- Real-time: Every action (breed, spend DNA) syncs immediately
- No "sync button" needed (invisible to user)
- Offline queue: Actions performed offline (no internet) → Queued locally → Sync when connection restored

**Why Cloud Save Matters:**
- Mobile users frequently upgrade devices (every 2-3 years)
- Mobile devices are lost/stolen/broken (10% of users per year experience device loss)
- Without cloud save: Device loss = progress loss = churn
- With cloud save: Device loss = inconvenience, progress safe = retention

**Conversion Trigger:**
"You're playing as a guest. Create an account to save your progress across devices!"

Appears after: 10 variants unlocked (player has invested time) OR first purchase (protect investment).

#### Premium Purchase Security

**Problem:** User spends $10 on energy bundle → Loses phone → Gets new phone → Wants purchases back.

**Solution:** Purchases tied to `user_id`, not device.

**Purchase Flow:**
1. User buys energy bundle ($4.99) via Google Play or App Store
2. App receives purchase receipt
3. Backend validates receipt with Google/Apple (prevents fraud)
4. Backend records purchase: `INSERT INTO purchases (user_id, item_id, receipt, amount) VALUES (?, ?, ?, ?)`
5. Backend grants item: `UPDATE users SET dna = dna + 1000, energy = energy + 10 WHERE id = ?`
6. User receives energy + DNA

**Recovery Flow (New Device):**
1. User logs in on new device
2. Backend fetches purchases: `SELECT * FROM purchases WHERE user_id = ?`
3. Backend checks: Are all purchased items granted?
   - Energy consumed? → Don't re-grant (consumable)
   - Exclusive variant unlocked? → Already in collection (permanent)
   - Subscription active? → Restore subscription status (recurring)
4. User sees: All permanent purchases intact, consumables consumed (expected)

**Receipt Validation:**
- **Google Play:** Use Google Play Billing API to verify receipt (prevents fake receipts)
- **App Store:** Use Apple StoreKit API to verify receipt
- Validation required to prevent fraud (attacker fabricating receipts)

**Why This Matters:**
- User trust: "If I spend money, it's safe even if I lose my phone"
- Reduces support tickets: No manual purchase restoration needed
- Compliance: Apple/Google require purchase restoration for device transfers

**User Education:**
"Your purchases are tied to your account, not your device. Log in on any device to restore your purchases."

### Guest → Account Conversion

**Philosophy:** Players don't create accounts on day one. They create accounts when they realize they're building something worth saving.

#### Conversion Funnel

**Stage 1: Initial Play (0-2 days)**
- User plays as guest (zero friction)
- Collects DNA, unlocks 3-5 variants
- Breeds first snake (meta-game engagement)
- No conversion prompts yet (avoid early pressure)

**Stage 2: Investment Realization (2-5 days)**
- User unlocks 10+ variants ("I've built a collection")
- User reaches Gen 5 snake ("I've made progress")
- User tries to join clan (blocked: "Create account to join clans")
- User views leaderboards (can see rankings, but not compete: "Sign in to compete!")

**Stage 3: Conversion Trigger**
Player encounters ONE of these triggers:
1. **Collection milestone:** "You've unlocked 10 variants! Create an account to save your collection across devices."
2. **Energy depletion:** "Out of energy? Sign in to get +5 bonus energy!"
3. **Clan invite:** "Create account to join clans and earn energy bonuses."
4. **Leaderboard aspiration:** "Sign in to compete on leaderboards and show off your snakes."
5. **First purchase:** "Create account to protect your purchase. (Purchases are not saved for guest accounts.)"

**Stage 4: Conversion Flow**
1. User taps "Create Account"
2. Modal appears:
   - **Option A:** Email/password (enter email, password, username)
   - **Option B:** Sign in with Google (one-tap)
   - **Option C:** Sign in with Apple (one-tap)
3. User chooses option, authenticates
4. Backend merges guest progress:
   - Guest UUID → New user_id
   - `UPDATE snakes SET user_id = ? WHERE user_id = ?` (migrate snakes)
   - `UPDATE users SET dna = ?, energy = ? WHERE id = ?` (migrate resources)
   - Delete guest UUID record (cleanup)
5. Welcome bonus granted: +100 DNA ("Thanks for creating an account!")
6. User returned to game, now authenticated
7. Full features unlocked: Clans, leaderboards, cloud save now available

**Progress Preservation:**
- All snakes migrated (collection intact)
- All DNA/energy migrated (resources intact)
- All purchases migrated (if guest made purchase, it's now tied to account)
- All progression migrated (generation progress, Lab investment)

**Why This Works:**
- No early pressure (guest plays for days before conversion prompt)
- Conversion at natural milestone (10 variants = investment realization)
- Clear value proposition ("Save your collection" vs vague "Create account")
- Social pressure (clan invite, leaderboard aspiration = FOMO)
- One-tap social login (Google/Apple reduces friction)

#### Conversion Metrics

**Target Metrics:**
- Guest conversion rate: 15-25% (industry benchmark: 20%)
- Average time to conversion: 2-5 days (Day 2: 5%, Day 3: 10%, Day 5: 15%)
- Primary conversion trigger:
  - Clan join blocked: 35%
  - Energy depletion: 30%
  - Collection save: 20%
  - Leaderboard aspiration: 10%
  - First purchase: 5%

**Why 15-25% Conversion is Good:**
- Guest accounts have 70%+ D1 retention (vs 30% if forced registration)
- 25% of 70% = 17.5% authenticated D1 retention (vs 30% forced registration)
- Net result: Similar authenticated retention, but guests who don't convert still engaged (potential future conversion)

**Failure Mode:**
- If <10% conversion: Triggers not compelling, or limitations too lenient (no incentive to convert)
- If <10% conversion: Increase limitation severity (e.g., guests can't breed Gen 3+) OR increase trigger frequency (prompt after 5 variants, not 10)

**Success Mode:**
- If >30% conversion: Triggers very compelling, users see value immediately
- If >30% conversion: May be able to reduce trigger frequency (less aggressive prompts) to improve guest experience

#### Conversion UX Best Practices

**DO:**
- Prompt at natural milestones (10 variants, energy depletion, clan invite)
- Explain benefit ("Save your collection", "Join clans", "Compete on leaderboards")
- One-tap social login (Google/Apple buttons prominent)
- Preserve ALL guest progress (zero loss on conversion)
- Welcome bonus (+100 DNA = positive reinforcement)

**DON'T:**
- Prompt during tutorial (too early, no investment yet)
- Prompt every 5 minutes (annoying, reduces conversion)
- Punish guests (don't delete progress if they decline conversion)
- Force conversion (guests can play indefinitely if they want)
- Hide benefit (vague "Create account" with no explanation = low conversion)

### Progression Persistence

**Core Principle:** Every action persists to backend immediately. No "save button" needed.

#### Cloud Sync on Login

**Login Flow (Progress Retrieval):**
1. User logs in (email/password, Google, Apple)
2. Backend verifies JWT token → Extracts user_id
3. Backend fetches latest state:
   - `SELECT * FROM users WHERE id = ?` (DNA, energy, username, avatar)
   - `SELECT * FROM snakes WHERE user_id = ?` (all owned snakes)
   - `SELECT * FROM breeding_queue WHERE user_id = ?` (active breedings)
   - `SELECT * FROM evolution_history WHERE user_id = ?` (evolution progress)
   - `SELECT * FROM purchases WHERE user_id = ?` (purchase history)
4. Backend returns state as JSON payload
5. Frontend hydrates app state (Redux/MobX/Context)
6. User sees: All snakes, DNA balance, breeding timers, energy = latest state

**Sync Frequency:**
- On login: Full state fetch (all data)
- On action: Incremental update (single record)
  - Example: User breeds snake → API POST /breed → Backend updates breeding_queue → Returns new snake
- On background/foreground: Check for updates (e.g., breeding timer expired while app backgrounded)

**Offline Behavior:**
- User plays offline (no internet)
- Actions queued locally: `breeding_queue_local = [{parent1, parent2, cost}]`
- User goes online
- Frontend syncs queue: `POST /sync` with local actions
- Backend processes queue: Apply breeding, update snakes, deduct DNA
- Frontend clears local queue, updates state

**Why Real-Time Sync:**
- User never loses progress (every action saved immediately)
- Multi-device sync seamless (play on phone, switch to tablet = same state)
- Offline tolerance (queue actions locally, sync when online)

#### Conflict Resolution (Rare Edge Case)

**Scenario:** User plays on Device A offline, plays on Device B offline, both devices go online simultaneously.

**Conflict Example:**
- Device A: Breeds Snake 1 + Snake 2 → Offspring A (timestamp: 10:00:00)
- Device B: Breeds Snake 1 + Snake 2 → Offspring B (timestamp: 10:00:05)
- Both devices sync → Which offspring is "real"?

**Resolution Strategy: Last-Write-Wins (Timestamp-Based)**
1. Backend receives sync from Device A (timestamp: 10:00:00)
2. Backend applies breeding → Creates Offspring A
3. Backend receives sync from Device B (timestamp: 10:00:05)
4. Backend checks: Is Snake 1 still available for breeding?
   - No (Device A already bred it)
   - Backend rejects Device B sync: "Snake 1 already used in breeding"
5. Device B receives error: "Breeding failed: Snake already used"
6. Device B shows message: "This snake was bred on another device. Please refresh."

**Alternative Resolution: Merge Conflicts (Resource-Based)**
- If conflict is resource-only (e.g., Device A spends 100 DNA, Device B spends 50 DNA, both offline):
  - Backend merges: Total DNA spent = 150
  - Backend validates: Does user have 150 DNA?
    - Yes → Apply both
    - No → Reject second sync
- If conflict is state-based (e.g., both devices breed same snake):
  - Backend uses timestamp (last-write-wins)

**Conflict Frequency:** <0.1% of actions (rare: requires 2 devices offline simultaneously + same action on both)

**User Experience:**
- Most users never encounter conflicts (single-device usage)
- If conflict: Clear error message ("This snake was already bred on another device")
- If conflict: User manually resolves (re-breed different snakes)

### First-Time User Experience

**Traditional Mobile Game (High Friction):**
```
Download → Registration Screen → Enter email → Enter password → Verify email → Finally play
Drop-off: 70% at registration (never see gameplay)
```

**SupaSnake (Low Friction):**
```
Download → Play immediately as guest → Enjoy game → Realize investment → Convert when ready
Drop-off: 30% at registration (but these users already played 2-5 days, much more engaged)
```

#### Friction Analysis

**Traditional Registration Friction Points:**
1. Email input (typing on mobile = slow)
2. Password creation (must remember password)
3. Email verification (switch to email app, find email, click link, return to game)
4. Total time: 3-5 minutes before first play
5. Drop-off: 70% of users abandon before playing

**SupaSnake Guest Account (Zero Friction):**
1. Open app → Tap "Play as Guest" → Playing within 10 seconds
2. No email, no password, no verification
3. Total time: 10 seconds to first play
4. Drop-off: 10% (users who intended to download different game)

**Conversion Friction (After Engagement):**
1. User plays for 2-5 days as guest (already engaged)
2. Conversion trigger appears ("Save your collection!")
3. User taps "Sign in with Google" → One-tap → Authenticated
4. Total time: 5 seconds to convert
5. Drop-off: 75-85% (but these users already played, may convert later)

**Net Result:**
- Traditional: 30% of downloads start playing (70% drop-off at registration)
- SupaSnake: 90% of downloads start playing (10% drop-off), 15-25% eventually create accounts
- **Outcome:** 90% × 25% = 22.5% authenticated users vs 30% traditional
- **But:** 90% - 22.5% = 67.5% engaged guests (potential future conversions, ad revenue)

**Why This Matters:**
- D1 retention higher (90% try game vs 30%)
- Guest users can still monetize (watch ads, buy energy as guest, then forced to create account to keep purchase)
- Conversion happens when engaged (not at cold start)
- Industry trend: All top mobile F2P games use guest accounts (Pokemon GO, Clash Royale, Candy Crush)

## Critical Findings (Part 1)

### 1. Guest Accounts Reduce Friction, Increase D1 Retention
**Insight:** 70% of mobile users drop off at forced registration. Guest accounts remove this barrier, allowing 90% of users to experience gameplay. Conversion happens after engagement (2-5 days), not at cold start.

**Impact:** D1 retention target: 50% (traditional 30%). Guest accounts enable this by deferring registration until user realizes investment ("I've collected 10 snakes, I need to save this!").

**Risk:** If guest conversion <10%, all that D1 retention is wasted (guests don't monetize, don't contribute to community). Mitigation: Conversion triggers (clan invite, energy depletion, collection save) at natural milestones.

### 2. Supabase Auth Accelerates Development by 2-3 Months
**Insight:** Building custom auth (JWT generation, OAuth flows, email verification, password reset) takes 2-3 months. Supabase provides this out-of-the-box, reducing Auth System implementation to 2-3 weeks.

**Impact:** v0.1 timeline achievable (3 months total). Custom auth would push v0.1 to Month 5-6 (unacceptable delay).

**Trade-Off:** Vendor lock-in (Supabase-specific). Mitigation: Supabase uses standard PostgreSQL + JWT (migration path exists if needed).

### 3. Multi-Account Prevention Essential to Maintain Balance
**Insight:** Without multi-account detection, players will exploit:
- Smurf accounts (leaderboard manipulation)
- DNA farming (create 10 guests, farm DNA, transfer via trading)
- Referral abuse (refer self 20 times for bonuses)

**Impact:** Game economy breaks, leaderboards become meaningless, legitimate players churn ("I can't compete with farmers/smurfs").

**Solution:** Device fingerprinting (limit 3 accounts per device) + Guest limitations (no trade, no leaderboard rank) + IP soft-flagging (>5 accounts flagged for review).

**Result:** Farming/smurfing still possible but limited (3 accounts per device = acceptable family use, but prevents mass exploitation).

### 4. Cloud Save is Key Value Proposition for Account Creation
**Insight:** "Create account to save progress" is the conversion hook. Players don't care about accounts abstractly—they care about not losing their 10 collected snakes.

**Impact:** Conversion trigger effectiveness: "Save your collection!" converts 20% vs "Create an account" converts 5% (4x improvement with clear benefit).

**UX:** Conversion prompts must explain benefit ("Save your collection across devices!") not just ask for account ("Sign up now!").

### 5. Ban System Must Be Fair and Graduated
**Insight:** False positives happen (anti-cheat errors, IP misattribution). Permanent bans on first offense cause wrongful churn.

**Solution:** Graduated punishments: Warning → 7-day suspension → 30-day suspension → Permanent ban. Easy appeal process (support email, 48-hour response).

**Impact:** False positives corrected quickly (5-10% of bans lifted on appeal), user trust maintained ("They made a mistake but fixed it fast"), legitimate violations still punished (60-70% of bans upheld).

**Risk:** Too lenient = cheaters stay, too strict = false positives churn. Balance: First-time minor violations get warnings (no punishment), repeat/severe violations escalate quickly.

## Open Questions (Part 1)

### 1. Facebook Login in v1.0?
**Question:** Should SupaSnake support Facebook login in addition to Google/Apple?

**Pro:** Some users prefer Facebook (especially older demographics, casual gamers)
**Con:** Declining trust after privacy scandals, adds 3rd OAuth provider complexity, diminishing returns (Google + Apple cover 90%+ of social login demand)

**Recommendation:** Defer to v1.0+. If user research shows demand (>10% of users request Facebook login), add it. Otherwise, Google + Apple sufficient.

### 2. Guest Account Feature Limits: Too Strict or Too Lenient?
**Current Limits:** No clans, no leaderboard ranking, no trading, no cloud save.

**Question:** Are these limits the right balance between incentivizing conversion and allowing meaningful gameplay?

**Too Strict:** If guests can't do anything fun, they churn before converting (no investment realization).
**Too Lenient:** If guests have full features, no incentive to convert (why create account if guest works?).

**Recommendation:** Test in soft launch. If guest conversion <10%, limits too lenient (add more restrictions). If guest D1 retention <40%, limits too strict (remove some restrictions).

**Experiment:** A/B test guest leaderboard visibility. Group A: Guests can see own scores but not rank publicly. Group B: Guests cannot see leaderboards at all. Measure conversion rates.

### 3. Multi-Account Limit: 3 or 5 Per Device?
**Current Limit:** 3 accounts per device (strict), 5 accounts per IP (soft flag).

**Question:** Is 3 accounts per device the right balance?

**3 accounts:** Allows small families (parent + 2 kids), prevents farming (10+ accounts).
**5 accounts:** Allows large families (parent + 4 kids), but enables more farming (diminishing returns).

**Risk:** Too strict (3) = false positives (large families), too lenient (5+) = farming (limited impact).

**Recommendation:** Start with 3, monitor support tickets. If >5% of users complain "I have 4 kids, need more accounts", increase to 5. If no complaints, keep at 3.

### 4. Email Verification Timing: Immediate or Delayed?
**Current:** Email verification required before full features (clans, leaderboards).

**Question:** Should email verification be required immediately on registration, or delayed until user tries to join clan/leaderboard?

**Immediate:** User must verify before playing (high friction).
**Delayed:** User can play, verification required when attempting blocked feature (lower friction).

**Recommendation:** Delayed verification (current design). User can convert guest → email account, play immediately, verify later when joining clan. Reduces conversion friction while maintaining security (verified email still required eventually).

**Experiment:** A/B test immediate vs delayed verification. Measure conversion rate + time-to-verification.

### 5. Password Strength: Current Requirements or More Lenient?
**Current:** 8+ chars, 1 uppercase, 1 number.

**Question:** Are these requirements the right balance between security and usability?

**Current (Moderate):** Memorable but secure (2.8 trillion combinations).
**Lenient (6+ chars):** Easier to remember, but weak (720 million combinations = brute-forceable).
**Strict (12+ chars, special char):** Very secure, but high friction (users forget complex passwords).

**Recommendation:** Keep current (8+ chars, 1 uppercase, 1 number). This is industry standard (matches Google, Apple, Facebook requirements). Special character requirement adds friction without significant security gain (phishing is bigger threat than brute force).

**Experiment:** Monitor password reset requests. If >20% of users reset password in first 30 days, current requirements may be too complex (users forget). If <5%, requirements may be too lenient (users choose weak passwords).

### 6. Account Deletion: GDPR-Compliant 30-Day Delay or Instant?
**Current:** Account marked deleted immediately, data purged after 30 days (GDPR compliance).

**Question:** Is 30-day delay the right balance between user protection (accidental deletion recovery) and compliance (GDPR requires timely deletion)?

**30-Day Delay:** Protects against accidental deletion (user can contact support to recover within 30 days).
**Instant Deletion:** User data deleted immediately (stricter privacy, but no recovery window).

**Recommendation:** Keep 30-day delay. GDPR allows "reasonable delay" (up to 30 days), and accidental deletions happen (users tap "Delete" by mistake, regret immediately). 30 days provides recovery window without GDPR violation.

**Edge Case:** If user requests "delete immediately" (e.g., data breach concern), support can manually expedite deletion (purge within 24 hours).

### 7. Username Change: Free Once or Always Free?
**Current:** Free once (within 7 days of creation), then 100 gems ($0.99).

**Question:** Should username changes be free once, always free, or always paid?

**Free Once:** Allows fixing typos/regrets, prevents frivolous changes (paid after first).
**Always Free:** User-friendly, but enables abuse (impersonation, trolling, confusion in clans).
**Always Paid:** Monetization opportunity, but punishes typos (frustrating experience).

**Recommendation:** Keep current (free once, then paid). This balances user-friendliness (free correction) with abuse prevention (paid changes reduce frivolous changes). Provides minor monetization vector ($0.99 per change) without being predatory.

**Experiment:** Track username change requests. If >30% of users change username multiple times, paid restriction may not be deterring enough. If <1% change username (even free), restriction may be unnecessary.

### 8. Referral System in v1.0: Impact on Multi-Account Detection?
**Question:** If referral system added (v1.0+), how does it affect Auth System design?

**Referral System:** User shares link → Friend signs up → Both get rewards (+500 DNA, exclusive variant).

**Impact on Auth:**
- Multi-account detection must prevent self-referral abuse (user refers own alt accounts)
- Device fingerprinting + IP tracking required to identify same person
- Referral rewards must be delayed (e.g., after friend reaches Day 7) to prevent throwaway accounts
- False positives (siblings referring each other on same device) must allow appeals

**Recommendation:** Defer referral system to v1.0+ to avoid adding anti-fraud complexity to v0.1 Auth System. When implementing referrals, add self-referral detection:
- Check device fingerprint: Referrer and referee same device? → Flag for review.
- Check IP: Referrer and referee same IP? → Soft flag (could be family).
- Delay reward: Referee must reach Day 7 before reward granted (prevents throwaway accounts).

---

*Part 2 (Levels 5-8: Social, Technical, Content, Meta-game) will analyze social interactions (clans, leaderboards), technical constraints (cross-platform sync, security), content impact (user-generated content, moderation), and meta-game consequences (prestige, progression systems).*
