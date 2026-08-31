#!/bin/bash
# Codex PostToolUse hook: Validates asset files after Write/Edit
# Checks naming conventions for files in assets/ directory
# Exit 0 = success (non-blocking, PostToolUse cannot block)
#
# Codex reports direct writes with a file_path and apply_patch edits with the
# patch text in tool_input.command.

INPUT=$(cat)

# Parse affected paths -- use jq if available, fall back to grep
if command -v jq >/dev/null 2>&1; then
    FILE_PATHS=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
    if [ -z "$FILE_PATHS" ]; then
        FILE_PATHS=$(echo "$INPUT" | jq -r '.tool_input.command // empty' | sed -nE 's/^\*\*\* (Add|Update) File: //p')
    fi
else
    FILE_PATHS=$(echo "$INPUT" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')
fi

WARNINGS=""
while IFS= read -r raw_path; do
    [ -n "$raw_path" ] || continue
    FILE_PATH=$(echo "$raw_path" | sed 's|\\|/|g')
    echo "$FILE_PATH" | grep -qE '(^|/)assets/' || continue
    FILENAME=$(basename "$FILE_PATH")

    if echo "$FILENAME" | grep -qE '[A-Z[:space:]-]'; then
        WARNINGS="$WARNINGS\nNAMING: $FILE_PATH must be lowercase with underscores (got: $FILENAME)"
    fi

    if echo "$FILE_PATH" | grep -qE '(^|/)assets/data/.*\.json$' && [ -f "$FILE_PATH" ]; then
        for cmd in python3 python py; do
            if command -v "$cmd" >/dev/null 2>&1; then
                if ! "$cmd" -m json.tool "$FILE_PATH" >/dev/null 2>&1; then
                    WARNINGS="$WARNINGS\nFORMAT: $FILE_PATH is not valid JSON"
                fi
                break
            fi
        done
    fi
done <<< "$FILE_PATHS"

if [ -n "$WARNINGS" ]; then
    echo -e "=== Asset Validation ===$WARNINGS\n========================" >&2
fi

exit 0
