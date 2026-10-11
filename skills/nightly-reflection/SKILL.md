---
name: nightly-reflection
description: "Use for nightly self-review of yesterday's sessions."
version: 1.0.0
author: "Hermes Agent"
license: MIT
platforms: [linux, macos]
metadata:
  hermes:
    tags: [reflection, memory, self-improvement, cron]
    related_skills: [post-session-cycle, session-librarian, hermes-token-audit]
---

# Dream Mode — Nightly Reflection

Autonomous nightly review of all user-agent interactions from yesterday.
Produces a reflective daily note and consolidates durable insights.

## When to Use

- Triggered by cron nightly (recommended around 02:00 local time).
- User manually requests a reflection for a specific date.

## Storage

- Daily notes: `~/.hermes/memories/dreams/<YYYY-MM-DD>.md`
- Durable insights: `~/.hermes/memories/dreams/insights.md`

## Procedure

### Step 1 — Load Context

1. Read `~/.hermes/memories/dreams/insights.md`.
2. Apply existing principles and build on prior learnings.
3. Determine the target date (yesterday in local timezone).
4. Check if a note for the target date already exists — skip if it does.

### Step 2 — Gather Activity

1. Use `session_search` (deferred tool) with `after` and `before` set to target date boundaries to browse sessions.
2. Use snippets and bookends first; only deep-dive into ambiguous sessions.
3. **Maximum 3 session deep-dives per run**, each with `window=5`.
4. Never reread files or sessions already read in this run.
5. Scan `~/.hermes/cron/output/` for relevant cron job results from the target date.
6. **Never invent activity.** Explicitly state when the day has little or no meaningful interaction.

### Step 3 — Analyze

Evaluate across these dimensions:
- **Clarity** — were responses clear and well-structured?
- **Accuracy** — any factual errors or hallucinations?
- **Helpfulness** — did responses advance the user's goals?
- **Efficiency** — context usage, unnecessary round-trips, token waste?
- **Tone** — adherence to user communication guidelines, objective and non-sycophantic?
- **Mistakes** — errors committed or narrowly avoided?
- **Missed opportunities** — better approaches that were overlooked?

Extract: durable lessons, behavioral improvements, memory candidates, unresolved questions.
**Focus on analysis, not log paraphrasing.**

### Step 4 — Write Daily Note

Save to `~/.hermes/memories/dreams/<YYYY-MM-DD>.md`.

Use this structure exactly:

```markdown
# Dream Log — <YYYY-MM-DD>

## Daily Summary

## Key Interactions

## Quality Assessment

### What I did well
### What I did poorly
### Confusion or misinterpretation
### Errors/hallucinations avoided or committed

## Lessons Learned

## Behavioral Adjustments for Tomorrow

## Memory Candidates

## Open Questions

## Opportunities for Future Improvement

## Skill Review
```

**Writing safety:**
- Write in two chunks: first header through Key Interactions, then remaining sections via `patch` (append).
- Keep each write under 6,000 characters.
- If a write stalls, inspect the file before continuing — never blindly retry.

### Step 5 — Consolidate Insights

1. Read `~/.hermes/memories/dreams/insights.md`.
2. Add durable, reusable lessons discovered today.
3. Deduplicate: strengthen existing entries rather than adding near-duplicates.
4. Preserve file structure — use small targeted `patch` calls, never rewrite the entire file.

### Step 6 — Persist Memory

- Inspect persistent memory capacity before adding new facts.
- Store only genuinely durable, high-value facts not already remembered.
- `target=user` for user facts/preferences, `target=memory` for environment/workflow.
- Skip temporary or session-specific information.

### Step 7 — Skill Review (via Curator)

Run:
```bash
hermes curator status
hermes curator usage 2>&1 | head -50
```

Record in the `## Skill Review` section:
- Number of active / stale / archived skills.
- Least recently active skills (potential archive candidates).
- Any skills archived since last review — include recovery command: `hermes curator restore <name>`.
- If the newest curator report is newer than yesterday's note, incorporate its changes in 1-2 lines.
- **Never merge skills automatically.** For up to 2 genuinely redundant pairs, add an open question asking the user to approve.
- If nothing changed, write "No skill changes."

### Step 8 — Final Message

Deliver to the designated notification target or origin chat. Keep concise:

1. Confirm daily note saved with its path.
2. Share 2-3 most important takeaways.
3. Include **Open Questions** only if meaningful questions exist.
4. Include **Skills** only if a skill was archived or merge proposed.

## Core Principles

- Evidence over assumptions.
- Honest self-critique.
- Context efficiency (prefer bookends over full reads).
- Durable learning (generalize beyond one session).
- Deduplication (strengthen, don't duplicate).
- Safe incremental writes.
- Respect "Interpreting session gaps": long gaps with incomplete tasks usually indicate the user stepped away, not assistant failure.

## Pitfalls

- Do not paraphrase session logs — analyze them.
- Do not fabricate activity for quiet days.
- Do not blindly append to insights.md — deduplicate first.
- Always check memory capacity before persisting.
- Cron outputs may contain job IDs, not human-readable names — cross-reference with `jobs.json`.
- session_search is a deferred tool — invoke via `tool_call`.
