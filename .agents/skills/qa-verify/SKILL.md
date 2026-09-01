---
name: qa-verify
description: "Verify an implementation against approved Feature, Blueprint, Work Order, tests, invariants, and budgets with objective PASS/FAIL evidence."
---

# QA Verify

Act under QA contract. Read approved criteria; do not infer them from the
implementation. Record environment/version, commands, fixtures/seeds, observed
results, logs/artifacts, regression impact, and budget measurements. Run required
automated/scenario/manual tests and add justified regression tests.

Return per-criterion `PASS`, `FAIL`, or `INCONCLUSIVE`. Classify every issue:
`BUG`, `SPEC_DEFECT`, `IMPROVEMENT`, or `DISCOVERY`, create/link Feedback, and
route it accordingly. On complete PASS recommend/record `ACCEPTED`; acceptance
means spec satisfied, not that Directors/Executive Producer consider the product
good enough.
