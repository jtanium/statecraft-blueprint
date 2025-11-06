# Citation Helper

Standardizes citations across markdown documents to maintain consistency.

## Purpose

Academic writing requires consistent citation formatting. This tool:
- Detects various citation formats
- Converts them to the project standard
- Validates citation completeness
- Optionally generates bibliography sections

## Usage

Basic usage:

```bash
ruby citation_formatter.rb input.md output.md
```

With options:

```bash
# Verbose output
ruby citation_formatter.rb -v input.md output.md

# Add bibliography section
ruby citation_formatter.rb -b input.md output.md

# Specify citation style
ruby citation_formatter.rb -s apa input.md output.md
```

## Project Standard Format

The default format is:

```
Author. "Title." *Publication* (Year). URL
```

Examples:

```markdown
Smith, John. "On Democratic Institutions." *Political Theory* (2023). https://example.com

Jones, Alice and Bob Williams. "Governance Reform." *Policy Review* (2022).
```

## Features

### Input Format Detection

The tool recognizes:

- **Standard academic**: Author (Year). Title. Publication.
- **APA style**: Author, A. (Year). Title. Publication, volume(issue), pages.
- **MLA style**: Author. "Title." Publication, Date, pages.
- **Chicago style**: Various footnote and bibliography formats
- **Informal**: Author, "Title", URL

### Citation Validation

Checks for:
- Author present
- Title present
- Year in valid format (4 digits)
- URL properly formatted (if present)
- DOI properly formatted (if present)

### Bibliography Generation

With `-b` flag, generates a "References" section:

```markdown
## References

Author1. "Title1." *Publication* (Year1).

Author2. "Title2." *Publication* (Year2).
```

Citations are:
- Sorted alphabetically by author
- Deduplicated
- Formatted consistently

## Options

```
-v, --verbose              Print detailed output
-b, --bibliography         Add bibliography section at end
-s, --style STYLE          Citation style (standard, apa, mla, chicago)
-h, --help                 Show help message
```

## Installation

```bash
bundle install
```

## Examples

Example input:

```markdown
As Smith (2023) argues in "Democratic Theory"...

According to Jones, A. & Williams, B. (2022). Governance. Policy Review, 15(3), 45-67...
```

Example output:

```markdown
As Smith, John. "Democratic Theory." *Political Philosophy* (2023) argues...

According to Jones, Alice and Bob Williams. "Governance." *Policy Review* (2022)...
```

## Development Status

Current implementation is a skeleton with TODO markers. Key areas needing implementation:

1. **Citation detection** - Pattern matching for various formats
2. **Parsing logic** - Extract author, title, year, publication from each format
3. **Format conversion** - Transform to standard format
4. **Bibliography builder** - Sort and deduplicate citations

See `citation_formatter.rb` for TODO comments marking where logic goes.

## Testing

Run tests (once implemented):

```bash
bundle exec rspec
```

## Contributing

Contributions welcome:

- Add support for additional citation formats
- Improve detection accuracy
- Add tests
- Handle edge cases (multiple authors, no year, etc.)

## Future Enhancements

- Export to BibTeX format
- Import from reference managers (Zotero, Mendeley)
- Detect duplicate citations with slight variations
- Support for in-text citation styles (Author, Year) vs. footnotes
- Validation against DOI/ISBN databases

## Files

- `citation_formatter.rb` - Main script
- `Gemfile` - Dependencies
- `examples/` - Sample inputs and outputs (to be added)
- `spec/` - Tests (to be added)

---

For general tool documentation, see [tools/README.md](../README.md).
