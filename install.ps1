# caveman installer — PowerShell wrapper
# Remote: irm https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.ps1 | iex
# Local:  .\install.ps1 [flags]

$MinNode = 18
$ErrorActionPreference = "Stop"

# Check Node.js is installed
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  Write-Host "caveman requires Node.js >= $MinNode."
  Write-Host "Install from: https://nodejs.org"
  exit 1
}

# Check Node.js version
$NodeVersion = node -e "process.stdout.write(String(process.versions.node.split('.')[0]))"
if ([int]$NodeVersion -lt $MinNode) {
  Write-Host "caveman requires Node.js >= $MinNode. You have Node.js $NodeVersion."
  Write-Host "Upgrade: https://nodejs.org"
  exit 1
}

# Detect local clone vs piped execution
$ScriptDir = $PSScriptRoot
if ($ScriptDir -and (Test-Path (Join-Path $ScriptDir "bin\install.js"))) {
  # Local clone
  node (Join-Path $ScriptDir "bin\install.js") @args
} else {
  # Remote / piped
  npx --yes caveman-installer @args
}
