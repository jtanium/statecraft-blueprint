# Tooling Philosophy

Why we build automation for writing workflows, and what that reveals about the process.

## The Core Insight

**If you can't automate it, you don't understand it well enough.**

Building tools for your own workflow forces you to:
- Make implicit decisions explicit
- Formalize fuzzy processes
- Identify what actually matters
- Distinguish essential from incidental

This project treats tooling not as a convenience, but as a **methodology reveal**.

## Why Build Custom Tools?

### 1. Formalization Forces Clarity

When you write a script to validate citations, you must decide:
- What makes a citation valid?
- Which formats are acceptable?
- How should errors be reported?
- What edge cases exist?

These aren't just technical questions—they're methodological ones. Automation forces you to answer them explicitly.

### 2. Consistency Enables Scale

Manual processes drift over time:
- Citation format varies
- Link styles change
- Validation becomes inconsistent
- Quality depends on how tired you are

Automated tools maintain consistency. The 50th processed document is handled the same as the first.

### 3. Tools Communicate Process

A tool's interface reveals the process:

```bash
ruby citation_formatter.rb input.md output.md
```

This says: "Citations are format-level operations on complete documents."

```bash
ruby validate_post.rb --conversations draft.md
```

This says: "Conversation references are optional but checkable."

The command-line interface **is** documentation of methodology.

### 4. Automation Lowers Barriers

