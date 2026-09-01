#!/usr/bin/env bash
set +e
DIR="project/production/session-state"
mkdir -p "$DIR"
OUT="$DIR/compact-snapshot.md"
ACTIVE="$DIR/active.md"
{
  echo "# Compaction Recovery Snapshot"
  echo
  echo "Generated: $(date -Iseconds)"
  echo "Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  echo
  echo "## Canonical project state"
  echo "Read: project/production/project-state.md"
  if [ -f "$ACTIVE" ]; then
    echo
    echo "## Active role/task handoff"
    cat "$ACTIVE"
  else
    echo "No active handoff file."
  fi
  echo
  echo "## Working files"
  { git diff --name-only; git diff --cached --name-only; git ls-files --others --exclude-standard; } 2>/dev/null | sort -u | sed 's/^/- /'
  echo
  echo "## Recent decisions/checkpoints"
  git log --oneline -5 2>/dev/null | sed 's/^/- /'
} > "$OUT"
exit 0
