---
name: calendar-sync
description: Two-way sync — all of the manager's tasks into Google Calendar in one go, and calendar meetings/events back into TASKS.md with prep tasks. Use when he says /calendar-sync, "Kalender", "alles in den Kalender", "tasks to calendar", and daily via the 08:30 routine.
---

# /calendar-sync — TASKS.md → Google Calendar

Agent: `<AGENT_DIR>`. Own calendar only (primary). **Never add attendees, never send invites.** Max ~10 tool calls.

1. Read `TASKS.md` (Now + This week + Waiting) and list Calendar events for today → +14 days.
2. **Dated tasks** (a weekday, date or time in the line): one event each at that date/time (no time → 10:00–10:30). Title starts with ✅, description = the task line + where the draft/file is. Popup 15 min.
3. **Undated tasks in "Now":** ONE event today 10:00–10:30 titled `📋 Heute: <n> Tasks`, description = bullet list of them (most urgent first). Replace yesterday's undated block, don't stack.
4. **No duplicates:** skip a task if an event with the same core words already exists in that window. Don't touch events the manager made himself.
5. Done tasks (`[x]`) → delete the matching ✅/📋 event only if Claude created it (title starts with ✅ or 📋).
6. Report in 2 lines: "+n neu, m übersprungen, k entfernt".

## Backwards: Calendar → agent
7. Read all events for today → +7 days (also ones the manager or others created: meetings, calls, deliveries, events).
8. Rewrite the section `## Termine (aus Kalender)` at the top of `TASKS.md` (create if missing; replace its content each run): one line per event `- Fr 13.11 13:45 CH Weekly Managers (Meet)`. Skip ✅/📋 events Claude made.
9. For each meeting/event that needs preparation (call with HQ, delivery, event, interview, trial), add a prep task to `TASKS.md` › Now one day before, e.g. `- [ ] Vorbereiten: CH Weekly Managers Fr 13:45 — Punkte: …` — only if not already there.

## Reminders + push lines
10. Every event Claude creates or syncs gets a popup **10 min before** (plus longer ones where useful). On HQ/others' meetings only set the reminder, never edit their text; always `notificationLevel: NONE`.
11. Every ✅/📋 event Claude creates starts its description with ONE funny, slightly pushy German line (food/burger humour, "Chef", short), then a blank line, then the facts. Never mean, never about other people.
