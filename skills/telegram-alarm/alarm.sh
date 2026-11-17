#!/bin/bash
# Telegram alarm for the manager — called by the routines when a push is needed.
#   bash tools/alarm.sh setup          → finds your chat id (after you sent a message to the bot)
#   bash tools/alarm.sh test           → sends a test alarm (ignores the time window)
#   bash tools/alarm.sh "Text"         → sends the alarm, only between 08:30 and 23:30
# Token + chat id live OUTSIDE the vault: ~/.config/agent-alarm/telegram.env
# Rule: alarm text has no staff names, amounts or customer data — only standard, status and file name.

CONF="$HOME/.config/agent-alarm/telegram.env"
[ -f "$CONF" ] || { echo "ALARM FAIL: $CONF missing (run: bash tools/alarm-token.sh)"; exit 2; }
# shellcheck disable=SC1090
source "$CONF"
[ -n "$TELEGRAM_BOT_TOKEN" ] || { echo "ALARM FAIL: TELEGRAM_BOT_TOKEN empty"; exit 2; }
API="https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}"

if [ "$1" = "setup" ]; then
  ID=$(curl -s "$API/getUpdates" | /usr/bin/python3 -I -c 'import json,sys
d=json.load(sys.stdin); ids=[u["message"]["chat"]["id"] for u in d.get("result",[]) if "message" in u]
print(ids[-1] if ids else "")')
  [ -n "$ID" ] || { echo "ALARM FAIL: no chat found — send /start to the bot in Telegram, then run setup again"; exit 3; }
  grep -v '^TELEGRAM_CHAT_ID=' "$CONF" > "$CONF.tmp"; echo "TELEGRAM_CHAT_ID=$ID" >> "$CONF.tmp"
  mv "$CONF.tmp" "$CONF"; chmod 600 "$CONF"; echo "ALARM OK: chat id saved"; exit 0
fi

[ -n "$TELEGRAM_CHAT_ID" ] || { echo "ALARM FAIL: no chat id — run: bash tools/alarm.sh setup"; exit 2; }

if [ "$1" = "test" ]; then
  TEXT="🔔 Test: the alarm works. This is what a push looks like."
else
  TEXT="$1"
  [ -n "$TEXT" ] || { echo "ALARM FAIL: no text"; exit 2; }
  NOW=$((10#$(date +%H%M)))
  if [ "$NOW" -lt 830 ] || [ "$NOW" -gt 2330 ]; then echo "ALARM SKIP: outside 08:30–23:30"; exit 0; fi
fi

RES=$(curl -s -X POST "$API/sendMessage" \
  --data-urlencode "chat_id=$TELEGRAM_CHAT_ID" \
  --data-urlencode "text=🚨 PUSH — ${TEXT}")
echo "$RES" | grep -q '"ok":true' && echo "ALARM OK" || { echo "ALARM FAIL: $(echo "$RES" | head -c 200)"; exit 1; }
