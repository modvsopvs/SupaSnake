# How to Implement Authentication

**Goal**: Set up Supabase Auth with email/password, Google Sign-In, Apple Sign-In, guest accounts, and guest-to-account conversion flow.

**Timeline**: 2-3 weeks (1 backend engineer + 1 frontend engineer)

**Prerequisites**:
- Supabase project created and configured
- React Native or Next.js project initialized
- Environment variables configured

---

## Step 1: Configure Supabase Auth Providers

Navigate to **Authentication → Providers** in Supabase dashboard.

### Enable Email/Password Provider

1. Click **Email** provider
2. Toggle **Enable Email Provider** to ON
3. **Confirm Email**: Toggle ON (require email verification)
4. **Email Templates**: Customize verification and password reset emails
   - Subject: "Verify your SupaSnake account"
   - Body: Include {{ .ConfirmationURL }} magic link
5. Save settings

### Enable Google Sign-In

1. Create Google OAuth credentials:
   - Go to [Google Cloud Console](https://console.cloud.google.com)
   - Create new project: "SupaSnake"
   - Enable Google+ API
   - Create OAuth 2.0 Client ID (Web application)
   - Add authorized redirect URIs: `https://your-project-id.supabase.co/auth/v1/callback`
2. Copy **Client ID** and **Client Secret**
3. In Supabase dashboard, click **Google** provider
4. Paste Client ID and Client Secret
5. Toggle **Enable Google Provider** to ON
6. Save settings

### Enable Apple Sign-In

1. Create Apple Services ID:
   - Go to [Apple Developer Portal](https://developer.apple.com)
   - Create new Services ID: "com.supasnake.auth"
   - Enable "Sign in with Apple"
   - Configure return URLs: `https://your-project-id.supabase.co/auth/v1/callback`
2. Copy **Services ID**, **Team ID**, **Key ID**, and download **Private Key** (.p8 file)
3. In Supabase dashboard, click **Apple** provider
4. Paste Services ID, Team ID, Key ID, and Private Key content
5. Toggle **Enable Apple Provider** to ON
6. Save settings

**Verification**: Test OAuth flows by clicking "Test" button in provider settings.

---

## Step 2: Install Supabase Auth SDK

Install Supabase client with auth support:

```bash
# React Native
npm install @supabase/supabase-js @react-native-async-storage/async-storage react-native-url-polyfill

# Next.js / Web
npm install @supabase/supabase-js
```

**Initialize Supabase client** in `lib/supabase.ts`:

```typescript
import { createClient } from '@supabase/supabase-js';
import AsyncStorage from '@react-native-async-storage/async-storage'; // React Native only
import 'react-native-url-polyfill/auto'; // React Native only

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    storage: AsyncStorage, // React Native: use AsyncStorage; Web: use localStorage (default)
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: true
  }
});
```

---

## Step 3: Build Login Screen

Create `screens/LoginScreen.tsx`:

```typescript
import { useState } from 'react';
import { View, TextInput, TouchableOpacity, Text } from 'react-native';
import { supabase } from '@/lib/supabase';

export default function LoginScreen({ navigation }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // Email/Password Sign-In
  async function signInWithEmail() {
    setLoading(true);
    setError('');

    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password
    });

    setLoading(false);

    if (error) {
      setError(error.message);
    } else {
      // Redirect to main game screen
      navigation.replace('Home');
    }
  }

  // Google Sign-In
  async function signInWithGoogle() {
    const { data, error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: 'supasnake://auth/callback' // Deep link for mobile
      }
    });

    if (error) setError(error.message);
  }

  // Apple Sign-In
  async function signInWithApple() {
    const { data, error } = await supabase.auth.signInWithOAuth({
      provider: 'apple',
      options: {
        redirectTo: 'supasnake://auth/callback'
      }
    });

    if (error) setError(error.message);
  }

  // Guest Account (Anonymous)
  async function continueAsGuest() {
    // Generate guest UUID locally
    const guestId = 'guest_' + Math.random().toString(36).substring(7);

    // Store guest ID in local storage
    await AsyncStorage.setItem('guest_id', guestId);

    // Navigate to game without backend auth
    navigation.replace('Home');
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Welcome to SupaSnake</Text>

      {error && <Text style={styles.error}>{error}</Text>}

      <TextInput
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        autoCapitalize="none"
        keyboardType="email-address"
        style={styles.input}
      />

      <TextInput
        placeholder="Password"
        value={password}
        onChangeText={setPassword}
        secureTextEntry
        style={styles.input}
      />

      <TouchableOpacity
        onPress={signInWithEmail}
        disabled={loading}
        style={styles.primaryButton}
      >
        <Text style={styles.buttonText}>
          {loading ? 'Signing in...' : 'Sign In'}
        </Text>
      </TouchableOpacity>

      <TouchableOpacity onPress={signInWithGoogle} style={styles.socialButton}>
        <Text>Continue with Google</Text>
      </TouchableOpacity>

      <TouchableOpacity onPress={signInWithApple} style={styles.socialButton}>
        <Text>Continue with Apple</Text>
      </TouchableOpacity>

      <TouchableOpacity onPress={continueAsGuest} style={styles.guestButton}>
        <Text>Play as Guest</Text>
      </TouchableOpacity>

      <TouchableOpacity onPress={() => navigation.navigate('Register')}>
        <Text style={styles.link}>Don't have an account? Sign up</Text>
      </TouchableOpacity>

      <TouchableOpacity onPress={() => navigation.navigate('ForgotPassword')}>
        <Text style={styles.link}>Forgot Password?</Text>
      </TouchableOpacity>
    </View>
  );
}
```

---

## Step 4: Build Registration Screen

Create `screens/RegisterScreen.tsx`:

```typescript
import { useState } from 'react';
import { View, TextInput, TouchableOpacity, Text, Alert } from 'react-native';
import { supabase } from '@/lib/supabase';

export default function RegisterScreen({ navigation }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [username, setUsername] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // Email/Password Registration
  async function signUpWithEmail() {
    setLoading(true);
    setError('');

    // Validate password strength
    if (password.length < 8) {
      setError('Password must be at least 8 characters');
      setLoading(false);
      return;
    }

    if (!/[A-Z]/.test(password)) {
      setError('Password must contain at least 1 uppercase letter');
      setLoading(false);
      return;
    }

    if (!/[0-9]/.test(password)) {
      setError('Password must contain at least 1 number');
      setLoading(false);
      return;
    }

    // Validate username uniqueness
    const { data: existingUser } = await supabase
      .from('user_profiles')
      .select('id')
      .eq('username', username)
      .single();

    if (existingUser) {
      setError('Username already taken');
      setLoading(false);
      return;
    }

    // Create auth user
    const { data: authData, error: authError } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: { username } // Store username in auth metadata
      }
    });

    if (authError) {
      setError(authError.message);
      setLoading(false);
      return;
    }

    // Create user profile
    const { error: profileError } = await supabase
      .from('user_profiles')
      .insert({
        id: authData.user!.id,
        username,
        dna_balance: 0,
        energy: 100
      });

    if (profileError) {
      setError(profileError.message);
      setLoading(false);
      return;
    }

    setLoading(false);

    Alert.alert(
      'Registration Successful',
      'Check your email to verify your account.',
      [{ text: 'OK', onPress: () => navigation.replace('Login') }]
    );
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Create Account</Text>

      {error && <Text style={styles.error}>{error}</Text>}

      <TextInput
        placeholder="Username (3-16 characters)"
        value={username}
        onChangeText={setUsername}
        maxLength={16}
        style={styles.input}
      />

      <TextInput
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        autoCapitalize="none"
        keyboardType="email-address"
        style={styles.input}
      />

      <TextInput
        placeholder="Password (8+ chars, 1 uppercase, 1 number)"
        value={password}
        onChangeText={setPassword}
        secureTextEntry
        style={styles.input}
      />

      <TouchableOpacity
        onPress={signUpWithEmail}
        disabled={loading}
        style={styles.primaryButton}
      >
        <Text style={styles.buttonText}>
          {loading ? 'Creating Account...' : 'Sign Up'}
        </Text>
      </TouchableOpacity>

      <TouchableOpacity onPress={() => navigation.navigate('Login')}>
        <Text style={styles.link}>Already have an account? Sign in</Text>
      </TouchableOpacity>
    </View>
  );
}
```

---

## Step 5: Implement Guest-to-Account Conversion

Create conversion modal triggered when guest tries to access auth-required feature:

```typescript
// components/GuestConversionModal.tsx
import { useState } from 'react';
import { Modal, View, Text, TouchableOpacity } from 'react-native';
import { supabase } from '@/lib/supabase';
import AsyncStorage from '@react-native-async-storage/async-storage';

export default function GuestConversionModal({ visible, onClose }) {
  async function convertGuestToAccount() {
    // Get guest data from local storage
    const guestId = await AsyncStorage.getItem('guest_id');
    const guestSnakes = await AsyncStorage.getItem('guest_snakes');
    const guestDNA = await AsyncStorage.getItem('guest_dna');

    // Redirect to registration screen with conversion flag
    navigation.navigate('Register', {
      isGuestConversion: true,
      guestData: {
        snakes: JSON.parse(guestSnakes || '[]'),
        dna: parseInt(guestDNA || '0')
      }
    });
  }

  return (
    <Modal visible={visible} transparent animationType="slide">
      <View style={styles.modalContainer}>
        <View style={styles.modalContent}>
          <Text style={styles.modalTitle}>Save Your Collection!</Text>

          <Text style={styles.modalBody}>
            You've unlocked 10 snakes and reached Generation 3.
            Create an account to save your progress across devices.
          </Text>

          <Text style={styles.benefits}>Benefits of Creating Account:</Text>
          <Text>✓ Cloud save across devices</Text>
          <Text>✓ Join clans and compete</Text>
          <Text>✓ Rank on global leaderboards</Text>
          <Text>✓ Showcase in gallery</Text>

          <TouchableOpacity
            onPress={convertGuestToAccount}
            style={styles.primaryButton}
          >
            <Text style={styles.buttonText}>Create Account</Text>
          </TouchableOpacity>

          <TouchableOpacity onPress={onClose} style={styles.secondaryButton}>
            <Text>Maybe Later</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Modal>
  );
}
```

**Migration Logic** in registration screen:

```typescript
// In RegisterScreen after successful sign-up
if (route.params?.isGuestConversion && route.params?.guestData) {
  const { snakes, dna } = route.params.guestData;

  // Migrate guest snakes to new authenticated account
  for (const snake of snakes) {
    await supabase.from('player_collection').insert({
      user_id: authData.user!.id,
      variant_id: snake.variant_id,
      generation: snake.generation
    });
  }

  // Update DNA balance
  await supabase
    .from('user_profiles')
    .update({ dna_balance: dna })
    .eq('id', authData.user!.id);

  // Grant welcome bonus for converting
  await supabase
    .from('user_profiles')
    .update({ dna_balance: dna + 100 }) // +100 DNA bonus
    .eq('id', authData.user!.id);

  // Clear guest data from local storage
  await AsyncStorage.removeItem('guest_id');
  await AsyncStorage.removeItem('guest_snakes');
  await AsyncStorage.removeItem('guest_dna');
}
```

---

## Step 6: Handle Session Management

Create `useAuth` hook for managing authentication state:

```typescript
// hooks/useAuth.ts
import { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase';
import AsyncStorage from '@react-native-async-storage/async-storage';

export function useAuth() {
  const [user, setUser] = useState(null);
  const [isGuest, setIsGuest] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Check for existing session
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session) {
        setUser(session.user);
        setIsGuest(false);
      } else {
        // Check if guest
        AsyncStorage.getItem('guest_id').then(guestId => {
          if (guestId) {
            setIsGuest(true);
          }
          setLoading(false);
        });
      }
    });

    // Listen for auth state changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (_event, session) => {
        setUser(session?.user ?? null);
        setIsGuest(false);
        setLoading(false);
      }
    );

    return () => subscription.unsubscribe();
  }, []);

  return { user, isGuest, loading };
}
```

**Usage in components**:

```typescript
import { useAuth } from '@/hooks/useAuth';

function HomeScreen() {
  const { user, isGuest, loading } = useAuth();

  if (loading) return <LoadingSpinner />;

  if (isGuest) {
    return <GuestHomeScreen />;
  }

  return <AuthenticatedHomeScreen user={user} />;
}
```

---

## Tips for Success

✅ **DO**:
- Test OAuth flows on both iOS and Android (platform-specific quirks)
- Store JWT tokens securely (iOS Keychain, Android Keystore)
- Auto-refresh access tokens before expiration (Supabase handles this)
- Show clear conversion value proposition ("Save your collection!")
- Preserve ALL guest progress during conversion (zero data loss)

❌ **DON'T**:
- Store passwords in plain text (Supabase hashes automatically)
- Skip email verification (required for account recovery)
- Force guest conversion too early (wait until 10+ variants unlocked)
- Ignore rate limiting (protect against brute force attacks)
- Hardcode OAuth redirect URLs (use environment variables)

---

## Common Mistakes

**Mistake 1**: OAuth redirect not working on mobile
- **Symptom**: "Invalid redirect URL" error
- **Fix**: Configure deep linking (iOS: Universal Links, Android: App Links)

**Mistake 2**: Guest data lost during conversion
- **Symptom**: User creates account but loses all snakes
- **Fix**: Migrate local storage data BEFORE clearing guest_id

**Mistake 3**: Session not persisting across app restarts
- **Symptom**: User logged out after closing app
- **Fix**: Use AsyncStorage (React Native) or localStorage (Web) for session persistence

**Mistake 4**: Email verification emails not sending
- **Symptom**: User never receives verification email
- **Fix**: Check Supabase email settings, verify SMTP configuration

---

## See Also

- **Quick Ref**: @knowledge_base/game/quick_ref/auth_system.md - Auth system overview
- **Quick Ref**: @knowledge_base/game/quick_ref/backend_supabase.md - Backend setup
- **How-To**: @knowledge_base/game/how_to/setup_supabase_backend.md - Database configuration
- **Complete Spec**: @docs/game/systems/analysis/AUTH_SYSTEM_analysis_part1.md - Full auth architecture
- **Complete Spec**: @docs/game/systems/analysis/AUTH_SYSTEM_analysis_part2.md - Social and retention impact
