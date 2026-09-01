#!/usr/bin/env bash
set +e
DIR="project/production/session-state"
LOG="project/production/session-log.md"
mkdir -p "$DIR"
{
  echo "## Session checkpoint: $(date -Iseconds)"
  echo "- Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  echo "- Project state: project/production/project-state.md"
  if [ -f "$DIR/active.md" ]; then
    echo "- Active handoff: $DIR/active.md"
  fi
  echo "- Recent commits:"
  git log --oneline --since="8 hours ago" 2>/dev/null | head -10 | sed 's/^/  - /'
  echo "- Uncommitted files:"
  { git diff --name-only; git ls-files --others --exclude-standard; } 2>/dev/null | sort -u | sed 's/^/  - /'
  echo
} >> "$LOG"
exit 0
