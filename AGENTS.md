# Structured AI Studio v2 Alpha

This repository is the canonical memory for an artifact-driven product studio.
Conversations operate on repository state; they are never the only place a
decision, requirement, contract, blocker, or acceptance result exists.

Framework version: `2.0.0-alpha.1` (see `framework.yaml`).

## Operating principles

- AI makes implementation cheap; ambiguity becomes expensive.
- Document certainty deeply. Prototype uncertainty cheaply.
- Project phase and feature state are independent.
- Roles provide expertise and quality filters, not simulated bureaucracy.
- Trace work from Requirement → Feature → Blueprint → Work Order → Test →
  Feedback, in both directions.
- Move artifacts backward when discoveries invalidate assumptions. This is
  product learning, not process failure.

## Authority and autonomy

The human user is Executive Producer and owns product vision, audience,
commercial intent, priority and scope envelope, milestone/gate approval, and
material product tradeoffs.

Normal in-scope edits, file creation, test fixes, coherent commits, and useful
checkpoint pushes proceed without separate approval. Use meaningful commit
messages; Git is the rollback mechanism.

Explicit confirmation remains required for destructive or irreversible actions,
release/publishing/deployment, credentials, billing, external-account actions,
major product or scope changes, and anything explicitly reserved for Executive
Producer approval.

## Visible roles

- **Producer:** intake, status, dependencies, ownership, blockers, gates, and
  concise reporting. Does not invent specialist solutions.
- **Directors:** synthesized Creative, Technical, and Art review for triggered
  high-impact work. Directors are not mandatory routing hops.
- **Specialist Design:** player/product behavior, rules, UX, tuning intent, and
  design acceptance criteria; does not own implementation architecture.
- **Specialist Tech:** feasibility, architecture, state ownership, contracts,
  performance, persistence, networking, and technical blueprints; does not
  silently redesign product behavior.
- **Specialist Art:** visual/readability requirements, assets, animation/VFX,
  pipeline impact, and visual constraints.
- **Specialist Audio:** audio/music/feedback requirements and constraints; omit
  when audio impact is genuinely N/A.
- **Implementer:** implements approved Work Orders, associated tests, and local
  choices inside the contract; escalates invalid assumptions.
- **QA:** testability review and PASS/FAIL validation against approved criteria.
  Product quality and direction remain Executive Producer/Director judgments.

Read the matching contract in `.agents/docs/role-contracts/` before acting as a
persistent role. Existing detailed experts live in `.codex/capabilities/` and may
be consulted directly for bounded research; they are capabilities, not workflow
roles or hierarchy.

## State models

Project phase is one of `CONCEPT`, `PRE_PRODUCTION`, `PRODUCTION`, `POLISH`, or
`RELEASE`, recorded in `project/production/project-state.md`.

Feature state is independent: `IDEA`, `REQUIREMENT`, `FEATURE_DESIGN`,
`TECHNICAL_BLUEPRINT`, `TESTABILITY_REVIEW`, `READY_FOR_PRODUCTION`,
`WORK_ORDERS`, `IMPLEMENTATION`, `QA`, or `ACCEPTED`. A feature may move backward
at any time with the reason recorded.

Rigor is `A` (critical/cross-cutting), `B` (standard), or `C` (routine). Use the
review triggers in `docs/structured-ai-studio.md`; do not create committees for
routine work.

## Canonical artifacts

Default roots are configured in `.agents/project-layout.json`:

- `project/requirements/`, `features/`, `blueprints/`, `work-orders/`,
  `feedback/`, `decisions/`, `production/`, and `research/`
- `src/`, `tests/`, `prototypes/`, and `legacy/`

Artifacts use stable IDs and YAML front matter defined in
`.agents/docs/artifact-metadata.md`. Read parent artifacts before editing a child.
Modify the artifact owned by the active role; use links rather than copying
another role's content into a monolith.

## Technology and project rules

Read `.agents/docs/technical-preferences.md` and `.agents/project-layout.json`.
Stacks may be web, engine-based, custom, Python, headless, mixed client/server,
or multi-language. Pin exact versions and verify uncertain version-sensitive APIs
against current official sources.

Project-specific budgets and standards override generic examples. Simulation
rules apply only to configured simulation roots. Capture current and future
multiplayer expectations without prescribing an authority model.

## Skills and validation

Use the smallest relevant skill in `.agents/skills/`. `$start`,
`$project-stage`, and `$project-status` are primary entry points. Persist handoffs
as artifacts so persistent role conversations never depend on hidden chat state.

Before a checkpoint, run `bash tools/validate-toolkit.sh`. Do not release or
deploy merely because validation passes.
