# Technology Reference Documentation

This directory contains curated, version-pinned notes for runtimes, engines,
frameworks, and important dependencies used by a project. It is an optional
convention; projects may use `docs/technology-reference/` or an established
repository location instead.

## Why This Exists

Dependencies evolve and version-sensitive APIs can invalidate otherwise sound
implementation. Reference notes preserve verified compatibility knowledge near
the code, independent of who or what model works on it later.

## Suggested Structure

```text
<component>/
├── VERSION.md                 # Exact pin, source, verification date
├── breaking-changes.md        # Relevant migration notes
├── deprecated-apis.md         # Deprecated API and replacement table
├── current-best-practices.md  # Practices verified for the pinned version
└── modules/                   # Optional subsystem notes
```

## Maintenance

- Pin exact versions in normal manifests, lockfiles, tool-version files, or
  containers; the note is not a substitute for a reproducible dependency pin.
- Update notes after a dependency upgrade or when verified behavior changes.
- Verify version-sensitive claims against current official documentation,
  release notes, source repositories, or owner-maintained package registries.
- Include direct source links and `Last verified: YYYY-MM-DD`.
- Document only issues important to this project; avoid copying whole manuals.
- Do not classify risk based on assumptions about model training or knowledge.

The checked-in Godot, Unity, and Unreal directories are examples and historical
reference material. General/custom stacks may add different components.
