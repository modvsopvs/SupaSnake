#!/bin/bash
# PreToolUse Hook: Enforce Server Authority
# Prevents localStorage usage for game state (AAA 2026 standard)
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

# Check if file uses localStorage
if ! echo "$TEXT" | grep -Eq 'localStorage\.(get|set|remove)Item|localStorage\['; then
  exit 0  # No localStorage usage, allow
fi

# Game state patterns that MUST NOT be in localStorage
# These indicate server authority violations
GAME_STATE_PATTERNS=(
  "dna"
  "DNA"
  "variant"
  "score"
  "points"
  "currency"
  "coins"
  "gems"
  "player"
  "inventory"
  "collection"
  "unlock"
  "achievement"
  "progress"
  "level"
  "xp"
  "experience"
  "stat"
  "energy"
  "stamina"
  "gameState"
  "game_state"
  "breeding"
  "evolution"
  "lab"
  "snake"
  "highScore"
  "leaderboard"
)

# Check if localStorage is used with game state keys
for pattern in "${GAME_STATE_PATTERNS[@]}"; do
  # Case-insensitive check for localStorage with game state key
  if echo "$TEXT" | grep -Eiq "localStorage\.(get|set|remove)Item\s*\(\s*['\"].*${pattern}|localStorage\[['\"

].*${pattern}"; then
    echo "❌ BLOCKED: Server Authority Violation" >&2
    echo "" >&2
    echo "AAA Architecture Requirement: Game state must be server-authoritative" >&2
    echo "" >&2
    echo "Violation: localStorage used for game state (pattern: $pattern)" >&2
    echo "File: ${FILE_PATH:-unknown}" >&2
    echo "" >&2
    echo "Why this matters:" >&2
    echo "  • Players can manipulate localStorage (cheating)" >&2
    echo "  • No server validation of state changes" >&2
    echo "  • Data loss if localStorage cleared" >&2
    echo "  • Impossible to sync across devices" >&2
    echo "  • Breaks multiplayer/leaderboards" >&2
    echo "" >&2
    echo "Fix: Use server-side storage instead" >&2
    echo "  1. Store in database via API route" >&2
    echo "  2. Use Supabase realtime for sync" >&2
    echo "  3. Client only displays server state" >&2
    echo "" >&2
    echo "Allowed localStorage usage:" >&2
    echo "  ✅ UI preferences (theme, volume, language)" >&2
    echo "  ✅ Input settings (controls, sensitivity)" >&2
    echo "  ✅ Tutorial completion flags" >&2
    echo "  ✅ Analytics consent" >&2
    echo "  ❌ Any game state, progress, or economy" >&2
    echo "" >&2
    echo "See: @knowledge_base/platform/how_to/maintain_server_authority.md" >&2
    exit 2
  fi
done

# localStorage used but no game state patterns detected - allow
# (Likely UI preferences, which are legitimate)
exit 0
