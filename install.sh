#!/bin/bash
set -euo pipefail

# caveman installer — thin wrapper that delegates to bin/install.js
# Supports both local clone installs and curl-piped remote installs.
#
# Remote: curl -fsSL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.sh | bash
# Local:  bash install.sh [flags]

MIN_NODE=18

# Check Node.js is installed
if ! command -v node >/dev/null 2>&1; then
  echo "caveman requires Node.js >= ${MIN_NODE}."
  echo ""
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Install via Homebrew: brew install node"
  else
    echo "Install via your package manager or https://nodejs.org"
  fi
  exit 1
fi

# Check Node.js version
NODE_MAJOR=$(node -e "process.stdout.write(String(process.versions.node.split('.')[0]))")
if [ "$NODE_MAJOR" -lt "$MIN_NODE" ]; then
  echo "caveman requires Node.js >= ${MIN_NODE}. You have Node.js ${NODE_MAJOR}."
  echo "Upgrade: https://nodejs.org"
  exit 1
fi

# Detect whether we're running from a local clone or piped from curl
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-/dev/stdin}")" 2>/dev/null && pwd || echo "")"

if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/bin/install.js" ]; then
  # Local clone — run directly
  exec node "$SCRIPT_DIR/bin/install.js" "$@"
else
  # Remote / piped — delegate to npx
  exec npx --yes caveman-installer "$@"
fi
