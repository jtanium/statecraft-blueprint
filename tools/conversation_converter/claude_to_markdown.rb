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

# Claude Conversation to Markdown Converter
# Converts exported Claude (or other AI) conversations to readable markdown
#
# Usage: ruby claude_to_markdown.rb conversation.json output.md
#
# Supports:
# - Claude conversation exports (JSON format)
# - ChatGPT conversation exports
# - Plain text conversation logs
#
# Output includes:
# - Formatted conversation with clear speaker labels
# - Timestamps (if available)
# - Metadata (model used, date, topic)
# - Code blocks properly formatted

require 'json'
require 'optparse'
require 'time'

class Message
  attr_reader :role, :content, :timestamp, :metadata

  def initialize(role, content, timestamp = nil, metadata = {})
    @role = role
    @content = content
    @timestamp = timestamp
    @metadata = metadata
  end

  def to_markdown(options = {})
    # TODO: Convert message to markdown format
    # Should include:
    # - Role indicator (User: / Assistant:)
    # - Timestamp if available and requested
    # - Properly formatted content (preserve code blocks, lists, etc.)

    output = []

    # Header with role
    header = role_header
    header += " (#{format_timestamp})" if timestamp && options[:include_timestamps]
    output << "### #{header}\n"

    # Content
    output << format_content(content)
    output << "\n"

    output.join("\n")
  end

  private

  def role_header
    case role.downcase
    when 'user', 'human'
      'User'
    when 'assistant', 'ai', 'claude', 'chatgpt'
      'Assistant'
    when 'system'
      'System'
    else
      role.capitalize
    end
  end

  def format_timestamp
    # TODO: Format timestamp in readable way
    return '' unless timestamp

    Time.parse(timestamp).strftime('%Y-%m-%d %H:%M')
  rescue StandardError
    timestamp
  end

  def format_content(text)
    # TODO: Clean up content formatting
    # - Preserve code blocks
    # - Fix line breaks
    # - Clean up extra whitespace
    # - Handle special markdown characters

    text.strip
  end
end

class ConversationParser
  def self.parse(input_path)
    content = File.read(input_path)

    # TODO: Detect format and parse accordingly
    case detect_format(input_path, content)
    when :claude_json
      parse_claude_json(content)
    when :chatgpt_json
      parse_chatgpt_json(content)
    when :plain_text
      parse_plain_text(content)
    else
      raise "Unknown conversation format"
    end
  end

  def self.detect_format(path, content)
    # TODO: Detect conversation format
    # - Check file extension
    # - Try parsing as JSON
    # - Look for format-specific markers

    return :claude_json if path.end_with?('.json') && content.include?('"role"')
    return :plain_text if path.end_with?('.txt')

    :unknown
  end

  def self.parse_claude_json(content)
    # TODO: Parse Claude conversation JSON format
    # Expected structure (may vary):
    # {
    #   "messages": [
    #     {"role": "user", "content": "...", "timestamp": "..."},
    #     {"role": "assistant", "content": "...", "timestamp": "..."}
    #   ],
    #   "metadata": {...}
    # }

    data = JSON.parse(content)
    messages = []

    # TODO: Extract messages from JSON structure
    if data['messages']
      data['messages'].each do |msg|
        messages << Message.new(
          msg['role'],
          msg['content'],
          msg['timestamp'],
          msg.slice('model', 'tokens')
        )
      end
    end

    {
      messages: messages,
      metadata: data['metadata'] || {}
    }
  end

  def self.parse_chatgpt_json(content)
    # TODO: Parse ChatGPT conversation JSON format
    # Structure may differ from Claude format

    data = JSON.parse(content)
    messages = []

    # TODO: Adapt to ChatGPT JSON structure

    {
      messages: messages,
      metadata: {}
    }
  end

  def self.parse_plain_text(content)
    # TODO: Parse plain text conversation
    # Look for patterns like:
    # - "User:" or "Human:"
    # - "Assistant:" or "AI:"
    # - Timestamp markers

    messages = []
    current_role = nil
    current_content = []

    content.each_line do |line|
      # TODO: Detect role changes
      # When role changes, save previous message and start new one
    end

    {
      messages: messages,
      metadata: {}
    }
  end
end

