# Writing Tools

This directory contains Ruby scripts that automate tedious parts of the writing and publishing workflow.

## Philosophy

Building tools for your own workflow serves multiple purposes:

1. **Makes the implicit explicit** - Automation forces you to formalize your process
2. **Saves time** - Repetitive tasks become one-liners
3. **Ensures consistency** - Formatting and validation happen the same way every time
4. **Demonstrates methodology** - Others can see and reuse your process

These aren't just utilities. They're part of the intellectual infrastructure.

## Available Tools

### Citation Helper

**Purpose**: Standardize citations across all documents

**Script**: `citation_helper/citation_formatter.rb`

Converts various citation formats (APA, MLA, Chicago, informal) to the project's standard format.

```bash
cd citation_helper
bundle install
ruby citation_formatter.rb ../concepts/governance-architecture/drafts/v1.md output.md
```

See [citation_helper/README.md](citation_helper/README.md) for details.

### Glossary Linker

**Purpose**: Automatically link glossary terms in markdown files

**Script**: `glossary_linker/auto_link_terms.rb`

Scans a markdown file and automatically creates links to glossary terms on first occurrence.

```bash
cd glossary_linker
bundle install
ruby auto_link_terms.rb ../concepts/governance-architecture/drafts/v2.md output.md
```

See [glossary_linker/README.md](glossary_linker/README.md) for details.

### Conversation Converter

**Purpose**: Convert AI conversation exports to readable markdown

**Script**: `conversation_converter/claude_to_markdown.rb`

Takes exported conversations from Claude, ChatGPT, or other AI tools and formats them as clean markdown for the `conversations/` directories.

```bash
cd conversation_converter
bundle install
ruby claude_to_markdown.rb conversation_export.json ../concepts/governance-architecture/conversations/001-initial-brainstorm.md
```

See [conversation_converter/README.md](conversation_converter/README.md) for details.

### Publishing Pipeline

**Purpose**: Validate drafts before publication

**Script**: `publishing_pipeline/validate_post.rb`

Checks that a draft is ready for publication by validating:
- All links work
- All citations are formatted
- Glossary terms are linked
- No TODO markers remain
- Frontmatter is complete

```bash
cd publishing_pipeline
bundle install
ruby validate_post.rb ../concepts/governance-architecture/drafts/v3.md
```

See [publishing_pipeline/README.md](publishing_pipeline/README.md) for details.

## Installation

Each tool has its own Gemfile. To install dependencies:

```bash
cd <tool-directory>
bundle install
```

Or install all tools at once:

```bash
for dir in */; do
  (cd "$dir" && bundle install)
done
```

## Requirements

- Ruby 3.0 or higher
- Bundler

## Development Status

These tools are in active development. Most are skeleton implementations with TODO comments indicating where logic needs to be filled in.

Contributions welcome - see [CONTRIBUTING.md](../CONTRIBUTING.md).

## Usage Patterns

### Single File Processing

```bash
ruby script.rb input.md output.md
```

### Batch Processing

Process multiple files:

```bash
for file in ../concepts/**/drafts/*.md; do
  ruby citation_formatter.rb "$file" "${file%.md}_formatted.md"
done
```

### Pipeline Multiple Tools

Chain tools together:

```bash
# 1. Format citations
ruby citation_helper/citation_formatter.rb draft.md temp1.md

# 2. Link glossary terms
ruby glossary_linker/auto_link_terms.rb temp1.md temp2.md

# 3. Validate
ruby publishing_pipeline/validate_post.rb temp2.md && mv temp2.md final.md
```

## Design Principles

### 1. Command-Line First

All tools are designed to be used from the command line. No GUIs, no web interfaces. Just:

```bash
ruby script.rb input.md output.md
```

### 2. Composable

Each tool does one thing well and can be combined with others via Unix pipes and shell scripts.

### 3. Transparent

The tools preserve the original file and output to a new file. You can always diff to see what changed.

### 4. Idiomatic Ruby

Code should be clear, expressive, and follow Ruby conventions. Prioritize readability over cleverness.

### 5. Self-Documenting

Each script includes:
- Clear comments explaining logic
- Help text accessible via `--help`
- Example usage in README

## Testing

Each tool directory should eventually include:
- `spec/` directory with RSpec tests
- `examples/` directory with sample inputs/outputs

Run tests:

```bash
cd <tool-directory>
bundle exec rspec
```

## Future Tools

Potential additions:

- **Conversation summarizer** - Auto-generate summaries of long AI conversations
- **Cross-reference validator** - Check that concept references are bidirectional
- **Timeline generator** - Create visual timelines of concept evolution from git history
- **Dependency mapper** - Generate graphs of how concepts reference each other

## Why Ruby?

Ruby was chosen because:

1. **Expressiveness** - Ruby code reads almost like pseudocode
2. **String/file manipulation** - Excellent for text processing
3. **Ecosystem** - Gems available for parsing, validation, etc.
4. **Scripting-friendly** - Easy to run as standalone scripts
5. **Personal preference** - The author knows Ruby well

If you prefer Python, JavaScript, or another language, the logic is transferable. The tools are simple enough to rewrite.

## Contributing

See each tool's README for specific contribution guidelines.

General principles:
- Keep tools simple and focused
- Add tests for new features
- Update README with usage examples
- Follow existing code style

---

*These tools evolve with the project. Check git history to see how they've changed.*
