# Routines (Claude Code › Scheduled)

Read-only by default: they read your tools, write files and drafts, never send.

| Time | Routine | Output |
|---|---|---|
| daily 08:30 | calendar sync (tasks ↔ calendar, 10-min reminders) | calendar + TASKS.md |
| daily 09:00 | morning brief + yesterday's scorecard | reports/briefs/DATE-morning.md |
| 13:00 + 17:00 | "unanswered questions from HQ > 2 h" check | drafts + push |
| 23:15 | end-of-day report check | scorecard |
| 23:45 | local git backup + ops log + health note | reports/ops, reports/health |
| Sunday 20:00 | weekly scorecard + reflection (prune memory, curate skills) | reports/briefs/DATE-week.md |

Pattern for every routine prompt: absolute agent path · files to read first · read-only rule · exact output file · max tool calls · one push only when something is red.
