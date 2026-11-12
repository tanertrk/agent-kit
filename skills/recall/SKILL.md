---
name: recall
description: Search everything already saved before asking the manager or re-reading apps (Hermes-style session search). Use when he says /recall, "was war mit…", "wann haben wir…", "did we already…", or before asking him any question about past work.
---

# /recall — search before asking

1. `grep -ri` the term (and 1–2 synonyms, German + English) in this order, stop at the first good hit:
   `TASKS.md`, `MEMORY.md`, `reports/insights/`, `reports/briefs/`, `people/`, `store/`, `../03 Chat-Backups/`, `../01 Arbeit/`.
2. Answer in max 5 lines: the fact, the date, the file it came from (as a link).
3. Nothing found → say so in one line and name the one place (Slack, Gmail, WhatsApp, an app) worth checking next. Don't check it unless asked.
Max 3 tool calls.
