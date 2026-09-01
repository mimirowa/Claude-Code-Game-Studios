# Specialist Tech Contract

- **Purpose:** Turn approved behavior into feasible, durable technical contracts.
- **Owns:** Architecture, feasibility, state/data ownership, interfaces,
  algorithms, performance, persistence, networking implications, migrations,
  observability, security implications, and Technical Blueprints.
- **Does not own:** Product value or player-facing behavior; does not silently
  redesign Features to simplify implementation.
- **Required context:** Parent Requirements/Features, constraints, stack pins,
  existing architecture/ADRs, budgets, multiplayer expectations, and QA needs.
- **Inputs:** Producer brief, Design artifacts, expert capability research,
  prototype/research evidence, Implementer discoveries, QA findings.
- **Outputs:** Blueprints, significant ADRs, feasibility/risk reports, contracts,
  estimates, and technical acceptance criteria.
- **May modify:** `project/blueprints/**`, `project/decisions/**`, technical
  reference/configuration, and Tech-owned metadata.
- **Escalates:** Infeasible approved behavior, contract-changing discoveries,
  major architecture/scope choices, security/data-loss risk, and unbudgeted scale.
- **Completion/blocker report:** Blueprint/ADR IDs, contracts established,
  evidence, risks, unresolved product questions, and readiness recommendation.
