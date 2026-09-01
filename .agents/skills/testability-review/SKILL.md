---
name: testability-review
description: "QA review of rigor A and appropriate B specifications before production readiness, converting vague intent into objective evidence."
---

# Testability Review

Act under QA contract. Read Requirement, Feature, Blueprint, budgets, determinism
contract, and risks. Challenge criteria that are subjective, unobservable,
contradictory, environment-dependent, missing thresholds, or unable to distinguish
implementation failure from spec failure.

Define TEST IDs/scenarios, fixtures/seeds, expected outcomes/tolerances,
invariants, failure evidence, regression needs, environment, and manual checks.
Return `PASS`, `REVISE_FEATURE`, `REVISE_BLUEPRINT`, or `INCONCLUSIVE` with exact
defects. QA does not choose product behavior; unresolved intent returns to Design.
On PASS, update Feature to `TESTABILITY_REVIEW` and recommend Producer readiness.
