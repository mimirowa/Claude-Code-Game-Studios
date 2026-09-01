# Structured AI Studio v2 Alpha

Structured AI Studio is a traceable, artifact-driven AI product-development
framework optimized for games and reusable for software projects. This branch is
`2.0.0-alpha.1`; the `codex` branch remains the v1 reference implementation.

The core idea is simple: repository artifacts are studio memory. Requirements,
Features, Blueprints, Work Orders, Tests, Feedback, decisions, and production
state form an explicit chain. Persistent AI role conversations operate on that
state rather than sharing hidden chat context.

## What changed in v2

- Eight concise operational roles replace a visible 48-agent hierarchy.
- All 48 detailed experts remain available as non-routing capabilities.
- Project phase and per-Feature lifecycle are independent.
- Stable IDs and parseable front matter provide forward/reverse traceability.
- Rigor A/B/C and trigger-based reviews avoid simulated committees.
- QA reviews testability before important implementation and verifies PASS/FAIL.
- Research/prototypes retire uncertainty; Work Orders bound implementation.
- Generic stacks, future multiplayer seams, and opt-in deterministic simulation
  are first-class.
- Routine edits, commits, pushes, and test fixes are autonomous; destructive,
  release, credential/billing/external-account, and material product/scope actions
  remain explicit decisions.

## Start

```bash
git clone --branch structured-ai-studio --single-branch \
  https://github.com/mimirowa/Claude-Code-Game-Studios.git my-project
cd my-project
codex
```

Run `$start`. For an imported repository, use `$project-stage`; for an active
project, use `$project-status`.

Read:

- [Architecture](docs/structured-ai-studio.md)
- [Quick start](.agents/docs/quick-start.md)
- [Artifact metadata](.agents/docs/artifact-metadata.md)
- [Role contracts](.agents/docs/role-contracts/README.md)
- [Workflow reference](.agents/docs/workflow-reference.md)
- [v1 migration audit](docs/v2-migration-audit.md)

## Repository map

```text
framework.yaml                  Framework identity/version
AGENTS.md                       Root operating contract
project/                        Canonical product/production artifacts
.agents/skills/                 27 v2 workflows
.agents/rules/                  6 v2 rules
.agents/docs/templates/         11 canonical artifact templates
.agents/docs/role-contracts/    Persistent-role ownership contracts
.codex/agents/                  8 visible operational roles
.codex/capabilities/            48 preserved detailed experts
.codex/hooks/                   State recovery and validation hooks
legacy/                         Non-active v1 workflow source material
tools/validate-toolkit.sh       Framework validation entry point
```

## Validate

```bash
bash tools/validate-toolkit.sh
```

This is an alpha operating model intended for dogfooding. It deliberately omits
Trello synchronization, dashboards, schedulers, and other automation until the
human workflow has proven useful.
