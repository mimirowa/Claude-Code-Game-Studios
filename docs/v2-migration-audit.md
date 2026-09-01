# v1 → Structured AI Studio v2 Migration Audit

Baseline: `codex` at `7d1a054`. Classification describes the v2 treatment.
`KEEP` means unchanged concept/content; `ADAPT` means retained with v2 semantics;
`REPLACE` means a new canonical workflow supersedes it; `REMOVE/DEPRECATE` means
it is not workflow-active in v2, though useful source material may remain under
`legacy/` or as a capability.

## Agents

All 48 v1 native agents were reviewed. Their long persona prompts are removed
from the visible workflow and preserved under `.codex/capabilities/` for bounded
expert consultation.

| Classification | v1 agents | v2 treatment |
|---|---|---|
| REPLACE | `producer`, `creative-director`, `technical-director`, `art-director`, `game-designer`, `technical-artist`, `audio-director`, `sound-designer`, `lead-programmer`, `qa-lead`, `qa-tester` | Concise Producer, Directors, Specialist Design/Tech/Art/Audio, Implementer, and QA contracts/agents |
| KEEP as capability | `accessibility-specialist`, `ai-programmer`, `analytics-engineer`, `community-manager`, `devops-engineer`, `economy-designer`, `engine-programmer`, `gameplay-programmer`, `level-designer`, `live-ops-designer`, `localization-lead`, `narrative-director`, `network-programmer`, `performance-analyst`, `prototyper`, `release-manager`, `security-engineer`, `systems-designer`, `tools-programmer`, `ui-programmer`, `ux-designer`, `world-builder`, `writer` | Non-visible expert capability; Producer/primary role may consult directly |
| KEEP as engine capability | `godot-specialist`, `godot-gdscript-specialist`, `godot-gdextension-specialist`, `godot-shader-specialist`, `unity-specialist`, `unity-addressables-specialist`, `unity-dots-specialist`, `unity-shader-specialist`, `unity-ui-specialist`, `unreal-specialist`, `ue-blueprint-specialist`, `ue-gas-specialist`, `ue-replication-specialist`, `ue-umg-specialist` | Available only when the configured stack makes them relevant |

## Skills

| Classification | v1 skills | Rationale / v2 destination |
|---|---|---|
| ADAPT | `start`, `project-stage-detect`, `brainstorm`, `prototype`, `architecture-decision`, `bug-report`, `perf-profile`, `sim-validate`, `tech-debt`, `retrospective` | Rewritten/trimmed around canonical artifacts, uncertainty, and explicit evidence |
| REPLACE | `map-systems`, `design-system`, `design-review`, `code-review`, `gate-check`, `milestone-review`, `sprint-plan`, `playtest-report`, `scope-check`, `estimate`, `onboard` | Superseded by `map-requirements`, `map-features`, `design-feature`, `technical-blueprint`, `testability-review`, `work-order`, `implement`, `qa-verify`, `feedback`, `gate-review`, `production-plan`, `project-status` |
| KEEP as optional specialist workflow | `asset-audit`, `balance-check`, `localize`, `launch-checklist`, `release-checklist`, `changelog`, `patch-notes`, `hotfix` | Valuable but moved outside alpha core; may return as capability workflows after dogfood |
| REMOVE / DEPRECATE | `team-audio`, `team-combat`, `team-level`, `team-narrative`, `team-polish`, `team-release`, `team-ui` | Simulated department pipelines duplicate role contracts and trigger-based review |
| REMOVE / DEPRECATE | `reverse-document` | Imported-project auditing belongs in project-stage; focused reverse documentation can be requested as a Work Order |
| REPLACE | `setup-engine` | Replaced by general `setup-stack`; no engine-only setup model |

Deprecated v1 skill sources are retained in `legacy/v1-skills/` for alpha
reference and are not repository-discoverable skills.

## Rules

| Classification | v1 rules | Treatment |
|---|---|---|
| ADAPT | `data-files`, `test-standards`, `prototype-code`, `simulation-code` | Generalized metadata/project budgets and opt-in configured roots |
| REPLACE | `design-docs`, `gameplay-code`, `engine-code`, `ai-code`, `network-code`, `ui-code` | Replaced by artifact, role-boundary, configurable coding, and optional simulation rules |
| KEEP as optional domain guidance | `narrative`, `shader-code` | Moved to legacy guidance; enable only via project-specific rules |

## Hooks

| Hook | Classification | Treatment |
|---|---|---|
| `session-start.sh`, `pre-compact.sh`, `session-stop.sh` | ADAPT | Recover/write compact pointers to phase, gate, task, role, blockers, decisions, and files |
| `detect-gaps.sh` | REPLACE | Artifact/state-aware gap detection using configured roots |
| `validate-commit.sh` | REPLACE | Non-blocking artifact/front-matter/traceability warnings plus hard syntax failures |
| `validate-push.sh` | ADAPT | Advisory protected-branch warning; no routine push approval gate |
| `validate-assets.sh` | KEEP | Still useful when assets are in scope |
| `log-agent.sh` | ADAPT | Role/capability terminology and canonical artifact references |

## Templates

| Classification | v1 templates |
|---|---|
| REPLACE with canonical v2 artifacts | `architecture-decision-record`, `game-design-document`, `technical-design-document`, `test-plan`, `project-stage-report`, `milestone-definition`, `sprint-plan`, `concept-doc-from-prototype` |
| KEEP as optional domain/content references | `art-bible`, `changelog-template`, `economy-model`, `faction-design`, `game-concept`, `game-pillars`, `incident-response`, `level-design-document`, `narrative-character-sheet`, `pitch-document`, `post-mortem`, `release-checklist-template`, `release-notes`, `risk-register-entry`, `sound-bible` |
| REMOVE / DEPRECATE | `architecture-doc-from-code`, `design-doc-from-implementation`, `systems-index`, all `collaborative-protocols/*` | Duplicate v2 artifact flow or encode persona/write-gate behavior |

V2 canonical templates are Requirement, Feature, Blueprint, Work Order, Feedback,
ADR, Research, Prototype Findings, Gate Review, Product Strategy, and Business
Case. Optional v1 sources move to `legacy/v1-templates/` during alpha.

## Documentation

| Classification | v1 documentation | Treatment |
|---|---|---|
| REPLACE | `agent-coordination-map`, `agent-roster`, `coordination-rules`, `review-workflow`, `quick-start`, `skills-reference`, `rules-reference`, `directory-structure`, `COLLABORATIVE-DESIGN-PRINCIPLE`, `WORKFLOW-GUIDE`, examples | Superseded by architecture, role contracts, metadata, workflow reference, and migration docs |
| ADAPT | `coding-standards`, `context-management`, `technical-preferences`, `setup-requirements`, hooks reference | Keep concise and align to project configuration/canonical state |
| KEEP | Codex user config/instruction templates; version-pinned engine reference notes | Useful operational/reference content, not core process |

## Decision summary

V2 deliberately reduces workflow-visible agents and skills while retaining
specialist knowledge out of the routing surface. It favors a small coherent
artifact lifecycle over compatibility aliases. Dogfood findings may promote
optional v1 capabilities back into v2 when concrete demand exists.
