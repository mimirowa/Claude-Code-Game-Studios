#!/usr/bin/env bash
set +e
echo "=== Structured AI Studio — Session Context ==="
echo "Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

STATE="project/production/project-state.md"
ACTIVE="project/production/session-state/active.md"
SNAPSHOT="project/production/session-state/compact-snapshot.md"

if [ -f "$STATE" ]; then
  echo "Canonical state: $STATE"
  for field in project_phase status owner_role; do
    value=$(sed -n "s/^${field}: *//p" "$STATE" | head -1)
    [ -n "$value" ] && echo "$field: $value"
  done
  sed -n '/^# Current Objective/,/^#/p' "$STATE" | sed '$d' | head -6
  sed -n '/^# Current Gate/,/^#/p' "$STATE" | sed '$d' | head -4
  sed -n '/^# Blockers/,/^#/p' "$STATE" | sed '$d' | head -8
fi

[ -f "$ACTIVE" ] && echo "Active handoff: $ACTIVE (read for role/task/artifact/files)."
[ -f "$SNAPSHOT" ] && echo "Compaction recovery: $SNAPSHOT"
echo "Recent checkpoints:"
git log --oneline -3 2>/dev/null | sed 's/^/  /'
echo "Read canonical artifacts for detail; do not infer state from this summary."
echo "================================================"
exit 0
