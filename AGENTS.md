# Codex Game Studios

Use this repository as a reusable game-development workspace driven by Codex.
The user remains the creative director; Codex coordinates planning,
implementation, review, and production support.

## Project configuration

- Engine: [CHOOSE: Godot 4 / Unity / Unreal Engine 5 / custom]
- Language: [CHOOSE]
- Version control: Git
- Build system: [CONFIGURE]
- Asset pipeline: [CONFIGURE]

Read `.agents/docs/technical-preferences.md` before making engine-specific
decisions. If it is not configured, use the `setup-engine` skill first.

## How to work

- Use the relevant repository skill in `.agents/skills/` when the request
  matches its description. `$start` is the entry point for a new or imported
  project, while `$project-stage-detect` is preferred for existing codebases.
- For complex work with independent tracks, delegate bounded tasks to the
  relevant custom agents in `.codex/agents/`, then consolidate their findings.
  Avoid parallel edits to the same files.
- Ask focused questions when a creative choice, product scope, or irreversible
  action genuinely needs the user's decision. Normal in-scope implementation
  and verification do not require a separate file-write confirmation.
- Present meaningful design alternatives with tradeoffs and a recommendation.
- Keep design documents, implementation, and tests consistent. Record durable
  decisions in the repository instead of relying on chat history.
- Do not commit, push, publish, or release unless the user explicitly asks.

## Path-specific rules

Before editing a matching path, read and follow its rule file:

| Path | Rule |
|---|---|
| `src/gameplay/**` | `.agents/rules/gameplay-code.md` |
| `src/core/**` | `.agents/rules/engine-code.md` |
| `src/ai/**` | `.agents/rules/ai-code.md` |
| `src/networking/**` | `.agents/rules/network-code.md` |
| `src/ui/**` | `.agents/rules/ui-code.md` |
| `assets/data/**` | `.agents/rules/data-files.md` |
| `design/gdd/**` | `.agents/rules/design-docs.md` |
| `tests/**` | `.agents/rules/test-standards.md` |
| `prototypes/**` | `.agents/rules/prototype-code.md` |
| shader files | `.agents/rules/shader-code.md` |
| narrative files | `.agents/rules/narrative.md` |

General conventions live in `.agents/docs/coding-standards.md`, repository
layout in `.agents/docs/directory-structure.md`, coordination guidance in
`.agents/docs/coordination-rules.md`, and session continuity guidance in
`.agents/docs/context-management.md`.

## Collaboration principles

The user owns creative and product decisions. Codex should expose assumptions,
offer options where alternatives matter, and implement the chosen direction.
Use `request_user_input` when available for short structured choices; otherwise
ask concise questions in conversation. See
`docs/COLLABORATIVE-DESIGN-PRINCIPLE.md` for the longer design protocol.
