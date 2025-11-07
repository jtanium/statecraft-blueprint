# Instructions for AI Assistants

This file contains instructions for AI assistants (Claude, ChatGPT, or others) working on The Statecraft Blueprint project.

## Core Philosophy

This project is built on **complete transparency**. Everything is documented:
- Every conversation that shapes ideas
- Every draft and iteration
- Every tool used
- Every decision and its reasoning
- **Every significant AI work session**

Your role as an AI assistant is to help develop ideas while maintaining this transparency.

## Project Structure

```
statecraft-blueprint/
├── concepts/           # Ideas in development
├── published/          # Finalized work
├── glossary/          # Term definitions
├── tools/             # Automation scripts
├── frameworks/        # Reusable analytical structures
├── research/          # Source materials
└── meta/              # Project documentation
    ├── principles.md
    ├── process.md
    ├── tooling-philosophy.md
    ├── roadmap.md
    ├── origin-story.md
    └── work-sessions/  # AI work session summaries
```

## Key Documentation

Before working on the project, read:

1. **README.md** - Project overview and philosophy
2. **meta/principles.md** - 10 core principles
3. **meta/process.md** - Development workflow
4. **CONTRIBUTING.md** - How to contribute
5. **meta/origin-story.md** - How this project was born

## When Doing Significant Work

After completing any substantial work session, create a summary in `meta/work-sessions/`:

### What Qualifies as "Significant Work"?

- Organizing/reorganizing multiple files
- Creating new directory structures
- Implementing tools or features
- Major documentation efforts
- Any work involving 5+ files
- Any work taking 30+ minutes

### Work Session Summary Template

Create: `meta/work-sessions/YYYY-MM-DD-descriptive-title.md`

Include:

```markdown
# [Title of Work Session]

**Date**: [Date]
**Duration**: [Approximate time]
**AI Assistant**: [Claude Sonnet 4.5, etc.]

## Summary

[2-3 sentence overview of what was accomplished]

## What Was Done

[Detailed breakdown of work completed]

## Organization/Structure Decisions

[Explain any organizational choices and reasoning]

## Statistics

- Files created: X
- Files modified: X
- Directories created: X
- Lines of code/documentation: X

## Challenges/Issues

[Any problems encountered and how they were resolved]

## Next Steps

[What should happen next or what remains to be done]

---

*Session completed [time] on [date]*
```

### Examples

See existing summaries in `meta/work-sessions/` for reference.

## File Naming Conventions

- **Conversations**: `YYYY-MM-DD-topic-description.md`
- **Drafts**: `YYYY-MM-DD-topic-version.md`
- **Research**: `descriptive-name.md` (with date if time-sensitive)
- **Work sessions**: `YYYY-MM-DD-descriptive-title.md`

## When Working on Concepts

Each concept in `concepts/[name]/` has:

- `README.md` - Overview and status
- `outline.md` - Structured outline
- `conversations/` - AI dialogues
- `drafts/` - Iterative versions
- `research/` - Supporting materials

### Adding Conversations

When conversations shape a concept:

1. Export the conversation (JSON, markdown, or text)
2. Save to `concepts/[name]/conversations/YYYY-MM-DD-topic.md`
3. Update `conversations/README.md` if needed

### Adding Drafts

When creating new draft versions:

1. Save to `concepts/[name]/drafts/YYYY-MM-DD-topic-vN.md`
2. Increment version number (v1, v2, v3...)
3. Update `drafts/README.md` to track evolution

### Adding Research

When adding sources or materials:

1. Save to `concepts/[name]/research/descriptive-name.md`
2. Include citation information
3. Add brief annotation explaining relevance

## Available Skills

Skills are specialized workflows that automate common tasks. Invoke them with natural language.

### add-file

**Purpose**: Organize new files added to the repository

**Trigger phrases**:
- "add [filename]"
- "organize [filename]"
- "I just added [filename]"
- "process new file"

**What it does**:
1. Finds the file in the repository
2. Reads and understands the content
3. Suggests proper naming following conventions
4. Renames the file
5. Updates relevant README documentation
6. Reports what was done

**When to use**:
- User adds a new draft, conversation, or research file
- File doesn't follow naming convention
- Documentation needs updating to reflect new file

**Example**:
```
User: "I just added a new essay draft called 'Government Design.md'"
Skill: [Finds file, reads it, suggests name, renames, updates README]
```

See `.claude/skills/add-file.md` for complete documentation.

## Tool Development

Tools in `tools/` are Ruby scripts for writing workflow automation:

- Keep them simple and focused
- Use clear variable names and comments
- Mark incomplete logic with `# TODO:` comments
- Update tool README with changes
- Include usage examples

## Glossary Terms

When adding terms to `glossary/terms/`:

1. Follow the template in `glossary/README.md`
2. Use filename: `term-name.md` (lowercase, hyphens)
3. Include definition, examples, related terms
4. Link to concepts that use the term

## Git Commit Messages

Format: `[area] Action: Description`

Examples:
- `[governance] Add: Initial outline`
- `[meta] Document: Work session summary`
- `[tools] Implement: Citation formatter logic`
- `[glossary] Define: Accountability architecture`

## Transparency Principles

As an AI assistant on this project:

1. **Be honest about limitations** - If you don't know, say so
2. **Show reasoning** - Explain why you're organizing things a certain way
3. **Document decisions** - Capture the "why" not just the "what"
4. **Preserve history** - Don't delete old versions, add new ones
5. **Note uncertainties** - Mark TODO items for human review
6. **Create summaries** - Document your work for future reference

## What to Avoid

- Don't delete or overwrite historical files
- Don't create files without clear purpose
- Don't use markdown files for file operations (use shell tools)
- Don't make assumptions without documenting them
- Don't skip work session summaries for significant work

## Questions?

If uncertain about:
- Where something should go
- How to organize something
- Whether to create a work session summary
- Any other decision

**Default to transparency**: Document the uncertainty and ask the user.

## For the User

This file itself can be updated as the project evolves. If you find these instructions need refinement, update them and document what changed in the git commit.

---

## Current Status

**Repository initialized**: November 6, 2025
**Primary AI assistant**: Claude Sonnet 4.5
**User**: jtanium

See `meta/origin-story.md` for how this project was born.

---

*These instructions will evolve. Check git history for changes.*
