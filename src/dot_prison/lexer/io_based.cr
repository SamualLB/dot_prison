class DotPrison::Lexer::IOBased < DotPrison::Lexer
  @current_char : Char?

  def initialize(@io : IO)
    super()
    @current_char = @io.read_char
  end

  private getter current_char

  private def next_char_no_column_increment
    @current_char = @io.read_char
  end
end
