#!/bin/bash
# PreToolUse Hook: Block Client-Side Secrets
# Prevents service role keys and sensitive credentials in client code
# Exit 0: Allow, Exit 2: BLOCK

# Read JSON input from stdin
INPUT=$(cat)

# Extract fields
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')
NEW_STRING=$(echo "$INPUT" | jq -r '.tool_input.new_string // empty')

# Only check Write and Edit tools
if [[ "$TOOL_NAME" != "Write" && "$TOOL_NAME" != "Edit" ]]; then
  exit 0
fi

# Combine content sources
TEXT="$CONTENT$NEW_STRING"

# Skip if no text to check
if [[ -z "$TEXT" ]]; then
  exit 0
fi

# Server-side patterns (secrets are ALLOWED here)
SERVER_PATTERNS=(
  "/server/"
  "/api/"
  "app/api/"
  "/middleware/"
  "/lib/server"
  "\.server\.(ts|js)"
  "route\.(ts|js)$"
  "\.env"  # Environment files
  "/config/server"
)

# Check if file is server-side
IS_SERVER_SIDE=0
for pattern in "${SERVER_PATTERNS[@]}"; do
  if echo "$FILE_PATH" | grep -Eq "$pattern"; then
    IS_SERVER_SIDE=1
    break
  fi
done

# If server-side, allow secrets
if [[ $IS_SERVER_SIDE -eq 1 ]]; then
  exit 0
fi

# Sensitive credential patterns (should NOT be in client code)
SECRET_PATTERNS=(
  "SERVICE_ROLE_KEY"
  "PRIVATE_KEY"
  "SECRET_KEY"
  "API_SECRET"
  "MASTER_KEY"
  "ADMIN_KEY"
  "DATABASE_URL"
  "STRIPE_SECRET_KEY"
  "STRIPE_WEBHOOK_SECRET"
  "OPENAI_API_KEY"
  "ANTHROPIC_API_KEY"
)

# Check for secret usage in client code
for pattern in "${SECRET_PATTERNS[@]}"; do
  if echo "$TEXT" | grep -Eq "process\.env\.${pattern}|env\.${pattern}|import.*${pattern}"; then
    echo "❌ BLOCKED: Client-Side Secret Exposure" >&2
    echo "" >&2
    echo "Security Violation: Sensitive credential in client-side code" >&2
    echo "" >&2
    echo "Violation: Reference to ${pattern}" >&2
    echo "File: ${FILE_PATH}" >&2
    echo "" >&2
    echo "Why this matters:" >&2
    echo "  • Secret will be exposed in client bundle" >&2
    echo "  • Anyone can extract and misuse the key" >&2
    echo "  • Attackers can impersonate your server" >&2
    echo "  • May lead to data breach or financial loss" >&2
    echo "  • Violates security best practices" >&2
    echo "" >&2
    echo "Fix: Use server-side API routes" >&2
    echo "  1. Move code using secret to API route (app/api/)" >&2
    echo "  2. Client calls API route without accessing secret" >&2
    echo "  3. API route uses secret server-side only" >&2
    echo "" >&2
    echo "Example:" >&2
    echo "  ❌ BAD (client component):" >&2
    echo "     const key = process.env.SERVICE_ROLE_KEY" >&2
    echo "     const supabase = createClient(url, key)" >&2
    echo "" >&2
    echo "  ✅ GOOD (API route):" >&2
    echo "     // app/api/admin/route.ts" >&2
    echo "     const key = process.env.SERVICE_ROLE_KEY" >&2
    echo "     const supabase = createClient(url, key)" >&2
    echo "" >&2
    echo "     // components/AdminPanel.tsx" >&2
    echo "     const data = await fetch('/api/admin')" >&2
    echo "" >&2
    echo "Allowed in client code:" >&2
    echo "  ✅ NEXT_PUBLIC_* environment variables" >&2
    echo "  ✅ Public publishable keys (NEXT_PUBLIC_STRIPE_KEY)" >&2
    echo "  ✅ Public anon keys (NEXT_PUBLIC_SUPABASE_ANON_KEY)" >&2
    echo "" >&2
    exit 2
  fi
done

# No secrets detected in client code - allow
exit 0
