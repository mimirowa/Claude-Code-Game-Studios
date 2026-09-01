---
name: project-status
description: "Produce a concise Producer status from canonical artifact metadata, blockers, dependencies, gate needs, and ownership."
---

# Project Status

Read project state and scan artifact front matter. Summarize:

1. current objective, phase, and next gate;
2. gate-required feature count by lifecycle status;
3. blocked artifacts, blocker IDs/reasons, and next owner;
4. missing required artifacts/reviews and stale relationships;
5. decisions requiring Executive Producer attention;
6. next actions by role.

Do not infer completion from chat or code alone. Verify metadata against artifact
bodies when inconsistent. Prefer a compact report like `Accepted 7 / QA 2 /
Implementing 2 / Blocked 1`, followed by the single most important blocker and
`No EP action currently required` when true. Update canonical project state when
requested; reports may live under `project/production/status/`.
