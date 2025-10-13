# Hook Testing - Quick Reference

## Quick Test Method

Test any hook manually before deploying:

```bash
# 1. Create test input
cat > /tmp/test_input.json <<EOF
{
  "tool_name": "Write",
  "tool_input": {
    "file_path": "test.ts",
    "content": "function test() {\n  // Incomplete: implement\n}"
  }
}
EOF

# 2. Run hook
cat /tmp/test_input.json | .claude/hooks/pre-tool-use/01-block-incomplete-code.sh

# 3. Check exit code
echo "Exit code: $?"

# Expected for PreToolUse:
# - exit 0 = Allow (good code)
# - exit 1 = Block (bad code)
```

## Creating a New Hook

```bash
# 1. Create file
touch .claude/hooks/pre-tool-use/04-your-hook.sh
chmod +x .claude/hooks/pre-tool-use/04-your-hook.sh

# 2. Basic template
#!/bin/bash
# Hook Name: Your Hook
# Type: PreToolUse
# Purpose: [What this hook does]
# Exit 0: Allow, Exit 1: BLOCK

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')

# Skip if not relevant
if [[ "$TOOL_NAME" != "Write" ]]; then
  exit 0
fi

# Your validation logic
if [[ "$CONTENT" =~ YOUR_PATTERN ]]; then
  echo "❌ BLOCKED: Your reason"
  echo ""
  echo "Fix: Your guidance"
  exit 1
fi

exit 0

# 3. Test it (see above)

# 4. Register in .claude/settings.local.json
```

## Common Patterns

**Block incomplete code:**
```bash
# Check for placeholder comments
if echo "$CONTENT" | grep -q "T0D0:"; then
  echo "❌ BLOCKED: Contains placeholder"
  exit 1
fi
```

**Require tests:**
```bash
TEST_FILE="${FILE_PATH%.ts}.test.ts"
if [[ ! -f "$TEST_FILE" ]]; then
  echo "❌ BLOCKED: No test file"
  exit 1
fi
```

**Auto-format (PostToolUse only):**
```bash
if [[ "$FILE_PATH" =~ \.(ts|js)$ ]]; then
  prettier --write "$FILE_PATH"
  echo "✓ Formatted: $FILE_PATH"
fi
```

## Debugging Failed Hooks

```bash
# Add at start of hook
set -x  # Print commands
set -e  # Exit on error

# Check permissions
ls -l .claude/hooks/pre-tool-use/your-hook.sh
# Should show: -rwxr-xr-x

# If not executable:
chmod +x .claude/hooks/pre-tool-use/your-hook.sh

# Time execution
time cat test.json | .claude/hooks/pre-tool-use/your-hook.sh
# Should be < 1 second typical, < 5 seconds max
```

## Hook Best Practices

✅ **DO:**
- Keep hooks fast (<1 second)
- Use clear error messages
- Test with multiple inputs
- Quote shell variables
- Handle missing fields gracefully

❌ **DON'T:**
- Block on minor issues (preferences)
- Perform expensive operations
- Access external services
- Modify files in PreToolUse
- Use eval on user input

**See:** @knowledge_base/platform/reference/hooks_guide_full.md for complete guide
