#!/bin/bash
# PreCompact Hook: Update CLAUDE.md Current Work Section
# Preserves Invariants section, updates only Current Work with git context
# Exit 0: Always (non-blocking)

CLAUDE_MD="CLAUDE.md"
BACKUP="CLAUDE.md.backup"

# Backup
cp "$CLAUDE_MD" "$BACKUP" 2>/dev/null

# Get current context
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "main")
LAST_COMMIT=$(git log -1 --oneline 2>/dev/null || echo "No commits yet")
GIT_STATUS=$(git status --short 2>/dev/null | head -5 || echo "No changes")
RECENT_FILES=$(git diff --name-only HEAD~3..HEAD 2>/dev/null | head -5 || echo "No recent files")
TIMESTAMP=$(date +"%Y-%m-%d %H:%M")

# Extract existing Current Work content (preserve if possible)
FEATURE_LINE=$(grep "^\*\*Feature:\*\*" "$CLAUDE_MD" 2>/dev/null || echo "**Feature:** (Update needed)")
STATUS_LINE=$(grep "^\*\*Status:\*\*" "$CLAUDE_MD" 2>/dev/null || echo "**Status:** (Update needed)")
BLOCKER_LINE=$(grep "^\*\*Blocker:\*\*" "$CLAUDE_MD" 2>/dev/null || echo "**Blocker:** None")

# Find section boundaries
CURRENT_WORK_START=$(grep -n "## 🎯 Current Work" "$CLAUDE_MD" | cut -d: -f1)
NEXT_SECTION=$(tail -n +$((CURRENT_WORK_START + 1)) "$CLAUDE_MD" | grep -n "^---" | head -1 | cut -d: -f1)
NEXT_SECTION=$((CURRENT_WORK_START + NEXT_SECTION))

if [[ -n "$CURRENT_WORK_START" ]] && [[ -n "$NEXT_SECTION" ]]; then
  # Extract before Current Work (Invariants section)
  head -n $((CURRENT_WORK_START - 1)) "$CLAUDE_MD" > /tmp/claude_before.md

  # Extract after Current Work (rest of file)
  tail -n +$((NEXT_SECTION)) "$CLAUDE_MD" > /tmp/claude_after.md

  # Create updated Current Work section
  cat > /tmp/claude_current.md <<EOF
## 🎯 Current Work (Update After Each Milestone)

$FEATURE_LINE
$STATUS_LINE
$BLOCKER_LINE

**Last Auto-Update:** $TIMESTAMP
**Branch:** $CURRENT_BRANCH
**Last Commit:** $LAST_COMMIT

**Recent Changes:**
\`\`\`
$GIT_STATUS
\`\`\`

**Recent Files:**
\`\`\`
$RECENT_FILES
\`\`\`

**Note:** Update manually after milestones with specific feature info.
See templates/CURRENT_WORK_TEMPLATE.md for guidance.

**Recovery (After /clear or Auto-Compact):**
1. Check CLAUDE.md Current Work section (this section)
2. Read: \`cat .claude/session_state/precompact_*.md\` for detailed snapshot
3. Load relevant context as specified in Current Work
4. Resume from last commit or Next Action

EOF

  # Combine: before + updated current work + after
  cat /tmp/claude_before.md /tmp/claude_current.md /tmp/claude_after.md > "$CLAUDE_MD"

  echo "✓ CLAUDE.md Current Work section updated" >&2
  echo "  Branch: $CURRENT_BRANCH" >&2
  echo "  Last commit: $LAST_COMMIT" >&2
  echo "  Invariants: Preserved" >&2
else
  echo "⚠️  Could not find Current Work section markers" >&2
  echo "  Restoring backup..." >&2
  mv "$BACKUP" "$CLAUDE_MD" 2>/dev/null
fi

# Cleanup
rm -f /tmp/claude_before.md /tmp/claude_current.md /tmp/claude_after.md

exit 0
