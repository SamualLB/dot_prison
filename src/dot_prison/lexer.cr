abstract class DotPrison::Lexer
  def self.new(string : String)
    StringBased.new(string)
  end

  def self.new(io : IO)
    IOBased.new(io)
  end

  getter token : Token

  def initialize
    @token = Token.new
    @line_number = 1
    @column_number = 1
    @buffer = IO::Memory.new
    @skip = false
  end

  private abstract def next_char_no_column_increment
  private abstract def current_char

  private def next_char
    @column_number += 1
    next_char_no_column_increment
  end

  def next_token
    skip_whitespace
    @token.line_number = @line_number
    @token.column_number = @column_number

    case current_char
    when nil
      Log.debug { "Parsing EOF token" }
      @token.type = :EOF
    when '"'
      Log.debug { "Parsing quoted token" }
      consume_quoted_text
    else
      Log.debug  { "Parsing unquoted token" }
      consume_text
    end

    Log.debug { @token }
    @token
  end

  private def consume_text
    buffer = String.build do |str|
      char = current_char
      until whitespace?(char) || char == '\0' || char == nil
        str << char
        char = next_char
      end
      next_char if char == '\0' # remove the null char
    end
    case buffer
    when "BEGIN"
      @token.type = :BEGIN
    when "END"
      @token.type = :END
    else
      @token.type = :TEXT
      @token.value = buffer
    end
  end

  private def consume_quoted_text
    buffer = String.build do |str|
      char = next_char
      until char == '"'
        str << char
        char = next_char
      end
    end
    next_char # remove extra "
    @token.type = :TEXT
    @token.value = buffer
  end

  private def skip_whitespace
    while whitespace?(current_char)
      if current_char == '\n'
        @line_number += 1
        @column_number = 0
      end
      next_char
    end
  end

  private def whitespace?(char)
    case char
    when ' ', '\t', '\n', '\r'
      true
    else
      false
    end
  end
end

require "./lexer/*"
