# How to Balance Progression

**Goal**: Create satisfying progression curve with no paywalls, long-term engagement

**Philosophy**: Skill > Dynasty > Grinding. Players should feel rewarded for play time, but skill remains most important.

---

## DNA Economy Balance

### Income Sources

**Gameplay (Primary)**:
- Base rate: 1 DNA per food pellet
- Average session (10 min): 50-100 DNA (casual)
- Skilled session (10 min): 200-300 DNA (experienced)
- Dynasty bonus (PRIMAL): +5% DNA generation
- Set bonus (per complete dynasty): +10% income (stacking)

**Example Income Progression**:
```
New player (no bonuses):
- Session 1: 50 DNA (10 min, still learning)
- Session 10: 150 DNA (10 min, improved skill)

Engaged player (PRIMAL dynasty + 1 set complete):
- Base: 200 DNA (skilled play)
- PRIMAL bonus: +5% = 210 DNA
- Set bonus: +10% = 231 DNA
- Total: 231 DNA per session (2.3× casual rate)

Completionist (PRIMAL + 3 sets complete):
- Base: 200 DNA
- PRIMAL bonus: +5% = 210 DNA
- Set bonuses: +30% = 273 DNA
- Total: 273 DNA per session (2.7× casual rate)
```

**Design Intent**: Skill improvement (50 → 200 DNA) is 4× multiplier. Dynasty bonuses (1.3×) are meaningful but secondary.

### Unlock Costs

**Dynasties**:
- CYBER: FREE (starter)
- PRIMAL: 2,000 DNA (~20 sessions casual, ~7 sessions engaged)
- COSMIC: 3,000 DNA (~30 sessions casual, ~10 sessions engaged)

**Variants (within owned dynasty)**:
- Common: 500 DNA (5-10 sessions)
- Uncommon: 1,000 DNA (10-20 sessions)
- Rare: 2,000 DNA (20-40 sessions)
- Epic: 4,000 DNA (40-80 sessions)
- Legendary: 8,000 DNA (80-160 sessions)

**Breeding**:
- Gen 0 + Gen 0 = 200 DNA (2-4 sessions)
- Gen 2 + Gen 3 = 450 DNA (4-9 sessions)
- Gen 5 + Gen 5 = 700 DNA (7-14 sessions)

**Design Intent**:
- Unlock new dynasty: ~1 week engaged play
- Complete full dynasty (10 variants): ~2-3 weeks
- Breed high-gen snake: Accessible for experimentation

---

## Time-to-Unlock Estimates

### Casual Player (50 DNA/session, 1 session/day)

**Week 1**:
- Day 1-5: Grind CYBER variants (start with 3 free)
- Day 6-7: Unlock 1-2 Common variants
- Total: 3-5 CYBER variants

**Week 2**:
- Day 8-14: Continue CYBER, unlock 2-3 more variants
- Total: 5-8 CYBER variants

**Week 4**:
- Day 22-28: Complete CYBER (10/10)
- Set bonus unlocked: +10% income (50 → 55 DNA/session)
- Total: 1 complete dynasty

**Month 2**:
- Start unlocking PRIMAL (2k DNA = 40 days → 36 days with bonus)
- Total: 1 complete, 1 in progress

**Month 6**:
- Total: 2-3 complete dynasties

**Design Intent**: Casual player has months of content, always progressing

---

### Engaged Player (150 DNA/session, 2 sessions/day)

**Week 1**:
- Day 1-3: Unlock PRIMAL dynasty (2k DNA = 7 sessions)
- Day 4-7: Unlock 3-5 PRIMAL variants
- Total: 1 dynasty unlocked, 3-5 variants

**Week 2**:
- Day 8-10: Complete PRIMAL (10/10)
- Set bonus: +10% income (150 → 165 DNA)
- Day 11-14: Start COSMIC, unlock 2-3 variants
- Total: 1 complete dynasty

