#!/usr/bin/env bash
set -euo pipefail
ROOT=$(git rev-parse --show-toplevel)
cd "$ROOT"
errors=0

check_count() {
  label=$1 expected=$2 actual=$3
  if [ "$actual" -ne "$expected" ]; then
    echo "ERROR: expected $expected $label, found $actual" >&2
    errors=$((errors + 1))
  fi
}

check_count "v2 skills" 27 "$(find .agents/skills -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l)"
check_count "visible role agents" 8 "$(find .codex/agents -maxdepth 1 -name '*.toml' | wc -l)"
check_count "preserved capabilities" 48 "$(find .codex/capabilities -maxdepth 1 -name '*.toml' | wc -l)"
check_count "v2 rules" 6 "$(find .agents/rules -maxdepth 1 -name '*.md' | wc -l)"
check_count "canonical templates" 11 "$(find .agents/docs/templates -maxdepth 1 -name '*.md' | wc -l)"

python3 -m json.tool .codex/hooks.json >/dev/null
python3 -m json.tool .agents/project-layout.json >/dev/null
python3 tools/validate-framework.py

for hook in .codex/hooks/*.sh tools/validate-toolkit.sh; do
  bash -n "$hook"
done

if rg -n -i 'anthropic|\.claude/|CLAUDE\.md|AskUserQuestion|may i write|never skip a tier|\.agents/agents/|run: /(start|project-stage-detect)|tier[^\n]*(Opus|Sonnet|Haiku)|model[^\n]*(Sonnet|Haiku)|LLM knowledge cutoff|training data likely covers' \
  --glob '!.git/**' --glob '!legacy/**' --glob '!.codex/capabilities/**' \
  --glob '!UPSTREAM-CHANGELOG.md' --glob '!ADAPTATION.md' \
  --glob '!tools/validate-toolkit.sh' .; then
  echo "ERROR: stale v1/Claude/model/write-gate terminology in active v2 files" >&2
  errors=$((errors + 1))
fi

for skill in .agents/skills/*/SKILL.md; do
  while IFS= read -r ref; do
    name=${ref#\$}
    [ -f ".agents/skills/$name/SKILL.md" ] || {
      echo "ERROR: $skill references missing skill $ref" >&2
      errors=$((errors + 1))
    }
  done < <(rg -o '\$[a-z][a-z0-9-]+' "$skill" | sort -u)
done

if [ "$errors" -ne 0 ]; then exit 1; fi
echo "Structured AI Studio toolkit validation passed."
