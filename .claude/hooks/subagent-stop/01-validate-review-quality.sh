#!/bin/bash
# SubagentStop Hook: Validate Review Quality
# Ensures sub-agent reviews are thorough
# Exit 0: Always (warnings only)

INPUT=$(cat)

SUBAGENT_NAME=$(echo "$INPUT" | jq -r '.subagent_name // empty')
SUBAGENT_OUTPUT=$(echo "$INPUT" | jq -r '.subagent_output // empty')

# Only check reviewer sub-agents
if [[ ! "$SUBAGENT_NAME" =~ reviewer && ! "$SUBAGENT_NAME" =~ validator ]]; then
  exit 0
fi

# Skip if no output
if [[ -z "$SUBAGENT_OUTPUT" ]]; then
  exit 0
fi

# Check word count
WORD_COUNT=$(echo "$SUBAGENT_OUTPUT" | wc -w)
MIN_WORDS=100

if [[ $WORD_COUNT -lt $MIN_WORDS ]]; then
  echo "⚠️  Sub-agent review may be too brief"
  echo "Word count: $WORD_COUNT (minimum: $MIN_WORDS)"
  echo "Consider requesting more detailed analysis"
  echo ""
fi

# Check for required elements based on agent type
if [[ "$SUBAGENT_NAME" =~ security ]]; then
  # Security review should mention key terms
  if ! echo "$SUBAGENT_OUTPUT" | grep -qi "vulnerability\|security\|exploit\|attack"; then
    echo "⚠️  Security review missing key security terms"
    echo "Review may not be thorough enough"
    echo ""
  fi

  if ! echo "$SUBAGENT_OUTPUT" | grep -qi "critical\|high\|medium\|low"; then
    echo "⚠️  Security review missing severity ratings"
    echo ""
  fi
fi

if [[ "$SUBAGENT_NAME" =~ performance ]]; then
  # Performance review should mention metrics
  if ! echo "$SUBAGENT_OUTPUT" | grep -qi "fps\|latency\|memory\|cpu\|time"; then
    echo "⚠️  Performance review missing performance metrics"
    echo "Review may not be thorough enough"
    echo ""
  fi
fi

if [[ "$SUBAGENT_NAME" =~ validator ]]; then
  # Validator should have pass/fail verdict
  if ! echo "$SUBAGENT_OUTPUT" | grep -qi "pass\|fail"; then
    echo "⚠️  Validator review missing pass/fail verdict"
    echo ""
  fi
fi

# Always allow (warnings only)
exit 0
