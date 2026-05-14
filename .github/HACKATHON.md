# 🏆 Hackathon Submission Notes

## BDD Forge — PM-XD Hackathon 2026

### Project Summary

BDD Forge is an AI-powered tool that applies Behavioral Driven Development (BDD) methodology to TurboTax product development. It transforms natural-language requirements into executable BDD scenarios, implementation code, and validated test results — demonstrating how AI can accelerate the entire development lifecycle when paired with structured specifications.

### Demo Instructions

1. Open the BDD Forge app (React artifact)
2. Select a persona (Product Manager, Developer, or QA)
3. Enter a requirement or click a sample
4. Watch the full pipeline execute in real-time
5. Review generated BDD scenarios, code, and test results
6. Use "Export to GitHub" to copy all artifacts

### Key Innovation

The insight that BDD's structured natural language (Given/When/Then) serves as the ideal interface between human intent and AI execution. Rather than giving AI vague requirements and hoping for correct code, BDD Forge uses Gherkin scenarios as a precise, human-verifiable intermediate layer.

### Technical Highlights

- **Three API calls in sequence**: Requirement → BDD → Code → Tests, each building on the previous output
- **Persona-adaptive prompts**: The AI system prompts change based on the selected role
- **Domain-specific knowledge**: Uses real TurboTax tax domain data (EITC thresholds, filing statuses, W-2 validation rules)
- **Zero setup**: Runs entirely as a React artifact with browser-based API calls

### Impact Potential

- **Cross-functional alignment**: PMs, Devs, and QA work from the same BDD specs
- **Faster iteration**: Spec → Code → Test in seconds, not sprint cycles
- **Quality by design**: Edge cases surface at spec time, not in production
- **Scalable to any Intuit product**: QuickBooks, Mailchimp, Credit Karma — any domain with structured business rules

### Built With

- React 18 (single-file component)
- Anthropic Claude API (Sonnet 4)
- Gherkin BDD specification language
- TurboTax tax domain knowledge
