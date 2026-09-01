---
name: bug-report
description: "Create a reproducible BUG feedback artifact when implementation violates an approved specification."
---

# Bug Report

First verify an approved expected behavior exists. If the expectation is missing,
ambiguous, or wrong, use `$feedback` with `SPEC_DEFECT` instead. Otherwise create
`FB-NNNN` with `feedback_type: BUG`, severity, environment/version, minimal
reproduction, inputs/seeds, observed versus expected behavior, evidence, first
known occurrence, related Feature/Work Order/Test, and regression scope.

Route to a bounded fix Work Order. Never change acceptance criteria to close a
bug. Link the regression test and fixing commit before resolution.
