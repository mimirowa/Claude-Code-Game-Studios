---
name: sim-validate
description: "Validate an opt-in deterministic/authoritative simulation through repeatability, invariants, replay, batches, sensitivity, references, and budgets."
---

# Simulation Validation

Use only configured simulation roots. Read the determinism contract, fixed-step
ownership, headless harness, seed/RNG stream policy, canonical state/event hash,
scenario fixtures, tolerances, reference outputs, and project budgets.

Record exact runtime/dependency versions, command, scenario/config hash, seed,
timestep, entity count, and warm-up/samples. Run identical input/seed repeatedly
and report first divergent tick/field. Validate invariants, checkpoint/save-load
and command/event replay where supported. Run configured seed batches and report
distributions/outliers; perturb selected parameters and report sensitivity or
expected monotonic behavior. Compare reference outputs/baselines without
auto-accepting changed goldens. Measure representative and worst-case headless
performance against budgets.

Return `PASS`/`FAIL`/`INCONCLUSIVE` per check with reproducible artifacts.
Distinguish missing harness capability from simulation failure. This complements
unit tests, balance interpretation, and `$perf-profile`.
