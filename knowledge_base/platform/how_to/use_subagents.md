# How to Use Sub-Agents

**Goal:** Leverage specialized sub-agents for deep analysis without diluting main coordinator context.

**Time required:** 5-15 minutes per sub-agent

---

## Overview

Sub-agents are specialized AI assistants that operate in separate 200k context windows. They provide domain expertise (security, performance, UX, etc.) while preserving your main coordinator's context.

**Key Benefit:** 95% rule adherence vs 70% with all context loaded in main coordinator.

---

## When to Use Sub-Agents

**Use sub-agents when:**
- ✅ Task requires deep domain expertise
- ✅ Task is self-contained (doesn't need back-and-forth)
- ✅ Task > 30k tokens estimated
- ✅ Current context > 150k
- ✅ Want parallel reviews (security + performance + UX)

**Don't use sub-agents when:**
- ❌ Need interactive discussion
- ❌ Task requires main coordinator's full context
- ❌ Simple task < 20k tokens
- ❌ Rapid iteration needed

---

## Step-by-Step Process

### Step 1: Choose Sub-Agent Type

**Available sub-agents:**

**Design Phase:**
- `design_architect` - Technical specifications, architecture plans

**Review Phase:**
- `security_reviewer` - Security vulnerabilities, auth/authz issues
- `performance_reviewer` - Performance bottlenecks, optimization
- `code_quality_reviewer` - Maintainability, best practices
- `ux_reviewer` - User experience, accessibility
- `balance_reviewer` - Game balance (for game development)

**Aggregation:**
- `review_aggregator` - Synthesize multiple reviews

**Validation:**
- `validator` - Final production readiness check

**Decision guide:**
- Need architecture? → design_architect
- Auth/payment code? → security_reviewer
- Game loop/rendering? → performance_reviewer
- Large refactor? → code_quality_reviewer
- UI changes? → ux_reviewer
- Multiple reviews done? → review_aggregator
- Ready for production? → validator

### Step 2: Write Clear Prompt

**Good prompt structure:**
```
[What to do]
[Specific files to review]
[Context/requirements]
[Expected output format]
[Minimum word count if needed]
```

**Example - Good Prompt:**
```python
Task(
    subagent_type="security_reviewer",
    description="Security audit of authentication system",
    prompt="""
    Review the authentication system for security vulnerabilities.

    Files to review:
    - src/auth/login.ts
    - src/auth/jwt.ts
    - src/auth/session.ts
    - src/auth/middleware.ts

    Focus on:
    - SQL/NoSQL injection
    - Authentication bypass
    - Session management
    - Credential storage

    Provide detailed security audit report with:
    - Severity ratings (Critical/High/Medium/Low)
    - Specific file:line references
    - Exploitation scenarios
    - Remediation steps with code examples

    Minimum 500 words.
    """
)
```

**Example - Bad Prompt:**
```python
Task(
    subagent_type="security_reviewer",
    prompt="Check the code for security issues"
)
# Too vague! No files specified, no expectations set
```

### Step 3: Spawn Sub-Agent

**Single sub-agent:**
```python
result = Task(
    subagent_type="performance_reviewer",
    description="Analyze rendering performance",
    prompt="[Your detailed prompt]"
)

# Sub-agent runs in background with fresh 200k context
# You can continue working while it runs
```

**Parallel sub-agents:**
```python
# Spawn multiple sub-agents simultaneously
security = Task(
    subagent_type="security_reviewer",
    description="Security audit",
    prompt="[Security prompt]"
)

performance = Task(
    subagent_type="performance_reviewer",
    description="Performance analysis",
    prompt="[Performance prompt]"
)

ux = Task(
    subagent_type="ux_reviewer",
    description="UX review",
    prompt="[UX prompt]"
)

# All run in parallel with separate 200k contexts
```

### Step 4: Review Sub-Agent Output

**Check output quality:**
- ✅ Sufficient detail? (Check word count, depth)
- ✅ Specific findings? (File:line references, concrete examples)
- ✅ Actionable recommendations? (Can you implement fixes?)
- ✅ Severity ratings? (For security/issues reviews)

**SubagentStop hook validates:**
- Minimum word count (typically 400-500 words)
- Required elements present
- Thoroughness indicators

**If output is too brief:**
1. Check if SubagentStop hook is configured
2. Add explicit word count to prompt
3. Request specific elements
4. Re-run with more detailed prompt

### Step 5: Act on Findings

**Aggregate reviews:**
```python
aggregated = Task(
    subagent_type="review_aggregator",
    description="Synthesize all reviews",
    prompt="""
    Synthesize the following reviews into prioritized action items:

    Security Review: [Paste or reference security output]
    Performance Review: [Paste or reference performance output]
    UX Review: [Paste or reference UX output]

    Provide:
    1. Critical issues (must fix before production)
    2. Important issues (should fix soon)
    3. Nice-to-have improvements (future consideration)

    For each issue, include:
    - Which review it came from
    - Severity/priority
    - Estimated effort
    - Implementation order
    """
)
```

**Implement fixes:**
- Start with critical issues
- Address high-priority findings
- Consider nice-to-have improvements

---

## Common Patterns

### Pattern 1: Design-Implement-Validate

```python
# 1. Get technical design
design = Task(
    subagent_type="design_architect",
    prompt="Design notifications system: [requirements]"
)

# 2. Implement based on design
# [Your implementation work]

# 3. Final validation
validation = Task(
    subagent_type="validator",
    prompt="Validate notifications feature is production-ready"
)
```

### Pattern 2: Parallel Reviews

```python
# After implementing feature, get all reviews simultaneously
security = Task(subagent_type="security_reviewer", ...)
performance = Task(subagent_type="performance_reviewer", ...)
code_quality = Task(subagent_type="code_quality_reviewer", ...)

# Aggregate results
summary = Task(
    subagent_type="review_aggregator",
    prompt="Synthesize all three reviews"
)

# Fix critical issues

# Final validation
validator = Task(subagent_type="validator", ...)
```

### Pattern 3: Chain Sub-Agents

```python
# Design
design = Task(subagent_type="design_architect", ...)

# Write design to file for next agent
Write("state/design_output.md", design.result)

# Review design
review = Task(
    subagent_type="code_quality_reviewer",
    prompt="""
    Review the technical design in state/design_output.md.
    Check for completeness, clarity, feasibility.
    """
)

# Revise design based on feedback
revised = Task(
    subagent_type="design_architect",
    prompt=f"""
    Revise design based on this feedback:
    {review.result}

    Original: state/design_output.md
    """
)
```

---

## Tips for Success

1. **Be specific in prompts** - List exact files, requirements, output format
2. **Set word count minimums** - "Minimum 500 words" ensures depth
3. **Provide context** - Give sub-agent enough information
4. **Validate output** - Use SubagentStop hook, check quality
5. **Use parallel execution** - Multiple reviews simultaneously
6. **Write outputs to files** - For chaining or future reference
7. **Aggregate multiple reviews** - Use review_aggregator sub-agent

---

## Common Mistakes

❌ **Vague prompts** - "Check the code" → Be specific!
❌ **No file list** - Sub-agent doesn't know what to review
❌ **Forgetting word count** - Get 50-word summaries instead of deep analysis
❌ **Not validating output** - Accept brief, superficial reviews
❌ **Sequential when could be parallel** - Waste time
❌ **Using for implementation** - Sub-agents are for analysis/design
❌ **Not providing context** - Sub-agent missing key information

---

## Expected Durations

- Design Architect: 3-5 minutes
- Security Reviewer: 5-8 minutes
- Performance Reviewer: 5-7 minutes
- Code Quality Reviewer: 4-6 minutes
- UX Reviewer: 5-8 minutes
- Balance Reviewer: 8-12 minutes
- Review Aggregator: 3-5 minutes
- Validator: 3-5 minutes

**If taking much longer:** Narrow scope or split into multiple sub-agents

---

## Quick Reference

**Choose agent:** Based on domain (security, performance, UX, etc.)
**Write prompt:** Clear task, specific files, expected output
**Spawn:** Use Task tool with subagent_type
**Review:** Check quality, depth, actionability
**Act:** Implement findings, prioritize by severity

---

**See also:**
- @knowledge_base/platform/quick_ref/subagent_types.md (agent type quick ref)
- @knowledge_base/platform/reference/subagent_guide_full.md (complete guide)
