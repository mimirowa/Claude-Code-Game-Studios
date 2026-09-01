---
name: sim-validate
description: "Validate deterministic or authoritative simulations with seeded scenarios, invariants, replay/reference comparisons, batches, sensitivity checks, and performance budgets."
---

# Simulation Validation

## Inputs

Accept an optional scenario, seed set, batch count, reference-output location,
or performance profile. Read `AGENTS.md`, `.agents/project-layout.json`, technical
preferences, simulation rules, manifests, and existing test/build scripts first.

## 1. Discover the Harness

- Locate configured simulation roots and headless entry points.
- Identify fixed timestep, seed injection, state serialization/hash, scenario
  fixtures, invariant checks, telemetry, and performance commands.
- Reuse project-native commands and output formats. Do not silently invent a
  second harness.
- If a capability is missing, distinguish "cannot validate yet" from a failed
  simulation and report the smallest useful harness gap.

## 2. Run Deterministic Scenarios

For each selected scenario:

1. Record runtime/dependency versions, scenario version, seed, timestep, inputs,
   configuration hash, and command.
2. Run the same inputs and seed at least twice.
3. Compare canonical state hashes, event streams, checkpoints, or normalized
   outputs at meaningful ticks and at completion.
4. If results differ, report the first divergent tick/checkpoint and the smallest
   differing state or event field available.

Use the project's determinism contract: bitwise, canonical serialized state, or
documented numeric tolerances.

## 3. Check Invariants and References

- Run project-defined invariants continuously or at configured checkpoints.
- Check conservation, bounds, ownership, ordering, uniqueness, terminal-state,
  or domain-specific properties supplied by the project.
- Compare golden/reference outputs when configured. Updating references is a
  deliberate behavior change and must be clearly reported, not auto-accepted.
- Validate save/load or command/event replay when supported, including replay
  from intermediate checkpoints.

## 4. Batch and Sensitivity Analysis

- Run the configured seed range or batch size and summarize distributions,
  failures, outliers, and confidence limits where meaningful.
- Perturb selected tuning parameters by configured deltas and report sensitivity
  of key outcomes.
- Compare against a baseline artifact or prior commit when supplied; distinguish
  deterministic regressions, statistical shifts, and expected tuning changes.

`$balance-check` interprets game balance; `$sim-validate` establishes repeatable
simulation behavior and measured outcome changes.

## 5. Performance

- Run representative and configured worst-case entity/content scenarios in
  headless mode when available.
- Measure simulation tick time or throughput, memory/allocations, and other
  project budgets with warm-up and sample counts recorded.
- Compare to configured budgets and baselines. `$perf-profile` remains the deeper
  workflow for root-cause profiling.

## 6. Report

Produce a concise Markdown report containing:

- environment and exact command(s);
- scenario/seed/configuration matrix;
- repeatability and first divergence, if any;
- invariant and replay/reference results;
- batch distributions and sensitivity changes;
- performance results versus configured budgets;
- PASS / FAIL / INCONCLUSIVE per check;
- reproducible artifacts and prioritized follow-ups.

Do not claim determinism from a single run. Preserve useful machine-readable
outputs when the project has an artifact convention. Normal test execution and
report writing within the agreed task do not need an extra approval gate.
