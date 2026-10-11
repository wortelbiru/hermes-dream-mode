#!/usr/bin/env bash
set -euo pipefail

HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Hermes Agent Dream Mode Setup ==="
echo "Target directory: $HERMES_HOME"

if [ ! -d "$HERMES_HOME" ]; then
    echo "Error: Hermes directory not found at $HERMES_HOME."
    echo "Please ensure Hermes Agent is installed or specify HERMES_HOME."
    exit 1
fi

# 1. Install Skill
SKILLS_DIR="$HERMES_HOME/skills/nightly-reflection"
echo "[1/3] Installing skill to $SKILLS_DIR..."
mkdir -p "$SKILLS_DIR"
cp "$SCRIPT_DIR/skills/nightly-reflection/SKILL.md" "$SKILLS_DIR/SKILL.md"
echo "Skill installed successfully."

# 2. Setup Memories Directory & Template
DREAMS_DIR="$HERMES_HOME/memories/dreams"
echo "[2/3] Setting up dream memories in $DREAMS_DIR..."
mkdir -p "$DREAMS_DIR"
if [ ! -f "$DREAMS_DIR/insights.md" ]; then
    cp "$SCRIPT_DIR/memories/dreams/insights.md" "$DREAMS_DIR/insights.md"
    echo "Created default insights.md."
else
    echo "Existing insights.md found, keeping current file."
fi

# 3. Cron Job Setup Instructions
echo "[3/3] Setting up Cron Job..."
echo ""
echo "To activate the nightly cron job, run the following in Hermes chat or CLI:"
echo ""
echo "In Hermes chat:"
echo '  Create a recurring cron job scheduled at "3 2 * * *" with prompt:'
echo '  "Run the nightly reflection procedure for yesterday. Follow every step in the nightly-reflection skill exactly."'
echo '  skills: ["nightly-reflection"]'
echo '  enabled_toolsets: ["file", "terminal", "memory", "session_search"]'
echo ""
echo "Or via hermes CLI (adjust schedule/deliver target as desired):"
echo '  hermes cron add --name "Dream Mode — Nightly Reflection" \'
echo '    --schedule "3 2 * * *" \'
echo '    --skill "nightly-reflection" \'
echo '    --prompt "Run the nightly reflection procedure for yesterday. Follow every step in the nightly-reflection skill exactly."'
echo ""
echo "Setup completed successfully."
