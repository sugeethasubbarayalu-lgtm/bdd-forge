<p align="center">
  <img src="docs/bdd-forge-banner.svg" alt="BDD Forge" width="720" />
</p>

<h1 align="center">BDD Forge - PM-XD Hackathon 2026</h1>
<p align="center">
  <strong>AI-Powered Behavioral Driven Development for TurboTax</strong><br/>
  <sub>🏆 PM-XD Hackathon 2026 · Bridging Human Intent and Machine Execution</sub>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/React-18-61DAFB?logo=react&logoColor=white" alt="React" />
  <img src="https://img.shields.io/badge/Claude_API-Sonnet_4-6366F1?logo=anthropic&logoColor=white" alt="Claude" />
  <img src="https://img.shields.io/badge/BDD-Gherkin-10B981" alt="BDD" />
  <img src="https://img.shields.io/badge/Domain-TurboTax-EC4899" alt="TurboTax" />
  <img src="https://img.shields.io/badge/PM--XD_Hackathon-2026-F59E0B" alt="Hackathon" />
</p>

---

## 💡 The Problem

Software development at scale suffers from a persistent gap between **what stakeholders want** and **what gets built**. Requirements live in PRDs, tests live in spreadsheets, and code lives in repos — all disconnected. Misalignment is discovered late, costing time, quality, and trust.

In the AI era, this gap becomes even more critical: if AI generates code from ambiguous specs, it generates **the wrong code faster**.

## 🔥 The Insight

> *"In the evolving landscape of AI-driven development, Behavioral Driven Development isn't just helpful — it's the essential bridge between human intent and machine execution."*

BDD's structured natural language (Given/When/Then) is the perfect interface layer for AI:
- **Precise enough** for machines to act on
- **Readable enough** for PMs, engineers, and QA to align around
- **Traceable** from requirement to test result

For TurboTax — where tax rules, financial workflows, and compliance demand precision — BDD becomes living documentation that humans verify and AI implements.

## 🚀 What BDD Forge Does

BDD Forge transforms a single natural-language input into a complete, validated development artifact — in seconds, not days.

```
📋 Requirement ──→ 🧪 BDD Scenarios ──→ ⚙️ Implementation ──→ ✅ Test Results
     (input)         (Gherkin specs)       (working code)       (pass/fail)
```

### The Full Pipeline

| Phase | What Happens | Output |
|-------|-------------|--------|
| **1. Requirement** | User enters a product requirement, feature spec, or test request | Natural language input |
| **2. BDD Generation** | AI generates precise Gherkin scenarios with domain-specific data | `.feature` file with Given/When/Then |
| **3. Code Generation** | AI produces implementation code from BDD specs | JavaScript module with business logic |
| **4. Test Execution** | AI validates implementation against BDD scenarios | Pass/fail results with step-level detail |

### Three Persona Workflows

BDD Forge adapts to **who you are** — the same pipeline, tailored to your role:

<table>
<tr>
<td width="33%" align="center">

**📋 Product Manager**

Starts with a raw PRD or spec.

*Emphasis: BDD as shared contract, requirement traceability, acceptance criteria*

</td>
<td width="33%" align="center">

**⚙️ Developer**

Starts with a feature to build.

*Emphasis: Step definitions, code architecture, module structure*

</td>
<td width="33%" align="center">

**🧪 QA / Tester**

Starts with a quality validation request.

*Emphasis: Test coverage, edge cases, risk assessment, boundary values*

</td>
</tr>
</table>

Each persona gets:
- Tailored AI system prompts optimized for their workflow
- Domain-specific sample inputs (TurboTax scenarios)
- Focused output emphasis (★ badges on their key pipeline phase)
- QA gets extra: coverage %, risk ratings (low/medium/high), priority tags

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    BDD Forge (React)                     │
├─────────────┬─────────────┬─────────────┬───────────────┤
│  Persona    │  Input      │  Pipeline   │  Export       │
│  Selector   │  Manager    │  Engine     │  to GitHub    │
└──────┬──────┴──────┬──────┴──────┬──────┴───────┬───────┘
       │             │             │              │
       ▼             ▼             ▼              ▼
┌─────────────────────────────────────────────────────────┐
│              Anthropic Claude API (Sonnet 4)             │
├─────────────────┬───────────────────┬───────────────────┤
│  BDD Generator  │  Code Generator   │  Test Runner      │
│  (Gherkin)      │  (JavaScript)     │  (JSON results)   │
└─────────────────┴───────────────────┴───────────────────┘
       │                    │                    │
       ▼                    ▼                    ▼
