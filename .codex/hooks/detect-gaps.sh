#!/usr/bin/env bash
# Advisory SessionStart hook: lightweight gap detection using configured roots.
set +e

echo "=== Checking for Project Gaps ==="

layout_values() {
  key=$1
  fallback=$2
  if command -v jq >/dev/null 2>&1 && [ -f .agents/project-layout.json ]; then
    jq -r ".${key}[]?" .agents/project-layout.json 2>/dev/null
  else
    printf '%s\n' "$fallback"
  fi
}

count_files() {
  total=0
  while IFS= read -r root; do
    [ -d "$root" ] || continue
    count=$(find "$root" -type f 2>/dev/null | wc -l | tr -d ' ')
    total=$((total + count))
  done
  printf '%s\n' "$total"
}

SOURCE_ROOTS=$(layout_values sourceRoots src)
DESIGN_ROOTS=$(layout_values designRoots design/gdd)
PROTOTYPE_ROOTS=$(layout_values prototypeRoots prototypes)
ARCH_ROOTS=$(layout_values architectureRoots docs/architecture)

SOURCE_FILES=$(printf '%s\n' "$SOURCE_ROOTS" | count_files)
DESIGN_FILES=$(printf '%s\n' "$DESIGN_ROOTS" | count_files)
ARCH_FILES=$(printf '%s\n' "$ARCH_ROOTS" | count_files)

STACK_CONFIGURED=false
if [ -f .agents/docs/technical-preferences.md ] &&
   grep -q '^\- \*\*Runtime\*\*: ' .agents/docs/technical-preferences.md &&
   ! grep '^\- \*\*Runtime\*\*: ' .agents/docs/technical-preferences.md | grep -q 'TO BE CONFIGURED'; then
  STACK_CONFIGURED=true
fi

if [ "$SOURCE_FILES" -eq 0 ] && [ "$DESIGN_FILES" -eq 0 ] && [ "$STACK_CONFIGURED" = false ]; then
  echo "NEW PROJECT: no configured runtime, design artifacts, or source files."
  echo "Suggested action: \$start"
  echo "==================================="
  exit 0
fi

if [ "$SOURCE_FILES" -gt 50 ] && [ "$DESIGN_FILES" -lt 5 ]; then
  echo "GAP: $SOURCE_FILES source files and $DESIGN_FILES design files across configured roots."
  echo "Check whether intent is documented elsewhere before using \$reverse-document."
fi

if [ "$SOURCE_FILES" -gt 20 ] && [ "$ARCH_FILES" -eq 0 ]; then
  echo "GAP: implemented code but no architecture notes in configured roots."
  echo "Document the current architecture; create ADRs only for significant decisions."
fi

while IFS= read -r root; do
  [ -d "$root" ] || continue
  find "$root" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | while IFS= read -r proto; do
    if [ ! -f "$proto/README.md" ] && [ ! -f "$proto/CONCEPT.md" ]; then
      echo "GAP: undocumented prototype: $proto"
    fi
  done
done <<< "$PROTOTYPE_ROOTS"

echo "Run \$project-stage-detect for a repository-wide evidence-based audit."
echo "==================================="
exit 0
