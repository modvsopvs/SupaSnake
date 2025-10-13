# Decision Matrix - Quick Reference

## Before Every Task

**Step 1:** Estimate task tokens (conversation + files + context)
**Step 2:** Check current context usage
**Step 3:** Calculate total (current + estimate)
**Step 4:** Apply matrix:

```
Total < 100k (50% capacity)
→ CONTINUE NORMALLY
  Context has room, work naturally

100k < Total < 150k (50-75% capacity)
→ /CLEAR + ACTIVE LOAD
  Curate context for task
  1. /clear
  2. CLAUDE.md auto-loads
  3. Load feature spec
  4. Load current files only
  5. Begin with clean context

Total > 150k (>75% capacity)
OR Task > 30k tokens
→ DELEGATE TO SUB-AGENT
  "Use [Agent] sub-agent to [task]"
  Sub-agent gets 200k fresh context
```

**Override:** Use judgment for mid-complex reasoning or highly relevant context.

**See:** @knowledge_base/platform/reference/context_management_full.md for details
