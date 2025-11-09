# Add AI-Generated Code Headers

Add proper AI-generated code warning headers to code files that are missing them.

## Task

1. **Find code files without headers** - Scan the repository for code files (Ruby, Python, JavaScript, etc.) that appear to be AI-generated but lack proper warning headers

2. **Confirm with user** - Before making changes, show the user:
   - List of files that will be modified
   - Preview of headers that will be added
   - Ask for confirmation to proceed

3. **Add appropriate headers** - For each file:
   - Detect the programming language
   - Use the correct comment syntax and header template
   - Include current ISO 8601 timestamp with timezone
   - Set status to `UNREVIEWED`
   - Preserve existing content exactly as-is

4. **Generate report** - After completion, provide:
   - List of files modified
   - Count of headers added
   - Any files skipped (with reasons)

## Header Templates Reference

Use templates from `Code Generation Instructions from Claude.md` based on file extension:

- `.rb` → Ruby header with `#` comments
- `.py` → Python header with `#` comments
- `.js`, `.ts` → JavaScript/TypeScript header with `/** */` block comments
- `.java`, `.cpp`, `.c`, `.cs` → Similar block comment style
- `.sh`, `.bash` → Bash header with `#` comments (after shebang if present)
- `.html` → HTML comment style `<!-- -->`
- `.css`, `.scss` → CSS block comment style `/** */`

## Safety Checks

Before adding headers:
- ✅ Confirm file is actually code (not data or config)
- ✅ Check if file already has AI-generated header (don't duplicate)
- ✅ Verify file is in git (ask before modifying untracked files)
- ✅ Make backup reference in memory for comparison
- ✅ Ask user to confirm before making changes

## Example Workflow

```
1. Scanning repository for code files...
2. Found 5 code files without AI headers:
   - tools/citation_helper.rb
   - tools/glossary_linker.rb
   - tools/conversation_converter.rb
   - tools/publishing_pipeline.rb
   - tools/ai_code_audit.rb

3. Preview of changes:
   [Show first file with proposed header]

4. Proceed with adding headers to all 5 files? [yes/no]

5. Adding headers...
   ✓ tools/citation_helper.rb
   ✓ tools/glossary_linker.rb
   ✓ tools/conversation_converter.rb
   ✓ tools/publishing_pipeline.rb
   ✓ tools/ai_code_audit.rb

6. Summary:
   - 5 files modified
   - All headers added successfully
   - Status set to UNREVIEWED
   - Ready for git commit
```

## Git Commit Suggestion

After adding headers, suggest a commit message:

```
[meta] Add: AI-generated code warning headers

Added standard warning headers to 5 code files indicating
they are AI-generated and require review before production use.

Files modified:
- tools/citation_helper.rb
- tools/glossary_linker.rb
- tools/conversation_converter.rb
- tools/publishing_pipeline.rb
- tools/ai_code_audit.rb

All marked as Status: UNREVIEWED
```

## Notes

- Only modify files that clearly need headers
- When in doubt, ask the user
- Preserve exact formatting and content
- Use correct timestamp format: ISO 8601 with timezone
- Default generator: Claude Sonnet 4.5 (unless specified otherwise)
- Default project: 2028 Thought Leadership Engine
