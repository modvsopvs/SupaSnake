#!/bin/bash
# PreToolUse Hook: Enforce Config Constants
# Prevents hard-coded game balance values (AAA 2026 standard)
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

# Skip if this IS the config file itself
if echo "$FILE_PATH" | grep -Eq "config/game\.(ts|js)|gameConfig\.(ts|js)|constants/game"; then
  exit 0
fi

# Skip non-game files (UI components, utilities, tests)
if echo "$FILE_PATH" | grep -Eq "/components/|/ui/|/utils/|\.test\.|\.spec\.|/styles/"; then
  exit 0
fi

# Game balance constant patterns (indicate hard-coded values)
# Format: const CONSTANT_NAME = number (with game-related name)
BALANCE_PATTERNS=(
  "DNA_COST.*="
  "DNA_REWARD.*="
  "DNA_PRICE.*="
  "SPAWN_RATE.*="
  "DROP_RATE.*="
  "ENERGY_COST.*="
  "ENERGY_MAX.*="
  "ENERGY_REGEN.*="
  "SCORE_MULTIPLIER.*="
  "DIFFICULTY_.*="
  "RARITY_.*CHANCE.*="
  "BREEDING_COST.*="
  "EVOLUTION_COST.*="
  "UNLOCK_COST.*="
  "PRICE_.*="
  "COST_.*="
  "MAX_ENERGY.*="
  "MAX_DNA.*="
  "BASE_DAMAGE.*="
  "BASE_HEALTH.*="
  "LEVEL_.*_REQUIREMENT.*="
)

# Check for hard-coded game balance constants
for pattern in "${BALANCE_PATTERNS[@]}"; do
  if echo "$TEXT" | grep -Eq "const\s+${pattern}\s*[0-9]+|let\s+${pattern}\s*[0-9]+"; then
    echo "❌ BLOCKED: Hard-Coded Game Constant" >&2
    echo "" >&2
    echo "AAA Architecture Requirement: Game balance values in centralized config" >&2
    echo "" >&2
    echo "Violation: Hard-coded game balance constant (pattern: $pattern)" >&2
    echo "File: ${FILE_PATH}" >&2
    echo "" >&2
    echo "Why this matters:" >&2
    echo "  • Can't tune balance without code changes" >&2
    echo "  • Can't A/B test different values" >&2
    echo "  • Can't hot-fix balance issues in production" >&2
    echo "  • Constants scattered across codebase" >&2
    echo "  • Difficult to track and audit balance" >&2
    echo "" >&2
    echo "Fix: Move to game config file" >&2
    echo "  1. Add constant to src/shared/config/game.ts" >&2
    echo "  2. Import from config: import { GAME_CONFIG } from '@/config/game'" >&2
    echo "  3. Use: GAME_CONFIG.economy.dnaCost" >&2
    echo "" >&2
    echo "Example:" >&2
    echo "  ❌ BAD (hard-coded):" >&2
    echo "     const DNA_COST = 50" >&2
    echo "     const DNA_REWARD = 10" >&2
    echo "" >&2
    echo "  ✅ GOOD (config file - src/shared/config/game.ts):" >&2
    echo "     export const GAME_CONFIG = {" >&2
    echo "       economy: {" >&2
    echo "         dnaCost: 50," >&2
    echo "         dnaReward: 10," >&2
    echo "       }" >&2
    echo "     }" >&2
    echo "" >&2
    echo "  ✅ GOOD (usage):" >&2
    echo "     import { GAME_CONFIG } from '@/config/game'" >&2
    echo "     const cost = GAME_CONFIG.economy.dnaCost" >&2
    echo "" >&2
    echo "Allowed constants:" >&2
    echo "  ✅ UI constants (padding, sizes, colors)" >&2
    echo "  ✅ Algorithm constants (math formulas)" >&2
    echo "  ✅ Component-local constants" >&2
    echo "  ❌ Game balance, economy, or progression values" >&2
    echo "" >&2
    echo "See: src/shared/config/game.ts.template for structure" >&2
    exit 2
  fi
done

# No hard-coded game constants detected - allow
exit 0
