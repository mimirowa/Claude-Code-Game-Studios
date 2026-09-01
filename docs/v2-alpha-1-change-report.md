# Structured AI Studio v2 Alpha.1 Change Report

## 1. Branch and version

- Branch: `structured-ai-studio`, created from `codex` commit `7d1a054`.
- Framework: Structured AI Studio `2.0.0-alpha.1` (`framework.yaml`).
- `codex` remains unchanged as the v1 reference; no stable v2 tag was created.

## 2. Architecture changes

V2 replaces a visible simulated studio hierarchy with repository-backed state,
stable artifacts, eight concise operational roles, direct expert consultation,
independent Project Phase/Feature State, rigor A/B/C, trigger-based Director
review, pre-production QA testability, and classified feedback routing.

The canonical trace is Requirement → Feature → Blueprint → Work Order → Test →
Feedback, with reverse links. Research and prototypes retire uncertainty;
implementation begins from bounded Work Orders. Conversations hand off through
artifacts, never hidden cross-chat context.

## 3. Files added

- `framework.yaml` and `docs/structured-ai-studio.md`.
- `docs/v2-migration-audit.md` and this report.
- Eight Role Contracts and eight concise `.codex/agents/*.toml` roles.
- `.agents/docs/artifact-metadata.md`.
- Eleven canonical templates: Requirement, Feature, Blueprint, Work Order,
  Feedback, ADR, Research, Prototype Findings, Gate Review, Product Strategy,
  and Business Case.
- Twenty-eight focused v2 skills (including bounded capability consultation) and
  six active rules.
- `project/production/project-state.md`.
- `tools/validate-framework.py`.
- `legacy/v1-*` preserves non-active v1 workflows, rules, templates, and docs.

## 4. Files substantially modified

- `AGENTS.md` now defines v2 authority, roles, state, artifacts, autonomy, stack,
  and canonical-memory rules.
- `README.md`, quick start, workflow reference, technical preferences, setup and
  hook references now describe v2.
- `.agents/project-layout.json` maps artifact/source/test/prototype/legacy/
  simulation/asset roots.
- Session, compaction, state-check, commit-validation, and role-audit hooks now
  use `project/production/**` and `$skill` terminology.
- Toolkit validation now checks active surface counts, framework identity,
  metadata, stable IDs/links, skills, roles/contracts, TOML/JSON, hooks, shell
  syntax, and stale terminology.

## 5. Skills kept, adapted, replaced, and deprecated

- Adapted concepts: start, project-stage audit, brainstorm, prototype, ADR,
  bug-report, performance, simulation validation, tech debt, retrospective.
- New/replacement core: project-status, research, product vision/strategy/business
  case, requirement/feature mapping, feature design, blueprint, testability,
  Work Order, implement, QA verify, feedback, gate review, production planning,
  and general stack setup.
- Deprecated from active discovery: department-team pipelines, duplicated design/
  review/gate/sprint workflows, engine-only setup, and reverse-document ceremony.
- Optional release/localization/balance/content v1 workflows remain preserved for
  possible evidence-based reintroduction after dogfood.

The exhaustive per-item classification and rationale is in
`docs/v2-migration-audit.md`.

## 6. Agent changes

The visible surface is Producer, Directors, Specialist Design, Specialist Tech,
Specialist Art, Specialist Audio, Implementer, and QA. The human is Executive
Producer. All 48 v1 detailed agents moved unchanged to `.codex/capabilities/` so
their expertise can support bounded investigation without imposing routing hops.

## 7. Hook changes

- Startup reports only canonical state pointers, phase/objective/gate/blockers,
  active handoff, and recent checkpoints.
- Gap detection runs lightweight framework/state validation.
- Compaction persists active role/task/artifact, blockers, decisions, and files.
- Session end appends a concise checkpoint without deleting canonical state.
- Commit validation is advisory and artifact-aware; normal commits/pushes remain
  autonomous. Release/deployment authority is not inferred from hook success.

## 8. Validation results

Final validation covers:

- 28 active skills, 8 visible roles, 48 preserved capabilities, 6 active rules,
  and 11 canonical templates;
- framework name/version/status;
- JSON and all active/capability TOML parsing;
- required files, Role Contracts, skill names/references, and hook targets;
- artifact/template front matter, stable ID uniqueness/patterns, and relationship
  resolution for managed project artifacts;
- shell syntax and stale Claude/model/path/write-gate terminology outside legacy.

Command: `bash tools/validate-toolkit.sh`.

## 9. Known limitations

- Front-matter validation intentionally supports a conservative simple-YAML
  subset; alpha dogfood should determine whether a YAML dependency/schema is
  justified.
- No Trello sync, dashboard, daemon, distributed scheduler, or automatic workflow
  transition engine exists. Metadata is designed to enable later projection.
- Stable ID allocation is procedural, not concurrency-locked.
- Optional v1 content/release workflows are legacy references, not polished v2
  skills. Reintroduce only where real project usage demonstrates need.
- Testability and lifecycle quality still depend on disciplined artifact review;
  automation checks shape and links, not whether product intent is wise.

## 10. Recommended first-project dogfood workflow

1. Run `$project-stage` against the imported repository without reorganizing it.
2. Record actual roots/stack pins and current/future multiplayer expectation with
   `$setup-stack` only where needed.
3. Establish/confirm Product Vision, then map Requirements and Features.
4. Select one gate-critical rigor A/B Feature. Run `$design-feature`,
   `$technical-blueprint`, and `$testability-review`.
5. Create one small `$work-order`, implement it, and run `$qa-verify` (plus
   `$sim-validate` when its code is in an opted-in simulation root).
6. Classify every mismatch through `$feedback`; allow lifecycle rollback.
7. Use `$project-status` after each handoff and capture operating friction for a
   framework retrospective before scaling the number of features.

## 11. Suggested `2.0.0-alpha.2` items

- Dogfood-derived metadata/schema revisions and a safe stable-ID allocator.
- A traceability/status CLI that emits JSON for Trello or dashboards without
  changing canonical state.
- Explicit TEST artifact template if project usage shows tests need separate
  persistent packages rather than Feature/Blueprint QA sections.
- Reintroduce only proven optional workflows (balance, accessibility,
  localization, release) in v2 role/artifact form.
- Add fixture repositories and end-to-end workflow validation from Requirement to
  Accepted/Feedback rollback.
- Evaluate whether capability prompts should be shortened or indexed by a
  machine-readable capability registry after observing actual consultation use.
