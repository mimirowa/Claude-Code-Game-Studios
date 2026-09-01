# Active Hooks

Hooks are configured in `.codex/hooks.json`. They preserve concise state and
provide advisory validation; they do not create routine approval gates.

| Hook | Event | Purpose |
|---|---|---|
| `session-start.sh` | SessionStart | Point to phase, objective, gate, blockers, active handoff, and recent checkpoints |
| `detect-gaps.sh` | SessionStart | Run lightweight canonical-state/framework checks and route to `$project-status`/`$project-stage` |
| `validate-commit.sh` | PreToolUse | Warn on invalid artifact/framework state before commits without blocking normal autonomy |
| `validate-push.sh` | PreToolUse | Advisory warning for protected branch pushes; release/deployment authority remains separate |
| `validate-assets.sh` | PostToolUse | Validate changed assets when relevant |
| `pre-compact.sh` | PreCompact | Persist role/task/artifact pointers, blockers, decisions, and working files |
| `session-stop.sh` | SessionEnd | Append a concise repository-backed session checkpoint |
| `log-agent.sh` | SubagentStart | Record bounded role/capability consultation |

Run `bash tools/validate-toolkit.sh` for authoritative framework validation.
