# Not working
class DotPrison::Builder
  def initialize(@io : IO)
  end

  def string(value)
    if value.contains?('"')
      raise "Contains \", don't know how to support this properly :("
    elsif value.contains?(' ')
      # " escaped
      @io << '"'
      @io << value
      @io << '"'
    else
      # non-escaped
      @io << value
    end
  end

  def table
    start_table
    yield
    end_table
  end

  def start_table
    @io << "BEGIN"
  end

  def end_table
    @io << "END"
  end

  def field(key, value)
    string(key)
    value.to_prison(self)
  end
end

module DotPrison
  def self.build(io : IO)
    builder = DotPrison::Builder.new(io)
  end
end
