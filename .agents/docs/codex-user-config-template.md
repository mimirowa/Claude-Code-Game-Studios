# Optional user-level Codex configuration

Repository configuration is committed in `.codex/config.toml`. Personal Codex
configuration belongs in `~/.codex/config.toml`; it is outside this repository
and must not be committed.

For example, users can choose their own status-line fields:

```toml
[tui]
status_line = ["model-with-reasoning", "current-dir", "git-branch"]
```

Permissions and sandboxing should be selected through the Codex client or user
configuration. Do not weaken them in this public template. Local lifecycle
hooks may be added to the user-level configuration, while the generic project
hooks remain in `.codex/hooks.json`.
