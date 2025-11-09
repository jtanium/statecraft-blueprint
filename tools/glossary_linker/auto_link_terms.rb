#!/usr/bin/env ruby
# frozen_string_literal: true

# ============================================================================
# AI-GENERATED CODE - NOT REVIEWED OR TESTED
# ============================================================================
# Generated: 2025-11-08T17:48:00-08:00
# Generator: Claude Sonnet 4.5
# Project: 2028 Thought Leadership Engine
#
# WARNING: This code has not been reviewed or tested by humans.
#          Do NOT use in production without thorough review.
# Status: UNREVIEWED
# ============================================================================

# Glossary Auto-Linker
# Automatically links glossary terms in markdown files
#
# Usage: ruby auto_link_terms.rb input.md output.md
#
# The script:
# 1. Scans the glossary directory for defined terms
# 2. Finds instances of those terms in the input file
# 3. Adds markdown links to the glossary on first occurrence
# 4. Optionally links all occurrences (not just first)

require 'optparse'
require 'fileutils'
require 'pathname'

class GlossaryTerm
  attr_reader :name, :path, :aliases

  def initialize(name, path, aliases = [])
    @name = name
    @path = path
    @aliases = aliases
  end

  # All possible ways this term might appear in text
  def search_patterns
    patterns = [name]
    patterns += aliases if aliases.any?
    patterns
  end

  # Convert term to regex pattern for matching
  # Should match word boundaries to avoid partial matches
  def to_regex(case_sensitive: false)
    patterns = search_patterns.map { |p| Regexp.escape(p) }
    pattern_str = patterns.join('|')
    flags = case_sensitive ? nil : Regexp::IGNORECASE
    Regexp.new("\\b(#{pattern_str})\\b", flags)
  end
end

class GlossaryLoader
  attr_reader :glossary_dir

  def initialize(glossary_dir = 'glossary/terms')
    @glossary_dir = glossary_dir
  end

  def load_terms
    # TODO: Implement glossary loading
    # 1. Scan glossary/terms directory for markdown files
    # 2. Parse each file to extract:
    #    - Term name (from filename or header)
    #    - Aliases (from frontmatter or special section)
    # 3. Build relative paths from current file to glossary

    terms = []

    unless Dir.exist?(glossary_dir)
      warn "Glossary directory not found: #{glossary_dir}"
      return terms
    end

    Dir.glob(File.join(glossary_dir, '*.md')).each do |file_path|
      # TODO: Parse markdown file
      # Look for:
      # - Main term (filename or first h1)
      # - Aliases (yaml frontmatter or "Also known as:" section)

      term_name = extract_term_name(file_path)
      aliases = extract_aliases(file_path)

      terms << GlossaryTerm.new(term_name, file_path, aliases)
    end

    terms
  end

  private

  def extract_term_name(file_path)
    # TODO: Extract term name from file
    # Try:
    # 1. First H1 heading in file
    # 2. Filename (converted from kebab-case to Title Case)

    filename = File.basename(file_path, '.md')
    filename.split('-').map(&:capitalize).join(' ')
  end

  def extract_aliases(file_path)
    # TODO: Extract aliases from file
    # Look for:
    # 1. YAML frontmatter with "aliases:" array
    # 2. Section titled "Also known as:" or "Aliases:"

    []
  end
end

