# Conversation Converter

Converts AI conversation exports to clean, readable markdown.

## Purpose

This project documents the conversations that shaped its ideas. To make those conversations readable and archivable, they need to be converted from various export formats to standardized markdown.

## Usage

```bash
ruby claude_to_markdown.rb conversation.json output.md
```

## Options

```
-v, --verbose          Print detailed output
--no-timestamps       Exclude timestamps from output
--no-metadata         Exclude metadata footer
-s, --summary         Add conversation summary
-h, --help            Show help message
```

## Output Format

```markdown
# AI Conversation

**Date**: 2023-11-15
**Model**: claude-3-opus

---

### User

What is governance?

### Assistant

Governance refers to...

---

*Conversation Statistics*
- Total messages: 10
- User messages: 5
- Assistant messages: 5
```

## Installation

```bash
bundle install
```

## Development Status

See `claude_to_markdown.rb` for TODO comments marking implementation areas.

---

For general tool documentation, see [tools/README.md](../README.md).
