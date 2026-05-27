# caveman — statusline badge script for Claude Code (Windows/PowerShell)
# Reads the caveman mode flag file and outputs a colored badge.
#
# Usage in ~/.claude/settings.json:
#   "statusLine": { "type": "command", "command": "powershell -ExecutionPolicy Bypass -File /path/to/caveman-statusline.ps1" }

$claudeDir = if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $HOME ".claude" }
$flagPath = Join-Path $claudeDir ".caveman-active"

# Exit gracefully if file doesn't exist
if (-not (Test-Path $flagPath -PathType Leaf)) { exit 0 }

# Reject reparse points (symlinks and junctions) — same security rationale as the bash version
$item = Get-Item $flagPath -Force -ErrorAction SilentlyContinue
if (-not $item) { exit 0 }
if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) { exit 0 }

# Hard-cap at 64 bytes
$bytes = [System.IO.File]::ReadAllBytes($flagPath)
if ($bytes.Length -gt 64) { exit 0 }

$rawMode = [System.Text.Encoding]::UTF8.GetString($bytes).Trim().ToLower()

# Strip anything outside [a-z0-9-] to prevent terminal injection
$mode = ($rawMode -replace '[^a-z0-9\-]', '')

# Whitelist
$validModes = @('off','lite','full','ultra','wenyan-lite','wenyan','wenyan-full','wenyan-ultra','commit','review','compress')
if ($mode -notin $validModes) { exit 0 }

$ESC = [char]27

if (-not $mode -or $mode -eq 'full') {
  Write-Host -NoNewline "${ESC}[38;5;172m[CAVEMAN]${ESC}[0m"
} else {
  $suffix = $mode.ToUpper()
  Write-Host -NoNewline "${ESC}[38;5;172m[CAVEMAN:$suffix]${ESC}[0m"
}

# Savings suffix
$savingsEnabled = if ($env:CAVEMAN_STATUSLINE_SAVINGS) { $env:CAVEMAN_STATUSLINE_SAVINGS } else { "1" }
if ($savingsEnabled -ne "0") {
  $suffixPath = Join-Path $claudeDir ".caveman-statusline-suffix"
  if (Test-Path $suffixPath -PathType Leaf) {
    $suffixItem = Get-Item $suffixPath -Force -ErrorAction SilentlyContinue
    if ($suffixItem -and -not ($suffixItem.Attributes -band [System.IO.FileAttributes]::ReparsePoint)) {
      $suffixBytes = [System.IO.File]::ReadAllBytes($suffixPath)
      if ($suffixBytes.Length -le 64) {
        $savings = [System.Text.Encoding]::UTF8.GetString($suffixBytes).Trim()
        # Strip control characters
        $savings = ($savings -replace '[\x00-\x1F]', '')
        if ($savings) {
          Write-Host -NoNewline " ${ESC}[38;5;172m$savings${ESC}[0m"
        }
      }
    }
  }
}