Tedious tasks don't get done:
- "I should check all these links" (but won't)
- "I should link glossary terms" (but forget)
- "I should format citations consistently" (but it's boring)

Automation makes the right thing the easy thing:

```bash
ruby auto_link_terms.rb draft.md output.md
```

Now linking glossary terms is one command.

## What Makes Good Workflow Tools?

### Command-Line First

**Principle**: Tools should be composable via Unix philosophy.

```bash
# Can chain tools together
cat draft.md | format_citations | link_terms | validate > final.md

# Can use in scripts
for file in drafts/*.md; do
  validate_post.rb "$file" && publish "$file"
done

# Can integrate with git hooks
# pre-commit: validate all markdown files
```

GUI tools trap you in their workflow. CLI tools compose.

### Single Responsibility

**Principle**: Each tool does one thing well.

- `citation_formatter.rb` only formats citations
- `auto_link_terms.rb` only links glossary terms
- `validate_post.rb` only validates, doesn't fix

This enables:
- **Composition**: Chain tools together
- **Understanding**: Each tool is comprehensible
- **Maintenance**: Changes are localized
- **Replacement**: Swap out one tool without affecting others

### Transparent Operation

**Principle**: You should see what the tool did.

Tools preserve input and create new output:

```bash
ruby tool.rb input.md output.md
diff input.md output.md  # See exactly what changed
```

This is better than in-place editing because:
- You can review changes before committing
- You can understand what the tool does
- You can catch bugs in the tool
- You learn from seeing transformations

### Fail Loudly

**Principle**: Errors should be obvious and specific.

Bad:
```
Error: Validation failed
```

Good:
```
✗ Validation failed with 2 error(s)

Errors:
  - Line 42: Broken internal link: ../glossary/missing.md
  - Line 89: TODO marker found: "TODO: Add example"
```

Specific errors teach you what needs fixing **and** what the tool cares about.

### Human-Readable Code

**Principle**: The tool's source code is documentation.

Tools in this project prioritize:
- Clear variable names
- Explanatory comments
- Obvious structure
- Ruby idioms (readable syntax)

Why? Because:
- You might need to modify the tool
- Others might want to understand your process
- The code **is** the formalized methodology

## Tool Development as Thinking Aid

### Start Manual, Automate When Patterns Emerge

Don't write tools prematurely. The process:

1. **Do it manually first** - Format citations by hand
2. **Notice patterns** - "I always check author/title/year"
3. **Document the pattern** - Write down validation rules
4. **Automate the pattern** - Write a script
5. **Refine through use** - Fix edge cases as you hit them

Automation **follows** understanding, not vice versa.

### Tools Reveal What You Actually Do

You might think your process is:
- Read source
- Take notes
- Write draft

But building tools reveals:
- Export conversation
- Convert to markdown
- Extract key points
- Create outline
- Write draft from outline
- Link glossary terms
- Format citations
- Validate links
- Review and revise

Tools make the **actual** process visible.

### Iterate on Tools Like You Iterate on Ideas

Tools v1.0 are rough. That's fine.

The `tools/` directory here contains **skeleton implementations** with TODOs. Why ship that?

Because:
- It documents intent (what the tool should do)
- It defines interfaces (how to use it)
- It invites contribution (here's where logic goes)
- It's honest about current state

Tools evolve. Version them like concepts.

## What We Don't Automate

### Creative Thinking

Tools can:
- Format output
- Check consistency
- Validate structure

Tools can't:
- Develop arguments
- Identify flaws in reasoning
- Make conceptual leaps

The **thinking** stays human. Tools handle the tedious parts so you can focus on thinking.

### Judgment Calls

Some decisions resist automation:
- Is this counterargument worth addressing?
- Is this example clear enough?
- Should this be split into two concepts?

Tools can flag potential issues ("No counterarguments found"), but can't make the judgment call.

### Genuine Exploration

Initial brainstorming and exploration shouldn't be constrained by tools. That's why the process starts with freeform conversations, not structured templates.

Tools come in **after** exploration, to formalize what was discovered.

## Examples from This Project

### Citation Formatter

**Problem**: Citation formats drift, making them hard to track and validate.

**Formalization**: Define standard format (Author. "Title." Publication (Year).)

**Tool**: Detects various formats, converts to standard

**Methodology reveal**: Citation format is semantic (author/title/publication/year), not just style

### Glossary Linker

**Problem**: Manually linking terms is tedious and inconsistent

**Formalization**: First occurrence of glossary term should be linked

**Tool**: Scans glossary, finds instances, adds links

**Methodology reveal**: Glossary isn't just reference—it's active structure in documents

### Conversation Converter

**Problem**: AI conversation exports are hard to read and archive

**Formalization**: Conversations are timestamped message sequences with metadata

**Tool**: Converts JSON exports to structured markdown

**Methodology reveal**: Conversations are primary sources, not just working notes

### Post Validator

**Problem**: Publishing checklist was mental, inconsistent, easy to forget

**Formalization**: Codified checklist (links work, citations formatted, no TODOs)

**Tool**: Automated validation with specific error messages

**Methodology reveal**: "Ready to publish" has objective criteria

## The Meta-Level Point

**Building tools is itself a form of thinking through the problem.**

When you write `validate_post.rb`, you're answering:
- What makes a post valid?
- What are the quality standards?
- What can be objectively checked vs. subjectively judged?

The tool is the **answer to those questions**, in executable form.

This is why the tools/ directory is part of the intellectual project, not just infrastructure.

## Principles Summary

1. **If you can't automate it, you don't understand it**
2. **Tools should be composable** (Unix philosophy)
3. **Each tool does one thing** (single responsibility)
4. **Operations should be transparent** (visible transformations)
5. **Errors should teach** (specific, actionable feedback)
6. **Code is documentation** (readable source)
7. **Automate patterns, not exploration** (formalize after understanding)
8. **Iterate on tools** (version them like ideas)
9. **Keep judgment human** (tools check, humans decide)
10. **Tooling is methodology** (building tools formalizes process)

## For Users of These Tools

You can use the tools without subscribing to the philosophy. They're practical utilities.

But if you **do** subscribe to the philosophy, you might:
- Modify tools to match your process
- Build new tools for your workflow gaps
- Share your tools to document your methodology
- Iterate on tools as your process evolves

The tools aren't just helpers—they're artifacts of the thinking process.

## For Other Projects

This approach can apply beyond political philosophy:

- **Academic research**: Tools for citation management, research notes, paper drafts
- **Technical writing**: Tools for API documentation, code examples, consistency
- **Creative writing**: Tools for character tracking, plot structure, revision
- **Any domain**: Where process can be formalized, tools can help

The question isn't "Should I build tools?" but "What does my reluctance to build tools reveal about what I don't understand about my process?"

---

*This philosophy emerged from actually building the tools. It's post-hoc rationalization of discovered patterns, not pre-planned architecture.*

*That's the point.*
