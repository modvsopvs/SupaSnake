# How to Create a Custom Hook

**Goal:** Create, test, and deploy a custom quality enforcement hook.

**Time required:** 15-30 minutes

---

## Overview

Hooks are executable scripts that enforce quality standards at specific lifecycle points. PreToolUse hooks can BLOCK operations, making them your primary quality gate.

**Use hooks for:** Preventing bad patterns, requiring tests, enforcing security, auto-formatting code.

---

## Step-by-Step Process

### Step 1: Identify Hook Type

**Choose based on your need:**

**PreToolUse** (Can BLOCK ✅)
- Prevent incomplete code patterns
- Require tests before allowing writes
- Block security vulnerabilities
- Enforce naming conventions

**PostToolUse** (Informational only)
- Auto-format code after writing
- Run linters
- Update metadata files

**Stop** (Informational only)
- Scan entire codebase when Claude finishes
- Comprehensive validation
- Generate reports

**Decision guide:**
- Need to PREVENT bad code? → PreToolUse
- Need to IMPROVE code after writing? → PostToolUse
- Need to CHECK overall state? → Stop

### Step 2: Create Hook Script

**File location:**
```bash
# PreToolUse hooks
.claude/hooks/pre-tool-use/04-your-hook-name.sh

# PostToolUse hooks
.claude/hooks/post-tool-use/02-your-hook-name.sh

# Stop hooks
.claude/hooks/stop/02-your-hook-name.sh

# Numbering: 01, 02, 03... determines execution order
```

**Create file:**
```bash
touch .claude/hooks/pre-tool-use/04-block-short-files.sh
chmod +x .claude/hooks/pre-tool-use/04-block-short-files.sh
```

### Step 3: Write Hook Logic

**Basic template:**
```bash
#!/bin/bash
# Hook Name: Block Short Files
# Type: PreToolUse
# Purpose: Prevent writing suspiciously short files
# Exit 0: Allow, Exit 1: BLOCK

INPUT=$(cat)

# Extract fields using jq
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')

# Skip if not relevant tool
if [[ "$TOOL_NAME" != "Write" ]]; then
  exit 0
fi

# Skip non-code files
if [[ ! "$FILE_PATH" =~ \.(ts|js|py|cpp)$ ]]; then
  exit 0
fi

# Skip test files (can be short)
if [[ "$FILE_PATH" =~ test_ || "$FILE_PATH" =~ \.test\. ]]; then
  exit 0
fi

# Count lines
LINE_COUNT=$(echo "$CONTENT" | wc -l)
MIN_LINES=10

if [[ $LINE_COUNT -lt $MIN_LINES ]]; then
  echo "❌ BLOCKED: File too short ($LINE_COUNT lines)"
  echo ""
  echo "Platform Requirement: Code files should be substantial"
  echo "Files under $MIN_LINES lines are often incomplete"
  echo ""
  echo "Fix: Complete the implementation or add documentation"
  exit 1
fi

# Allow write
exit 0
```

**Key elements:**
1. Read JSON from stdin: `INPUT=$(cat)`
2. Extract fields with jq: `$(echo "$INPUT" | jq -r '.tool_name')`
3. Skip irrelevant cases: Exit 0 early
4. Check for your pattern
5. Block with clear message: Echo explanation, exit 1
6. Allow if passed: Exit 0

### Step 4: Test Hook Manually

**Create test input:**
```bash
# Test case 1: Should block (short file)
cat > /tmp/test_short.json <<EOF
{
  "tool_name": "Write",
  "tool_input": {
    "file_path": "test.ts",
    "content": "function test() {\n  return 42;\n}"
  }
}
EOF

# Run hook
cat /tmp/test_short.json | .claude/hooks/pre-tool-use/04-block-short-files.sh

# Check exit code
echo "Exit code: $?"
# Expected: 1 (blocked)
```

**Test edge cases:**
- Empty input
- Missing fields
- Different tool names
- Different file types
- Already existing files

### Step 5: Register Hook