┌─────────────────────────────────────────────────────────┐
│                 TurboTax Domain Knowledge                │
│  Tax brackets · EITC thresholds · Filing statuses       │
│  W-2 validation · Quarterly estimates · Safe harbor     │
└─────────────────────────────────────────────────────────┘
```

## 📂 Repository Structure

```
bdd-forge/
├── README.md                          # This file
├── src/
│   └── bdd-forge.jsx                  # Main React application
├── features/
│   └── eitc-qualification.feature     # Example generated Gherkin scenarios
├── examples/
│   ├── pm/                            # Product Manager workflow examples
│   │   └── eitc-requirement.md
│   ├── dev/                           # Developer workflow examples
│   │   └── estimated-tax-calculator.md
│   └── qa/                            # QA workflow examples
│       └── w2-import-validation.md
├── docs/
│   ├── bdd-forge-banner.svg           # Project banner
│   ├── WHY-BDD.md                     # The case for BDD + AI
│   └── PERSONAS.md                    # Persona design rationale
└── .github/
    └── HACKATHON.md                   # Hackathon submission notes
```

## 🧪 Example: EITC Qualification (Product Manager Flow)

**Input requirement:**
> As a taxpayer filing with TurboTax, I want the system to determine if I qualify for the Earned Income Tax Credit (EITC) based on my filing status, income, and number of qualifying children, so that I can maximize my refund.

**Generated BDD (excerpt):**
```gherkin
Feature: EITC Qualification Engine
  As a TurboTax user
  I want to check my EITC eligibility
  So that I can maximize my tax refund

  Background:
    Given the tax year is 2024
    And EITC income thresholds are loaded

  @happy-path
  Scenario: Single filer with two qualifying children qualifies for EITC
    Given a taxpayer with filing status "Single"
    And earned income of $38,000
    And 2 qualifying children under age 19
    And investment income of $2,500
    When the EITC eligibility check is performed
    Then the taxpayer should qualify for EITC
    And the estimated credit amount should be approximately $5,980

  @edge-case
  Scenario: Income at exact EITC threshold boundary
    Given a taxpayer with filing status "Head of Household"
    And earned income of $55,768
    And 3 qualifying children
    When the EITC eligibility check is performed
    Then the taxpayer should be flagged for manual review
```

**Generated test results:**
```
✅ Single filer with two children — PASSED (all 6 steps green)
✅ Married filing jointly with no children — PASSED
❌ Income at exact threshold boundary — FAILED (step 4: expected "manual review", got "qualified")
✅ Investment income exceeds $11,000 limit — PASSED
```

## 🎯 Why This Matters for Intuit

| Value | Impact |
|-------|--------|
| **🔗 Traceability** | Every line of code traces back to a BDD scenario and product requirement |
| **🤝 Collaboration** | PMs, Engineers, and QA share one source of truth — the Gherkin spec |
| **⚡ Velocity** | The spec → code → test loop goes from days to seconds |
| **🛡️ Quality** | Edge cases and error paths are surfaced *before* a single line of code is written |
| **📖 Living Docs** | BDD specs double as always-current documentation |
| **🤖 AI-Ready** | Structured specs are the ideal input for AI code generation |

## 🛠️ Tech Stack

- **Frontend**: React 18 (single-file artifact)
- **AI Engine**: Anthropic Claude API (Sonnet 4)
- **Spec Language**: Gherkin (Cucumber BDD)
- **Domain**: TurboTax — federal tax filing, EITC, W-2 import, estimated payments
- **Design**: Custom dark theme with Sora + JetBrains Mono typography

## 🚀 Getting Started

BDD Forge runs as a React artifact in Claude.ai — no local setup required.

To run locally:
```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/bdd-forge.git
cd bdd-forge

# The app is a single React component (src/bdd-forge.jsx)
# Drop it into any React project (Vite, CRA, Next.js)
# It calls the Anthropic Claude API directly from the browser
```

## 👥 Team

Built with ❤️ at **PM-XD Hackathon 2026**

## 📄 License

MIT

---

<p align="center">
  <strong>BDD Forge</strong> — Because the best code starts with a conversation, not a compiler.<br/>
  <sub>AI doesn't replace collaboration. It accelerates it.</sub>
</p>
