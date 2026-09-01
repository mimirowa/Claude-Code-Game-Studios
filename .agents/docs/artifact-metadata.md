# Artifact Metadata and Stable IDs

All canonical project artifacts are Markdown with YAML front matter. Use plain
YAML scalars and lists so standard parsers and future board integrations can
read them. The repository is authoritative; external tools mirror this data.

## Required common fields

```yaml
---
id: FTR-SIM-023
type: feature
title: Crosswind Echelons
status: TECHNICAL_BLUEPRINT
project_phase: PRE_PRODUCTION
rigor: A
priority: P0
owner_role: specialist_tech
reviewers:
  - specialist_design
  - qa
parent_ids:
  - REQ-SIM-004
depends_on:
  - FTR-SIM-007
blocks:
  - FTR-AI-011
blocked_by: []
trello_card_id: null
last_updated: 2026-09-01
---
```

Required on managed artifacts: `id`, `type`, `title`, `status`, `project_phase`,
`rigor`, `priority`, `owner_role`, `reviewers`, `parent_ids`, `depends_on`,
`blocks`, `blocked_by`, and `last_updated`. `trello_card_id` is optional but
reserved. Use `[]`, never omitted/null, for empty relationship lists.

Allowed project phases: `CONCEPT`, `PRE_PRODUCTION`, `PRODUCTION`, `POLISH`,
`RELEASE`. Allowed rigor: `A`, `B`, `C`. Recommended priority: `P0`–`P3`.

Feature status uses the Feature lifecycle. Other artifacts use a small type-
appropriate uppercase vocabulary documented by their template (for example
`DRAFT`, `READY`, `ACTIVE`, `BLOCKED`, `VERIFIED`, `ACCEPTED`, `SUPERSEDED`).

## Stable ID rules

| Type | Pattern | Example |
|---|---|---|
| Requirement | `REQ[-DOMAIN]-NNN` | `REQ-SIM-004` |
| Feature | `FTR[-DOMAIN]-NNN` | `FTR-SIM-023` |
| Blueprint | `BP[-DOMAIN]-NNN-NN` | `BP-SIM-023-01` |
| Work Order | `WO[-DOMAIN]-NNN-NN` | `WO-SIM-023-03` |
| Test | `TEST[-DOMAIN]-NNN-NN` | `TEST-SIM-023-02` |
| Feedback | `FB-NNNN` | `FB-0041` |
| ADR | `ADR-NNN` | `ADR-007` |
| Research | `RES[-DOMAIN]-NNN` | `RES-MKT-003` |
| Prototype | `PRO-NNN` | `PRO-006` |
| Gate | `GATE-NAME-NN` | `GATE-FIRST-PLAYABLE-01` |

Domain prefixes are optional uppercase letters/digits. Allocate the next ID by
scanning the canonical root and reserved IDs. Never renumber or reuse an ID,
including after cancellation. Filename begins with lowercase ID followed by a
short slug, e.g. `ftr-sim-023-crosswind-echelons.md`.

## Traceability

- `parent_ids` points upward; parent artifacts list children in their body or
  relationship metadata when the template provides it.
- `depends_on`, `blocks`, and `blocked_by` contain artifact IDs, not prose.
- Blueprints link implemented Features; Work Orders link Feature and Blueprint;
  tests link criteria/Work Orders; Feedback links the observed artifacts/tests.
- Update both ends when adding a durable relationship. Validation detects missing
  referenced IDs but humans/Producer resolve semantic correctness.
- Code and commits should mention the Work Order ID when practical.

## Ownership and updates

`owner_role` is the next accountable role, not authorship. A role modifies its
owned artifact/body and shared metadata necessary for a handoff. Update
`last_updated` for substantive or state/relationship changes. Status changes
must not conceal unresolved blockers or lifecycle rollback reasons.
