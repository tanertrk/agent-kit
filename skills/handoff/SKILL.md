---
name: handoff
description: Move a long chat to a fresh one without losing anything. Saves a chat backup in Obsidian, files insights, and gives a short start prompt for the new chat. Use when the manager types /handoff, says "neuer Chat", "Übergabe", "chat is too long", or when the conversation has become very long.
---

# /handoff — fresh chat, nothing lost

Vault: `<VAULT_DIR>` (space at the end). Agent: `<vault>/07 Agent`.

1. **File first.** Run the `/insights` steps on this chat so tasks, people, store facts and lessons are already in the agent files.
2. **Chat backup.** Write `<vault>/03 Chat-Backups/JJJJ-MM-TT – <Thema>.md` in German, following `Vorlage Chat-Backup.md`:
   frontmatter `tags: [chat-backup]`, `datum`, `quelle: Claude Code`;
   sections *Worum ging es?* · *Ergebnis / Entscheidungen* · *Offene Punkte* (checkboxes) · *Verknüpft mit* (`[[00 Agent]]`, people, notes touched).
   Max ~40 lines. Only what the next chat needs: decisions, open threads, where things are, what is unproven.
3. **Start prompt.** Give the manager a block to paste into the new chat:
   ```
   Weiter von [[JJJJ-MM-TT – Thema]]. Lies CLAUDE.md, MEMORY.md, TASKS.md und diese Notiz. Offen: <1–3 Punkte>. Mach weiter mit: <nächster Schritt>.
   ```
4. Tell him in one line: open a new session in the `the manager-Agent` folder, paste the block.

Never put passwords, ID/AHV/bank numbers or private chat content in the backup.
