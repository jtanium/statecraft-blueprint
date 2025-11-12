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

## Statecraft Writing Style Guide

When drafting or editing content for The Statecraft Blueprint (especially governance architecture essays), follow these principles. Full guide: `concepts/governance-architecture/WRITING_STYLE_GUIDE.md`

### Core Mission: Second-Order Work

We're creating conditions where policy debates can lead somewhere—not pre-deciding solutions.

**What we ARE doing:**
- Point out undeniable problems everyone can see (shutdowns, gridlock, policy whiplash)
- Spread awareness that solutions exist
- Show the system itself can be changed
- Build a "big tent" for structural reform

**What we're NOT doing:**
- Advocating for specific policies (yet)
- Debating which reforms are best
- Getting bogged down in implementation details

### The Core Tension: Abstract vs. Concrete

**Problem:**
- Too abstract: "We need constitutional reform" → People glaze over
- Too concrete: "Here's ranked choice voting" → People fixate on debating that specific thing

**Solutions:**
1. **Lead with the problem, not the solution** - Open with systemic failure that's undeniable
2. **Use multiple diverse examples** - Show 3-4 different examples to signal "these are illustrations"
3. **Explicit framing** - Use phrases like "ONE example to make this concrete—not a proposal we're advocating for..."
4. **"Choose Your Own Adventure" framing** - Present structural change as enabling choice, not imposing solutions
5. **Redirect debate energy** - When readers want to debate specifics, redirect to the meta-level

### Voice & Tone Standards

- **Stoic brand**: Calm, measured, never alarmist
- **Analytically rigorous**: Show your work, cite sources
- **Intellectually honest**: Acknowledge complexity and trade-offs
- **Non-partisan by design**: Frame as system problems, not people problems
- **Accessibility without condescension**: For all readers without treating anyone as less intelligent
- **Systems thinker**: Engineering mindset, first-principles analysis, root cause focus
- **Bipartisan empathy**: Show how system failures hurt everyone

### Content Standards

**Always:**
- ✅ Identify system failures (not just symptoms)
- ✅ Trace root causes
- ✅ Propose structural solutions
- ✅ Show the work (evidence, citations, logic)
- ✅ Acknowledge trade-offs and complexity
- ✅ Frame as design problems, not people problems

**Never:**
- ❌ Pretend solutions are simple
- ❌ Blame individuals for structural problems
- ❌ Use tribal/partisan language
- ❌ Oversimplify for emotional impact
- ❌ Hide uncertainty or limitations
- ❌ Make promises about easy fixes

### Quality Checklist

Before finalizing content:
- [ ] Does this lead with an undeniable problem?
- [ ] Are examples clearly labeled as illustrative?
- [ ] Could someone from either political side find value here?
- [ ] Is the tone stoic and analytical, not emotional?
- [ ] Are we showing the work (evidence, logic, citations)?
- [ ] Have we avoided getting stuck in specific policy debates?
- [ ] Does it end with hope and agency?

**See `concepts/governance-architecture/WRITING_STYLE_GUIDE.md` for complete guidance.**

---

## Tiered Content Strategy

The Statecraft Blueprint uses a 5-tier content multiplication strategy. Full details: `meta/content-strategy.md`

**The Tiers:**
- **T1: The Foundation** (2,500-4,000 words) - Pillar essays on Substack
- **T2: Traditional Op-Ed** (750-1,000 words) - Media placements (WaPo, The Hill, Bloomberg)
- **T3: Digital Core** (150-300 words) - Quotable social media posts (LinkedIn, Twitter/X)
- **T4: Micro-Hook** (Single sentence) - Headlines, tweets, memes
- **T5: Visual** (Infographics, diagrams) - System visualizations, data viz, quote cards

**Content Multiplication**: Each T1 pillar generates 7-15 pieces of derived content (T2-T5)

**When drafting:**
- **T1 pieces**: Follow full pillar essay structure (see content-strategy.md)
- **T2 op-eds**: Use classic op-ed formula: Lede → Problem → Why It Matters → Solution → Closer
- **T3 posts**: Create quotable paragraphs using Hook → Mechanism → Consequence → Punch line
- **T4 hooks**: Generate 5-10 one-sentence zingers per topic (provocative reframes, systems insights, calls to action)

**Current Priority**: Generating T2 op-eds from existing T1 pillars for Phase II outreach.

---

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

## AI-Generated Code Headers

**IMPORTANT**: All code files generated by AI must include a warning header indicating the code has not been reviewed or tested.

### When to Include Headers

**Always include headers when**:
- Creating new code files (Ruby, Python, JavaScript, etc.)
- The file is executable code (not documentation or data)

**Do not include headers for**:
- Markdown documentation files
- JSON/YAML configuration files
- Plain text files
- Files that are primarily data

### Header Template by Language

**Ruby:**
```ruby
# ============================================================================
# AI-GENERATED CODE - NOT REVIEWED OR TESTED
# ============================================================================
# Generated: [ISO 8601 timestamp with timezone]
# Generator: Claude Sonnet 4.5
# Project: 2028 Thought Leadership Engine
#
# WARNING: This code has not been reviewed or tested by humans.
#          Do NOT use in production without thorough review.
# Status: UNREVIEWED
# ============================================================================
```

**Python:**
```python
# ============================================================================
# AI-GENERATED CODE - NOT REVIEWED OR TESTED
# ============================================================================
# Generated: [ISO 8601 timestamp]
# Generator: Claude Sonnet 4.5
# Project: 2028 Thought Leadership Engine
#
# WARNING: This code has not been reviewed or tested by humans.
#          Do NOT use in production without thorough review.
# Status: UNREVIEWED
# ============================================================================
```

**JavaScript/TypeScript:**
```javascript
/**
 * ============================================================================
 * AI-GENERATED CODE - NOT REVIEWED OR TESTED
 * ============================================================================
 * Generated: [ISO 8601 timestamp]
 * Generator: Claude Sonnet 4.5
 * Project: 2028 Thought Leadership Engine
 *
 * WARNING: This code has not been reviewed or tested by humans.
 *          Do NOT use in production without thorough review.
 * Status: UNREVIEWED
 * ============================================================================
 */
```

See `Code Generation Instructions from Claude.md` for complete templates and language-specific formats.

### Inline Markers for Partial Modifications

When modifying existing code files (not creating new ones), use inline markers:

```ruby
# === BEGIN AI-GENERATED CODE (2025-11-08T07:30:00-07:00) - UNREVIEWED ===
def new_method_added_by_ai
  # AI-generated implementation
end
# === END AI-GENERATED CODE ===
```

### Status Progression

Update status as code is reviewed:
- `UNREVIEWED` - Initial generation
- `IN REVIEW` - Being evaluated
- `TESTED` - Passed initial tests
- `REVIEWED` - Approved by human reviewer
- `PRODUCTION READY` - Safe for deployment

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
