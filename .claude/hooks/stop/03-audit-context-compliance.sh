#!/bin/bash
# Stop Hook: Audit Context Compliance
# Checks Rule #1 and Rule #2 adherence

PROJECT_DIR=$(pwd)

# Find most recent context plan
CONTEXT_PLAN=$(ls -t state/context_plan_*.json 2>/dev/null | head -1)

if [[ ! -f "$CONTEXT_PLAN" ]]; then
  # No context plan - check if this was a simple query or implementation work
  # If implementation files were modified, this is a problem

  IMPL_FILES_MODIFIED=$(git diff --cached --name-only 2>/dev/null | \
    grep -v -E "^(state/|docs/|\.claude/|README|knowledge_base/)" || echo "")

  if [[ -n "$IMPL_FILES_MODIFIED" ]]; then
    echo "⚠️  Context Compliance Warning"
    echo ""
    echo "Implementation files modified without context plan:"
    echo "$IMPL_FILES_MODIFIED"
    echo ""
    echo "Rule #1: Should create context plan before implementing"
    echo "This may indicate working without proper context"
  fi

  exit 0
fi

# Check if context was loaded
STATUS=$(jq -r '.status' "$CONTEXT_PLAN")
LOADED_COUNT=$(jq '.loaded | length' "$CONTEXT_PLAN")
REQUIRED_COUNT=$(jq '.required_context | length' "$CONTEXT_PLAN")

echo "=== Context Compliance Audit ==="
echo ""
echo "Query: $(jq -r '.query' "$CONTEXT_PLAN")"
echo "Status: $STATUS"
echo "Required files: $REQUIRED_COUNT"
echo "Loaded files: $LOADED_COUNT"
echo ""

if [[ "$STATUS" == "pending" ]]; then
  echo "⚠️  Context plan created but never executed"
  echo "Plan was created but no files were loaded"
  echo "Rule #1: Should load planned context before working"
fi

if [[ "$STATUS" == "loaded" ]]; then
  echo "✅ Context properly loaded before implementation"
  echo ""
  echo "Loaded files:"
  jq -r '.loaded[]? | "  - \(.)"' "$CONTEXT_PLAN"
fi

# Check for blocked loads (Rule #2 enforcement)
BLOCKED_COUNT=$(jq '.blocked | length' "$CONTEXT_PLAN" 2>/dev/null || echo "0")
if [[ "$BLOCKED_COUNT" -gt 0 ]]; then
  echo ""
  echo "✅ Rule #2: Blocked $BLOCKED_COUNT inappropriate load(s) (prevented bloat)"
  echo "Blocked files:"
  jq -r '.blocked[]? | "  - \(.)"' "$CONTEXT_PLAN"
fi

echo "==============================="
exit 0
