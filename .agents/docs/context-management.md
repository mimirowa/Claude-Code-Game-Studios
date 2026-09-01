# Context and Session Memory

Canonical product state lives in `project/**`. Session context contains pointers,
not copies.

Maintain `project/production/session-state/active.md` during multi-session work:

```markdown
# Active Handoff
- Role: implementer
- Task: WO-014-03
- Relevant artifacts: FTR-014, BP-014-01, WO-014-03
- Blockers: none
- Recent decisions: ADR-007
- Working files: src/..., tests/...
- Next action: run required scenario tests
```

Before compaction, the hook snapshots this handoff, modified files, recent
decisions/checkpoints, and a pointer to project state. At restart, read project
state, active handoff, and only the linked artifacts. Never infer another role
thread's hidden decisions; require its artifact update.
