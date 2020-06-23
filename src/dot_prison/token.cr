class DotPrison::Token
  property type : Symbol
  property line_number : Int32
  property column_number : Int32
  property value : String

  def initialize
    @type = :EOF
    @line_number = 0
    @column_number = 0
    @value = ""
  end

  def to_s(io : IO)
    io << @type
    io << ": "
    io << @line_number
    io << ':'
    io << @column_number
    if @type == :TEXT
      io << " \""
      io << @value
      io << '"'
    end
  end
end
