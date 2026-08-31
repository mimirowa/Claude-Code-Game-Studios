# Codex Game Studios

A reusable game-development workspace for ChatGPT and Codex, adapted from the
main branch of this repository. It turns a coding session into a coordinated
studio with specialist agents, repeatable workflows, design templates, project
rules, and lifecycle checks.

## What is included

| Component | Count | Codex integration |
|---|---:|---|
| Custom agents | 48 | `.codex/agents/*.toml` |
| Skills | 38 | `.agents/skills/*/SKILL.md` |
| Hooks | 8 | `.codex/hooks.json` and `.codex/hooks/` |
| Path rules | 12 | Routed by `AGENTS.md` and project layout |
| Templates | 29 | `.agents/docs/templates/` |

The roster covers production, design, programming, art, audio, narrative, QA,
release, accessibility, analytics, security, and engine specialists. The
framework also supports web, TypeScript, custom runtimes, Python prototypes,
headless servers, simulations, and mixed client/server stacks.

## Requirements

- Git
- A current Codex client (CLI, IDE extension, or ChatGPT desktop app)
- Bash for the included hooks
- Recommended: `jq` and Python 3 for validation helpers

The repository contains no runtime package dependencies. Game-engine and
project dependencies are selected later with `$setup-engine`.

## Start a project

Clone the Codex branch directly:

```bash
git clone --branch codex --single-branch \
  https://github.com/mimirowa/Claude-Code-Game-Studios.git my-game
cd my-game
codex
```

Trust the project when Codex asks so it can load `.codex/config.toml`, custom
agents, and hooks. Then invoke `$start`. For an existing project, invoke
`$project-stage-detect` first and use `$setup-engine` only if the technical
preferences are not already clear.

Useful starting workflows:

- `$start` — guided onboarding
- `$project-stage-detect` — inspect an existing project and identify gaps
- `$brainstorm` — develop a game concept
- `$map-systems` — map systems and dependencies
- `$design-system` — write a system design collaboratively
- `$sprint-plan` — create an actionable sprint
- `$code-review` — review implementation risks
- `$sim-validate` — validate determinism, invariants, replay, batches, and budgets

Codex discovers repository skills from `.agents/skills`. Custom agents can be
used when you explicitly ask Codex to delegate or when repository instructions
call for delegation. Complex tasks can be divided among specialists and
consolidated by the main agent.

## Safety and validation

The project configuration enables Codex lifecycle hooks. They load session
context, detect missing project artifacts, validate commits and pushes, check
assets after edits, preserve compacted-session state, and log agent/session
activity. Hook commands resolve from the Git root, so launching Codex from a
subdirectory still works.

Hooks are advisory except for invalid data or explicitly unsafe operations.
They complement—rather than replace—Codex permissions and sandboxing.

## Repository map

```text
AGENTS.md                 Root operating instructions
.agents/skills/           Reusable Codex skills
.agents/docs/             Standards, references, and templates
.agents/rules/            Path-specific development rules
.agents/project-layout.json Configurable roots for new and imported projects
.codex/config.toml        Project Codex configuration
.codex/agents/            Native custom-agent definitions
.codex/hooks.json         Lifecycle hook registration
.codex/hooks/             Hook implementations
design/                   Game design documents
docs/                     Architecture and workflow documentation
production/               Sprints, milestones, risks, and session state
prototypes/               Isolated experiments
src/                      Game source
tests/                    Automated and playtest artifacts
tools/                    Build and content-pipeline tools
```

See [ADAPTATION.md](ADAPTATION.md) for the upstream review, conversion choices,
known limitations, and future-maintenance strategy. The detailed end-to-end
process remains in [docs/WORKFLOW-GUIDE.md](docs/WORKFLOW-GUIDE.md).

## Provenance and license

The original project and this adaptation use the MIT license. The existing
[LICENSE](LICENSE) and Git history retain attribution. Keep generic framework
changes on this branch; put game-specific content in each game's own repository.
