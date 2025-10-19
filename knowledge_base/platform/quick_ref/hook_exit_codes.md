# Hook Exit Codes - Quick Reference

## Critical: Correct Exit Codes

**PreToolUse hooks (BLOCKING):**
- `exit 0` = **Allow** operation (tool executes)
- `exit 2` = **BLOCK** operation (tool never executes)

**All other hooks (INFORMATIONAL):**
- Exit codes are informational only
- Cannot block operations
- Output shown to Claude

## ⚠️ Common Mistake: exit 1

**WRONG:**
```bash
if [[ "$CONTENT" =~ "incomplete" ]]; then
  echo "❌ BLOCKED: Incomplete code"
  exit 1  # DOES NOT BLOCK!
fi
```

**CORRECT:**
```bash
if [[ "$CONTENT" =~ "incomplete" ]]; then
  echo "❌ BLOCKED: Incomplete code"
  exit 2  # Actually blocks operation
fi
```

## Why This Matters

**Symptom:** Hook runs, shows error message, but file is still written.

**Root Cause:** `exit 1` is treated as informational error. Only `exit 2` prevents tool execution.

**Impact:** Silent quality failures - appears to enforce standards but doesn't.

## Real-World Example

During implementation of context validation hooks (2025-10-19), used `exit 1` instead of `exit 2`. Hooks appeared to run (showed blocking messages) but files were still written. Bug discovered during manual testing when operations succeeded despite "BLOCKED" messages.

**This mistake was made twice** - emphasizing importance of documentation.

## Template

```bash
#!/bin/bash
# PreToolUse Hook: [Name]
# Exit 0: Allow, Exit 2: BLOCK

INPUT=$(cat)

# Extract fields
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // empty')

# Skip if not relevant
if [[ "$TOOL_NAME" != "Write" ]]; then
  exit 0
fi

# Check for bad pattern
if [[ "$CONTENT" =~ "bad_pattern" ]]; then
  echo "❌ BLOCKED: [Reason]" >&2
  echo "" >&2
  echo "Fix: [Guidance]" >&2
  exit 2  # Must be 2, not 1!
fi

# Allow operation
exit 0
```

## Key Principle

**Only PreToolUse with exit 2 can prevent bad code from being written.**

All other hooks are informational and cannot enforce quality standards.

**See also:**
- @knowledge_base/platform/quick_ref/hook_types.md
- @knowledge_base/platform/reference/hooks_guide_full.md
