# Active Loading Protocol - Quick Reference

## After /clear: Load in Order

### Phase 1: Invariants (Automatic)
```
/clear executes
→ CLAUDE.md auto-loads
→ Invariants + Current Work
→ ~700 tokens
```

### Phase 2: Current Feature Context
```
Load feature spec:
@docs/features/[current_feature]_spec.md

Result: +5-10k tokens
```

### Phase 3: Current Files Only
```
Load active files:
- Implementation files for current feature
- Related test files
- Configuration if relevant

Don't load:
- Historical/old code
- Unrelated features
- Full codebase

Result: +10-15k tokens
```

### Phase 4: Recent Decisions (Optional)
```
git log --oneline --grep="Decision" -5

Result: +2-5k tokens
```

## Total After Loading
**~20-35k tokens of highly relevant context**

Compare to: 120k+ tokens of mixed context before /clear

**See:** @knowledge_base/platform/reference/context_management_full.md
