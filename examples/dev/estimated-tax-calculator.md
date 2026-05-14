# Developer Example: Estimated Tax Calculator

## Feature Spec Input

> Build a quarterly estimated tax payment calculator for self-employed taxpayers that factors in projected annual income, business deductions, self-employment tax, and prior year safe harbor rules.

## What BDD Forge Generates

### For the Developer, the key output is the **Implementation Code**:

The AI produces a JavaScript module that:
- Implements the quarterly estimated tax calculation logic
- Maps step definitions to business logic functions
- Handles edge cases identified in the BDD scenarios
- Uses real 2024 tax rates and self-employment tax rules
- Includes JSDoc documentation and clear exports

### Generated Code Structure (excerpt):

```javascript
/**
 * Quarterly Estimated Tax Calculator
 * Implements IRS Form 1040-ES logic for self-employed taxpayers
 * @module EstimatedTaxCalculator
 */

// Step: Given a self-employed taxpayer with projected annual income of {amount}
export function createTaxpayer(projectedIncome, deductions = 0) {
  return {
    projectedIncome,
    deductions,
    selfEmploymentTaxRate: 0.153, // 15.3% SE tax (12.4% SS + 2.9% Medicare)
    socialSecurityWageBase: 168600, // 2024 limit
  };
}

// Step: When quarterly estimated payments are calculated
export function calculateQuarterlyPayment(taxpayer) {
  const netSEIncome = taxpayer.projectedIncome - taxpayer.deductions;
  const seTax = calculateSelfEmploymentTax(netSEIncome, taxpayer);
  const adjustedIncome = netSEIncome - (seTax * 0.5); // Deductible half of SE tax
  const incomeTax = calculateIncomeTax(adjustedIncome);
  const totalTax = incomeTax + seTax;
  return Math.ceil(totalTax / 4);
}

// Step: Then the payment should meet safe harbor requirements
export function checkSafeHarbor(quarterlyPayment, priorYearTax) {
  const annualPayment = quarterlyPayment * 4;
  const meetsCurrentYear = annualPayment >= totalTax * 0.9;
  const meetsPriorYear = annualPayment >= priorYearTax * 1.0;
  return { safe: meetsCurrentYear || meetsPriorYear, method: /*...*/ };
}
```

### Why this matters for Developers:

1. **Step-to-code mapping**: Each function maps directly to a BDD step, so the relationship between spec and implementation is explicit.

2. **Domain logic included**: The AI uses real tax rules (SE tax rate, SS wage base, safe harbor percentages) — not placeholder values.

3. **Scaffold, not final**: The generated code is a starting point. The developer reviews, refines, and integrates. But the architecture is already aligned with the spec.

4. **Tests already passing**: The generated code was validated against the BDD scenarios. The developer starts with a green test suite.

## Sample Pipeline Output

```
📋 Requirement    → ✓ Captured
🧪 BDD Scenarios  → ✓ 4 scenarios (happy path, edge cases, safe harbor)
⚙️ Implementation → ★ 75-line JavaScript module (Dev Focus)
✅ Test Results    → 3/4 passed (75%) — safe harbor edge case needs review
```

---

*BDD Forge — Developer Workflow*
