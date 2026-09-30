# Project context

- Project spec, tech stack and commands: `docs/KICKOFF.md`
- Current plan and progress: `docs/PLAN.md` (checkbox list; `[x]` = done)
- Team setup: the main session is the orchestrator; code is written by the `executor`
  subagent and reviewed by the `reviewer` subagent (see `.claude/agents/`).
- A Stop hook (`.claude/hooks/check_plan.sh`) keeps the orchestrator working while
  `docs/PLAN.md` has unchecked steps. To pause for a human decision, write the question
  to `.claude/NEED_HUMAN` and stop.
