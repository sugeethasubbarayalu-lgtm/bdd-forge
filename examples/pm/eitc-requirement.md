# Product Manager Example: EITC Qualification

## Requirement Input

> As a taxpayer filing with TurboTax, I want the system to determine if I qualify for the Earned Income Tax Credit (EITC) based on my filing status, income, and number of qualifying children, so that I can maximize my refund.

## What BDD Forge Generates

### For the PM, the key output is the **BDD Scenarios**:

The AI translates the requirement into 4-5 precise Gherkin scenarios covering:
- Happy path: standard qualification case
- Edge cases: income at exact thresholds, boundary values
- Error handling: ineligible filing statuses, disqualifying investment income
- Domain specifics: real 2024 EITC thresholds, IRS rules

### Why this matters for PMs:

1. **Instant validation**: Can you read the scenarios and confirm they match your intent? If yes, the spec is correct. If not, refine the requirement.

2. **Shared contract**: These scenarios become the agreement between PM, Dev, and QA. No more "that's not what I meant" in sprint review.

3. **Traceability**: Each scenario links back to the original requirement via comments. When a test fails, you can trace it to which business rule was violated.

4. **Living documentation**: Unlike PRDs that go stale, BDD scenarios stay current because they're executable. If the code doesn't match the scenario, the test fails.

## Sample Pipeline Output

```
📋 Requirement    → ✓ Captured
🧪 BDD Scenarios  → ★ 5 scenarios generated (PM Focus)
⚙️ Implementation → ✓ JavaScript module with tax logic
✅ Test Results    → 4/5 passed (80%) — edge case flagged for review
```

The PM's takeaway: "My requirement produced 5 testable scenarios. 4 pass. The one that failed reveals an edge case I hadn't considered (income at exact threshold). I need to clarify the business rule."

---

*BDD Forge — Product Manager Workflow*
