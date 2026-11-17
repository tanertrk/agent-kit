#!/bin/bash
# Saves the Telegram bot token for alarm.sh. The token is typed hidden and never shown.
DIR="$HOME/.config/agent-alarm"; mkdir -p "$DIR"; chmod 700 "$DIR"
read -r -s -p "Paste the bot token from @BotFather (hidden), then Enter: " T; echo
T=$(printf '%s' "$T" | tr -d '[:space:]')
case "$T" in [0-9]*:*) ;; *) echo "No bot token recognised (got ${#T} characters; expected ~46, format 123456789:ABC...). Run again."; exit 1;; esac
echo "TELEGRAM_BOT_TOKEN=$T" > "$DIR/telegram.env"; chmod 600 "$DIR/telegram.env"
echo "Saved. Now send a message to your bot, then run: bash tools/alarm.sh setup"
