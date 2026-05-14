# caveman

> why use many token when few token do trick

Ultra-compressed communication mode for AI coding agents. Cuts ~75% of output tokens while keeping full technical accuracy.

## What it does

Caveman makes your AI agent respond like a smart caveman — terse, precise, no fluff. Same answers, far fewer tokens.

**Before:** "Sure! I'd be happy to help you with that. The issue you're experiencing is likely caused by a token expiry check that uses the wrong comparison operator..."

**After:** "Auth fail. Token expiry check wrong operator. Change `<` to `<=` line 42."

Real API benchmarks: **65% average output reduction** across 10 diverse tasks. Speed roughly triples.

## Install

**macOS/Linux/WSL:**
```bash
curl -fsSL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.ps1 | iex
```

Requires Node ≥18. Takes ~30 seconds.

## Usage

Activate with `/caveman` or say "talk like caveman."

**Intensity levels:**
- `/caveman lite` — strips filler, keeps articles and full sentences
- `/caveman` — default full mode, drops articles, fragments OK
- `/caveman ultra` — abbreviates prose words (DB, auth, config), arrows for causality
- `/caveman wenyan` — classical Chinese (文言文), ~80% character reduction
- `/caveman off` — deactivate

**Deactivate:** "stop caveman" or "normal mode"

## Skills

| Command | What it does |
|---------|-------------|
| `/caveman-commit` | Terse Conventional Commit message (≤50 char subject) |
| `/caveman-review` | One-line PR review comments: `L<n>: problem. fix.` |
| `/caveman-compress <file>` | Compress memory file ~46%; backup saved as FILE.original.md |
| `/caveman-stats` | Real token usage + estimated savings for this session |
| `/caveman-help` | Quick-reference card |

## Statusline badge

When active, shows `[CAVEMAN]` or `[CAVEMAN:ULTRA]` in your Claude Code statusline. Claude will offer to set this up on first session.

## Configuration

```json
// ~/.config/caveman/config.json
{ "defaultMode": "full" }
```

Or via env var: `CAVEMAN_DEFAULT_MODE=full`

## Safety

Caveman automatically suspends for:
- Security warnings
- Irreversible action confirmations
- Multi-step sequences where compression risks misreading

Resumes after the critical part is communicated clearly.

## License

MIT — Julius Brussee
