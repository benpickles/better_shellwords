require 'strscan'

class BetterShellwords
  VERSION = '0.1.0'

  NON_WHITESPACE = /\S+/
  WHITESPACE = /\s+/

  QUOTES = {
    '"' => /"[^"]+"/,
    "'" => /'[^']+'/,
  }

  def initialize(string)
    @scanner = StringScanner.new(string.strip)
  end

  def split
    words = []

    while !scanner.eos?
      next_char = scanner.peek(1)

      if next_char == '"' || next_char == "'"
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
