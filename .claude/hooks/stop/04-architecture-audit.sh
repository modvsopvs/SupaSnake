#!/bin/bash
# Stop Hook: Architecture Compliance Audit
# Comprehensive scan for architectural violations (AAA 2026 standards)
# Output is injected back into Claude's context

echo "=== Architecture Compliance Audit ==="
echo ""

# Find all code files (excluding node_modules, .git, etc.)
CODE_FILES=$(find . -type f \( -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" \) \
  ! -path "*/node_modules/*" \
  ! -path "*/.git/*" \
  ! -path "*/dist/*" \
  ! -path "*/build/*" \
  ! -path "*/.next/*" 2>/dev/null)

# Skip if no code files found
if [[ -z "$CODE_FILES" ]]; then
  echo "ℹ️  No code files found yet (empty project)"
  echo "===================="
  exit 0
fi

ISSUES_FOUND=0

# 1. Server Authority Violations
echo "🔒 Server Authority Check..."
SERVER_AUTH_VIOLATIONS=$(echo "$CODE_FILES" | \
  xargs grep -l "localStorage.*\(dna\|DNA\|variant\|score\|currency\|inventory\|collection\)" 2>/dev/null)
if [[ -n "$SERVER_AUTH_VIOLATIONS" ]]; then
  echo "⚠️  Potential localStorage violations (game state):"
  echo "$SERVER_AUTH_VIOLATIONS" | head -3
  echo ""
  ISSUES_FOUND=1
fi

# 2. Client-Side Database Access
echo "🗄️  Database Access Check..."
CLIENT_DB_ACCESS=$(echo "$CODE_FILES" | \
  grep -E "/(client|components|hooks|ui)/" | \
  xargs grep -l "supabase\.from(" 2>/dev/null | \
  grep -v "/api/" | grep -v "/server/")
if [[ -n "$CLIENT_DB_ACCESS" ]]; then
  echo "⚠️  Client-side database access detected:"
  echo "$CLIENT_DB_ACCESS" | head -3
  echo ""
  ISSUES_FOUND=1
fi

# 3. Secret Exposure
echo "🔑 Secret Exposure Check..."
SECRET_IN_CLIENT=$(echo "$CODE_FILES" | \
  grep -v -E "/(server|api)/" | \
  grep -v "\.env" | \
  xargs grep -l "SERVICE_ROLE_KEY\|PRIVATE_KEY\|SECRET_KEY" 2>/dev/null)
if [[ -n "$SECRET_IN_CLIENT" ]]; then
  echo "⚠️  Secrets in client code detected:"
  echo "$SECRET_IN_CLIENT" | head -3
  echo ""
  ISSUES_FOUND=1
fi

# 4. Hard-Coded Constants
echo "🎮 Game Constants Check..."
HARD_CODED_CONSTANTS=$(echo "$CODE_FILES" | \
  grep -v "/config/" | \
  xargs grep -E "const\s+(DNA_COST|DNA_REWARD|SPAWN_RATE|ENERGY_MAX).*=" 2>/dev/null | head -3)
if [[ -n "$HARD_CODED_CONSTANTS" ]]; then
  echo "⚠️  Hard-coded game constants detected:"
  echo "$HARD_CODED_CONSTANTS"
  echo ""
  ISSUES_FOUND=1
fi

# 5. Missing Error Handling (API routes)
echo "⚡ Error Handling Check..."
API_FILES=$(echo "$CODE_FILES" | grep -E "/api/.*route\.(ts|js)")
if [[ -n "$API_FILES" ]]; then
  MISSING_TRY_CATCH=$(echo "$API_FILES" | \
    xargs grep -L "try {" 2>/dev/null)
  if [[ -n "$MISSING_TRY_CATCH" ]]; then
    echo "⚠️  API routes without try-catch:"
    echo "$MISSING_TRY_CATCH" | head -3
    echo ""
    ISSUES_FOUND=1
  fi
fi

# 6. Synchronous DB Calls
echo "🔄 Async Pattern Check..."
SYNC_DB_CALLS=$(echo "$CODE_FILES" | \
  xargs grep -E "supabase\.from.*\.then\(" 2>/dev/null | head -3)
if [[ -n "$SYNC_DB_CALLS" ]]; then
  echo "⚠️  Using .then() instead of async/await:"
  echo "$SYNC_DB_CALLS"
  echo ""
  ISSUES_FOUND=1
fi

# 7. Mixed Client/Server Concerns
echo "📦 Separation of Concerns Check..."
MIXED_CONCERNS=$(echo "$CODE_FILES" | \
  grep -E "/(components|ui)/" | \
  xargs grep -E "(export async function (GET|POST|PUT|DELETE))" 2>/dev/null)
if [[ -n "$MIXED_CONCERNS" ]]; then
  echo "⚠️  API routes in client directories:"
  echo "$MIXED_CONCERNS" | head -3
  echo ""
  ISSUES_FOUND=1
fi

# Summary
echo ""
if [[ $ISSUES_FOUND -eq 0 ]]; then
  echo "✅ No architecture violations detected"
  echo "✅ Server authority maintained"
  echo "✅ Client/server separation clean"
  echo "✅ Secrets properly isolated"
  echo "✅ AAA architecture standards met"
else
  echo "⚠️  Architecture violations found"
  echo ""
  echo "Review the issues above and apply fixes:"
  echo "  • localStorage: Move to server-side storage"
  echo "  • Client DB access: Use API routes instead"
  echo "  • Secrets: Move to server-side code"
  echo "  • Constants: Centralize in config files"
  echo "  • Error handling: Add try-catch to API routes"
  echo "  • Async patterns: Use async/await, not .then()"
  echo ""
  echo "See: @knowledge_base/platform/how_to/maintain_server_authority.md"
fi

echo "===================="

# Always exit 0 (informational only)
exit 0
