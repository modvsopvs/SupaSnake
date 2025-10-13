#!/bin/bash
# PreToolUse Hook: Block Incomplete Code
# Prevents writing code with TODO/FIXME/placeholders
# Exit 0: Allow, Exit 2: BLOCK

# Read JSON input from stdin
INPUT=$(cat)

# Extract tool name and content
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
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

# Blocked patterns
INCOMPLETE_PATTERNS=(
  "TODO:"
  "FIXME:"
  "XXX:"
  "HACK:"
  "NotImplementedError"
  "throw new Error([\"']Not implemented"
  "return null; // implement"
  "return null # TODO"
  "pass  # TODO"
  "pass  # FIXME"
  "mock_"
  "stub_"
  "fake_"
  "placeholder_"
  "temp_function"
)

# Check each pattern
for pattern in "${INCOMPLETE_PATTERNS[@]}"; do
  if echo "$TEXT" | grep -q "$pattern"; then
    echo "❌ BLOCKED: Code contains incomplete pattern: $pattern" >&2
    echo "" >&2
    echo "Platform Requirement: All code must be production-ready" >&2
    echo "Found pattern indicating incomplete implementation" >&2
    echo "" >&2
    echo "Fix: Complete the implementation before committing" >&2
    echo "Remove TODO/FIXME comments and implement all functionality" >&2
    exit 2
  fi
done

# Allow write
exit 0
