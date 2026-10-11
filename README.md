# Dream Mode — Nightly Reflection for Hermes Agent

Autonomous nightly self-reflection and continuous learning pipeline for Hermes Agent.

## Overview

Dream Mode reviews all user ↔ agent interactions from the previous day, evaluates interaction quality, extracts reusable insights, updates persistent memories, audits skill health via Curator, and writes a structured daily dream log.

## Features

- **Daily Log Generation**: Saved to `~/.hermes/memories/dreams/<YYYY-MM-DD>.md`.
- **Durable Insights Consolidation**: Extracted into `~/.hermes/memories/dreams/insights.md`.
- **Quality Assessment**: Evaluates clarity, accuracy, helpfulness, efficiency, tone, and mistakes.
- **Hermes Curator Integration**: Audits skill usage and flags stale/archived candidates.
- **Privacy-Preserving**: Runs locally on your Hermes instance with zero external telemetry.

## Directory Structure

```text
.
├── README.md
├── setup.sh
├── skills/
│   └── nightly-reflection/
│       └── SKILL.md
└── memories/
    └── dreams/
        └── insights.md
```

## Quick Start

1. Extract the package into any directory.
2. Run the installer:
   ```bash
   bash setup.sh
   ```
3. Schedule the cron job in Hermes (see below) or trigger manually.

## Scheduling the Cron Job

Ask your Hermes Agent:
> "Schedule a nightly cron job at 02:03 named 'Dream Mode — Nightly Reflection' using the nightly-reflection skill. Set enabled_toolsets to file, terminal, memory, session_search."

Alternatively, configure via Hermes CLI:
```bash
hermes cron add \
  --name "Dream Mode — Nightly Reflection" \
  --schedule "3 2 * * *" \
  --skill "nightly-reflection" \
  --prompt "Run the nightly reflection procedure for yesterday. Follow every step in the nightly-reflection skill exactly."
```

## Manual Trigger

To run reflection manually on demand, tell Hermes:
> "Run the nightly-reflection skill for yesterday."
