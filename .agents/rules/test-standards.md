---
paths:
  - "<configured testRoots>/**"
---

# Test Standards

- Link important tests to TEST, Feature, Blueprint, or Work Order IDs.
- Tests state arrangement/input, action, expected result/tolerance, and failure
  evidence. Names should identify behavior/scenario, not implementation detail.
- Unit tests avoid uncontrolled external state; integration tests isolate/clean
  resources; performance tests record environment, workload, samples, and budget.
- Use deterministic fixtures/seeds when outcome depends on randomness.
- A bug fix normally adds a regression that fails before the fix.
- Never weaken approved criteria or goldens merely to pass changed code. Route
  intentional behavior changes through the owning artifact first.
- Report PASS, FAIL, or INCONCLUSIVE; do not convert missing testability into PASS.
