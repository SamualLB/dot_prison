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
end
