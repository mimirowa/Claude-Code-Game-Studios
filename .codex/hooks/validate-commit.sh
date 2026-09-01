#!/usr/bin/env bash
# Advisory commit hook. Normal commits are autonomous; invalid canonical metadata
# is reported for correction but this hook does not create an approval gate.
set +e
INPUT=$(cat)
if command -v jq >/dev/null 2>&1; then
  COMMAND=$(printf '%s' "$INPUT" | jq -r '.tool_input.command // empty')
else
  COMMAND=$(printf '%s' "$INPUT" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/^.*"command"[[:space:]]*:[[:space:]]*"//;s/"$//')
fi
echo "$COMMAND" | grep -qE '^git[[:space:]]+commit' || exit 0

if command -v python3 >/dev/null 2>&1; then
  python3 tools/validate-framework.py >/dev/null || echo "WARNING: framework/artifact validation failed; run bash tools/validate-toolkit.sh" >&2
fi

git diff --cached --name-only | grep -E '^project/.*\.md$' | while read -r file; do
  [ -f "$file" ] || continue
  grep -q '^id: ' "$file" || echo "WARNING: managed artifact lacks id: $file" >&2
  grep -q '^last_updated: ' "$file" || echo "WARNING: managed artifact lacks last_updated: $file" >&2
done
exit 0
