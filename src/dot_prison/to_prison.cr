class Object
  def to_prison
    String.build do |str|
      to_prison str
    end
  end
end

class String
  def to_prison(io : IO)
    if includes?('"')
      raise "Escaping \" character unsupported"
    elsif includes?(' ')
      io << '"'
      io << self
      io << '"'
    else
      io << self
    end
  end
end

private def to_prison_string(io, k, v, indent = 0)
  io << "    " * indent if indent > 0
  k.to_prison(io)
  io << ' '
  v.to_prison(io)
  io << '\n'
end

private def to_prison_table(io, k, v, indent = 0)
  io << "    " * indent if indent > 0
  io << "BEGIN "
  k.to_prison(io)
  io << '\n'
  v.to_prison(io, indent + 1)
  io << "    " * indent if indent > 0
  io << "END\n"
end

class DotPrison::Table
  def to_prison(io : IO, indent = 0)
    each do |k, v|
      case v
      in String then to_prison_string(io, k, v, indent)
      in Table then to_prison_outer_table(io, k, v, indent)
      in Array(Table) then v.each { |nv| to_prison_outer_table(io, k, nv, indent) }
      in Array(String) then v.each { |nv| to_prison_string(io, k, nv, indent) }
      end
    end
  end
end
