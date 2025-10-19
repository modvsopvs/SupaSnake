#!/bin/bash
# Helper: Update context plan status
# Usage: ./automation/update_context_plan.sh <status>

STATUS=$1
CONTEXT_PLAN=$(ls -t state/context_plan_*.json 2>/dev/null | head -1)

if [[ ! -f "$CONTEXT_PLAN" ]]; then
  echo "No context plan found"
  exit 1
fi

if [[ -z "$STATUS" ]]; then
  echo "Usage: $0 <status>"
  echo "Valid statuses: pending, loading, loaded, blocked, complete"
  exit 1
fi

jq --arg status "$STATUS" '.status = $status' "$CONTEXT_PLAN" > "${CONTEXT_PLAN}.tmp"
mv "${CONTEXT_PLAN}.tmp" "$CONTEXT_PLAN"

echo "Context plan status updated: $STATUS"
