---
name: new-job
description: Teach the agent a new job (e.g. "answer supply in Slack", "check the HR tool", "write the weekly report"). Interviews the manager one question at a time, gathers examples from his tools, then adds a skill for the job. Use when the manager types /new-job, says "neuer Job", "bring dir bei", "build an agent for", or pastes the AI Foundations agent-builder prompt.
---

# /new-job — add a job to the agent

The agent already exists (`CLAUDE.md`, `MEMORY.md`, `examples/`, `.claude/skills/`). This skill adds **one new job** to it. Never recreate those files; extend them.

## 0. Read first
`CLAUDE.md`, `MEMORY.md`, `profile/me.md`, `store/store.md`, `people/people.md`, and the list of skills in `.claude/skills/`. If an existing skill already covers the job, say so and offer to improve that one instead.

## 1. Interview — one question at a time
Wait for each answer before the next. Skip anything the files already answer. Usually 6–10 questions:
1. What exactly is the job, and how often?
2. What does a good result look like? (Show me one if you have it.)
3. How do you do it today, step by step?
4. Which tools and sources? (Slack channel, Gmail, Drive file, the HR tool, the inventory tool…)
5. What do you always do?
6. What do you never do?
7. Who reads the result, and in which language?
8. When must I stop and ask you instead of acting?
9. What goes wrong most often?
10. Should it run on a schedule, or only when you call it?

Keep questions short. the manager answers fast with typos — read for intent.

## 2. Gather examples
Search the connected tools (Slack, Gmail, Drive, Calendar, the Obsidian vault `../`) for past examples of this job done well. **Show what you found and ask before saving.** Save the chosen ones to `examples/<job-name>.md`, each with date, source and one line on why it's good. Never copy passwords or ID/AHV/bank numbers.

## 3. Ask for missing files
Name the files that would help (price list, supplier list, template, policy). He drops them into `inbox/`; move them to the right folder. Say clearly when you have enough.

## 4. Build
- **Skill:** `.claude/skills/<short-name>/SKILL.md` with frontmatter `name` + `description` (trigger words in German and English). Body: what to read first (always `MEMORY.md` + the examples file), the steps in order, what a good result looks like, when to stop and ask, output format and where it is saved.
- **CLAUDE.md:** add the skill to the skills row of the table, and any new "ask first" rule to the rules.
- **Schedule (only if he said yes in Q10):** create a scheduled task with a self-contained prompt that reads the agent folder at `~/Desktop/the manager-Agent`. Read-only in Slack/Gmail unless he explicitly allowed sending.
- **Obsidian:** add the skill to the Skills line in `00 Agent.md`.

## 5. Test, then explain
Run the new skill once on a real, current case and show the result. Then, in plain words: what the skill does, how to call it (`/<short-name>`), what it will never do without asking. Ask for one correction; save it to `MEMORY.md` if it applies to future jobs.
