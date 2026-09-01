---
name: project-stage-detect
description: "Audit a new, imported, or legacy project in place; detect its stage, configured roots, existing capabilities, and evidence-based gaps."
---

# Project Stage Detection

## 1. Load Project Layout

Read `.agents/project-layout.json`. Use every configured source, design, test,
prototype, simulation, architecture, and production root that exists. If the
file is missing, infer likely roots from manifests and repository structure,
report the inference, and use the standard defaults only as a fallback.

Do not require a repository reorganization before auditing it. Support monorepos,
web packages, custom engines, Python projects, servers, and mixed stacks.

## 2. Inspect Evidence

- Read manifests, lockfiles, build/test scripts, CI, entry points, and technical
  preferences to identify the actual stack and pinned versions.
- Inventory major modules under all source roots and distinguish implemented,
  stubbed, generated, and unused code.
- Inventory design, architecture, production, prototype, and test artifacts.
- Inspect simulation roots for timestep ownership, determinism, replay,
  headless execution, scenario tests, telemetry, and performance tests.
- Identify where persistence and runtime state are owned.
- Record whether future multiplayer is expected, ruled out, or undecided. If it
  is not recorded, flag the question without assuming single-player forever.

## 3. Classify Stage

Honor an explicit stage file in a configured production root. Otherwise classify
the project from repository evidence rather than fixed file-count thresholds:

- **Concept**: product intent is still being discovered.
- **Systems Design**: core systems are being specified or decomposed.
- **Technical Setup**: stack, repository, and executable skeleton are forming.
- **Pre-Production**: representative slices/prototypes validate major risks.
- **Production**: planned product systems are being implemented and integrated.
- **Polish**: feature scope is substantially stable and quality dominates.
- **Release**: release candidate, distribution, and operations work is active.

State confidence and conflicting indicators. An old or large codebase is not
automatically in Production if its implementation is nonfunctional or abandoned.

## 4. Identify Gaps Without Template Bias

Describe observed capability first, then the gap and its impact. A missing
default-path document is not a gap if the information exists elsewhere or is not
needed. ADRs are expected only for significant architectural decisions. Testing,
documentation, and performance expectations come from configured project rules.

Ask only questions that materially change the assessment or next action. Routine
report creation does not need a separate file-write confirmation.

## 5. Active Role Set

Recommend a lean role set for the current stage:

- continuously active roles;
- specialists consulted for identified subsystems or risks;
- milestone-only reviewers.

This is a recommendation, not mandatory routing. Project-specific role matrices
belong in the project repository.

## 6. Write the Report

Use `.agents/docs/templates/project-stage-report.md`, adapting sections to the
actual layout. Include:

- stage and confidence;
- configured/inferred roots and technology concerns;
- implemented capabilities and stubs;
- evidence-backed gaps and risks;
- multiplayer-readiness status without adding multiplayer scope;
- recommended next actions and active role set.

Write the report when requested or when it is the agreed output, then verify it.

## Follow-up

Recommend only relevant workflows, such as `$reverse-document`, `$setup-engine`,
`$sim-validate`, `$map-systems`, `$sprint-plan`, or `$gate-check`.
