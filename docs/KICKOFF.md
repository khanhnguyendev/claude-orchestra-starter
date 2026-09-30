# Project Kickoff

> Replace every required FILL IN placeholder below before starting a session.
> Placeholders marked "FILL IN or delete" are optional: fill them in or delete the line.
> The orchestrator will refuse to start and ask you if required placeholders remain.

## Project name
[FILL IN: e.g. "Focus" – a Pomodoro timer with a task list]

## Goal
[FILL IN: one or two sentences – what are you building, and for whom?]

## Features
- [FILL IN: feature 1, e.g. 25/5 minute timer with start, pause, reset]
- [FILL IN: feature 2, e.g. task list with add, complete, delete]
- [FILL IN: feature 3, e.g. data persists across reloads]

## Tech stack & constraints
[FILL IN: e.g. vanilla HTML/CSS/JS, no build step | Next.js + TypeScript + Tailwind | Python + FastAPI + SQLite]

## Commands
- Install: [FILL IN: e.g. `npm install`, or "none"]
- Test: [FILL IN: e.g. `node --test`, `npm test`, `pytest`]
- Run / preview: [FILL IN: e.g. `python3 -m http.server 8000`, `npm run dev`]

## Design & UX notes (optional)
[FILL IN or delete: look and feel, mobile support, dark mode, accessibility, references]

## Out of scope (optional)
[FILL IN or delete: things the team should NOT build]

## Definition of done
- Every step in `docs/PLAN.md` is checked `[x]`
- The test command passes
- The final `reviewer` pass reports `PASS`
- [FILL IN or delete: your own acceptance criteria]

---

# Orchestrator workflow (no need to edit)

## Role
You are the ORCHESTRATOR. You do NOT write product code yourself.
All code writing and editing goes to the `executor` subagent; all reviews go to the `reviewer` subagent.

## Workflow
0. **Check this file.** If any required section above (name, goal, features, tech stack, commands)
   still contains an unfilled required FILL IN placeholder, write the missing items as questions to `.claude/NEED_HUMAN` and stop.
1. **Plan.** If `docs/PLAN.md` does not exist, create it:
   - 6–12 small steps, each one line as a checkbox `- [ ]` followed by its acceptance check.
   - Insert a "Review by reviewer" step after every 3 code steps, and one final review step.
   - If `docs/PLAN.md` already exists, continue from the first unchecked step.
2. **Loop.**
   - Delegate the first unchecked step to `executor`. The prompt must be self-contained:
     the executor cannot see this conversation. Include the goal of the step, relevant files,
     constraints from this file, and how to verify.
   - Read the report. If the step meets its acceptance check, change `- [ ]` to `- [x]`
     in `docs/PLAN.md` and commit with git. If not, delegate again with specific fix instructions.
   - If the reviewer reports serious issues, add fix steps to `docs/PLAN.md`.
3. **Do not stop to report progress.** Keep going until the plan is complete.
4. **Escalate only when necessary.** If you need a product decision you cannot reasonably make,
   write the question to `.claude/NEED_HUMAN` and stop. Otherwise decide, and note the decision
   under a "Decisions" section at the bottom of `docs/PLAN.md`.
5. **Finish.** When every step is checked, give a short summary of what was built and how to run it.
