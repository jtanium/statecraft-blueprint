# Process Documentation

How ideas move from initial thoughts to published concepts.

## Overview

The Statecraft Blueprint follows a structured process for developing ideas:

1. **Initial Exploration** - Conversations and brainstorming
2. **Concept Formation** - First drafts and outlines
3. **Research Phase** - Gathering supporting materials
4. **Iterative Refinement** - Multiple draft versions
5. **Validation** - Automated checks and review
6. **Publication** - Moving to `published/` directory
7. **Evolution** - Continued updates based on feedback

This document describes each phase.

## Phase 1: Initial Exploration

### What Happens

- Conversations with AI assistants to explore ideas
- Free-form brainstorming
- Questioning assumptions
- Identifying interesting angles

### Artifacts Created

- Conversation logs (JSON exports from Claude, ChatGPT, etc.)
- Quick notes and sketches
- Initial questions list

### Location

`concepts/[concept-name]/conversations/`

### Example

```
concepts/governance-architecture/conversations/
├── 001-what-is-governance.md
├── 002-why-institutions-fail.md
└── 003-accountability-mechanisms.md
```

### Tools Used

- AI assistants for thinking through ideas
- `conversation_converter` to format conversations as markdown

## Phase 2: Concept Formation

### What Happens

- Create a concept directory
- Write an outline of the main idea
- Draft README explaining the concept
- Set status to "draft"

### Artifacts Created

- `outline.md` - Structured overview of the idea
- `README.md` - Explanation of what this concept is about
- First draft in `drafts/v1.md`

### Location

`concepts/[concept-name]/`

### Example Structure

```
concepts/governance-architecture/
├── README.md
├── outline.md
├── conversations/
├── drafts/
│   └── v1.md
└── research/
```

### Outline Format

```markdown
# [Concept Name]

## Core Question
What fundamental question does this address?

## Key Claims
1. Main thesis
2. Supporting claims
3. Implications

## Structure
- Section 1
- Section 2
- Section 3

## Status
Draft - initial formation
```

## Phase 3: Research Phase

### What Happens

- Gather relevant papers, books, examples
- Document sources with annotations
- Identify supporting evidence
- Note contradicting evidence

### Artifacts Created

- Research notes in `research/` directory
- Annotated bibliography
- Examples and case studies

### Location

`concepts/[concept-name]/research/`

### Research Note Format

```markdown
# [Source Title]

**Citation**: Full citation
**Relevance**: How this relates to the concept
**Key Points**:
- Point 1
- Point 2

**Quotes**: [with page numbers]

**Critiques**: What's weak about this source?
```

## Phase 4: Iterative Refinement

### What Happens

- Write multiple draft versions
- Refine arguments
- Address counterarguments
- Improve clarity and structure
- Link glossary terms
- Format citations

### Artifacts Created

- `drafts/v2.md`, `v3.md`, etc.
- Git commits documenting changes
- Possibly more conversations working through issues

### Tools Used

- `citation_formatter` to standardize citations
- `glossary_linker` to add glossary links
- Git for version control

### Versioning Convention

- `v1.md` - First complete draft
- `v2.md` - Major structural changes
- `v2.1.md` - Minor revisions to v2
- Continue until ready for publication

## Phase 5: Validation

### What Happens

- Run validation checks
- Fix broken links
- Resolve TODO markers
- Ensure citations are complete
- Check glossary linking
- Add required frontmatter

### Tools Used

- `validate_post.rb` to check readiness

### Frontmatter Required

```yaml
---
title: "Concept Title"
date: YYYY-MM-DD
status: ready
tags: [tag1, tag2]
conversations:
  - 001-what-is-governance
  - 002-why-institutions-fail
---
```

### Validation Command

```bash
ruby tools/publishing_pipeline/validate_post.rb concepts/[concept]/drafts/v3.md
```

Must pass all checks before moving to publication.

## Phase 6: Publication

### What Happens

- Final draft moves to `published/` directory
- Frontmatter status updated to "published"
- Announcement/summary written
- Cross-references updated

### Location

`published/[concept-name].md`

### What Stays in concepts/

The entire development history remains:

```
concepts/governance-architecture/
├── README.md
├── outline.md
├── conversations/
├── drafts/
│   ├── v1.md
│   ├── v2.md
│   └── v3.md (the published version)
└── research/
```

The published version is **copied** to `published/`, not moved.

## Phase 7: Evolution

### What Happens

- Respond to feedback and critiques
- Update when new information emerges
- Create new versions if substantial changes needed
- Document all changes in git commits

### When to Update

- Factual errors discovered
- Logical flaws identified
- New research changes conclusions
- Better examples found
- Clarity improvements

### Update Process

1. Create new draft version in `concepts/[name]/drafts/`
2. Document what changed and why
3. Re-run validation
4. Update published version
5. Note changes in commit message

### Major vs. Minor Updates

**Minor updates** (typos, clarity, formatting):
- Update published file directly
- Document in commit message

**Major updates** (argument changes, new conclusions):
- Create new draft version
- Full refinement process
- Publish as new version
- Link from old version with explanation

## Process Tools

### Conversation to Draft

```bash
# 1. Convert conversations to markdown
ruby tools/conversation_converter/claude_to_markdown.rb export.json concepts/topic/conversations/001.md

# 2. Start outline based on conversations
# (manual step)

# 3. Write first draft
# (manual step)
```

### Draft to Publication

```bash
# 1. Format citations
ruby tools/citation_helper/citation_formatter.rb draft.md temp1.md

# 2. Link glossary terms
ruby tools/glossary_linker/auto_link_terms.rb temp1.md temp2.md

# 3. Validate
ruby tools/publishing_pipeline/validate_post.rb temp2.md

# 4. If validation passes
cp temp2.md published/concept-name.md
```

## Quality Standards

### Before Publication

A concept should:

- Have clear thesis and structure
- Include supporting evidence
- Address obvious counterarguments
- Link to glossary terms
- Cite all sources
- Pass all validation checks
- Be reviewed by at least one other person (optional but recommended)

### Ongoing

Published work should:

- Respond to substantive critiques
- Update when errors are found
- Evolve as understanding improves
- Maintain backward compatibility (old versions stay accessible)

## Collaboration

### External Contributions

See [CONTRIBUTING.md](../CONTRIBUTING.md) for how others can:

- Challenge ideas via issues
- Propose improvements via PRs
- Fork and extend concepts
- Add research materials

### Internal Process

For primary authors:

1. Create branch for major new concepts
2. Develop through phases 1-5 in branch
3. Merge when ready for publication
4. Keep main branch clean (only published work)

## Git Workflow

### Commit Messages

Format: `[concept-name] Action: Description`

Examples:
- `[governance] Add: Initial outline`
- `[governance] Draft: First complete version`
- `[governance] Refine: Restructured argument flow`
- `[governance] Publish: Move to published directory`
- `[governance] Fix: Corrected citation format`

### Branch Strategy

- `main` - Published work only
- `concepts/[name]` - Development branch for specific concept
- `tools/[feature]` - Development branch for tool improvements

## Metrics and Progress

Track:

- Concepts in development vs. published
- Number of drafts per concept (shows iteration)
- Conversations per concept (shows exploration depth)
- Research sources per concept
- Time from initial idea to publication
- Updates after publication (shows evolution)

These metrics aren't for comparison—they're for understanding your own process.

---

*This process will evolve as we learn what works. This is version 1.0.*
