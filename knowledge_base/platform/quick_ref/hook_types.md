# Hook Types - Quick Reference

## Overview

Hooks enforce quality at different lifecycle points. Choose the right type for your use case.

## Hook Types

| Hook Type | Can Block? | When Runs | Use Case |
|-----------|------------|-----------|----------|
| **PreToolUse** | ✅ Yes | Before Write/Edit | Block incomplete code, security issues |
| **PostToolUse** | ❌ No | After Write/Edit | Auto-format, run linters |
| **Stop** | ❌ No | When Claude finishes | Scan entire codebase, comprehensive validation |
| **SubagentStop** | ❌ No | After sub-agent completes | Validate review thoroughness |
| **UserPromptSubmit** | ❌ No | Before Claude sees prompt | Inject quality standards |
| **PreCompact** | ❌ No | Before context compaction | Save critical state |

## Decision Guide

**Need to PREVENT bad code from being written?**
→ Use **PreToolUse** (blocks operations)

**Need to IMPROVE code after writing?**
→ Use **PostToolUse** (auto-formats, lints)

**Need to CHECK overall state?**
→ Use **Stop** (scans entire codebase)

**Need to ensure THOROUGH reviews?**
→ Use **SubagentStop** (validates sub-agent output)

**Need to SET expectations?**
→ Use **UserPromptSubmit** (injects context)

**Need to PRESERVE state during long sessions?**
→ Use **PreCompact** (saves before context loss)

## Exit Codes

**PreToolUse (CRITICAL):**
- `exit 0` = Allow operation
- `exit 1` = BLOCK operation (file never written)

**All Other Hooks:**
- Exit codes are informational only
- Cannot block operations
- Output shown to Claude

## Key Principle

**PreToolUse** is your quality gate - it's the ONLY hook that can prevent bad code from being written. Use it for critical standards.

**See:** @knowledge_base/platform/reference/hooks_guide_full.md for complete details
