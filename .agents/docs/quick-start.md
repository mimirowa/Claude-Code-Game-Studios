# Structured AI Studio Quick Start

1. Run `$start` to recover phase, gate, objective, active artifact/role, and
   blockers from repository state.
2. If importing work, run `$project-stage`; do not reorganize it first.
3. In Concept, establish evidence and intent with `$research`, `$prototype`,
   `$product-vision`, `$product-strategy`, and `$business-case` as needed.
4. Map `Requirement → Feature`, then use `$design-feature`,
   `$technical-blueprint`, and `$testability-review` in proportion to rigor.
5. Producer marks ready work and creates `$work-order`; Implementer runs
   `$implement`; QA runs `$qa-verify`.
6. Capture every observed issue via `$feedback` before routing it.
7. Use `$project-status` for concise state and `$gate-review` for material gates.

Persistent role threads read/write their Role Contract and canonical artifacts.
They never rely on context hidden in another chat.

## Recommended first project flow

```text
$project-stage (if imported)
→ $product-vision
→ $map-requirements
→ $map-features
→ select one rigor-appropriate Feature
→ $design-feature
→ $technical-blueprint (when non-trivial)
→ $testability-review (A and appropriate B)
→ $work-order
→ $implement
→ $qa-verify
→ $feedback / $project-status
```

Do not initialize every template at once. Create only artifacts that answer the
current phase/gate question or make a real handoff executable.
