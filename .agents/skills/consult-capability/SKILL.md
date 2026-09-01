---
name: consult-capability
description: "Use one preserved detailed expert capability for a bounded research/review question without adding it to the visible workflow or changing artifact ownership."
---

# Consult Capability

Read `.codex/capabilities/` descriptions and select the narrowest relevant expert
(AI, networking, database-adjacent tools, performance, engine, economy, UX,
accessibility, localization, release, etc.). Load only that capability definition,
the bounded question, applicable canonical artifacts, and required evidence.

The primary operational role remains accountable. Ask the capability for findings,
options/tradeoffs, evidence, risks, and recommended artifact owner—never autonomous
cross-domain edits or workflow authority. It may be consulted in a bounded
subagent when available or used as a focused review lens in the main session.

Consolidate useful findings into the owning Requirement, Feature, Blueprint,
Work Order, Research, Feedback, or review record. Do not make the capability prompt
itself canonical state, expose it as a persistent workflow role, or route through
simulated hierarchy. Report which capability was used and what evidence changed.
