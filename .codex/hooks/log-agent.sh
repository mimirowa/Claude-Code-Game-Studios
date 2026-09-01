#!/bin/bash
# Codex SubagentStart hook: Log agent invocations for audit trail
# Tracks workflow roles/capabilities without treating them as a hierarchy
#
# Input schema (SubagentStart):
# { "agent_id": "agent-abc123", "agent_type": "game_designer", ... }

INPUT=$(cat)

# Parse agent name -- use jq if available, fall back to grep
if command -v jq >/dev/null 2>&1; then
    AGENT_NAME=$(echo "$INPUT" | jq -r '.agent_type // "unknown"' 2>/dev/null)
else
    AGENT_NAME=$(echo "$INPUT" | grep -oE '"agent_type"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/"agent_type"[[:space:]]*:[[:space:]]*"//;s/"$//')
    [ -z "$AGENT_NAME" ] && AGENT_NAME="unknown"
fi

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
SESSION_LOG_DIR="project/production/session-state"

mkdir -p "$SESSION_LOG_DIR" 2>/dev/null

echo "$TIMESTAMP | Role/capability consulted: $AGENT_NAME" >> "$SESSION_LOG_DIR/role-audit.log" 2>/dev/null

exit 0
