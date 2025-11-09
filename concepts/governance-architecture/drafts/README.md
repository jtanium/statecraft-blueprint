# Governance Architecture Drafts

This directory contains iterative drafts of essays and outlines that comprise the Governance Architecture concept.

## Organization

As of November 2025, drafts are organized by **pillar and part** structure. Each pillar represents a major conceptual area, with parts being individual essays or pieces within that pillar.

### Naming Convention

```
P#.#-series_name/
├── #-piece_name-type.md
├── #-piece_name-conversation.md
└── series-context.md
```

- **P#.#** = Pillar number, Part number (e.g., P3.1)
- **series_name** = Name of the conceptual series
- **#** = Piece number within the series
- **piece_name** = Descriptive name of the piece
- **type** = outline, draft, final, essay, etc.
- **conversation** = Development conversations for that piece

Files are grouped together by pillar/part, with conversations living alongside the outlines and drafts they helped create.

## Current Pillar Structure

### Pillar 2: Engineering for Complexity

#### P2.1 - Nuance Series
**Purpose**: Establish why modern governance demands sophisticated, nuanced thinking rather than simplification.

**Location**: `P2.1-nuance_series/`

**Contents**:
- Part 1: The Unavoidable Need for Nuance (outline + draft)
- Part 2: Semantic Ambiguity (draft)

#### P2.2 - Governance Design
**Purpose**: Propose the Federal Governance Agency as an architectural solution to system design failures.

**Location**: `P2.2-governance_design/`

**Contents**:
- Governance Architecture Outline (comprehensive outline with tiered framework)
- Engineering for Complexity (draft)
- Refactoring Government essay (polished proposal)
- Development conversations (essay refinement, funding lapse edge case)

### Pillar 3: Systematic Failures and Solutions

#### P3.1 - Immune System Series (4 Parts)
**Purpose**: Analyze why political systems fail to process complexity. Shows the cascade of failures, explains why fixes don't work, elevates stakes, and provides action framework.

**Location**: `P3.1-immune_system_series/`

**Contents**:
- **Series Context**: `immune-system-context.md` - Framework, tone, methodology for the series
- **Part 1: Five-Stage Cascade** - How nonsense becomes policy in real-time (outline + draft + conversation)
- **Part 2: Why Every Fix Fails** - Why traditional solutions fail mechanically (outline + draft + conversation)
- **Part 3: 21st Century Problems** - Universal stakes and action framework (outline + final + conversation)
- **Part 4: Case Studies** - Supplemental material applying cascade to multiple domains (not yet created)

#### P3.2 - [Content Area TBD]
**Location**: `P3.2/`

**Contents**:
- Revision summary (content and purpose still being developed)

## Why This Structure?

The previous chronological naming (`YYYY-MM-DD-topic.md`) made it hard to:
- Find related pieces quickly
- Understand which pieces belong to which series
- See the relationship between conversations and their resulting drafts
- Identify what's been completed vs. what's still in progress

The new pillar/part structure:
- **Groups related work** - All pieces in a series live together
- **Shows relationships** - Conversations sit next to the outlines/drafts they developed
- **Identifies hierarchy** - Clear pillar → part → piece structure
- **Removes version clutter** - Git handles versioning, so no more `-v1`, `-v2` suffixes
- **Enables navigation** - Easy to find "Part 2 of the Immune System Series"

## Reading Order

### For Understanding the Argument:
1. **P2.1** - Establishes the *problem* (why nuance is required)
2. **P3.1** - Demonstrates the *cascade* and why fixes fail
3. **P2.2** - Proposes the *architectural solution* (Federal Governance Agency)

### For Following the Evolution:
Check git history - commits track how thinking evolved over time.

## From Draft to Published

Once a piece is ready for publication:
1. It goes through the validation pipeline (`tools/publishing_pipeline/validate_post.rb`)
2. Final version is copied to `published/`
3. All draft history remains here for reference

The drafts directory is the **workshop**. The published directory is the **gallery**.

## File Status

All files in this directory should be considered:
- **Status**: Draft / Work in Progress
- **Completeness**: Varies (outlines, drafts, finals at different stages)
- **Accuracy**: Ideas may have evolved beyond what's written here

Check git commits and the published directory for the current state of thinking.

---

*This is where ideas are messy, incomplete, and evolving. That's the point.*
