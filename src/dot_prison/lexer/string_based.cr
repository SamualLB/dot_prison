class DotPrison::Lexer::StringBased < DotPrison::Lexer
  def initialize(string)
    super()
    @reader = Char::Reader.new(string)
  end

  private def current_pos
    @reader.pos
  end

  private def next_char_no_column_increment
    char = @reader.next_char
    if char == '\0' && @reader.pos != @reader.string.bytesize
      raise "unexpected char"
    end
    char
  end

  private def current_char
    @reader.current_char
  end
end
