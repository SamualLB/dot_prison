class DotPrison::Lexer::StringBased < DotPrison::Lexer
  @string : String
  def initialize(@string)
    super()
    @reader = Char::Reader.new(string)
  end

  private def current_pos
    @reader.pos
  end

  private def next_char_no_column_increment
    return nil if @string.empty?
    return nil if @string.bytesize == current_pos+1
    char = @reader.next_char
    if char == nil && @reader.pos != @reader.string.bytesize
      raise "unexpected char"
    end
    char
  end

  private def current_char
    return nil if @string.empty?
    return nil if @string.bytesize == current_pos+1
    @reader.current_char
  end
end
