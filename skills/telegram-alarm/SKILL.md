---
name: "telegram-alarm"
description: "Send the manager a Telegram alarm through his own bot when a push is needed, because app notifications get overlooked. Use when a routine finds something red, when he says 'alarm me', 'send it to my phone', 'Telegram', or to set up, repair or test the alarm."
---

# Telegram alarm

App notifications drown in noise. Every real push also goes as a Telegram message to the manager's own bot: its own chat, its own loud sound, pinned, allowed in every Focus mode. Free, no server, one curl call.

## Send
```bash
bash tools/alarm.sh "S1 red: HQ question open for 3h. Draft: hq-check.md"
```
- Only 08:30–23:30 (the script checks; otherwise `ALARM SKIP`). Max 1 alarm per routine run.
- **No staff names, amounts or customer data in the text** — Telegram is an outside service. Only standard, status, count, file name.
- `ALARM FAIL` → report it in the routine's final message, never swallow it.

## Set up (5 min)
1. Telegram › **@BotFather** › `/newbot` → copy the token.
2. `bash tools/alarm-token.sh` → paste the token (hidden input). Saved to `~/.config/agent-alarm/telegram.env`, chmod 600, outside the notes folder.
3. Send "hi" to the new bot, then `bash tools/alarm.sh setup` (finds the chat id; bot updates expire after 24 h, so send a fresh message if it says "no chat found").
4. `bash tools/alarm.sh test`.
5. Phone: custom sound for the bot chat, pin it, allow Telegram in Focus.

## Wire into routines
In each scheduled routine, at the step that sends a notification, add:
> Whenever this step sends a notification, ALSO run `bash tools/alarm.sh "<same message>"` — no names, amounts or customer data. Send it even if no notification tool is available. If it prints ALARM FAIL, say so in the final message.

## Why not WhatsApp or email to yourself?
Messages you send from your own account never ring your own phone. A bot is a different sender, so it does.
