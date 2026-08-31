#!/usr/bin/env bash
set -euo pipefail

ROOT=$(git rev-parse --show-toplevel)
cd "$ROOT"
errors=0

check_count() {
    label=$1
    expected=$2
    actual=$3
    if [ "$actual" -ne "$expected" ]; then
        echo "ERROR: expected $expected $label, found $actual" >&2
        errors=$((errors + 1))
    fi
}

check_count "skills" 37 "$(find .agents/skills -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l)"
check_count "custom agents" 48 "$(find .codex/agents -maxdepth 1 -name '*.toml' | wc -l)"
check_count "rules" 11 "$(find .agents/rules -maxdepth 1 -name '*.md' | wc -l)"

python3 -m json.tool .codex/hooks.json >/dev/null

for skill in .agents/skills/*/SKILL.md; do
    head -1 "$skill" | grep -qx -- '---' || {
        echo "ERROR: missing frontmatter in $skill" >&2
        errors=$((errors + 1))
    }
    grep -q '^name:' "$skill" || errors=$((errors + 1))
    grep -q '^description:' "$skill" || errors=$((errors + 1))
done

if rg -n -i 'anthropic|\.claude/|CLAUDE\.md|AskUserQuestion' \
    --glob '!.git/**' --glob '!UPSTREAM-CHANGELOG.md' \
    --glob '!ADAPTATION.md' --glob '!tools/validate-toolkit.sh' .; then
    echo "ERROR: unresolved Claude-specific integration references" >&2
    errors=$((errors + 1))
fi

if [ "$errors" -ne 0 ]; then
    exit 1
fi

echo "Toolkit validation passed."