**Week 3**:
- Day 15-21: Complete COSMIC (10/10)
- Set bonus: +20% total (150 → 180 DNA)
- Total: 2 complete dynasties

**Week 4**:
- Day 22-28: Breed high-gen variants, experiment
- Total: 2 complete, breeding experimentation

**Month 2**:
- Start unlocking SHADOW (new dynasty release)
- Total: 3 complete (CYBER, PRIMAL, COSMIC) + SHADOW in progress

**Month 6**:
- Total: 6+ complete dynasties (all MVP + 3 monthly releases)

**Design Intent**: Engaged player completes MVP content in 3-4 weeks, then sustained by monthly releases

---

### Completionist (300 DNA/session, 3+ sessions/day)

**Week 1**:
- Day 1-7: Complete all 3 MVP dynasties (30/30 variants)
- Set bonus: +30% income (300 → 390 DNA)
- Total: Full MVP collection

**Week 2-4**:
- Breed to maximize generations
- Optimize set bonuses
- Prepare for Month 2 release

**Month 2+**:
- Complete new dynasty within 3-4 days of release
- Always at collection edge

**Design Intent**: Even hardcore players have 1+ week of content per MVP. Monthly releases keep them engaged long-term.

---

## Breeding Economy

### Cost Formula

```python
breeding_cost = 200 + (avg_parent_generation * 100)

Examples:
Gen 0 + Gen 0 = 200 DNA
Gen 1 + Gen 1 = 300 DNA
Gen 3 + Gen 5 = 600 DNA  # avg = 4
Gen 10 + Gen 10 = 1200 DNA
```

**Design Rationale**:
- Low entry cost (200 DNA) encourages experimentation
- Scaling cost prevents infinite generation spam
- Gen 10+ becomes expensive (1200+ DNA = 4-8 sessions)

### Stat Scaling

```python
final_stats = base_stats * (1 + generation * 0.05)

Examples:
CYBER OMEGA (Legendary base: Speed 1.5)
Gen 0: 1.5 speed
Gen 3: 1.5 * 1.15 = 1.725 speed (+15%)
Gen 10: 1.5 * 1.50 = 2.25 speed (+50%)
Gen 20: 1.5 * 2.00 = 3.0 speed (+100%)
```

**Design Rationale**:
- Gen 3 (+15% stats) is accessible (600 DNA cost)
- Gen 10 (+50% stats) is achievable (1200 DNA cost)
- Gen 20 (+100% stats) is whale territory (2200 DNA cost)
- Skill still matters more than stats

---

## Set Bonus Progression

### Stacking Bonuses

```
1 complete dynasty: +10% DNA income
2 complete: +20%
3 complete: +30%
6 complete: +60%
10 complete: +100% (double income)
```

**Impact on Progression**:

**Casual Player Journey**:
- Month 1: 50 DNA/session (no bonuses)
- Month 4: 55 DNA/session (+10% from 1 complete)
- Month 6: 60 DNA/session (+20% from 2 complete)
- Month 12: 70 DNA/session (+40% from 4 complete)

**Engaged Player Journey**:
- Week 1: 150 DNA/session (no bonuses)
- Week 2: 165 DNA/session (+10%)
- Week 3: 180 DNA/session (+20%)
- Week 4: 195 DNA/session (+30%)
- Month 6: 240 DNA/session (+60% from 6 complete)
- Year 1: 300 DNA/session (+100% from 10 complete)

**Design Rationale**:
- Early bonuses feel meaningful (10% noticeable)
- Long-term bonuses are massive (100% doubles income)
- Creates virtuous cycle (bonuses accelerate future unlocks)
- Never "complete" (always new dynasty to unlock)

---

## Balancing New Dynasties

### Stat Bonus Variety

**Existing Bonuses**:
- CYBER: +5% speed
- PRIMAL: +5% DNA generation
- COSMIC: +5% size

**Future Dynasty Bonuses (Examples)**:
- SHADOW: +5% stealth (future mechanic)
- CRYSTAL: +5% defense (future mechanic)
- INFERNO: +5% attack (future mechanic)
- AQUA: +5% agility (future mechanic)

