---
paths:
  - "<configured data/asset roots>/**"
---

# Data File Rules

- Validate syntax/schema with the project's configured tooling.
- Version breaking schemas and document migration/compatibility.
- State units, ranges, defaults, identity, and ownership for important fields.
- Keep designer/operator tuning values traceable to Feature/Blueprint intent.
- Preserve stable external IDs and deterministic ordering where outcomes depend
  on order. Do not rely on incidental object/map iteration.
- Avoid secrets, personal data, credentials, or licensed data without explicit
  authority and documented handling/source.
- Generated data identifies its source and reproducible generation command.
