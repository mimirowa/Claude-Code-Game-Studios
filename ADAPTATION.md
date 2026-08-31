# Codex adaptation notes

## Upstream assessment

The main branch is a well-organized prompt framework, not an executable game
framework. Its strongest reusable assets are the specialist role prompts, 37
production workflows, design templates, staged-development model, and small
validation scripts. Its main portability problem was that discovery,
permissions, hooks, subagents, and tool names were encoded specifically for
Claude Code.

The original also favors approval before every write. That is useful during
collaborative game design but unnecessarily interrupts ordinary implementation.
The adapted root instructions reserve explicit approval for material creative
choices, scope changes, destructive actions, commits, and publishing.

## Conversion map

| Main-branch mechanism | Codex branch mechanism |
|---|---|
| `CLAUDE.md` | Root `AGENTS.md` |
| `.claude/skills/` | `.agents/skills/` |
| Markdown agent manifests | `.codex/agents/*.toml` custom agents |
| `.claude/settings.json` hooks | `.codex/hooks.json` plus `.codex/config.toml` |
| `AskUserQuestion` | `request_user_input` when available, plain questions otherwise |
| Claude slash workflows | Codex skill invocation such as `$sprint-plan` |
| Implicit path rules | Explicit routing table in `AGENTS.md` |

Model names were intentionally removed from agent definitions. Each custom
agent inherits the active Codex model and reasoning setting, avoiding stale or
account-specific model pins.

## Known limitations

- ChatGPT conversations not attached to a local project do not load repository
  files. Use a Codex project session for the full framework.
- Codex must trust the repository before project-scoped configuration and hooks
  load.
- The role set is intentionally broad. For a specific game, remove irrelevant
  engine specialists or ask Codex to use only the applicable department.
- Hooks require Bash. Windows users should run through Git Bash or WSL, or add
  `commandWindows` entries with native equivalents.
- `UPSTREAM-CHANGELOG.md` is historical material, not current setup guidance.

## Maintaining the adaptation

Merge generic content changes from `main` selectively. Role content, templates,
and workflow improvements usually transfer cleanly; Claude settings and hook
configuration should be translated rather than merged verbatim.

Before publishing a release, run `tools/validate-toolkit.sh` and inspect the
diff for new Claude-specific paths or tool names.
