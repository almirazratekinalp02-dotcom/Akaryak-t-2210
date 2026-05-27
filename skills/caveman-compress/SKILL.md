---
name: caveman-compress
description: >
  Compress natural language memory files (CLAUDE.md, todos, preferences) into caveman format
  to save input tokens. Preserves all technical substance, code, URLs, and structure.
  Compressed version overwrites the original file. Human-readable backup saved as FILE.original.md.
trigger: /caveman-compress FILEPATH or "compress memory file"
---

Compress natural language memory files. Strip fluff. Preserve substance.

## Trigger

`/caveman-compress <filepath>` or user request to compress a memory file.

## Process

1. Locate file at given path
2. Back up original as `FILE.original.md`
3. Compress contents using caveman rules
4. Validate: compressed file must be smaller, all technical info preserved
5. Retry up to 2 times on errors; report failures without modifying originals

## Compression Rules

**Remove:**
- Articles (a, an, the)
- Filler words (just, really, basically, actually, simply, very)
- Pleasantries (please, thank you, feel free to)
- Hedging (might, could, perhaps, I think, probably, it seems)
- Redundant phrases ("in order to" → "to", "due to the fact that" → "because")
- Connective fluff ("Additionally,", "Furthermore,", "It's worth noting that")

**Preserve exactly (never modify):**
- Code blocks (``` fenced and indented)
- Inline code (`backtick`)
- URLs and file paths
- Shell commands
- Technical terms and proper nouns
- Dates and version numbers
- Environment variable names

**Compress prose:**
- Use short synonyms (big, fix, use, get, run)
- Fragments acceptable
- Drop "you should" — just state the action
- Merge redundant bullets into one
- Keep single clearest example, drop others

## Critical

Code within triple backticks: copied exactly. No modifications to comments, spacing, content, or line order.

## File Scope

Only compress: `.md`, `.txt`, `.typ`, `.typst`, `.tex`, extensionless files.
Never modify: `.py`, `.js`, `.ts`, `.json`, `.yaml`, `.toml`, or any code/config format.
Never compress: `FILE.original.md` backup files.
