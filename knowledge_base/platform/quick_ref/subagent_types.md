# Sub-Agent Types - Quick Reference

## When to Use Sub-Agents

**Problem:** Loading all domain contexts dilutes attention (70% rule adherence)
**Solution:** Specialized sub-agents with focused context (95% rule adherence)

**Use sub-agents for:**
- Complex analysis requiring deep expertise
- Tasks >30k tokens
- Parallel reviews (security + performance + UX)
- When main coordinator context >150k

## Sub-Agent Types

### Design Phase

**Design Architect**
- **Purpose:** Create comprehensive technical specifications
- **Input:** Requirements + answers to design questions
- **Output:** Technical design document (1,000+ words)
- **Duration:** 3-5 minutes
- **Use when:** Starting new feature, need architecture plan

### Review Phase

**Security Reviewer**
- **Purpose:** Audit code for vulnerabilities
- **Output:** Security audit report with severity ratings
- **Duration:** 5-8 minutes
- **Use when:** Auth, payment, data handling code

**Performance Reviewer**
- **Purpose:** Analyze performance bottlenecks
- **Output:** Performance analysis with metrics
- **Duration:** 5-7 minutes
- **Use when:** Game loops, rendering, heavy algorithms

**Code Quality Reviewer**
- **Purpose:** Review maintainability and best practices
- **Output:** Code quality report with refactoring suggestions
- **Duration:** 4-6 minutes
- **Use when:** Large refactors, complex business logic

**UX Reviewer**
- **Purpose:** Evaluate user experience
- **Output:** UX feedback with usability improvements
- **Duration:** 5-8 minutes
- **Use when:** UI changes, user flows, accessibility

**Balance Reviewer (Games)**
- **Purpose:** Test and analyze game balance
- **Output:** Balance analysis with simulation results
- **Duration:** 8-12 minutes
- **Use when:** Game mechanics, economy, progression

### Aggregation Phase

**Review Aggregator**
- **Purpose:** Synthesize multiple reviews into priorities
- **Input:** All review outputs
- **Output:** Consolidated report (critical/important/nice-to-have)
- **Duration:** 3-5 minutes
- **Use when:** Multiple reviews completed, need action plan

### Validation Phase

**Validator**
- **Purpose:** Final quality gate before production
- **Output:** PASS/FAIL report with checklist
- **Duration:** 3-5 minutes
- **Use when:** Feature complete, ready for production

## Usage Pattern

```python
# 1. Design
design = Task(
    subagent_type="design_architect",
    description="Design speed boost system",
    prompt="Requirements: 2x speed, 3s duration, 50 DNA cost"
)

# 2. Review (parallel)
security = Task(subagent_type="security_reviewer", ...)
performance = Task(subagent_type="performance_reviewer", ...)

# 3. Aggregate
summary = Task(
    subagent_type="review_aggregator",
    prompt="Synthesize security and performance reviews"
)

# 4. Validate
validation = Task(
    subagent_type="validator",
    prompt="Final validation before production"
)
```

## Best Practices

✅ **DO:**
- Keep prompts focused (clear task, specific files)
- Provide context (what they need to know)
- Set expectations (word count, depth)
- Validate output (SubagentStop hook)

❌ **DON'T:**
- Overload context (stay focused)
- Expect state retention (each invocation is fresh)
- Use for implementation (analysis/design only)
- Skip validation (always check quality)

## Decision Guide

**Need architecture plan?** → Design Architect
**Need security audit?** → Security Reviewer
**Need performance analysis?** → Performance Reviewer
**Need final validation?** → Validator
**Have multiple reviews?** → Review Aggregator

**See:** @knowledge_base/platform/reference/subagent_guide_full.md for complete details
