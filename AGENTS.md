# Codex Game Studios

Use this repository as a reusable game-development workspace driven by Codex.
The user remains the creative director; Codex coordinates planning,
implementation, review, and production support.

## Project configuration

Configure the project by concern rather than assuming a monolithic game engine:

- Runtime: [CONFIGURE]
- Language: [CONFIGURE]
- Client/rendering framework: [CONFIGURE or N/A]
- Simulation runtime: [CONFIGURE or N/A]
- Server/backend: [CONFIGURE or N/A]
- Persistence/database: [CONFIGURE or N/A]
- Build tooling: [CONFIGURE]
- Testing: [CONFIGURE]
- Target platforms: [CONFIGURE]

Read `.agents/docs/technical-preferences.md` and
`.agents/project-layout.json` before making stack or path assumptions. Use
`$setup-engine` to configure any engine, framework, custom runtime, or mixed
stack; its historical name does not limit supported technologies.

## How to work

- Use the relevant repository skill in `.agents/skills/` when the request
  matches its description. `$start` is the entry point for a new or imported
  project, while `$project-stage-detect` is preferred for existing codebases.
- For complex work with independent tracks, delegate bounded tasks to the
  relevant custom agents in `.codex/agents/`, then consolidate their findings.
  Avoid parallel edits to the same files.
- Ask focused questions when a destructive or irreversible action, major
  product/creative direction change, scope change, release/deployment, or an
  action involving credentials, billing, or external services genuinely needs
  the user's decision. Normal in-scope edits, commits, pushes, and verification
  do not require separate approval.
- Present meaningful design alternatives with tradeoffs and a recommendation.
- Keep design documents, implementation, and tests consistent. Record durable
  decisions in the repository instead of relying on chat history.
- Commit and push useful, coherent checkpoints during an agreed task so Git is
  the rollback mechanism. Releases, publishing, and deployment still require
  explicit confirmation.

## Path-specific rules

Before editing a matching path, read and follow its rule file:

| Path | Rule |
|---|---|
| `src/gameplay/**` | `.agents/rules/gameplay-code.md` |
| `src/core/**` | `.agents/rules/engine-code.md` |
| configured simulation roots (default `src/sim/**`) | `.agents/rules/simulation-code.md` |
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

The paths above are recommended defaults. Imported and legacy repositories use
the roots in `.agents/project-layout.json`; audit them in place before proposing
a physical reorganization.

## Collaboration principles

The user owns creative and product decisions. Codex should expose assumptions,
offer options where alternatives matter, and implement the chosen direction.
Use `request_user_input` when available for short structured choices; otherwise
ask concise questions in conversation. See
`docs/COLLABORATIVE-DESIGN-PRINCIPLE.md` for the longer design protocol.
