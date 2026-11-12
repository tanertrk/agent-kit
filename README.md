# Agent Kit for Non-Coders

A working personal AI agent for a manager who doesn't code — built on Claude Code, an Obsidian-style notes folder and plain Markdown. Running daily in a real restaurant operation since November 2026.

**What it does:** morning briefings, unanswered-question alerts, end-of-day report checks, calendar ↔ task sync with reminders, inbox triage, document → action items, weekly scorecard with self-reflection, nightly local backup and ops metrics.

## Structure
- `templates/` — `CLAUDE.md`, `SOUL.md`, `MEMORY.md`, `TASKS.md` to start your own agent
- `skills/` — reusable skills (copy into `.claude/skills/`)
- `agents/` — `reader` (cheap model for big reads), `helper` (routine work)
- `routines/` — scheduled-job patterns
- `docs/ops-log.md` — metrics format

## Principles
1. One folder is the source of truth; the agent reads it first and writes back to it.
2. Memory is curated, not a log. Skills write themselves.
3. Read-only by default — nothing is sent without the human's OK.
4. Measure every job (success, duration, tokens).

## Credits
`email-inbox-triage`, `weekly-review-planning`, `document-to-action-items` adapted from [Hermes Agent](https://github.com/NousResearch/hermes-agent) (MIT). Memory/SOUL design inspired by Hermes.

## License
MIT
