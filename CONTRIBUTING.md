# Contributing to The Statecraft Blueprint

Thank you for your interest in contributing. This project thrives on diverse perspectives, rigorous critique, and collaborative refinement.

## Ways to Contribute

### 1. Challenge the Ideas

Found a logical flaw? Disagree with a premise? Spotted an inconsistency?

**Open an issue** describing:
- Which concept or claim you're challenging
- The specific problem you've identified
- Your reasoning (with sources if applicable)

Example: "The assumption in governance-architecture/outline.md:45 that X leads to Y ignores the counterexample of Z in historical context..."

### 2. Extend the Concepts

Want to build on an idea or take it in a new direction?

**Fork the repository** and:
- Create a new branch for your extension
- Add your work to the appropriate `concepts/` subdirectory
- Include your reasoning process (conversations, drafts, research)
- Submit a pull request with a clear explanation

### 3. Improve the Tooling

The Ruby scripts in `tools/` are meant to be useful and elegant.

**Contributions welcome**:
- Bug fixes
- New features
- Performance improvements
- Better error handling
- Additional tools for writing workflows

See each tool's README for specific contribution guidelines.

### 4. Add Research

Found a relevant paper, book, historical example, or data source?

**Submit a pull request** adding it to:
- `research/` for general resources
- `concepts/[topic]/research/` for topic-specific materials

Include a brief annotation explaining its relevance.

### 5. Fix Errors

Typos, broken links, formatting issues, unclear explanations?

**Pull requests welcome** - no issue needed for minor fixes.

## Contribution Standards

### For Content

1. **Show your reasoning** - Don't just assert; explain how you arrived at your conclusion
2. **Cite sources** - Use the citation helper tool or follow existing formats
3. **Link to context** - Reference specific files and line numbers when discussing existing content
4. **Be precise** - Vague critiques are hard to address; specific ones are valuable
5. **Stay on topic** - This is about governance and institutional design, not general politics

### For Code

1. **Follow Ruby idioms** - Code should be clear and expressive
2. **Write tests** - At minimum, include example usage
3. **Document thoroughly** - Comments should explain *why*, not just *what*
4. **Keep it modular** - Each tool should do one thing well
5. **Command-line friendly** - Tools should be runnable as `ruby script.rb input.md output.md`

### For Discussion

1. **Assume good faith** - We're all trying to figure this out
2. **Be specific** - "This is wrong" is less helpful than "This contradicts X because Y"
3. **Welcome disagreement** - The point is to strengthen ideas through challenge
4. **Separate facts from values** - Be clear when you're making an empirical claim vs. a normative one

## The Review Process

### For Issues

- I'll respond to challenges and questions as time allows
- Good-faith critiques will be engaged with seriously
- If an issue reveals a flaw, I'll document the error and update the reasoning

### For Pull Requests

**Content PRs**:
1. I'll review for logical soundness and fit with project scope
2. May request clarification or additional reasoning
3. If merged, your contribution becomes part of the project history
4. All contributors are credited in commit history

**Code PRs**:
1. Must maintain or improve code quality
2. Should include examples or tests
3. Must not break existing functionality
4. Will be tested before merging

## What We're NOT Looking For

- **Partisan advocacy** - This isn't about left vs. right
- **Unfounded assertions** - Claims need reasoning and evidence
- **Personal attacks** - Critique ideas, not people
- **Off-topic content** - Stay focused on governance and institutions
- **Bad faith engagement** - Trolling, sea-lioning, or deliberate derailing

## Style Guide

### Markdown

- Use ATX-style headers (`#` not `===`)
- One sentence per line in source (makes diffs cleaner)
- Reference files with relative paths
- Use fenced code blocks with language specified

### Citations

Use the citation helper tool or follow this format:

```markdown
Author. "Title." *Publication* (Year). [URL if available]
```

### Glossary Terms

When using a defined term, link it on first use:

```markdown
The [accountability architecture](../glossary/terms/accountability-architecture.md) requires...
```

Or use the auto-linker tool to add these automatically.

## Questions?

Not sure if your idea fits? Open an issue asking.

Want to propose a major change? Open an issue for discussion before writing a large PR.

Need help with the tools? Check the `tools/` README or ask in an issue.

## Recognition

All contributors are credited through Git commit history.

Significant intellectual contributions (major extensions, important critiques that lead to revisions) will be acknowledged in the relevant concept's README.

## License

By contributing, you agree that your contributions will be licensed under the same CC BY 4.0 license as the rest of the project.

---

**Remember**: The goal is better ideas, not winning arguments. If your contribution makes the reasoning stronger—whether by extending it or by revealing flaws—it's valuable.
