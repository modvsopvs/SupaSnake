#!/bin/bash
# PreToolUse Hook: Require Context for Implementation
# Enforces Rule #1: Must have context before implementing
# Exit 0: Allow, Exit 2: BLOCK

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only check Write/Edit tools on implementation files (not docs, not state)
if [[ "$TOOL_NAME" != "Write" && "$TOOL_NAME" != "Edit" ]]; then
  exit 0
fi

# Skip if writing to state/ or docs/ (allowed without context)
if [[ "$FILE_PATH" =~ /state/ ]] || [[ "$FILE_PATH" =~ /docs/ ]] || [[ "$FILE_PATH" =~ \.claude ]]; then
  exit 0
fi

# Skip if writing context plan itself
if [[ "$FILE_PATH" =~ context_plan.*\.json ]]; then
  exit 0
fi

# Skip knowledge_base writes (documentation work)
if [[ "$FILE_PATH" =~ ^knowledge_base/ ]]; then
  exit 0
fi

# Find most recent context plan
CONTEXT_PLAN=$(ls -t state/context_plan_*.json 2>/dev/null | head -1)

# Check if plan exists
if [[ ! -f "$CONTEXT_PLAN" ]]; then
  echo "❌ BLOCKED: No context plan found" >&2
  echo "" >&2
  echo "Rule #1: Must load context before implementing" >&2
  echo "" >&2
  echo "Fix: Create context plan with required knowledge base files" >&2
  echo "  1. Analyze what context you need" >&2
  echo "  2. Create state/context_plan_<timestamp>.json" >&2
  echo "  3. Load required files" >&2
  echo "  4. Then implement" >&2
  exit 2
fi

# Check if plan has any required context
REQUIRED_COUNT=$(jq '.required_context | length' "$CONTEXT_PLAN")
if [[ "$REQUIRED_COUNT" -eq 0 ]]; then
  echo "⚠️  Warning: Context plan has no required files" >&2
  echo "Allowing write, but verify you have necessary context" >&2
  exit 0
fi

# Check if required context is loaded
LOADED_COUNT=$(jq '.loaded | length' "$CONTEXT_PLAN")

if [[ "$LOADED_COUNT" -eq 0 ]]; then
  echo "❌ BLOCKED: Context plan created but nothing loaded yet" >&2
  echo "" >&2
  echo "Plan requires:" >&2
  jq -r '.required_context[]? | "  - \(.file) (\(.reason))"' "$CONTEXT_PLAN" >&2
  echo "" >&2
  echo "Rule #1: Load required context before implementing" >&2
  echo "" >&2
  echo "Fix: Read the required files first" >&2
  exit 2
fi

# Check if all critical files loaded
CRITICAL_FILES=$(jq -r '.required_context[]? | select(.priority == "critical") | .file' "$CONTEXT_PLAN")
LOADED_FILES=$(jq -r '.loaded[]?' "$CONTEXT_PLAN")

MISSING_CRITICAL=()
while IFS= read -r critical; do
  if [[ -n "$critical" ]] && ! echo "$LOADED_FILES" | grep -q "^${critical}$"; then
    MISSING_CRITICAL+=("$critical")
  fi
done <<< "$CRITICAL_FILES"

if [[ ${#MISSING_CRITICAL[@]} -gt 0 ]]; then
  echo "❌ BLOCKED: Critical context files not loaded" >&2
  echo "" >&2
  echo "Missing:" >&2
  for file in "${MISSING_CRITICAL[@]}"; do
    REASON=$(jq -r --arg file "$file" \
      '.required_context[]? | select(.file == $file) | .reason' "$CONTEXT_PLAN")
    echo "  - $file ($REASON)" >&2
  done
  echo "" >&2
  echo "Rule #1: Must have all critical context before implementing" >&2
  echo "" >&2
  echo "Fix: Read the missing files first" >&2
  exit 2
fi

# Mark plan as complete
jq '.status = "loaded"' "$CONTEXT_PLAN" > "${CONTEXT_PLAN}.tmp"
mv "${CONTEXT_PLAN}.tmp" "$CONTEXT_PLAN"

# Allow write
echo "✓ Context verified for implementation"
exit 0
