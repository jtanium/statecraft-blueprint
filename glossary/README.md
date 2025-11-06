# Glossary

A living dictionary of terms used throughout The Statecraft Blueprint.

## Purpose

Complex ideas require precise terminology. This glossary:

- Defines specialized terms
- Provides consistent definitions across all concepts
- Links related terms
- Evolves as understanding deepens

## How to Use

### Reading

When you encounter a term you don't understand, check here. Each term has:
- Clear definition
- Context and examples
- Related terms
- Links to concepts that use it

### Writing

When writing new concepts:
1. Use the `auto_link_terms` tool to automatically link glossary terms
2. Define new terms as you introduce them
3. Add new term files to `glossary/terms/`

### Contributing

To add or improve a term definition:
1. Create/edit a file in `glossary/terms/`
2. Follow the term template below
3. Submit a pull request

## Term Template

Each term file should follow this structure:

```markdown
# [Term Name]

Also known as: [aliases, if any]

## Definition

[Clear, concise definition in 1-3 sentences]

## Detailed Explanation

[Longer explanation with context]

## Examples

[Concrete examples that illustrate the term]

## Related Terms

- [Link to related term 1]
- [Link to related term 2]

## Used In

[List of concepts that heavily use this term]

## References

[Optional: Sources or further reading]
```

## Current Terms

### Core Concepts

*To be added as terms are defined*

Example terms that will be defined:
- Accountability architecture
- Institutional design
- Governance framework
- Democratic legitimacy
- Public goods
- Collective action problem
- Information architecture
- Incentive structure
- Regulatory capture
- Separation of powers

### Process Terms

*To be added*

Terms about the project methodology:
- Intellectual transparency
- Concept development
- Draft iteration
- Validation pipeline

## Principles for Definitions

### 1. Clarity Over Precision

Better to be clear and slightly informal than precisely technical but confusing.

Good: "A governance framework is the set of rules, norms, and structures that determine how decisions get made and enforced."

Bad: "A governance framework constitutes the normative and institutional apparatus through which collective decision-making processes are instantiated and implemented."

### 2. Examples Ground Abstraction

Always include concrete examples.

### 3. Acknowledge Controversy

If a term is contested or has multiple meanings, say so.

### 4. Link Generously

Connect terms to related concepts and to the concepts that use them.

### 5. Update Honestly

When understanding improves, update the definition and note what changed in the git commit.

## Evolution of Terms

Definitions aren't fixed:

- **Initial definition**: Based on early understanding
- **Refinement**: As concepts develop, definitions sharpen
- **Revision**: When flaws are identified, definitions change
- **Versioning**: Git history shows how definitions evolved

This is a feature, not a bug. Understanding deepens over time.

## Searching for Terms

Use GitHub's search or grep:

```bash
# Find all uses of a term
grep -r "accountability architecture" concepts/

# Find all definitions
ls glossary/terms/
```

Or use the `auto_link_terms` tool to see which terms are defined.

## Contributing New Terms

When should you add a new term?

**Add a term when**:
- You use it repeatedly across concepts
- It has a specific meaning in this project
- Readers might not know what it means
- Definition helps clarify your argument

**Don't add a term when**:
- It's common English (don't define "government")
- You use it once
- Dictionary definition is sufficient
- It's not central to any concept

## Organization

Terms are organized as flat files in `terms/`, not hierarchically.

Why? Because:
- Terms relate in multiple ways (hierarchies oversimplify)
- Search works better than navigation for finding terms
- Links between terms create implicit structure
- Adding new terms doesn't require reorganization

## Status Indicators

Some terms may have status markers:

- `[Draft]` - Initial definition, subject to revision
- `[Contested]` - Multiple valid interpretations exist
- `[Deprecated]` - No longer used, but kept for reference
- `[Stable]` - Well-defined and unlikely to change substantially

## Questions?

If a term is unclear or missing:
- Open an issue
- Propose a better definition
- Ask for clarification

The glossary exists to help understanding, not to show off vocabulary.

---

*This README will evolve as the glossary grows. Check git history for changes.*
