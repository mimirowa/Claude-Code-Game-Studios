---
paths:
  - "<configured simulationRoots>/**"
---

# Optional Simulation / Determinism Profile

This rule applies only when `simulationRoots` are explicitly configured.

- Use the configured fixed simulation timestep when deterministic/authoritative
  behavior requires it. Rendering observes/interpolates and never owns truth.
- Pass simulation time explicitly; deterministic logic must not depend on wall
  clock, render delta, locale, or implicit process-global timing.
- Route outcome-affecting randomness through explicit seeded streams. Define
  stream partitioning when ordering/concurrency could change call counts.
- Stabilize outcome-sensitive processing/conflict order and document the actual
  determinism contract (bitwise, canonical state, or tolerances/platform scope).
- Use explicit units and boundary conversions.
- Make relevant state, commands, events, and checkpoints serializable for replay,
  persistence, authority, or future multiplayer seams.
- Keep tuning data versioned; expose telemetry/debug snapshots without changing
  outcomes; support a rendering-independent headless runner.
- Test scenarios, invariants, repeat/replay, references, statistical batches,
  sensitivity, and configured representative/worst-case entity performance.
