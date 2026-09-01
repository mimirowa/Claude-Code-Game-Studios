---
paths:
  - "<configured sourceRoots>/**"
---

# Configurable Coding Standards

- Follow formatter, linter, naming, documentation, test, and dependency policy in
  `.agents/docs/technical-preferences.md` and closer project instructions.
- Important performance constraints must be measurable against configured
  workloads/budgets. Do not impose universal allocation, timing, or coverage limits.
- Put intended tuning values in versioned configuration; named algorithmic
  constants may remain in code.
- Preserve architecture/dependency boundaries from approved Blueprints/ADRs.
- Bug fixes normally include a regression test. Verify changes proportionately.
- Public API examples and ADRs are required only when project policy or the
  significance of the decision warrants them.
- Mention the Work Order ID in implementation notes/commits when practical.
