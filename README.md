# The Statecraft Blueprint

> Rethinking government from first principles, with complete intellectual transparency.

## What Is This?

The Statecraft Blueprint is a political philosophy and governance reform project that treats ideas like open-source code. Every conversation, every draft, every iteration, and every tool used to develop these ideas is publicly documented.

This isn't a manifesto. It's a **thinking process made visible**.

## Philosophy: Show Your Work

Most political philosophy presents finished ideas as if they emerged fully formed. This project does the opposite:

- **Every conversation** with AI assistants that shaped these ideas is preserved
- **Every draft** showing how concepts evolved is included
- **Every tool** used to organize, format, and publish is available
- **Every decision** about process and methodology is documented

Why? Because:

1. **Ideas evolve like code** - They get refactored, debugged, and improved through iteration
2. **Transparency builds trust** - Seeing the reasoning process reveals strengths and weaknesses
3. **Work should be reproducible** - Others can follow the same process or fork in new directions
4. **Collaboration requires visibility** - You can't build on hidden foundations

If you disagree with a conclusion, you can trace it back to the conversation where it originated. If you find a flaw, you can see exactly where the reasoning went wrong. If you want to extend an idea, you have all the context you need.

## Repository Structure

```
statecraft-blueprint/
├── concepts/          # Core ideas in development
│   └── governance-architecture/
│       ├── conversations/  # AI dialogues that shaped the concept
│       ├── drafts/         # Iterative versions
│       └── research/       # Supporting materials
├── published/         # Finalized essays and posts
├── glossary/          # Defined terms with cross-references
├── tools/             # Automation for writing workflows
│   ├── citation_helper/
│   ├── glossary_linker/
│   ├── conversation_converter/
│   └── publishing_pipeline/
├── frameworks/        # Reusable analytical structures
├── research/          # Source materials and references
└── meta/              # Documentation about the project itself
    ├── principles.md
    ├── process.md
    ├── tooling-philosophy.md
    └── roadmap.md
```

## How This Works

### 1. Concepts in Development

Each major idea lives in `concepts/` with:
- An outline of the current thinking
- Conversations that shaped it (exported from Claude, ChatGPT, etc.)
- Multiple drafts showing evolution
- Research notes and references

**Example**: `concepts/governance-architecture/` contains the working materials for an essay on institutional design.

### 2. Automation as Thinking Aid

The `tools/` directory contains Ruby scripts that automate tedious parts of writing:
- **citation_formatter.rb** - Standardizes citation formats
- **auto_link_terms.rb** - Automatically links glossary terms in markdown
- **claude_to_markdown.rb** - Converts AI conversation exports to readable markdown
- **validate_post.rb** - Checks that drafts are ready for publication

These aren't just utilities. They're part of the methodology. Building tools for your writing workflow forces you to make your process explicit.

### 3. From Draft to Published

When an idea is ready:
1. Final draft goes through the publishing pipeline
2. Cross-references are validated
3. Conversation history is linked
4. The piece moves to `published/`

The entire history remains visible. No idea springs forth fully formed.

## Current Focus

This repository is in its early stages. The first major concept in development is **Governance Architecture** - a framework for thinking about how to design government institutions that actually serve their stated purposes.

## Who This Is For

- **Readers** who want to understand not just the conclusions, but the reasoning process
- **Collaborators** who want to extend, challenge, or remix these ideas
- **Skeptics** who want to trace claims back to their origins
- **Writers** who might benefit from the tooling approach
- **Anyone** interested in transparent intellectual work

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to propose changes, challenge assumptions, or contribute to the tooling.

## License

All content is released under [Creative Commons Attribution 4.0 International (CC BY 4.0)](LICENSE.md).

You're free to:
- **Share** - Copy and redistribute the material
- **Adapt** - Remix, transform, and build upon the material
- **Use commercially** - For any purpose

Under these terms:
- **Attribution** - You must give appropriate credit and link to the license
- **No additional restrictions** - You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits

## Technical Details

- **Language**: Ruby (for tooling)
- **Format**: Markdown (for all content)
- **Version Control**: Git (every commit is part of the intellectual history)

## Contact

Questions? Disagreements? Found a logical flaw?

Open an issue. Let's discuss.

---

*This README itself will evolve. Check the commit history to see how the project description has changed.*
