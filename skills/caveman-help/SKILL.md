---
name: caveman-help
description: >
  Quick-reference card for all caveman modes, skills, and commands.
  Trigger: /caveman-help
---

Display caveman quick-reference. No inference needed — just print the card.

## Trigger

`/caveman-help` — print the reference card below verbatim.

---

## Caveman Quick Reference

**Modes** (persist until changed or session ends):

| Command | Level | What changes |
|---------|-------|--------------|
| `/caveman lite` | Lite | Strips filler/hedging; keeps articles and full sentences |
| `/caveman` | Full (default) | Drops articles; fragments OK; short synonyms |
| `/caveman ultra` | Ultra | Abbreviates prose words (DB, auth, config); X → Y causality |
| `/caveman wenyan` | Wenyan-full | Classical Chinese (文言文); ~80% char reduction |
| `/caveman off` | Off | Deactivate; resume normal style |

**Deactivate:** "stop caveman" or "normal mode"
**Reactivate:** `/caveman` or "activate caveman"

---

**Skills:**

| Command | What it does |
|---------|-------------|
| `/caveman-commit` | Terse Conventional Commit message (≤50 char subject) |
| `/caveman-review` | One-line PR review comments: `L<n>: problem. fix.` |
| `/caveman-compress <file>` | Compress memory file ~46%; backup saved as FILE.original.md |
| `/caveman-stats` | Real token usage + estimated savings for this session |
| `/caveman-stats --all` | Lifetime stats across all sessions |
| `/caveman-stats --share` | One-line shareable summary |
| `/caveman-help` | This card |

---

**Config** (priority order):
1. `CAVEMAN_DEFAULT_MODE=full` env var
2. `~/.config/caveman/config.json` → `{ "defaultMode": "full" }`
3. Built-in default: `full`

**More:** https://github.com/JuliusBrussee/caveman
