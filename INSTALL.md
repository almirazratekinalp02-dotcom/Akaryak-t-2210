# Installation

## Quick install (recommended)

**macOS/Linux/WSL:**
```bash
curl -fsSL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.ps1 | iex
```

Requirements: Node.js ≥18. Takes ~30 seconds.

## What the installer does

1. Detects which AI coding agents are installed (Claude Code, Cursor, Codex, etc.)
2. Installs caveman for each detected agent
3. For Claude Code: installs the plugin + configures the statusline badge
4. For other agents: installs the appropriate skill/rule files

## Manual install (Claude Code plugin)

If you prefer to install manually as a Claude Code plugin:

1. Clone this repository
2. In Claude Code, run: `/plugins add /path/to/caveman`

Or install from the marketplace: search for "caveman" in Claude Code plugins.

## Configuration

After install, set your default mode:

```json
// ~/.config/caveman/config.json
{ "defaultMode": "full" }
```

Valid modes: `off`, `lite`, `full`, `ultra`, `wenyan-lite`, `wenyan-full`, `wenyan-ultra`

Or use an environment variable:
```bash
export CAVEMAN_DEFAULT_MODE=full
```

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.sh | bash -- --uninstall
```

## Troubleshooting

**Caveman not activating:** Check that the plugin is installed with `/plugins list` in Claude Code.

**Statusline not showing:** Run `/caveman` — Claude will offer to configure the statusline badge.

**Debug mode:** Set `CAVEMAN_DEBUG=1` to see flag file operations in stderr.
