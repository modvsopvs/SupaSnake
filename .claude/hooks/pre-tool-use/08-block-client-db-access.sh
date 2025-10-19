#!/bin/bash
# PreToolUse Hook: Block Client-Side Database Access
# Prevents direct database queries from client code (AAA 2026 standard)
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

# Skip if no database access detected
if ! echo "$TEXT" | grep -Eq 'supabase\.from\(|createClient.*supabase'; then
  exit 0  # No database access, allow
fi

# Determine if file is client-side or server-side
IS_CLIENT_SIDE=0

# Client-side patterns (should NOT access database directly)
CLIENT_PATTERNS=(
  "/client/"
  "/components/"
  "/hooks/"
  "/ui/"
  "/utils/client"
  "/features/.*/components/"
  "/features/.*/hooks/"
  "app/.*\.(tsx|jsx)$"  # App Router components (not API)
)

# Server-side patterns (CAN access database)
SERVER_PATTERNS=(
  "/server/"
  "/api/"
  "app/api/"
  "/middleware/"
  "/lib/server"
  "/services/"
  "/db/"
  "\.server\.(ts|js)"  # Files explicitly marked as server
  "route\.(ts|js)$"     # App Router API routes
)

# Check if file is in client-side location
for pattern in "${CLIENT_PATTERNS[@]}"; do
  if echo "$FILE_PATH" | grep -Eq "$pattern"; then
    IS_CLIENT_SIDE=1
    break
  fi
done

# If client-side, check if it's NOT in server override
if [[ $IS_CLIENT_SIDE -eq 1 ]]; then
  for pattern in "${SERVER_PATTERNS[@]}"; do
    if echo "$FILE_PATH" | grep -Eq "$pattern"; then
      IS_CLIENT_SIDE=0  # Override: actually server-side
      break
    fi
  done
fi

# If not detected as client-side, allow (default: trust server placement)
if [[ $IS_CLIENT_SIDE -eq 0 ]]; then
  exit 0
fi

# Client-side file is accessing database - BLOCK
echo "❌ BLOCKED: Client-Side Database Access Violation" >&2
echo "" >&2
echo "AAA Architecture Requirement: Database access only from server code" >&2
echo "" >&2
echo "Violation: Direct database query in client-side file" >&2
echo "File: ${FILE_PATH}" >&2
echo "" >&2
echo "Why this matters:" >&2
echo "  • Exposes database structure to client (security risk)" >&2
echo "  • No server-side validation of queries" >&2
echo "  • RLS policies can be bypassed with client manipulation" >&2
echo "  • Can't rate-limit or audit database access" >&2
echo "  • Difficult to optimize and cache queries" >&2
echo "" >&2
echo "Fix: Use API routes for database access" >&2
echo "  1. Create API route in app/api/ or src/server/api/" >&2
echo "  2. API route performs database query with validation" >&2
echo "  3. Client calls API route via fetch/axios" >&2
echo "  4. API route returns sanitized data" >&2
echo "" >&2
echo "Example:" >&2
echo "  ❌ BAD (client component):" >&2
echo "     const { data } = await supabase.from('players').select()" >&2
echo "" >&2
echo "  ✅ GOOD (API route):" >&2
echo "     // app/api/players/route.ts" >&2
echo "     export async function GET() {" >&2
echo "       const { data } = await supabase.from('players').select()" >&2
echo "       return Response.json(data)" >&2
echo "     }" >&2
echo "" >&2
echo "     // components/PlayerList.tsx" >&2
echo "     const data = await fetch('/api/players')" >&2
echo "" >&2
echo "See: @knowledge_base/platform/how_to/maintain_server_authority.md" >&2
exit 2
