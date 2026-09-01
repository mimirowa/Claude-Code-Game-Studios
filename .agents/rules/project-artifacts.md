---
paths:
  - "project/**"
---

# Project Artifact Rules

- Repository artifacts, not chat or external boards, are canonical state.
- Managed Markdown artifacts use valid YAML front matter and stable IDs per
  `.agents/docs/artifact-metadata.md`; never renumber or reuse an ID.
- Maintain upward and downward traceability. Use IDs in relationship fields and
  update both ends of durable relationships.
- Project phase and Feature state are independent. Record reasons for backward
  lifecycle movement; never hide blockers to make status appear advanced.
- Modify domain-owned content under the applicable Role Contract. Cross-role
  clerical metadata updates are allowed; substantive changes return to the owner.
- Use N/A with rationale for genuinely irrelevant Art/Audio/Security/etc. impact.
- Update `last_updated` on substantive, state, owner, or relationship changes.
