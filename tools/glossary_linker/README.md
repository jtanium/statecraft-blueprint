# Glossary Linker

Automatically creates links to glossary terms in markdown documents.

## Purpose

When writing about complex topics with specialized terminology, you want:
- Consistent linking to glossary definitions
- No manual link maintenance
- Proper handling of term variations

This tool automates that process.

## Usage

Basic usage:

```bash
ruby auto_link_terms.rb input.md output.md
```

With options:

```bash
# Verbose output showing linked terms
ruby auto_link_terms.rb -v input.md output.md

# Link all occurrences (not just first)
ruby auto_link_terms.rb -a input.md output.md

# Case-sensitive matching
ruby auto_link_terms.rb -c input.md output.md

# Custom glossary directory
ruby auto_link_terms.rb -g path/to/glossary input.md output.md
```

## How It Works

1. **Scans glossary** - Loads all terms from `glossary/terms/`
2. **Finds matches** - Locates instances of terms in input file
3. **Creates links** - Adds markdown links to glossary
4. **Preserves context** - Skips code blocks and existing links

## Glossary Structure

Expected glossary structure:

```
glossary/
├── README.md
└── terms/
    ├── accountability-architecture.md
    ├── governance-framework.md
    └── institutional-design.md
```

Each term file should have:

```markdown
# Accountability Architecture

Also known as: accountability framework, accountability system

[Definition and explanation...]
```

The tool extracts:
- **Term name**: From filename or first H1
- **Aliases**: From "Also known as:" section or YAML frontmatter

## Example

Input:

```markdown
The accountability architecture must be built into the
institutional design from the start. Without proper
accountability architecture, institutions drift.
```

Output:

```markdown
The [accountability architecture](../../glossary/terms/accountability-architecture.md)
must be built into the institutional design from the start.
Without proper accountability architecture, institutions drift.
```

Note: Only the first occurrence is linked by default. Use `-a` to link all.

## Smart Linking

The tool avoids linking:

- Inside code blocks (` ``` `)
- Inside inline code (`` ` ` ``)
- Inside existing links
- Partial word matches (using `\b` word boundaries)

## Relative Paths

Links are calculated relative to the input file location:

- File in `concepts/governance/draft.md` → `../../glossary/terms/term.md`
- File in `published/essay.md` → `../glossary/terms/term.md`

## Options

```
-v, --verbose              Print detailed output
-a, --all                  Link all occurrences (not just first)
-c, --case-sensitive       Case-sensitive term matching
-g, --glossary DIR         Glossary directory path
-h, --help                 Show help message
```

## Installation

```bash
bundle install
```

## Development Status

Current implementation is a skeleton with TODO markers. Key areas needing implementation:

1. **Glossary loading** - Parse term files and extract names/aliases
2. **Term matching** - Find term instances while avoiding code blocks
3. **Link generation** - Calculate relative paths and create links
4. **Context preservation** - Skip links inside code/existing links

See `auto_link_terms.rb` for TODO comments marking where logic goes.

## Testing

Run tests (once implemented):

```bash
bundle exec rspec
```

## Contributing

Contributions welcome:

- Improve term detection accuracy
- Handle plural forms intelligently
- Support YAML frontmatter for aliases
- Add tests
- Handle edge cases

## Edge Cases to Handle

- **Plurals**: "institution" should match "institutions"
- **Capitalization**: "Democratic Reform" should match "democratic reform"
- **Hyphens**: "account-ability" should match "accountability"
- **Nested terms**: When one term contains another
- **Ambiguous terms**: When term appears in different contexts

## Future Enhancements

- Intelligent plural matching
- "See also" links between related terms
- Automatic detection of undefined terms that should be in glossary
- Statistics on term usage across documents
- Visual graph of term relationships

## Files

- `auto_link_terms.rb` - Main script
- `Gemfile` - Dependencies
- `examples/` - Sample inputs and outputs (to be added)
- `spec/` - Tests (to be added)

---

For general tool documentation, see [tools/README.md](../README.md).
