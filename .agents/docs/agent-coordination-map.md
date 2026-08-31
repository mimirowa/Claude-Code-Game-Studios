# Agent Coordination Map

The roster in `.codex/agents/` is a capability catalog, not a mandatory org
chart. The main Codex session coordinates the task and can consult the closest
specialist directly.

## Role Families

- **Product and delivery:** producer, creative-director, release-manager,
  community-manager, live-ops-designer.
- **Design:** game-designer, systems-designer, economy-designer, level-designer,
  ux-designer, world-builder, writer, narrative-director.
- **Engineering:** technical-director, lead-programmer, gameplay-programmer,
  engine-programmer, ai-programmer, network-programmer, ui-programmer,
  tools-programmer, devops-engineer, security-engineer, analytics-engineer.
- **Quality and performance:** qa-lead, qa-tester, performance-analyst,
  accessibility-specialist, localization-lead.
- **Content:** art-director, technical-artist, audio-director, sound-designer.
- **Engine expertise:** Godot, Unity, and Unreal leads and their subsystem
  specialists. General/custom stacks use the domain roles above directly.

## Active Role Set

For each stage or milestone, projects may identify:

| Status | Purpose | Typical use |
|---|---|---|
| Continuously active | Recurring ownership and integration | Main implementation/design loop |
| Consulted | Bounded expertise | Subsystem decision, review, investigation |
| Milestone reviewer | Integrated outcome review | Gate, release candidate, major architecture checkpoint |

An individual may cover several roles. Roles can move between statuses as risks
change. Keep project-specific matrices in the game repository.

## Proportionate Patterns

- **Routine feature or fix:** main session + implementing specialist if useful +
  focused verification.
- **Subsystem change:** implementation role + affected domain specialist; add a
  lead when interfaces or multiple systems change.
- **Cross-domain/high-impact change:** affected roles + the relevant product or
  technical reviewer; record the durable decision.
- **Milestone/release:** only configured milestone reviewers, with explicit user
  confirmation before release, publishing, or deployment.
- **Incident:** smallest group able to contain and diagnose it; broaden review
  for security, data loss, external communication, or systemic risk.

## Escalation

Resolve issues with the smallest relevant group. Ask the user when the decision
changes product/creative direction, scope, involves destructive or irreversible
work, credentials/billing/external services, or release/deployment. Technical
uncertainty alone is a reason to investigate or consult a specialist, not to add
ceremonial approvals.

## Collaboration Boundaries

- Avoid parallel edits to the same files.
- Give consultants bounded questions and consolidate their evidence centrally.
- Agents may edit in-scope files outside their nominal domain when the task
  requires it; request specialist review based on risk, not directory ownership.
- Document significant decisions and open risks, not every conversational step.
