# Optional user-level Codex instructions

Personal preferences that should apply across repositories belong in
`~/.codex/AGENTS.md`, outside this project. Do not commit machine details,
credentials, customer information, or private project context here.

Example:

```markdown
# Personal preferences

- Keep responses concise.
- Run relevant tests after code changes.
- Explain architectural decisions briefly.
- When I say "review", use the `$code-review` skill on recent changes.
```

Project-specific instructions belong in the repository's `AGENTS.md` and should
remain generic when this branch is used as a public template.
