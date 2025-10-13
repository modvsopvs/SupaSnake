#!/bin/bash
# PreToolUse Hook: Require Tests
# Blocks new functions without corresponding tests
# Exit 0: Allow, Exit 2: BLOCK

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')
NEW_STRING=$(echo "$INPUT" | jq -r '.tool_input.new_string // empty')

# Only check Write and Edit tools
if [[ "$TOOL_NAME" != "Write" && "$TOOL_NAME" != "Edit" ]]; then
  exit 0
fi

# Skip if no file path
if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

# Skip test files themselves
if [[ "$FILE_PATH" =~ test_ || "$FILE_PATH" =~ _test\. || "$FILE_PATH" =~ \.test\. || "$FILE_PATH" =~ /tests?/ ]]; then
  exit 0
fi

# Skip non-code files
if [[ ! "$FILE_PATH" =~ \.(ts|js|py|cpp|java|go|rs)$ ]]; then
  exit 0
fi

# Combine content
TEXT="$CONTENT$NEW_STRING"

# Extract function definitions
FUNCTIONS=()

# TypeScript/JavaScript functions
if [[ "$FILE_PATH" =~ \.(ts|js)$ ]]; then
  FUNCTIONS+=($(echo "$TEXT" | grep -E "(function |const .* = |export function |async function )" | sed 's/.*function \([a-zA-Z_][a-zA-Z0-9_]*\).*/\1/' | sed 's/.*const \([a-zA-Z_][a-zA-Z0-9_]*\) =.*/\1/'))
fi

# Python functions
if [[ "$FILE_PATH" =~ \.py$ ]]; then
  FUNCTIONS+=($(echo "$TEXT" | grep -E "^def " | sed 's/def \([a-zA-Z_][a-zA-Z0-9_]*\).*/\1/'))
fi

# C++ functions
if [[ "$FILE_PATH" =~ \.cpp$ ]]; then
  FUNCTIONS+=($(echo "$TEXT" | grep -E "^[a-zA-Z_].*\(" | sed 's/\(.*\)(.*/\1/' | awk '{print $NF}'))
fi

# If no functions found, allow (not a code file)
if [[ ${#FUNCTIONS[@]} -eq 0 ]]; then
  exit 0
fi

# Determine test file path
TEST_FILE=""
if [[ "$FILE_PATH" =~ \.ts$ ]]; then
  TEST_FILE="${FILE_PATH%.ts}.test.ts"
elif [[ "$FILE_PATH" =~ \.js$ ]]; then
  TEST_FILE="${FILE_PATH%.js}.test.js"
elif [[ "$FILE_PATH" =~ \.py$ ]]; then
  TEST_FILE="tests/test_$(basename $FILE_PATH)"
elif [[ "$FILE_PATH" =~ \.cpp$ ]]; then
  TEST_FILE="tests/test_$(basename $FILE_PATH)"
fi

# Check if test file exists
if [[ ! -f "$TEST_FILE" ]]; then
  echo "❌ BLOCKED: No test file found for $FILE_PATH" >&2
  echo "" >&2
  echo "Platform Requirement: All code must have tests (≥95% coverage)" >&2
  echo "Expected test file: $TEST_FILE" >&2
  echo "" >&2
  echo "Fix: Create test file with tests for:" >&2
  for func in "${FUNCTIONS[@]}"; do
    echo "  - $func()" >&2
  done
  exit 2
fi

# Check if functions are tested (basic check)
TEST_CONTENT=$(cat "$TEST_FILE")
MISSING_TESTS=()

for func in "${FUNCTIONS[@]}"; do
  if ! echo "$TEST_CONTENT" | grep -q "$func"; then
    MISSING_TESTS+=("$func")
  fi
done

if [[ ${#MISSING_TESTS[@]} -gt 0 ]]; then
  echo "❌ BLOCKED: Missing tests for new functions" >&2
  echo "" >&2
  echo "Platform Requirement: All functions must be tested" >&2
  echo "Functions without tests:" >&2
  for func in "${MISSING_TESTS[@]}"; do
    echo "  - $func()" >&2
  done
  echo "" >&2
  echo "Fix: Add tests to $TEST_FILE" >&2
  exit 2
fi

# Allow write
exit 0