class GlossaryLinker
  attr_reader :input_path, :output_path, :options, :terms

  def initialize(input_path, output_path, options = {})
    @input_path = input_path
    @output_path = output_path
    @options = default_options.merge(options)
    @terms = []
  end

  def link!
    load_glossary
    content = read_input
    linked_content = add_links(content)
    write_output(linked_content)

    print_summary if options[:verbose]
  end

  private

  def default_options
    {
      verbose: false,
      link_all: false,          # Link all occurrences (not just first)
      case_sensitive: false,    # Case-insensitive matching
      glossary_dir: 'glossary/terms',
      skip_code_blocks: true    # Don't link inside code blocks
    }
  end

  def load_glossary
    glossary_path = calculate_glossary_path
    loader = GlossaryLoader.new(glossary_path)
    @terms = loader.load_terms

    puts "Loaded #{terms.size} glossary terms" if options[:verbose]
  end

  def calculate_glossary_path
    # TODO: Calculate relative path from input file to glossary
    # This ensures links work regardless of where the file is in the repo

    options[:glossary_dir]
  end

  def read_input
    unless File.exist?(input_path)
      raise "Input file not found: #{input_path}"
    end

    File.read(input_path)
  end

  def add_links(content)
    # TODO: Main linking logic
    # 1. Parse markdown to identify code blocks (to skip)
    # 2. For each term, find occurrences in text
    # 3. Replace with markdown link on first (or all) occurrences
    # 4. Avoid linking inside existing links
    # 5. Avoid linking inside code blocks or code spans

    linked_content = content.dup
    linked_terms = Set.new

    # TODO: Parse out code blocks if skip_code_blocks is true
    code_blocks = extract_code_blocks(content) if options[:skip_code_blocks]

    terms.each do |term|
      regex = term.to_regex(case_sensitive: options[:case_sensitive])

      # TODO: Find matches
      matches = linked_content.scan(regex)

      if matches.any? && !linked_terms.include?(term.name)
        # TODO: Replace first occurrence with link
        # linked_content.sub!(regex, create_link(term))

        linked_terms << term.name
        puts "Linked: #{term.name}" if options[:verbose]
      end
    end

    linked_content
  end

  def extract_code_blocks(content)
    # TODO: Extract positions of code blocks to skip them during linking
    # Match: ```...``` and `...`
    []
  end

  def create_link(term, matched_text)
    # TODO: Create markdown link to glossary term
    # Calculate relative path from input file to glossary term
    # Format: [matched_text](relative/path/to/glossary/term.md)

    relative_path = calculate_relative_path(term.path)
    "[#{matched_text}](#{relative_path})"
  end

  def calculate_relative_path(target_path)
    # TODO: Calculate relative path from input_path to target_path
    # Use Pathname for clean path calculation

    input_dir = Pathname.new(File.dirname(input_path))
    target = Pathname.new(target_path)
    target.relative_path_from(input_dir).to_s
  end

  def write_output(content)
    File.write(output_path, content)
  end

  def print_summary
    puts "Glossary linking complete"
    puts "Input:  #{input_path}"
    puts "Output: #{output_path}"
  end
end

# Command-line interface
def main
  options = {
    verbose: false,
    link_all: false,
    case_sensitive: false,
    glossary_dir: 'glossary/terms'
  }

  OptionParser.new do |opts|
    opts.banner = "Usage: ruby auto_link_terms.rb [options] input.md output.md"

    opts.on("-v", "--verbose", "Print detailed output") do
      options[:verbose] = true
    end

    opts.on("-a", "--all", "Link all occurrences (not just first)") do
      options[:link_all] = true
    end

    opts.on("-c", "--case-sensitive", "Case-sensitive term matching") do
      options[:case_sensitive] = true
    end

    opts.on("-g", "--glossary DIR", "Glossary directory path") do |dir|
      options[:glossary_dir] = dir
    end

    opts.on("-h", "--help", "Show this help message") do
      puts opts
      exit
    end
  end.parse!

  if ARGV.length < 2
    puts "Error: Input and output file paths required"
    puts "Usage: ruby auto_link_terms.rb input.md output.md"
    exit 1
  end

  input_path = ARGV[0]
  output_path = ARGV[1]

  linker = GlossaryLinker.new(input_path, output_path, options)
  linker.link!

  puts "✓ Glossary terms linked: #{output_path}" unless options[:verbose]
rescue StandardError => e
  warn "Error: #{e.message}"
  warn e.backtrace.join("\n") if options[:verbose]
  exit 1
end

# Run if called directly
main if __FILE__ == $PROGRAM_NAME
