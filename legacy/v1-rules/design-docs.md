---
paths:
  - "design/gdd/**"
---

# Design Document Rules

- Use the full eight-section system template when feature complexity warrants it;
  smaller changes may update a focused existing document
- Formulas must include variable definitions, expected value ranges, and example calculations
- Edge cases must explicitly state what happens, not just "handle gracefully"
- Dependencies must be bidirectional — if system A depends on B, B's doc must mention A
- Tuning knobs must specify safe ranges and what gameplay aspect they affect
- Acceptance criteria must be testable — a QA tester must be able to verify pass/fail
- No hand-waving: "the system should feel good" is not a valid specification
- Balance values must link to their source formula or rationale
- For long collaborative design sessions, write agreed sections incrementally to
  preserve decisions. Do not add routine file-write approval gates
