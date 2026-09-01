# Structured AI Studio v2 Architecture

## Purpose and philosophy

Structured AI Studio turns intent into traceable, testable work while keeping
human product authority explicit. AI increases implementation throughput, which
makes ambiguous intent and architectural drift the limiting costs. The framework
therefore treats repository artifacts as studio memory and conversations as
temporary operators over that memory.

Document known constraints and contracts deeply. Use research and time-boxed
prototypes to retire uncertainty cheaply. Roles are review lenses and ownership
boundaries, not a fictional reporting hierarchy.

## Roles

The Executive Producer is the human decision-maker. Producer coordinates state
and flow. Design, Tech, Art, and Audio own domain artifacts. Implementer executes
bounded Work Orders. QA verifies the approved specification. A synthesized
Director review combines Creative, Technical, and Art lenses for high-impact
work; a specific lens may investigate deeper when needed.

Detailed operational boundaries live in `.agents/docs/role-contracts/`.
Specialized v1 agents remain available as non-workflow capabilities under
`.codex/capabilities/`.

## Project phases

| Phase | Primary question | Typical evidence |
|---|---|---|
| CONCEPT | What, for whom, why, and within what constraints? | Vision, pillars, HLGD/HLTD, strategy, business assumptions, risks, research |
| PRE_PRODUCTION | What exactly must exist and how will it be proven? | Requirements, prioritized features, blueprints, test criteria, estimates |
| PRODUCTION | Can we build the approved product and prove behavior? | Work Orders, implementation, tests, feedback, accepted features |
| POLISH | Is the integrated experience stable, legible, performant, accessible, and tuned? | Regression, playtest, performance, compatibility, content closure |
| RELEASE | Is the product ready for commercial/distribution execution? | Release evidence, known gaps, operational readiness, explicit go/no-go |

Project phase describes the overall program. It never implies that every feature
has reached the same state.

## Feature lifecycle

`IDEA → REQUIREMENT → FEATURE_DESIGN → TECHNICAL_BLUEPRINT →
TESTABILITY_REVIEW → READY_FOR_PRODUCTION → WORK_ORDERS → IMPLEMENTATION → QA →
ACCEPTED`

Transitions may move backward. Record why: QA may expose a spec defect,
implementation may invalidate a blueprint, or playtesting may invalidate the
requirement. A Production project can contain features in every state.

## Artifact model and traceability

Requirement states product truth and desired outcome. Feature defines observable
product behavior. Blueprint defines how one or more features will be satisfied.
Work Order bounds implementation. Test proves criteria. Feedback records observed
truth and routes it to the correct level.

Every artifact has a stable ID and explicit links. Downward links answer "has
this requirement been implemented?" Upward links answer "why does this code or
test exist?" External boards may visualize metadata but never become canonical.

Feature packages are linked domain-owned artifacts, not one document repeatedly
rewritten by every role. Art, Audio, or separate QA documents may be N/A when
impact is absent.

## Rigor and review

- **A — critical/high-risk/cross-cutting:** Design, Tech, relevant Art/Audio, QA
  testability, Director review, and Executive Producer approval when materially
  product-affecting.
- **B — standard:** relevant specialists, Tech when non-trivial, QA criteria,
  Producer readiness; Directors only on a trigger.
- **C — routine/low-risk:** Producer → Work Order → Implementer → focused
  automated/regression verification.

Director triggers: Level A readiness, major ADR, Vision/Pillar change, material
scope increase, conflicting specialists, cross-domain architecture, and
milestone/gate review. Review seeks vision or architecture drift, hidden scope,
unsupported assumptions, contradictions, weak criteria, missing dependencies,
future scaling problems, art/content burden, and material commercial impact.

QA testability review occurs before important A and appropriate B implementation.
QA challenges vague PASS/FAIL criteria; QA does not decide whether the intended
product is desirable.

## Feedback routing

- `BUG`: implementation violates approved specification → fix/new Work Order.
- `SPEC_DEFECT`: approved Requirement, Feature, or Blueprint is wrong, ambiguous,
  incomplete, or contradictory → owning specialist and lifecycle rollback.
- `IMPROVEMENT`: behavior is correct but a better opportunity exists → backlog
  and Requirement/Feature consideration.
- `DISCOVERY`: new product, technical, market, or player truth → Producer and,
  when material, Directors/Executive Producer.

## Gates

Supported gates include Concept, First Playable, Vertical Slice, Production
Expansion, Alpha, Beta, and Release. Each answers a named question with required
evidence/features, quality criteria, acceptable gaps, blockers, and a `GO`,
`CONDITIONAL_GO`, or `NO_GO` decision. Prototypes retire risk; they are not a
mandatory quality gate.

## Repository memory and persistent conversations

Persistent Producer, Design, Tech, Art, Audio, Implementer, and QA conversations
are supported, but no thread may rely on another thread's hidden context. The
handoff is a canonical artifact with updated metadata, status, links, blockers,
and decisions. Session state points to relevant artifacts instead of copying the
whole project into startup context.
