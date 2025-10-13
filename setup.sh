#!/bin/bash
# ZTE Platform Template - Setup Script
# Initializes a new project with the ZTE development platform

set -e  # Exit on error

echo "=================================================="
echo "  ZTE Platform Template - Project Initialization"
echo "=================================================="
echo ""

# Get project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Project directory: $PROJECT_DIR"
echo ""

# Step 1: Update settings.local.json with absolute paths
echo "[1/6] Updating hook paths in .claude/settings.local.json..."
if [[ -f "$PROJECT_DIR/.claude/settings.local.json" ]]; then
  # Replace PROJECT_ROOT placeholder with actual path
  sed -i.bak "s|PROJECT_ROOT|$PROJECT_DIR|g" "$PROJECT_DIR/.claude/settings.local.json"
  rm "$PROJECT_DIR/.claude/settings.local.json.bak"
  echo "✓ Hook paths updated"
else
  echo "⚠️  Warning: .claude/settings.local.json not found"
fi
echo ""

# Step 2: Create required directories
echo "[2/6] Creating required directories..."
mkdir -p "$PROJECT_DIR/.claude/session_state"
mkdir -p "$PROJECT_DIR/docs"
mkdir -p "$PROJECT_DIR/templates"
mkdir -p "$PROJECT_DIR/state"
echo "✓ Directories created"
echo ""

# Step 3: Initialize git (if not already initialized)
echo "[3/6] Initializing git repository..."
if [[ ! -d "$PROJECT_DIR/.git" ]]; then
  cd "$PROJECT_DIR"
  git init
  echo "✓ Git repository initialized"
else
  echo "✓ Git repository already exists"
fi
echo ""

# Step 4: Create initial commit
echo "[4/6] Creating initial commit..."
cd "$PROJECT_DIR"
git add .
if git diff --cached --quiet; then
  echo "✓ No changes to commit (already committed)"
else
  git commit -m "Initial commit: ZTE Platform v2.1

Zero-Touch Engineering (ZTE) AAA Development Platform initialized.

Components:
- 6 hook types (deterministic quality enforcement)
- 8 sub-agents (specialized AI analysis)
- Orchestration system (multi-instance coordination)
- Knowledge base v2.1 (database-like query optimization)

Ready for development with top 1% infrastructure.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>"
  echo "✓ Initial commit created"
fi
echo ""

# Step 5: Verify hook permissions
echo "[5/6] Verifying hook permissions..."
find "$PROJECT_DIR/.claude/hooks" -name "*.sh" -exec chmod +x {} \;
find "$PROJECT_DIR/automation" -name "*.py" -exec chmod +x {} \;
echo "✓ Hook permissions verified"
echo ""

# Step 6: Update PLATFORM_STATUS.md with current date
echo "[6/6] Updating PLATFORM_STATUS.md..."
CURRENT_DATE=$(date +%Y-%m-%d)
if [[ -f "$PROJECT_DIR/PLATFORM_STATUS.md" ]]; then
  sed -i.bak "s|\[Auto-updated on initialization\]|$CURRENT_DATE|g" "$PROJECT_DIR/PLATFORM_STATUS.md"
  rm "$PROJECT_DIR/PLATFORM_STATUS.md.bak"
  echo "✓ PLATFORM_STATUS.md updated"
fi
echo ""

echo "=================================================="
echo "  ✅ Setup Complete!"
echo "=================================================="
echo ""
echo "Next steps:"
echo "  1. Update CLAUDE.md with your project info"
echo "  2. Update PLATFORM_STATUS.md with project name"
echo "  3. Create your project structure (src/, etc.)"
echo "  4. Start developing with ZTE platform support"
echo ""
echo "Documentation:"
echo "  @knowledge_base/MAP.md - Query index for all docs"
echo "  @CLAUDE.md - Mission control"
echo "  @PLATFORM_STATUS.md - Platform status"
echo ""
echo "Hooks active: /hooks list"
echo "Agents available: /agents list"
echo ""
echo "Happy coding! 🚀"
