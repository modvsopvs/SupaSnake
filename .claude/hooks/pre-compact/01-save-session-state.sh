#!/bin/bash
# PreCompact Hook: Save Session State (Dynamic)
# Captures current work context, not static platform info
# Exit 0: Always (non-blocking)

# Create state directory
mkdir -p .claude/session_state

# Generate timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
STATE_FILE=".claude/session_state/precompact_${TIMESTAMP}.md"

# Extract current work from CLAUDE.md
CURRENT_WORK=$(awk '/## 🎯 Current Work/,/^---/' CLAUDE.md 2>/dev/null || echo "No current work section found")

# Get git context
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "main")
LAST_COMMITS=$(git log --oneline -5 2>/dev/null || echo "No commits")
RECENT_FILES=$(git diff --name-only HEAD~5..HEAD 2>/dev/null | head -10 || echo "No recent files")
GIT_STATUS=$(git status --short 2>/dev/null | head -10 || echo "No changes")

# Get recent architecture decisions
RECENT_DECISIONS=$(git log --oneline --grep="Decision" -5 2>/dev/null || echo "No recent architecture decisions")

# Create dynamic snapshot
cat > "$STATE_FILE" <<EOF
# Session State Snapshot (Dynamic)

**Captured:** $(date)
**Reason:** PreCompact auto-save
**Branch:** $CURRENT_BRANCH

---

## Current Work Context

$CURRENT_WORK

---

## Recent Activity

### Last 5 Commits
\`\`\`
$LAST_COMMITS
\`\`\`

### Files Modified (Last 5 Commits)
\`\`\`
$RECENT_FILES
\`\`\`

### Working Directory Status
\`\`\`
$GIT_STATUS
\`\`\`

---

## Recent Architecture Decisions

\`\`\`
$RECENT_DECISIONS
\`\`\`

---

## Recovery Protocol

After auto-compact:

1. **Read CLAUDE.md (auto-loaded)**
   - Invariants section has core platform info
   - Current Work section has feature status

2. **Check this snapshot for details**
   \`cat .claude/session_state/precompact_${TIMESTAMP}.md\`

3. **Load relevant context**
   - Feature spec (see Current Work → Recovery)
   - Current files (see Files Modified above)
   - Recent decisions (see above)

4. **Resume work**
   - Follow "Next Action" from Current Work section
   - Load context as specified in Recovery section

---

## Platform Quick Reference

**Hooks:** \`/hooks list\` or \`.claude/hooks/\`
**Sub-Agents:** \`/agents list\` or \`.claude/agents/\`
**Documentation:** \`@docs/CONTEXT_MANAGEMENT.md\`

**Status:** Production ready (v2.0)
**Philosophy:** Proactive context curation

---

*This snapshot focused on YOUR current work, not static platform info*
*Platform details always in CLAUDE.md Invariants section*
EOF

echo "✓ Dynamic session state saved to $STATE_FILE" >&2
echo "" >&2
echo "Captured:" >&2
echo "  - Current work from CLAUDE.md" >&2
echo "  - Recent commits and files" >&2
echo "  - Architecture decisions" >&2
echo "" >&2
echo "Resume with: cat $STATE_FILE" >&2

exit 0
