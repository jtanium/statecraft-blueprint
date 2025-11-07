# Add File Skill

This skill helps organize new files added to the repository by finding them, understanding their content, renaming them to follow conventions, and updating relevant documentation.

## Trigger Phrases

Activate this skill when the user says things like:
- "add [filename]"
- "organize [filename]"
- "I just added [filename]"
- "process new file [filename]"
- "there's a new file in [location]"

## What This Skill Does

1. **Finds the file** - Searches for the file in the repository
2. **Reads and understands** - Analyzes content to determine topic, type, and significance
3. **Suggests proper naming** - Proposes a name following `YYYY-MM-DD-topic-description.md` convention
4. **Renames the file** - Updates filename to follow conventions
5. **Updates documentation** - Adds entry to relevant README
6. **Reports results** - Summarizes what was done

## Process Steps

### Step 1: Locate the File

```bash
# Search for the file
find /Users/jtanium/RubymineProjects/statecraft-blueprint -name "*[filename-pattern]*" -type f
```

If multiple matches, ask user which one.

### Step 2: Get File Metadata

```bash
# Check when file was last modified
ls -l [filepath]
```

Use the modification date for the YYYY-MM-DD prefix.

### Step 3: Read and Analyze Content

Read the file and determine:

**File Type:**
- Draft/essay if it contains article-style content
- Outline if it has hierarchical structure
- Conversation if it shows dialogue format
- Research if it's source material or references

**Topic/Title:**
- Extract from first H1 heading
- Or summarize main subject in 2-4 words

**Concept Association:**
- Which concept does this belong to? (governance-architecture, etc.)
- Check file location or content themes

**Significance:**
- Is this a new phase of development?
- Does it represent a major evolution?
- Or is it incremental work within existing phase?

**Version:**
- Look for version indicators in filename or content
- Check for similar files to determine next version number
- Default to v1 if unclear

### Step 4: Suggest New Filename

Format: `YYYY-MM-DD-topic-description-vN.md`

Examples:
- `2025-11-07-refactoring-government-essay-v1.md`
- `2025-11-05-five-stage-cascade-outline.md`
- `2025-11-04-gemini-reconstruction-attempt.md`

Rules:
- Use file modification date
- Lowercase, hyphens between words
- Descriptive but concise (3-6 words)
- Include version if applicable
- Include type indicator (essay, outline, draft) if helpful

Present the suggestion to user and ask for approval or modification.

### Step 5: Rename the File

```bash
mv "[old-path]" "[new-path]"
```

### Step 6: Determine Where Documentation Needs Updating

Based on file type and location:

**If it's a draft:**
- Update `concepts/[concept-name]/drafts/README.md`
- Add to chronological phase list
- Determine if it's a new phase or continues existing

**If it's a conversation:**
- Update `concepts/[concept-name]/conversations/README.md`
- Add to conversation list with date and topic

**If it's research:**
- Update `concepts/[concept-name]/research/README.md`
- Add to materials list with relevance note

**If it's significant:**
- Consider updating `concepts/[concept-name]/README.md`
- Update status or "What's New" section

### Step 7: Update the README

Read the relevant README to understand current structure.

**For drafts/README.md:**

Identify existing phases:
```markdown
### Phase 1: [Name] ([Date Range])
### Phase 2: [Name] ([Date Range])
...
```

Determine if new file:
- **Continues existing phase** - Add bullet point to latest phase
- **Starts new phase** - Create new phase section with appropriate title

Add entry in format:
```markdown
- `YYYY-MM-DD-filename.md` - [Brief description from file title/content]
```

If new phase:
```markdown
### Phase N: [Phase Name Based on Content] ([Date])

[1-2 sentence description of what this phase represents]:

- `YYYY-MM-DD-filename.md` - [Description]
```

**For other READMEs:**
Follow similar pattern - understand structure, add entry appropriately.

### Step 8: Report What Was Done

Provide clear summary:

```
## File Added and Organized

**Original**: [old filename]
**New**: [new filename]
**Location**: [full path]

**Content**: [1-2 sentence summary of what the file is about]

**Updates Made**:
- Renamed file following naming convention
- Updated [README location]
- Added to Phase [N]: [Phase Name]

**Next Steps**:
[Any suggestions for what to do with this file next]
```

## Special Considerations

### Determining Phases

Phases represent significant shifts in thinking:
- **New concept direction** - Qualifies as new phase
- **Major evolution of idea** - Qualifies as new phase
- **Incremental refinement** - Continues existing phase

Look for:
- Title changes (different main topic)
- Date gaps (several days between files)
- Conceptual shifts in content
- User stating "this is a new direction"

### Version Numbers

Include version (v1, v2, v3) when:
- File itself indicates version
- There are existing similar files with versions
- It's clearly an iteration on previous work

Omit version when:
- It's a standalone piece
- It's an outline or preliminary work
- No clear versioning pattern exists

### README Structure Preservation

When updating READMEs:
- Maintain existing formatting style
- Keep chronological order
- Match indentation and bullet style
- Preserve section headers
- Don't remove existing content

## Error Handling

**File not found:**
- Try fuzzy matching
- Search in common locations
- Ask user for more specific path

**Multiple matches:**
- List all matches
- Ask user to specify which one

**Unclear file type:**
- Ask user: "Is this a draft, conversation, or research material?"

**Uncertain about phase:**
- Default to continuing latest phase
- Explain reasoning
- Ask user if it seems right

**README structure unclear:**
- Add entry at end with date
- Note that manual organization may be needed
- Ask user to review

## Example Usage

**User**: "I just added a new draft called 'System Design Essay.md'"

**Skill Process**:
1. Find: `concepts/governance-architecture/drafts/System Design Essay.md`
2. Check date: Modified Nov 7, 2025
3. Read: Essay about designing government systems for resilience
4. Suggest: `2025-11-07-system-design-essay-v1.md`
5. User approves
6. Rename file
7. Read drafts/README.md, see latest is Phase 5 (Nov 7)
8. Determine: Continues Phase 5 (same date, related topic)
9. Add bullet to Phase 5
10. Report results

## Notes for AI Using This Skill

- **Be thorough**: Read files completely to understand them
- **Ask when uncertain**: Don't guess about phases or naming
- **Explain reasoning**: Help user understand why you're suggesting what you are
- **Be flexible**: User may want different naming or organization
- **Maintain consistency**: Match existing patterns in READMEs
- **Document edge cases**: If you encounter something unusual, note it

This skill embodies the project's philosophy: organization and documentation should be transparent and thoughtful, not arbitrary.

---

*This skill will evolve as we learn what works. Update it based on actual usage.*
