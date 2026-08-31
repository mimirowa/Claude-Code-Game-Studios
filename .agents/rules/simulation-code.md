---
paths:
  - "src/sim/**"
  - "<configured simulationRoots>/**"
---

# Simulation Code Rules

Apply this profile only to simulation roots configured in
`.agents/project-layout.json` or project-specific AGENTS instructions.

- Advance authoritative simulation state with a configured fixed timestep.
  Rendering may interpolate or observe state but must not own simulation truth.
- Pass simulation time explicitly. Deterministic logic must not read wall-clock
  time, render delta, frame count, locale, or process-global timing implicitly.
- Route outcome-affecting randomness through explicit seeded RNG streams. Record
  seeds and define how streams are partitioned when ordering or concurrency can
  change call counts.
- Make outcome-sensitive iteration and conflict resolution order stable and
  documented across supported runtimes/platforms.
- State units in names, types, schemas, or nearby documentation. Convert units at
  boundaries and avoid ambiguous unitless values.
- Keep tuning values in versioned data or clearly named configuration when they
  are intended to change without algorithm edits.
- Expose useful telemetry and debug snapshots without changing outcomes.
- Support a rendering-independent headless runner for automated scenarios,
  replay, regression, batch, and performance tests.
- Make commands, events, checkpoints, and relevant state serializable when replay,
  persistence, authoritative execution, or future multiplayer may need them.
- Test invariants, repeated runs with the same seed, reference outputs where
  appropriate, and representative plus configured worst-case entity counts.
- Meet the measurable budgets in technical preferences. Do not invent universal
  tick-rate, latency, allocation, or throughput limits.

If strict cross-platform bitwise determinism is not required, document the actual
contract (for example deterministic on one runtime/version or tolerance-based
reference comparison).
