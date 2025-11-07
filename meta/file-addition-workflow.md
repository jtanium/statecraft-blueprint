# File Addition Workflow

Documentation of the process for adding new files to the repository, and ideas for potential automation.

## Current Manual Process

When a new draft, conversation, or research file is added:

### 1. Locate the File

```bash
find concepts/[concept-name]/ -name "*[search-term]*"
```

### 2. Determine Proper Naming

**Format**: `YYYY-MM-DD-descriptive-name.md`

- **Date**: Use file modification date or creation date
- **Description**: Short, descriptive, lowercase with hyphens
- **Version**: Include version number if applicable (v1, v2, etc.)

**Check file date**:
```bash
ls -l [filename]
```

### 3. Read File Contents

Quick scan to understand:
- What is this file about?
- What's the main topic or title?
- Is it a draft, outline, conversation, or research?
- What phase of development does it represent?

### 4. Rename File

```bash
mv "[old-name].md" "YYYY-MM-DD-descriptive-name.md"
```

### 5. Update Relevant README

Depending on file type:

**Drafts** → `concepts/[name]/drafts/README.md`
- Add to chronological phase list
- Include brief description
- Note if it's a new phase or continues existing one

**Conversations** → `concepts/[name]/conversations/README.md`
- Add to conversation list
- Note date and topic
- Link to any resulting drafts

**Research** → `concepts/[name]/research/README.md`
- Add to materials list
- Include relevance note

### 6. Consider Updates to Concept README

If the file represents significant progress:
- Update `concepts/[name]/README.md` status
- Add to "What's New" or recent changes
- Update phase indicators

## Potential Automation Ideas

### Option 1: Interactive Script

Create `tools/file_organizer/add_file.rb`:

```ruby
# Interactive script that:
1. Asks: What type of file? (draft/conversation/research)
2. Asks: Which concept?
3. Asks: Brief description?
4. Scans file contents to suggest title
5. Generates proper filename with date
6. Moves/renames file
7. Updates appropriate README
8. Optionally creates git commit
```

### Option 2: Claude Skill

Create `.claude/skills/add-file.md`:

```markdown
When user says "add [filename]" or similar:
1. Find the file
2. Determine file type and concept
3. Read contents to understand topic
4. Suggest proper name following convention
5. Rename file
6. Update relevant READMEs
7. Summarize what was done
```

### Option 3: Git Hook

Create `.git/hooks/post-commit` that:
- Detects new files without standard naming
- Suggests renames
- Checks if READMEs need updating

### Option 4: Watcher Script

Background script that:
- Watches for new files in concepts/
- Prompts for organization when detected
- Helps with naming and placement

## What Should Be Automated?

### High Value (Should Automate)

✅ **File renaming** - Standard pattern, easy to automate
✅ **Date detection** - Can be determined from file metadata
✅ **README updates** - Template-based, predictable structure

### Medium Value (Could Automate)

⚠️ **Phase detection** - Requires understanding content
⚠️ **Description generation** - Could suggest based on title
⚠️ **Version numbering** - Needs to check existing versions

### Low Value (Keep Manual)

❌ **Content understanding** - Requires reading and analysis
❌ **Significance assessment** - Requires judgment
❌ **Conceptual grouping** - Requires understanding evolution

## Recommended Approach

### Phase 1: Simple Script

Create a Ruby script that:
1. Takes filename as argument
2. Asks a few questions (type, concept, description)
3. Generates standard name
4. Renames file
5. Prints template text for README update (doesn't auto-edit)

This gives most of the benefit with minimal complexity.

### Phase 2: Smart Assistant

If Phase 1 proves useful, enhance with:
1. Content scanning to suggest descriptions
2. Automatic README updates
3. Git commit creation
4. Phase detection based on dates and content

### Phase 3: Full Integration

If Phase 2 works well:
1. Make it a Claude skill
2. Add file watching
3. Integrate with validation pipeline
4. Create dashboard of recent additions

## Example: Manual Process for Today's File

**Original**: `Governance Architecture Essay Draft (1).md`

**Steps taken**:
1. Found file: `find concepts/governance-architecture/drafts/ -name "*Essay*"`
2. Checked date: `ls -l` showed Nov 7, 2025
3. Read contents: Essay titled "Refactoring Government"
4. Renamed: `2025-11-07-refactoring-government-essay-v1.md`
5. Updated `drafts/README.md` - added Phase 5
6. Documented process in this file

**Time**: ~5-10 minutes

**Could be automated**: Steps 1, 2, 4, 5 (rename and basic README update)

**Should stay manual**: Step 3 (understanding significance and phase)

## Template: README Entry for New Draft

```markdown
### Phase [N]: [Phase Name] ([Date])

[Description of what this phase represents]:

- `YYYY-MM-DD-topic-name.md` - [Description of this specific file]
```

## Template: README Entry for New Conversation

```markdown
### [Date]: [Topic]

- `YYYY-MM-DD-topic.md` - [What was discussed, what resulted]
```

## Next Steps

1. Try this manual process a few more times
2. Identify pain points
3. Build simplest useful automation
4. Iterate based on actual usage

## Notes for Tool Development

If building this as a tool:

**Input options**:
- Filename (path or search term)
- Concept name (or detect from path)
- File type (or detect from path)
- Description (or extract from title)

**Output**:
- New filename
- Updated README (or template to copy)
- Git commit message suggestion

**Edge cases to handle**:
- File already has standard name
- Multiple files with similar names
- Concept doesn't exist
- README doesn't have expected structure
- Version number conflicts

---

*This workflow document should evolve as we learn what actually helps vs. what creates overhead.*
