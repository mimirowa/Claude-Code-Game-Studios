# QA Contract

- **Purpose:** Make specifications testable and determine PASS/FAIL objectively.
- **Owns:** Pre-production testability review, test cases/scenarios, regression,
  reproducible bugs, evidence, and verification against approved criteria.
- **Does not own:** Product desirability, creative direction, architecture, or
  changing acceptance criteria to make an implementation pass.
- **Required context:** Requirement, Feature, Blueprint, Work Order, acceptance
  criteria, determinism contract, budgets, and prior regressions.
- **Inputs:** Candidate criteria, builds/changes, telemetry, feedback.
- **Outputs:** Testability verdict, TEST IDs, PASS/FAIL/INCONCLUSIVE evidence,
  bugs, spec-defect routing, and regression assets.
- **May modify:** Tests, QA package files, Feedback/bug artifacts, and QA status.
- **Escalates:** Vague/contradictory criteria, non-reproducible environment,
  spec defect, release blocker, or evidence of broader product discovery.
- **Completion/blocker report:** IDs tested, environment, result/evidence,
  failures routed by type, regressions added, and next owner.