**Add to .claude/settings.local.json:**
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Write|Edit|MultiEdit",
        "hooks": [
          {
            "type": "command",
            "command": "/Users/josefbell/Snake_2/.claude/hooks/pre-tool-use/01-block-incomplete-code.sh"
          },
          {
            "type": "command",
            "command": "/Users/josefbell/Snake_2/.claude/hooks/pre-tool-use/04-block-short-files.sh"
          }
        ]
      }
    ]
  }
}
```

**Important:**
- Use absolute paths
- Include in appropriate hook type section
- Matcher determines which tools trigger hook
- Multiple hooks run sequentially for PreToolUse

### Step 6: Test with Claude

**Integration test:**
1. Ask Claude to write a short file (< 10 lines)
2. Hook should block it
3. Claude sees error message
4. Claude should rewrite with more content
5. Hook allows the write

---

## Common Hook Patterns

### Pattern: Require Tests

```bash
# Determine test file path
TEST_FILE="${FILE_PATH%.ts}.test.ts"

# Check if test file exists
if [[ ! -f "$TEST_FILE" ]]; then
  echo "❌ BLOCKED: No test file found"
  echo "Expected: $TEST_FILE"
  exit 1
fi
```

### Pattern: Block Security Issues

```bash
# Check for hard-coded secrets
if echo "$CONTENT" | grep -Eq 'password\s*=\s*["'"'"'][^"'"'"']{3,}'; then
  echo "❌ BLOCKED: Hard-coded password detected"
  echo "Use environment variables: process.env.PASSWORD"
  exit 1
fi
```

### Pattern: Enforce Naming Conventions

```bash
# Check function naming (must be camelCase)
if echo "$CONTENT" | grep -Eq 'function [A-Z]'; then
  echo "❌ BLOCKED: Functions must use camelCase"
  echo "Found PascalCase function name"
  exit 1
fi
```

### Pattern: Auto-Format (PostToolUse)

```bash
# Format TypeScript/JavaScript files
if [[ "$FILE_PATH" =~ \.(ts|js)$ ]]; then
  if command -v prettier &> /dev/null; then
    prettier --write "$FILE_PATH" 2>/dev/null
    echo "✓ Formatted: $FILE_PATH"
  fi
fi
```

---

## Best Practices

✅ **DO:**
- Keep hooks fast (< 1 second)
- Write clear error messages with fix guidance
- Quote shell variables
- Handle missing fields gracefully
- Test thoroughly before deploying
- Use absolute paths in config

❌ **DON'T:**
- Block on minor issues (preferences)
- Perform expensive operations (recursive finds)
- Access external services (network calls)
- Modify files in PreToolUse (use PostToolUse)
- Use eval on user input

---

## Debugging Tips

**Hook not running:**
```bash
# Check permissions
ls -l .claude/hooks/pre-tool-use/04-block-short-files.sh
# Should show: -rwxr-xr-x

# If not executable:
chmod +x .claude/hooks/pre-tool-use/04-block-short-files.sh
```

**Hook too slow:**
```bash
# Time execution
time cat test.json | .claude/hooks/pre-tool-use/04-block-short-files.sh
# Should be < 1 second

# Optimize by reducing scope
# Don't: find . -name "*.ts" | xargs grep "pattern"
# Do: grep "pattern" <<< "$CONTENT"
```

**Wrong exit code:**
```bash
# Always use explicit exit
exit 0  # Allow
exit 1  # Block

# Don't rely on last command exit code
# BAD: if grep "pattern" "$FILE"; then echo "Found"; fi; exit $?
# GOOD: if grep "pattern" "$FILE"; then exit 1; fi; exit 0
```

---

## Quick Reference

**Create:** `touch .claude/hooks/pre-tool-use/04-name.sh && chmod +x`
**Template:** Read stdin, extract fields, check pattern, block or allow
**Test:** Create JSON input, run hook, check exit code
**Register:** Add to .claude/settings.local.json with absolute path
**Verify:** Test with Claude, ensure blocking works

---

**See also:**
- @knowledge_base/platform/quick_ref/hook_types.md (hook types)
- @knowledge_base/platform/quick_ref/hook_testing.md (testing guide)
- @knowledge_base/platform/reference/hooks_guide_full.md (complete reference)
