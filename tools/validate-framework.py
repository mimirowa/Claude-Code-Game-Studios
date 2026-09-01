#!/usr/bin/env python3
"""Validate Structured AI Studio structure and artifact metadata (stdlib only)."""
from __future__ import annotations

import json
import re
import sys
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
errors: list[str] = []


def fail(message: str) -> None:
    errors.append(message)


required = [
    "framework.yaml", "AGENTS.md", ".agents/project-layout.json",
    ".agents/docs/artifact-metadata.md", "docs/structured-ai-studio.md",
    "docs/v2-migration-audit.md", "project/production/project-state.md",
]
for rel in required:
    if not (ROOT / rel).is_file():
        fail(f"missing required file: {rel}")

try:
    version_fields = {}
    for line in (ROOT / "framework.yaml").read_text().splitlines():
        if ":" in line:
            key, value = line.split(":", 1)
            version_fields[key.strip()] = value.strip()
    if version_fields != {
        "name": "Structured AI Studio",
        "version": "2.0.0-alpha.1",
        "status": "alpha",
    }:
        fail(f"unexpected framework identity/version: {version_fields}")
except Exception as exc:
    fail(f"invalid framework.yaml: {exc}")

try:
    layout = json.loads((ROOT / ".agents/project-layout.json").read_text())
except Exception as exc:
    fail(f"invalid project layout JSON: {exc}")
    layout = {}

try:
    hooks = json.loads((ROOT / ".codex/hooks.json").read_text())
except Exception as exc:
    fail(f"invalid hooks JSON: {exc}")
    hooks = {}

for path in (ROOT / ".codex/agents").glob("*.toml"):
    try:
        with path.open("rb") as stream:
            tomllib.load(stream)
    except Exception as exc:
        fail(f"invalid agent TOML {path.relative_to(ROOT)}: {exc}")

skill_names: set[str] = set()
for path in (ROOT / ".agents/skills").glob("*/SKILL.md"):
    text = path.read_text()
    match = re.search(r"(?m)^name:\s*([^\n]+)$", text)
    if not text.startswith("---\n") or not match or "\ndescription:" not in text:
        fail(f"invalid skill front matter: {path.relative_to(ROOT)}")
        continue
    name = match.group(1).strip().strip('"')
    if name in skill_names:
        fail(f"duplicate skill name: {name}")
    skill_names.add(name)

expected_skills = {
    "start", "project-stage", "project-status", "brainstorm", "research",
    "prototype", "product-vision", "product-strategy", "business-case",
    "map-requirements", "map-features", "design-feature",
    "technical-blueprint", "testability-review", "architecture-decision",
    "work-order", "implement", "qa-verify", "feedback", "bug-report",
    "sim-validate", "perf-profile", "gate-review", "production-plan",
    "tech-debt", "retrospective", "setup-stack",
}
if skill_names != expected_skills:
    fail(f"skill set mismatch: missing={sorted(expected_skills-skill_names)}, extra={sorted(skill_names-expected_skills)}")

for event in hooks.get("hooks", {}).values():
    for group in event:
        for hook in group.get("hooks", []):
            command = hook.get("command", "")
            match = re.search(r"/\.codex/hooks/([^\" ]+)", command)
            if match and not (ROOT / ".codex/hooks" / match.group(1)).is_file():
                fail(f"hook references missing file: {match.group(1)}")

common_keys = {
    "id", "type", "title", "status", "project_phase", "rigor", "priority",
    "owner_role", "reviewers", "parent_ids", "depends_on", "blocks",
    "blocked_by", "last_updated",
}
id_pattern = re.compile(r"^(?:REQ|FTR|BP|WO|TEST|RES)(?:-[A-Z0-9]+)*-\d{2,4}(?:-\d{2})?$|^(?:FB-\d{4}|ADR-\d{3}|PRO-\d{3}|GATE-[A-Z0-9-]+-\d{2}|PROJECT-STATE)$")
ids: dict[str, Path] = {}
references: list[tuple[Path, str]] = []


def parse_front_matter(path: Path) -> dict[str, object] | None:
    text = path.read_text()
    if not text.startswith("---\n"):
        return None
    end = text.find("\n---\n", 4)
    if end < 0:
        fail(f"unterminated front matter: {path.relative_to(ROOT)}")
        return None
    lines = text[4:end].splitlines()
    data: dict[str, object] = {}
    active_list: str | None = None
    for raw in lines:
        if not raw.strip() or raw.lstrip().startswith("#"):
            continue
        if raw.startswith("  - ") and active_list:
            assert isinstance(data[active_list], list)
            data[active_list].append(raw[4:].strip().strip('"'))
            continue
        match = re.match(r"^([A-Za-z_][A-Za-z0-9_]*):(?:\s*(.*))?$", raw)
        if not match:
            fail(f"unsupported/simple-YAML syntax in {path.relative_to(ROOT)}: {raw}")
            continue
        key, value = match.group(1), (match.group(2) or "").strip()
        active_list = None
        if value == "" or value == "[]":
            data[key] = []
            active_list = key if value == "" else None
        elif value.startswith("[") and value.endswith("]"):
            inner = value[1:-1].strip()
            data[key] = [] if not inner else [part.strip().strip('"') for part in inner.split(",")]
        else:
            data[key] = value.strip('"')
    return data


artifact_roots = layout.get("artifactRoots", {}) if isinstance(layout, dict) else {}
for root in artifact_roots.values() if isinstance(artifact_roots, dict) else []:
    base = ROOT / str(root)
    if not base.exists():
        continue
    for path in base.rglob("*.md"):
        data = parse_front_matter(path)
        if data is None:
            fail(f"managed artifact lacks front matter: {path.relative_to(ROOT)}")
            continue
        missing = common_keys - data.keys()
        if missing:
            fail(f"artifact missing {sorted(missing)}: {path.relative_to(ROOT)}")
        artifact_id = str(data.get("id", ""))
        if not id_pattern.match(artifact_id):
            fail(f"invalid stable ID {artifact_id!r}: {path.relative_to(ROOT)}")
        elif artifact_id in ids:
            fail(f"duplicate ID {artifact_id}: {path.relative_to(ROOT)} and {ids[artifact_id].relative_to(ROOT)}")
        else:
            ids[artifact_id] = path
        for key in ("parent_ids", "depends_on", "blocks", "blocked_by"):
            value = data.get(key, [])
            if isinstance(value, list):
                references.extend((path, str(ref)) for ref in value if ref)

for path, ref in references:
    if ref not in ids:
        fail(f"unresolved artifact reference {ref}: {path.relative_to(ROOT)}")

if errors:
    for error in errors:
        print(f"ERROR: {error}", file=sys.stderr)
    raise SystemExit(1)
print(f"Framework validation passed: {len(skill_names)} skills, {len(ids)} managed artifacts.")
