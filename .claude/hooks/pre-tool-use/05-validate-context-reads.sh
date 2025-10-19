#!/bin/bash
# PreToolUse Hook: Validate Context Reads
# Enforces Rule #2: No context bloat
# Exit 0: Allow, Exit 2: BLOCK

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only validate knowledge_base reads
if [[ "$TOOL_NAME" != "Read" ]] || [[ ! "$FILE_PATH" =~ knowledge_base/ ]]; then
  exit 0
fi

# Find most recent context plan
CONTEXT_PLAN=$(ls -t state/context_plan_*.json 2>/dev/null | head -1)

# If no plan exists, require one for knowledge_base reads
if [[ ! -f "$CONTEXT_PLAN" ]]; then
  echo "❌ BLOCKED: No context plan found" >&2
  echo "" >&2
  echo "Rule #1: Must create context plan before loading" >&2
  echo "" >&2
  echo "Fix: Create state/context_plan_<timestamp>.json with:" >&2
  echo "  - query: What you're working on" >&2
  echo "  - required_context: Files you need" >&2
  echo "  - Consult MAP.md for correct files" >&2
  echo "" >&2
  echo "See @knowledge_base/MAP.md for query patterns" >&2
  exit 2
fi

# Check if this file is in the plan (required or optional)
FILE_IN_PLAN=$(jq -r --arg file "$FILE_PATH" \
  '.required_context[]? | select(.file == $file) | .file' "$CONTEXT_PLAN")

FILE_IN_OPTIONAL=$(jq -r --arg file "$FILE_PATH" \
  '.optional_context[]? | select(.file == $file) | .file' "$CONTEXT_PLAN")

if [[ -z "$FILE_IN_PLAN" && -z "$FILE_IN_OPTIONAL" ]]; then
  echo "❌ BLOCKED: File not in context plan" >&2
  echo "" >&2
  echo "Attempting to load: $FILE_PATH" >&2
  echo "" >&2
  echo "Required files in plan:" >&2
  jq -r '.required_context[]? | "  - \(.file) (\(.reason))"' "$CONTEXT_PLAN" >&2
  echo "" >&2
  echo "Optional files in plan:" >&2
  jq -r '.optional_context[]? | "  - \(.file) (\(.reason))"' "$CONTEXT_PLAN" >&2
  echo "" >&2
  echo "Rule #2: Only load planned context (prevents bloat)" >&2
  echo "" >&2
  echo "Fix: Either:" >&2
  echo "  1. Update context plan to include this file (if truly needed)" >&2
  echo "  2. Use a different file that's already in the plan" >&2
  echo "  3. Remove this read (if not needed)" >&2

  # Track blocked reads
  jq --arg file "$FILE_PATH" \
    '.blocked += [$file] | .blocked |= unique' \
    "$CONTEXT_PLAN" > "${CONTEXT_PLAN}.tmp" 2>/dev/null
  mv "${CONTEXT_PLAN}.tmp" "$CONTEXT_PLAN" 2>/dev/null

  exit 2
fi

# Update plan: add to loaded array
jq --arg file "$FILE_PATH" \
  '.loaded += [$file] | .loaded |= unique' \
  "$CONTEXT_PLAN" > "${CONTEXT_PLAN}.tmp"
mv "${CONTEXT_PLAN}.tmp" "$CONTEXT_PLAN"

# Allow read
echo "✓ Context read validated: $(basename "$FILE_PATH")"
exit 0
