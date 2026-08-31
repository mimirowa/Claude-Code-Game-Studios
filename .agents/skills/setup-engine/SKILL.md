---
name: setup-engine
description: "Configure and version-pin any project technology stack: engines, web frameworks, custom runtimes, Python prototypes, servers, persistence, build tools, tests, and target platforms."
---

# Technology Stack Setup

The skill keeps its established `$setup-engine` name, but it supports general
and mixed stacks. Never assume Godot, Unity, Unreal, or any other engine is
required.

## 1. Inspect Before Asking

- Read `AGENTS.md`, `.agents/docs/technical-preferences.md`, and
  `.agents/project-layout.json`.
- Inspect manifests, lockfiles, build scripts, CI, source roots, and existing
  architecture notes.
- For an imported project, report the stack already evidenced by the repository
  and preserve it unless the task includes a migration decision.
- Read the configured design roots for product, platform, scope, and team-size
  constraints when those documents exist.

## 2. Configure Separate Concerns

Determine or explicitly mark undecided/N/A for:

1. Runtime
2. Language(s)
3. Client/rendering framework
4. Simulation runtime
5. Server/backend
6. Persistence/database
7. Build tooling and package management
8. Testing frameworks and commands
9. Target platforms
10. Whether future multiplayer is expected, ruled out, or undecided

Valid choices include browser/web games, TypeScript with Phaser or PixiJS,
custom engines, Python prototypes, headless/server applications, conventional
engines, and mixed client/server stacks.

When a choice is genuinely open, present a small number of viable options with
tradeoffs tied to the project's constraints. Technology choice is a material
architectural/product decision, so let the user choose. Do not ask again when
the agreed task or existing repository already determines it.

## 3. Multiplayer Readiness

Ask whether future multiplayer is expected even when multiplayer is not in the
current milestone. If it is possible or undecided, discuss proportionate seams:

- simulation/domain logic separate from presentation and networking;
- serializable commands, events, and relevant state;
- clear ownership of simulation and persistence state;
- deterministic or authoritative execution where the project needs it;
- no networking dependencies inside domain rules.

Do not prescribe lockstep, client/server, peer-to-peer, turn-based, real-time,
or hybrid networking. Record the current expectation without expanding scope
into multiplayer implementation.

## 4. Pin and Verify Versions

- Pin exact direct dependency and runtime versions in the stack's normal
  manifests, lockfiles, tool-version files, or container definitions.
- Do not guess current releases. When a version must be selected or an API is
  version-sensitive, verify it against current official documentation.
- Prefer primary sources: official documentation, release notes, repositories,
  and package registries maintained by the project owner.
- Record important compatibility, migration, deprecation, and platform notes in
  `docs/technology-reference/<component>/` or an existing project convention.
- Include the pinned version, source links, and last verification date.
- Never estimate what a current or future model "probably knows," and never use
  a model knowledge cutoff as a risk classification.

`$setup-engine refresh` re-checks pinned versions and relevant official notes.
It reports available updates and migration impact; it does not upgrade major
versions without an agreed migration task.

## 5. Configure Project Files

Update, as applicable:

- the concern-based Project configuration section in `AGENTS.md`;
- `.agents/docs/technical-preferences.md`;
- `.agents/project-layout.json` with actual source, design, test, prototype,
  simulation, architecture, and production roots;
- manifests, lockfiles, and tool-version files needed to make pins reproducible;
- concise version-specific reference notes where they add durable value.

Preserve existing project conventions and content. Normal in-scope file edits,
dependency installation, commits, and pushes do not require an extra approval
gate. Confirm destructive migrations, credentials/billing/external-service
actions, release/deployment, scope expansion, and unresolved major stack choices.

## 6. Configure Standards and Budgets

Record measurable project-specific choices rather than universal mandates:

- formatter, linter, naming, and public API documentation policy;
- test commands, required suites, and quality thresholds;
- frame, simulation, memory, allocation, network, storage, and scale budgets;
- significant ADR criteria;
- deterministic simulation requirements, if applicable.

Leave unknown budgets explicitly unconfigured and create a follow-up task; do
not invent a generic `2 ms`, zero-allocation, or coverage target.

## 7. Report

Summarize the configured concerns, exact version pins, verified sources,
project-root mapping, multiplayer expectation, commands to build/test, unresolved
decisions, and files changed. Suggest `$project-stage-detect`, `$sim-validate`, or
another relevant next step based on the actual project.

## Guardrails

- Treat framework/engine-specific examples as examples, not the supported set.
- Do not physically reorganize an imported repository merely to fit defaults.
- Do not overwrite unrelated reference notes.
- Verify ambiguous version information before encoding it.
