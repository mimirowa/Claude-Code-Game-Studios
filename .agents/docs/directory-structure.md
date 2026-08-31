# Directory Structure

The framework recommends this layout for new projects:

```text
/
├── AGENTS.md
├── .agents/
│   └── project-layout.json      # Configured roots for imported/new projects
├── src/                         # Application/game source
│   └── sim/                     # Optional deterministic simulation domain
├── assets/                      # Art, audio, shaders, and data
├── design/gdd/                  # Game/system design documents
├── docs/architecture/           # Architecture notes and significant ADRs
├── tests/                       # Unit, integration, scenario, and performance tests
├── tools/                       # Build, validation, and content tooling
├── prototypes/                  # Isolated experiments
└── production/                  # Sprints, milestones, releases, session state
```

## Imported and Legacy Projects

Do not reorganize an existing repository merely to satisfy this template. Set
the actual roots in `.agents/project-layout.json` and make skills, hooks, and
audits operate on those locations. Multiple roots are supported for monorepos,
mixed client/server projects, and separate simulation packages.

Use relative repository paths without `..`. A simulation root may sit inside a
source root or be a separate package. Project-specific AGENTS files may add
rules for additional paths.
