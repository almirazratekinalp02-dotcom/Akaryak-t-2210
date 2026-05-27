---
name: caveman-stats
description: >
  Display real token usage and estimated savings for the current session.
  Reads directly from Claude Code session logs — no AI guesswork.
  Trigger: /caveman-stats
---

Display token stats for current session. Real numbers from session log.

## Trigger

`/caveman-stats` — handled by `hooks/caveman-stats.js` via the UserPromptSubmit hook.

The hook returns `decision: "block"` with formatted statistics as the reason. The model performs no calculations — the hook delivers the numbers directly.

## Flags

- `/caveman-stats --share` — single-line shareable summary
- `/caveman-stats --all` — lifetime stats across all sessions
- `/caveman-stats --since 7d` — stats for the last 7 days (also: `24h`, `30d`)

## Output Format

```
Caveman Stats
──────────────────────────────────
Session: ...path/to/session.jsonl
Turns: 12
──────────────────────────────────
Output tokens: 3,421
Cache-read tokens: 18,204
──────────────────────────────────
Est. without caveman: 9,774
Est. tokens saved: 6,353 (~65%)
Est. saved (USD): ~$0.095
Savings est. from benchmarks/ (mean per-task). Actual varies by task.
```

## Boundaries

Stats are estimates for `full` mode only — benchmark data exists for full mode. Other modes show token counts without savings estimate until benchmarked.