class ConversationConverter
  attr_reader :input_path, :output_path, :options

  def initialize(input_path, output_path, options = {})
    @input_path = input_path
    @output_path = output_path
    @options = default_options.merge(options)
  end

  def convert!
    conversation = parse_conversation
    markdown = generate_markdown(conversation)
    write_output(markdown)

    print_summary(conversation) if options[:verbose]
  end

  private

  def default_options
    {
      verbose: false,
      include_timestamps: true,
      include_metadata: true,
      add_summary: false
    }
  end

  def parse_conversation
    ConversationParser.parse(input_path)
  end

  def generate_markdown(conversation)
    # TODO: Generate complete markdown document
    # Structure:
    # - Title and metadata
    # - Optional summary
    # - Conversation messages
    # - Optional footer with statistics

    output = []

    # Header
    output << generate_header(conversation[:metadata])
    output << ""

    # Summary if requested
    if options[:add_summary]
      output << generate_summary(conversation)
      output << ""
    end

    # Messages
    conversation[:messages].each do |message|
      output << message.to_markdown(
        include_timestamps: options[:include_timestamps]
      )
    end

    # Footer
    output << generate_footer(conversation) if options[:include_metadata]

    output.join("\n")
  end

  def generate_header(metadata)
    # TODO: Generate markdown header with metadata
    # Include:
    # - Title (from metadata or generated)
    # - Date
    # - AI model used
    # - Topic/tags if available

    lines = ["# AI Conversation"]
    lines << ""

    if metadata['date']
      lines << "**Date**: #{metadata['date']}"
    end

    if metadata['model']
      lines << "**Model**: #{metadata['model']}"
    end

    if metadata['topic']
      lines << "**Topic**: #{metadata['topic']}"
    end

    lines << ""
    lines << "---"

    lines.join("\n")
  end

  def generate_summary(conversation)
    # TODO: Generate conversation summary
    # Could include:
    # - Number of messages
    # - Main topics discussed
    # - Key conclusions

    "## Summary\n\nThis conversation contains #{conversation[:messages].size} messages."
  end

  def generate_footer(conversation)
    # TODO: Generate footer with statistics
    lines = ["---", ""]

    message_count = conversation[:messages].size
    user_messages = conversation[:messages].count { |m| m.role.downcase == 'user' }
    assistant_messages = conversation[:messages].count { |m| m.role.downcase == 'assistant' }

    lines << "*Conversation Statistics*"
    lines << "- Total messages: #{message_count}"
    lines << "- User messages: #{user_messages}"
    lines << "- Assistant messages: #{assistant_messages}"

    lines.join("\n")
  end

  def write_output(content)
    File.write(output_path, content)
  end

  def print_summary(conversation)
    puts "Conversation converted successfully"
    puts "Messages: #{conversation[:messages].size}"
    puts "Input:    #{input_path}"
    puts "Output:   #{output_path}"
  end
end

# Command-line interface
def main
  options = {
    verbose: false,
    include_timestamps: true,
    include_metadata: true,
    add_summary: false
  }

  OptionParser.new do |opts|
    opts.banner = "Usage: ruby claude_to_markdown.rb [options] conversation.json output.md"

    opts.on("-v", "--verbose", "Print detailed output") do
      options[:verbose] = true
    end

    opts.on("--no-timestamps", "Exclude timestamps from output") do
      options[:include_timestamps] = false
    end

    opts.on("--no-metadata", "Exclude metadata from output") do
      options[:include_metadata] = false
    end

    opts.on("-s", "--summary", "Add conversation summary") do
      options[:add_summary] = true
    end

    opts.on("-h", "--help", "Show this help message") do
      puts opts
      exit
    end
  end.parse!

  if ARGV.length < 2
    puts "Error: Input and output file paths required"
    puts "Usage: ruby claude_to_markdown.rb conversation.json output.md"
    exit 1
  end

  input_path = ARGV[0]
  output_path = ARGV[1]

  converter = ConversationConverter.new(input_path, output_path, options)
  converter.convert!

  puts "✓ Conversation converted: #{output_path}" unless options[:verbose]
rescue StandardError => e
  warn "Error: #{e.message}"
  warn e.backtrace.join("\n") if options[:verbose]
  exit 1
end

# Run if called directly
main if __FILE__ == $PROGRAM_NAME
