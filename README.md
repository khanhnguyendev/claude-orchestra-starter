# Claude Orchestra Starter

A project starter that turns Claude Code into a small autonomous team:

```
You ──► docs/KICKOFF.md (what to build)
           │
           ▼
   Orchestrator (main session, Opus)
     │  plans docs/PLAN.md, decides every next step
     ├──► executor subagent (Sonnet)  – writes the code for one step
     ├──► reviewer subagent (Sonnet)  – runs tests, reviews, reports PASS / issues
     └──► Stop hook – won't let the orchestrator stop while PLAN.md has unchecked steps
```

Runs entirely on a Claude subscription through Claude Code. No API key, no MCP server.

## Requirements
- Claude Code installed and logged in (`claude` works in your terminal)
- git
- Whatever your chosen stack needs (e.g. Node 18+ for `node --test`)

## Quick start
1. Copy this folder and rename it to your project name.
2. Fill in every `[FILL IN: ...]` placeholder in `docs/KICKOFF.md`.
3. Review `.claude/settings.json` → `permissions.allow` and add the commands your stack needs
   (anything not listed will prompt you for approval and pause the loop).
4. Make the scripts executable (only needed if your unzip tool dropped permissions):
   `chmod +x start.sh .claude/hooks/check_plan.sh`
5. First run only: start `claude`, run `/agents` (should list `executor` and `reviewer`) and
   `/hooks` (should list the Stop hook), accept any trust prompts, then `/exit`.
6. Start the team: `./start.sh`  (or `MODEL=sonnet ./start.sh` to save usage)

Watch `docs/PLAN.md` fill up with `[x]` as steps complete.

## When the loop stops
| Reason | What to do |
|---|---|
| Plan complete | Run the preview command from `docs/KICKOFF.md` and try it out |
| Orchestrator asked you a question | Answer it in the session; the loop resumes |
| Permission prompt | Approve it; add the command to `settings.json` if it recurs |
| Safety limit (40 auto-continues) | Review progress, then type `continue` |
| You want to steer | Press `Esc`, type new instructions |

To resume later: run `./start.sh` again. The orchestrator continues from the first unchecked step.

## Customizing
- **Models:** change `model:` in `.claude/agents/*.md`, or `MODEL=...` for the orchestrator.
- **Safety limit:** `export MAX_AUTO_CONTINUE=60` before starting.
- **Plan location:** `export PLAN_FILE=docs/PLAN.md` (default).
- **Workflow rules:** edit the "Orchestrator workflow" section at the bottom of `docs/KICKOFF.md`.

## Notes
- An autonomous loop can use your subscription's usage limits quickly, especially with Opus
  as orchestrator. Watch the first few steps.
- Hook and subagent file formats may change between Claude Code versions. If the loop does not
  auto-continue, check `/hooks` and the Claude Code docs.
