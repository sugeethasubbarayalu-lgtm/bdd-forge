# Persona Design in BDD Forge

## Why Personas Matter

BDD is inherently collaborative — it's designed to be the shared language between product, engineering, and quality. But each role enters the conversation from a different starting point and cares about different outputs.

BDD Forge doesn't just acknowledge this — it **adapts the entire pipeline** based on who you are.

## The Three Personas

### 📋 Product Manager

**Starting point**: A raw product requirement, user story, or PRD excerpt.

**What they care about**:
- Are the generated BDD scenarios accurate translations of their intent?
- Do the acceptance criteria capture all the business rules?
- Is there traceability from requirement → scenario → test?
- Can they share these specs with engineers and QA as a contract?

**How BDD Forge adapts**:
- AI prompts emphasize acceptance criteria and requirement traceability
- BDD scenarios include comments linking back to the original requirement
- The BDD generation phase is marked as the ★ focus area
- Sample inputs are user stories in standard "As a... I want... So that..." format

**Value delivered**: The PM gets an immediate, executable translation of their requirement that they can validate before any code is written.

---

### ⚙️ Developer

**Starting point**: A feature specification or module to build.

**What they care about**:
- Is the generated code clean, well-structured, and production-ready?
- Are step definitions properly mapped to business logic?
- Does the code handle edge cases and input validation?
- Can they use this as a starting point for their implementation?

**How BDD Forge adapts**:
- AI prompts emphasize code architecture, step definitions, and error handling
- Generated code includes JSDoc comments and clear module exports
- The code generation phase is marked as the ★ focus area
- Sample inputs are technical feature specifications

**Value delivered**: The developer gets a working implementation scaffold that's already aligned with BDD scenarios — no guessing about expected behavior.

---

### 🧪 QA / Tester

**Starting point**: A test request or quality validation need.

**What they care about**:
- Are edge cases and boundary values covered?
- What's the test coverage and risk assessment?
- Are there negative test cases (invalid inputs, error paths)?
- Which scenarios are highest priority?

**How BDD Forge adapts**:
- AI prompts emphasize boundary values, negative cases, and priority tagging
- BDD scenarios include `@priority` tags (P0, P1, P2) and `@edge-case` markers
- Test results include coverage percentages and risk badges (low/medium/high)
- The test execution phase is marked as the ★ focus area
- Sample inputs describe testing objectives with specific coverage expectations

**Value delivered**: QA gets a comprehensive test suite with risk-prioritized scenarios that go beyond happy-path testing.

## Design Principles

1. **Same pipeline, different lens**: All three personas see the full Requirement → BDD → Code → Tests flow. The difference is in emphasis, prompts, and output detail.

2. **Role-appropriate language**: PMs see "PRD" and "acceptance criteria." Developers see "step definitions" and "module structure." QA sees "coverage" and "risk assessment."

3. **Visual emphasis**: The ★ badge on the stepper and output cards tells each persona where to focus their attention.

4. **Domain consistency**: All personas work with TurboTax scenarios, ensuring the demo stays grounded in a real Intuit product context.

---

*BDD Forge — PM-XD Hackathon 2026*
