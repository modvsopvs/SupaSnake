#!/bin/bash
# PostToolUse Hook: Auto-Format and Lint
# Automatically formats code after writes
# Exit 0: Always (warnings only, never blocks)

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only process Write and Edit tools
if [[ "$TOOL_NAME" != "Write" && "$TOOL_NAME" != "Edit" ]]; then
  exit 0
fi

# Skip if no file path
if [[ -z "$FILE_PATH" || ! -f "$FILE_PATH" ]]; then
  exit 0
fi

# Format based on file type
if [[ "$FILE_PATH" =~ \.(ts|js|tsx|jsx)$ ]]; then
  # TypeScript/JavaScript: prettier + eslint
  if command -v prettier &> /dev/null; then
    prettier --write "$FILE_PATH" 2>/dev/null
    echo "✓ Formatted with prettier: $FILE_PATH"
  fi

  if command -v eslint &> /dev/null; then
    eslint --fix "$FILE_PATH" 2>/dev/null || echo "⚠ ESLint warnings in $FILE_PATH"
  fi

elif [[ "$FILE_PATH" =~ \.py$ ]]; then
  # Python: black + pylint
  if command -v black &> /dev/null; then
    black "$FILE_PATH" 2>/dev/null
    echo "✓ Formatted with black: $FILE_PATH"
  fi

  if command -v pylint &> /dev/null; then
    pylint "$FILE_PATH" 2>/dev/null || echo "⚠ Pylint warnings in $FILE_PATH"
  fi

elif [[ "$FILE_PATH" =~ \.(cpp|hpp|cc|h)$ ]]; then
  # C++: clang-format
  if command -v clang-format &> /dev/null; then
    clang-format -i "$FILE_PATH"
    echo "✓ Formatted with clang-format: $FILE_PATH"
  fi

elif [[ "$FILE_PATH" =~ \.go$ ]]; then
  # Go: gofmt
  if command -v gofmt &> /dev/null; then
    gofmt -w "$FILE_PATH"
    echo "✓ Formatted with gofmt: $FILE_PATH"
  fi

elif [[ "$FILE_PATH" =~ \.rs$ ]]; then
  # Rust: rustfmt
  if command -v rustfmt &> /dev/null; then
    rustfmt "$FILE_PATH"
    echo "✓ Formatted with rustfmt: $FILE_PATH"
  fi
fi

# Always allow (warnings only)
exit 0
