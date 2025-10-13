#!/bin/bash
# Stop Hook: Scan for Incomplete Patterns
# Scans entire codebase after Claude stops responding
# Output is injected back into Claude's context

echo "=== Quality Scan ==="

# Find all code files (excluding node_modules, .git, etc.)
CODE_FILES=$(find . -type f \( -name "*.ts" -o -name "*.js" -o -name "*.py" -o -name "*.cpp" -o -name "*.go" -o -name "*.rs" \) \
  ! -path "*/node_modules/*" \
  ! -path "*/.git/*" \
  ! -path "*/dist/*" \
  ! -path "*/build/*" \
  ! -path "*/__pycache__/*")

# Scan for incomplete patterns
ISSUES_FOUND=0

# TODO/FIXME comments
TODOS=$(echo "$CODE_FILES" | xargs grep -n "TODO:" 2>/dev/null | head -5)
if [[ -n "$TODOS" ]]; then
  echo "⚠️  Found TODO comments:"
  echo "$TODOS"
  echo ""
  ISSUES_FOUND=1
fi

FIXMES=$(echo "$CODE_FILES" | xargs grep -n "FIXME:" 2>/dev/null | head -5)
if [[ -n "$FIXMES" ]]; then
  echo "⚠️  Found FIXME comments:"
  echo "$FIXMES"
  echo ""
  ISSUES_FOUND=1
fi

# Debug statements
DEBUG_LOGS=$(echo "$CODE_FILES" | xargs grep -n "console\.log\|print(" 2>/dev/null | head -5)
if [[ -n "$DEBUG_LOGS" ]]; then
  echo "⚠️  Found debug statements:"
  echo "$DEBUG_LOGS"
  echo ""
  ISSUES_FOUND=1
fi

# Empty catch blocks
EMPTY_CATCHES=$(echo "$CODE_FILES" | xargs grep -A1 "catch" 2>/dev/null | grep -B1 "{ *}" | head -10)
if [[ -n "$EMPTY_CATCHES" ]]; then
  echo "⚠️  Found empty catch blocks:"
  echo "$EMPTY_CATCHES"
  echo ""
  ISSUES_FOUND=1
fi

# Commented code blocks (crude check)
COMMENTED_CODE=$(echo "$CODE_FILES" | xargs grep "^[ ]*\/\/" 2>/dev/null | wc -l)
if [[ $COMMENTED_CODE -gt 50 ]]; then
  echo "⚠️  Excessive commented code: $COMMENTED_CODE lines"
  echo "Consider removing unused code instead of commenting"
  echo ""
  ISSUES_FOUND=1
fi

if [[ $ISSUES_FOUND -eq 0 ]]; then
  echo "✅ No incomplete patterns found"
fi

echo "===================="

# Always exit 0 (informational only)
exit 0