**Design Rules**:
1. All bonuses = 5% (balanced, no "must-have" dynasty)
2. Each bonus affects different stat (strategic choices)
3. No dynasty is objectively "best" (play style preference)

### Unlock Cost Scaling

**Option A: Flat Cost (Recommended)**:
- All dynasties: 2,000-3,000 DNA
- Pro: Simple, fair
- Con: Later dynasties feel "cheaper" (players have more income)

**Option B: Scaling Cost**:
- Dynasty 1-3: FREE/2k/3k DNA
- Dynasty 4-6: 4k/5k/6k DNA
- Dynasty 7+: 7k+ DNA
- Pro: Accounts for income growth
- Con: Complex, may feel punishing

**Recommendation**: Use Option A (flat cost). Later dynasties naturally feel rewarding due to set bonus acceleration.

---

## Testing Progression Balance

### Metrics to Track

**Engagement Metrics**:
- Daily Active Users (DAU)
- Session length (target: 10-15 minutes)
- Sessions per day (target: 1-3)
- Retention (Day 1, Day 7, Day 30)

**Progression Metrics**:
- Average DNA per session (target: 100-150)
- Time to first dynasty unlock (target: 7-14 days)
- Time to complete dynasty (target: 14-30 days)
- Breeding frequency (target: 2-5 breeds/week)

**Economy Metrics**:
- DNA sources (gameplay vs bonuses)
- DNA sinks (unlocks vs breeding)
- Dynasty unlock order (is there a "meta"?)
- Variant unlock distribution (are Legendaries unlocked?)

### Red Flags

**Progression Too Fast**:
- Players complete all content in <2 weeks
- DNA income >500/session without skill improvement
- No one breeds (unlocking is too easy)
- Fix: Increase unlock costs, reduce income

**Progression Too Slow**:
- Players quit before first dynasty unlock
- Average session <5 minutes (giving up)
- Retention drops <30% by Day 7
- Fix: Reduce unlock costs, increase income, add starter bonuses

**Economy Imbalance**:
- Only 1 dynasty dominates (e.g., everyone picks PRIMAL for DNA bonus)
- Legendaries never unlocked (too expensive)
- Breeding ignored (cost too high relative to benefit)
- Fix: Rebalance bonuses, adjust costs, improve breeding rewards

---

## Tuning Knobs

### Easy Adjustments (No Client Update)

**Unlock Costs** (database):
```sql
UPDATE snake_variants SET unlock_cost_dna = 400 WHERE rarity = 'common';
-- Reduce Common cost 500 → 400 (20% cheaper)
```

**Set Bonuses** (database):
```sql
UPDATE dynasties SET set_bonus_dna_income = 0.15;
-- Increase set bonus 10% → 15%
```

### Hard Adjustments (Client Update)

**DNA Income** (gameplay code):
```typescript
const dnaPerPellet = 1; // Change to 2 for double income
```

**Breeding Formula** (gameplay code):
```typescript
const breedingCost = 200 + (avgGen * 100); // Reduce multiplier to 50
```

---

## Summary

**Balanced Progression Targets**:
- Casual player: 1 complete dynasty in 4 weeks
- Engaged player: 3 complete dynasties in 3 weeks
- Completionist: All MVP content in 1 week

**Key Principles**:
1. Skill > Dynasty > Grinding
2. No paywalls (all content unlockable)
3. Set bonuses create virtuous cycle
4. Monthly releases prevent "completion"
5. All dynasties balanced (no "meta" choice)

**Monitoring**: Track metrics weekly, tune via database (no client update needed)

---

## See Also

**Economic Balance**: @knowledge_base/game/quick_ref/economic_balance.md
**Collection Targets**: @knowledge_base/game/quick_ref/collection_targets.md
**Dynasty Spec**: @docs/game/systems/DYNASTY_SYSTEM_specification_v1.0.md
