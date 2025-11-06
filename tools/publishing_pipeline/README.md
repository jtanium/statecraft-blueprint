# Publishing Pipeline

Validates drafts before publication to ensure quality and consistency.

## Purpose

Before moving a draft to the `published/` directory, it should be validated:
- All internal links work
- All citations are formatted properly
- Glossary terms are linked
- No TODO markers remain
- Frontmatter is complete
- Document structure is sound

This tool automates those checks.

## Usage

Basic validation:

```bash
ruby validate_post.rb draft.md
```

With options:

```bash
# Skip specific checks
ruby validate_post.rb --no-links draft.md
ruby validate_post.rb --no-citations draft.md

# Include conversation reference checking
ruby validate_post.rb --conversations draft.md

# Strict mode (warnings become errors)
ruby validate_post.rb --strict draft.md
```

## Validation Checks

### Frontmatter

Checks for required YAML frontmatter:

```yaml
---
title: "Post Title"
date: 2023-11-15
status: ready
tags: [governance, institutions]
---
```

Required fields: `title`, `date`, `status`

### TODO Markers

Finds any remaining TODO/FIXME/XXX markers that should be resolved.

### Internal Links

Validates that relative links point to existing files:

```markdown
[concept](../concepts/governance/outline.md)  # Must exist
```

### External Links

Checks URL formatting for external links.

### Citations

Validates citation formatting (uses similar logic to citation_formatter.rb).

### Glossary Terms

Optional check for unlinked glossary terms.

### Document Structure

Checks for:
- Title (H1)
- Sections (H2+)
- Reasonable length
- Content beyond just headings

## Options

```
--no-frontmatter      Skip frontmatter validation
--no-links            Skip link validation
--no-citations        Skip citation validation
--conversations       Check for conversation references
--strict              Treat warnings as errors
-h, --help            Show help message
```

## Exit Codes

- `0` - Validation passed
- `1` - Validation failed

Use in scripts:

```bash
if ruby validate_post.rb draft.md; then
  mv draft.md published/
  echo "Published!"
else
  echo "Fix errors first"
fi
```

## Installation

```bash
bundle install
```

## Example Output

```
✗ Validation failed with 2 error(s)

Errors:
  - Broken internal link: ../glossary/terms/missing.md
  - Found 1 TODO marker(s) - resolve before publishing

Warnings:
  - No tags specified in frontmatter
  - Document is very short (89 words)
```

## Development Status

Current implementation is a skeleton with TODO markers. Key areas needing implementation:

1. **Frontmatter parsing** - Extract and validate YAML
2. **Link validation** - Check internal/external links
3. **Citation checking** - Validate format
4. **Glossary validation** - Find unlinked terms

See `validate_post.rb` for TODO comments marking where logic goes.

## Testing

Run tests (once implemented):

```bash
bundle exec rspec
```

## Contributing

Contributions welcome:

- Add new validation checks
- Improve error messages
- Add tests
- Handle edge cases

## Future Enhancements

- Check for common writing issues (passive voice, etc.)
- Validate image links and alt text
- Check for broken external URLs (with timeout)
- Spell checking integration
- Reading level analysis
- Cross-reference validation (bidirectional links)

## Files

- `validate_post.rb` - Main script
- `Gemfile` - Dependencies
- `spec/` - Tests (to be added)

---

For general tool documentation, see [tools/README.md](../README.md).
