---
name: project-stage
description: "Audit an existing project in place and determine project phase separately from per-feature state."
---

# Project Stage Audit

Use configured artifact, source, test, prototype, legacy, simulation, and asset
roots. Infer missing roots from manifests without requiring reorganization.

Inventory actual product/technical artifacts, executable code, stubs, tests,
research/prototypes, architecture, persistence/state ownership, multiplayer
expectation, deterministic seams, production evidence, and release maturity.

Classify overall phase as `CONCEPT`, `PRE_PRODUCTION`, `PRODUCTION`, `POLISH`, or
`RELEASE`, with confidence and conflicting evidence. Inventory Feature statuses
independently; never infer they match project phase. Describe observed capability
before gaps and avoid template/file-count bias.

Write/update a stage audit under `project/production/`, link evidence, recommend
a lean active role set and next artifacts, and update project state when the
classification is evidenced rather than a material gate decision.
