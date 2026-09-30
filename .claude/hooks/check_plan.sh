#!/bin/bash
# Stop hook: keeps the orchestrator working while docs/PLAN.md has unchecked steps.
#
# Lets the session stop when:
#   - the plan file does not exist yet (normal chat, or before planning)
#   - every step is checked
#   - .claude/NEED_HUMAN exists (the orchestrator has a question for you)
#   - it has auto-continued MAX_AUTO_CONTINUE times in a row (safety limit)

cat > /dev/null  # ignore the JSON payload Claude Code sends on stdin

DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
PLAN="$DIR/${PLAN_FILE:-docs/PLAN.md}"
COUNT_FILE="$DIR/.claude/hooks/.stop_count"
NEED_HUMAN="$DIR/.claude/NEED_HUMAN"
MAX="${MAX_AUTO_CONTINUE:-40}"

allow_stop() { rm -f "$COUNT_FILE"; exit 0; }

[ -f "$PLAN" ] || allow_stop
if [ -f "$NEED_HUMAN" ]; then rm -f "$NEED_HUMAN"; allow_stop; fi

REMAINING=$(grep -cE '^[[:space:]]*- \[ \]' "$PLAN")
[ "$REMAINING" -eq 0 ] && allow_stop

COUNT=$(( $(cat "$COUNT_FILE" 2>/dev/null || echo 0) + 1 ))
if [ "$COUNT" -gt "$MAX" ]; then
  rm -f "$COUNT_FILE"
  echo "{\"systemMessage\":\"Auto-continued $MAX times. Pausing so you can review progress.\"}"
  exit 0
fi
echo "$COUNT" > "$COUNT_FILE"

printf '{"decision":"block","reason":"docs/PLAN.md still has %s unchecked step(s) (auto-continue %s/%s). Delegate the next unchecked step to the executor subagent. If you truly need a decision from the user, write the question to .claude/NEED_HUMAN and stop."}\n' "$REMAINING" "$COUNT" "$MAX"
exit 0
