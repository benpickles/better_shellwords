require 'strscan'

class Quotesplit
  VERSION = '0.1.0'

  DOUBLE_QUOTE = '"'
  SINGLE_QUOTE = "'"
  NON_WHITESPACE = /\S+/
  WHITESPACE = /\s+/

  QUOTES = {
    DOUBLE_QUOTE => /"[^"]*"/,
    SINGLE_QUOTE => /'[^']*'/,
  }

  def self.split(string)
    new(string).split
  end

  def initialize(string)
    @scanner = StringScanner.new(string.strip)
  end

  def split
    words = []

    while !scanner.eos?
      next_char = scanner.peek(1)

      if next_char == DOUBLE_QUOTE || next_char == SINGLE_QUOTE
        end_of_quote = scanner.match?(QUOTES.fetch(next_char))

        if end_of_quote
          scanner.pos += 1
          words << scanner.peek(end_of_quote - 2)
          scanner.pos += end_of_quote - 1
          next
        end
      end

      scanned = scanner.scan(NON_WHITESPACE)

      if scanned
        words << scanned
      elsif scanner.scan(WHITESPACE)
        # Skip to the next non-whitespace.
      else
        raise 'bang'
      end
    end

    words
  end

  private
    attr_reader :scanner
end
