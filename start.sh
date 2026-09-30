#!/bin/bash
# Starts the orchestrator session. Override the model with: MODEL=sonnet ./start.sh
set -e
cd "$(dirname "$0")"

if grep -qF '[FILL IN:' docs/KICKOFF.md; then
  echo "docs/KICKOFF.md still has unfilled placeholders. Fill it in first."
  exit 1
fi

[ -d .git ] || git init -q
exec claude --model "${MODEL:-opus}" "Read docs/KICKOFF.md and follow the orchestrator workflow in it."
