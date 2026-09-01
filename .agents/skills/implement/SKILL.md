---
name: implement
description: "Execute an approved Work Order, verify it, checkpoint it in Git, and route discoveries without silently changing the contract."
---

# Implement

Act under Implementer contract. Read Work Order and every parent/contract it
links, repository rules, affected code/tests, and current working-tree state.
Implement exact scope with required tests and integration. Preserve user changes
and use coherent commits/pushes without routine permission gates.

If behavior/contract is incomplete or impossible, stop that affected path and
record a `SPEC_DEFECT`/discovery with owning role; do not redesign silently. Run
proportionate verification and report Work Order ID, files/commits, commands and
results, deviations, discoveries, and QA handoff. Advance to `IMPLEMENTATION`
only when Definition of Done is evidenced.
