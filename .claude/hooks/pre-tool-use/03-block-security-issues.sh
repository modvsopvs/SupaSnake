#!/bin/bash
# PreToolUse Hook: Block Security Issues
# Prevents common security vulnerabilities
# Exit 0: Allow, Exit 2: BLOCK

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')
NEW_STRING=$(echo "$INPUT" | jq -r '.tool_input.new_string // empty')

# Only check Write and Edit tools
if [[ "$TOOL_NAME" != "Write" && "$TOOL_NAME" != "Edit" ]]; then
  exit 0
fi

# Combine content
TEXT="$CONTENT$NEW_STRING"

# Skip if no text
if [[ -z "$TEXT" ]]; then
  exit 0
fi

# Check for hard-coded password
if echo "$TEXT" | grep -Eq 'password[[:space:]]*=[[:space:]]*["\047]'; then
  echo "❌ BLOCKED: Hard-coded password detected" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Use environment variables or secure vaults" >&2
  exit 2
fi

# Check for hard-coded API key
if echo "$TEXT" | grep -Eq 'api[_-]?key[[:space:]]*=[[:space:]]*["\047]'; then
  echo "❌ BLOCKED: Hard-coded API key detected" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Use environment variables" >&2
  exit 2
fi

# Check for hard-coded secret
if echo "$TEXT" | grep -Eq 'secret[[:space:]]*=[[:space:]]*["\047]'; then
  echo "❌ BLOCKED: Hard-coded secret detected" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Use environment variables" >&2
  exit 2
fi

# Check for hard-coded token
if echo "$TEXT" | grep -Eq 'token[[:space:]]*=[[:space:]]*["\047]'; then
  echo "❌ BLOCKED: Hard-coded token detected" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Use environment variables" >&2
  exit 2
fi

# Check for SQL concatenation
if echo "$TEXT" | grep -Eq 'SELECT.*\+|INSERT.*\+|UPDATE.*\+'; then
  echo "❌ BLOCKED: SQL concatenation detected (injection risk)" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Use parameterized queries" >&2
  exit 2
fi

# Check for eval() usage
if echo "$TEXT" | grep -Eq 'eval\('; then
  echo "❌ BLOCKED: eval() usage detected" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Avoid eval(), use safer alternatives" >&2
  exit 2
fi

# Check for exec() usage
if echo "$TEXT" | grep -Eq 'exec\('; then
  echo "❌ BLOCKED: exec() usage detected" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Avoid exec(), use safer alternatives" >&2
  exit 2
fi

# Check for innerHTML (XSS risk)
if echo "$TEXT" | grep -Eq 'innerHTML[[:space:]]*='; then
  echo "❌ BLOCKED: innerHTML usage detected (XSS risk)" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Use textContent or sanitize HTML" >&2
  exit 2
fi

# Check for dangerouslySetInnerHTML (XSS risk)
if echo "$TEXT" | grep -Eq 'dangerouslySetInnerHTML'; then
  echo "❌ BLOCKED: dangerouslySetInnerHTML usage detected" >&2
  echo "" >&2
  echo "Platform Requirement: Zero critical security issues" >&2
  echo "Fix: Sanitize HTML or use safer alternatives" >&2
  exit 2
fi

# Allow write
exit 0
