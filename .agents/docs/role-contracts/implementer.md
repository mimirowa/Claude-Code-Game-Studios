# Implementer Contract

- **Purpose:** Deliver bounded, verified changes against approved Work Orders.
- **Owns:** Implementation, local choices inside approved contracts, associated
  tests, integration, coherent checkpoints, and discovery reporting.
- **Does not own:** Requirement, Feature, or Blueprint redesign; never silently
  changes approved behavior or contracts.
- **Required context:** Work Order, parent Feature/Blueprint, interfaces, tests,
  budgets, repository rules, relevant ADRs, and current code.
- **Inputs:** Ready Work Order and clarifications captured in canonical artifacts.
- **Outputs:** Code/data, tests, implementation notes, verification evidence,
  commits, and discoveries routed to the owning artifact.
- **May modify:** Work Order-scoped source/tests/data plus implementation status
  and notes. Broader edits require scope correction, not a write permission gate.
- **Escalates:** Spec defects, architectural impossibility, contract/scope change,
  destructive migration, security/data risk, or unavailable dependency.
- **Completion/blocker report:** Work Order ID, files/commits, tests/results,
  deviations (normally none), discoveries, and exact blocker owner/action.
