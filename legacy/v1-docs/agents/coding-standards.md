# Coding Standards

- Follow the language, formatter, linter, documentation, and testing standards
  configured in `.agents/docs/technical-preferences.md`.
- Prefer clear interfaces and testable seams where they improve maintainability;
  do not impose one dependency-management pattern on every stack.
- Keep tuning values data-driven when designers or operators need to change them.
  Constants intrinsic to an algorithm may remain in code and should be named.
- Add tests in proportion to risk. Bug fixes should normally include a regression
  test; gameplay and simulation logic should have deterministic test seams.
- Verify implementation with the most relevant automated checks, screenshots,
  scenarios, profiling, or manual inspection before marking it complete.
- Public API examples, allocation restrictions, coverage targets, and numeric
  performance limits apply only when configured for the project or subsystem.
- Create ADRs for significant architectural decisions: choices with durable,
  cross-system consequences, meaningful alternatives, or costly reversibility.
  Routine implementation does not require an ADR.

# Design Document Standards

- Use the project's configured design roots. `design/gdd/` is the default.
- Match document depth to the feature's complexity and risk.
- A full system specification may cover overview, player experience, rules,
  formulas, edge cases, dependencies, tuning knobs, and acceptance criteria.
- Smaller changes may update an existing document or task instead of creating a
  new document.
- Balance values should state their source, rationale, or validation method.
