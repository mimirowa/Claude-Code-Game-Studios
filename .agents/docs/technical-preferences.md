# Technical Preferences

<!-- Populated by $setup-stack. Pin exact versions in project manifests and
lockfiles. Use N/A where a concern does not apply. -->

## Technology Stack

- **Runtime**: [TO BE CONFIGURED]
- **Primary Language**: [TO BE CONFIGURED]
- **Secondary Languages**: [TO BE CONFIGURED or NONE]
- **Client / Rendering Framework**: [TO BE CONFIGURED or N/A]
- **Simulation Runtime**: [TO BE CONFIGURED or N/A]
- **Server / Backend**: [TO BE CONFIGURED or N/A]
- **Persistence / Database**: [TO BE CONFIGURED or N/A]
- **Build Tooling**: [TO BE CONFIGURED]
- **Package Manager**: [TO BE CONFIGURED]
- **Testing**: [TO BE CONFIGURED]
- **Target Platforms**: [TO BE CONFIGURED]
- **Deployment**: [TO BE CONFIGURED or N/A]
- **Current Multiplayer Requirement**: [TO BE CONFIGURED]
- **Future Multiplayer Expected**: [YES / NO / UNDECIDED]

## Version Policy

- Exact runtime and dependency versions: [PIN IN MANIFESTS / LOCKFILES]
- Official documentation sources: [LINKS]
- Version-specific project notes: [PATHS or NONE]
- Last verified: [DATE]

Verify version-sensitive APIs against current official documentation when the
answer affects implementation. Record durable compatibility notes in project
documentation. Never infer reliability from a model knowledge-cutoff estimate.

## Architecture Boundaries

- **Simulation ownership**: [TO BE CONFIGURED]
- **Client / simulation boundary**: [TO BE CONFIGURED]
- **Persistence ownership**: [TO BE CONFIGURED]
- **Command / event / state serialization**: [TO BE CONFIGURED]

If future multiplayer is possible, keep domain and simulation logic independent
of presentation and networking, and make relevant commands, events, and state
serializable. Choose deterministic, authoritative, peer-to-peer, or hybrid
execution based on project needs; the framework does not prescribe one model.

## Naming and Code Conventions

- **Formatting / linting**: [TO BE CONFIGURED]
- **Public API documentation**: [TO BE CONFIGURED]
- **Naming**: [TO BE CONFIGURED]
- **Error handling**: [TO BE CONFIGURED]

## Measurable Budgets

- **Rendering / frame time**: [TO BE CONFIGURED or N/A]
- **Simulation tick / throughput**: [TO BE CONFIGURED or N/A]
- **Memory / allocations**: [TO BE CONFIGURED]
- **Network / storage**: [TO BE CONFIGURED or N/A]
- **Worst-case entity or content scale**: [TO BE CONFIGURED]

Rules enforce configured budgets, not framework-wide numeric defaults. Profile
representative and worst-case workloads before and after optimization.

## Testing Standards

- **Frameworks**: [TO BE CONFIGURED]
- **Required suites**: [TO BE CONFIGURED]
- **Coverage / quality gates**: [TO BE CONFIGURED]
- **Determinism / replay checks**: [TO BE CONFIGURED or N/A]

## Forbidden Patterns

- [None configured yet]

## Allowed Libraries / Addons

- [None configured yet]

## Architecture Decisions Log

Create ADRs for significant, durable architectural choices with meaningful
alternatives or cross-system consequences. Routine implementation does not
require an ADR.

- [No ADRs yet]
