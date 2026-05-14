# QA Example: W-2 Import Validation

## Test Request Input

> Validate the W-2 import flow in TurboTax: a user photographs their W-2, the OCR extracts employer EIN, wages, and withholdings, and the data populates the correct fields. Cover cases for blurry images, multiple W-2s, and amended forms.

## What BDD Forge Generates

### For QA, the key output is the **Test Execution Results**:

The AI produces a comprehensive test suite with:
- Boundary value analysis on OCR confidence thresholds
- Negative test cases for invalid/unreadable inputs
- Priority tags (P0, P1, P2) for test planning
- Coverage percentage across the feature
- Risk badges (low/medium/high) per scenario

### Generated Test Results (excerpt):

```
Pass Rate: 83% (5/6 scenarios)
Coverage: 94%

✅ Happy path — clear W-2 photo extraction          [12ms] Risk: LOW
✅ Multiple W-2s from different employers            [18ms] Risk: LOW
✅ Amended W-2 (W-2c) detection and handling         [15ms] Risk: MEDIUM
❌ Blurry image — OCR confidence below threshold     [22ms] Risk: HIGH
   ✗ Step failed: "Then the OCR confidence score should be below 70%"
   → Expected confidence: <70%, Actual: 72% (boundary violation)
✅ Invalid document (not a W-2) rejection            [8ms]  Risk: LOW
✅ EIN format validation (XX-XXXXXXX pattern)        [11ms] Risk: LOW
```

### Why this matters for QA:

1. **Risk-prioritized**: The HIGH risk badge on the blurry image scenario immediately tells QA where to focus manual testing effort.

2. **Boundary failures revealed**: The test failure shows a boundary condition at the OCR confidence threshold (72% vs 70% limit). This is exactly the kind of edge case that's missed without systematic BDD scenarios.

3. **Coverage analysis**: 94% coverage with specific gaps identified — QA knows what's tested and what needs additional scenarios.

4. **Priority alignment**: P0 scenarios (happy path, data accuracy) pass. The P1 failure (OCR threshold) needs investigation but isn't a release blocker.

## Sample Pipeline Output

```
📋 Requirement    → ✓ Captured
🧪 BDD Scenarios  → ✓ 6 scenarios with @priority tags
⚙️ Implementation → ✓ OCR extraction module with validation
✅ Test Results    → ★ 5/6 passed (83%) — Risk: HIGH on OCR boundary (QA Focus)
```

---

*BDD Forge — QA / Tester Workflow*
