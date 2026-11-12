---
name: assist
description: the manager's personal assistant moves — put any task, meeting, event, deadline or reminder into his calendar and task list in one step, with a 10-min reminder and a funny push line. Use when he says /assist, "erinnere mich", "trag ein", "remind me", "add to calendar", "Termin", "vergiss nicht", or names something with a date or time.
---

# /assist — one sentence in, everything organised

Agent: `<AGENT_DIR>`. Max ~5 tool calls. Answer in 1–3 lines.

1. **Understand** what, when, who. No time given → 10:00–10:30 that day; no day → today if before 18:00, else tomorrow. Only ask if the day is truly unclear.
2. **Calendar** (primary, Google Calendar connector):
   - Title: emoji + short task (✅ task · 🍔 event · 📞 call · 📅 deadline · 🥓/🧾 supply).
   - Description: line 1 = ONE funny, slightly pushy German push line (burger/food humour, "Chef", never mean, never about other people), blank line, then the facts + where the draft/file is.
   - Reminders: popup **10 min** before (+60 min for events, +30 for deadlines).
   - **Never add attendees or send invites.** `notificationLevel: NONE`. Check for a duplicate first.
3. **TASKS.md:** add the line to the right section (Now / This week / Waiting) with date in brackets — unless it is a pure appointment, then it shows up via `/calendar-sync`.
4. **Recurring** ("jeden Montag", "every week") → RRULE, same rules.
5. **Reply:** `✅ Fr 13.11 20:30 Barry's Gym — Reminder 10 min, Push drin.`

Bulk (all tasks at once, or calendar → tasks): use `/calendar-sync`.
