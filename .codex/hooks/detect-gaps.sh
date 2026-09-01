#!/usr/bin/env bash
set +e
echo "=== Structured AI Studio — State Check ==="

[ -f framework.yaml ] || echo "GAP: framework.yaml missing"
[ -f project/production/project-state.md ] || echo "GAP: canonical project state missing; run \$start"

if [ -f project/production/project-state.md ]; then
  grep -q '^project_phase: ' project/production/project-state.md || echo "GAP: project phase not recorded"
  grep -q '^# Current Gate' project/production/project-state.md || echo "GAP: current gate section missing"
fi

if command -v python3 >/dev/null 2>&1; then
  python3 tools/validate-framework.py 2>&1 | head -20
else
  echo "INFO: Python 3 unavailable; run toolkit validation when available"
fi

echo "Use \$project-status for blocker/readiness detail or \$project-stage for an imported repository."
echo "============================================="
exit 0
