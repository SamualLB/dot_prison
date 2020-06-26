class Object
  def to_prison
    String.build do |str|
      to_prison str
    end
  end

  #def to_prison(io : IO)
  #  DotPrison.build(io) do |prison|
  #    to_prison(prison)
  #  end
  #end
end

class DotPrison::Table
  def to_prison(io : IO, indent = 0)
    each do |k, v|
      case v
      in String then to_prison_outer_string(io, k, v, indent)
      in Table then to_prison_outer_table(io, k, v, indent)
      in Array(Table) then v.each { |nv| to_prison_outer_table(io, k, nv, indent) }
      in Array(String) then v.each { |nv| to_prison_outer_string(io, k, nv, indent) }
      end
    end
  end

  private def to_prison_outer_string(io, k, v, indent = 0)
    io << " " * indent if indent > 0
    to_prison_string(io, k)
    io << ' '
    to_prison_string(io, v)
    io << '\n'
  end

  private def to_prison_outer_table(io, k, v, indent = 0)
    io << " " * indent if indent > 0
    io << "BEGIN "
    to_prison_string(io, k)
    io << '\n'
    v.to_prison(io, indent + 2)
    io << " " * indent if indent > 0
    io << "END\n"
  end

  private def to_prison_string(io, val, indent = 0)
    if val.includes?('"')
      raise "Escaping \" character unsupported"
    elsif val.includes?(' ')
      io << '"'
      io << val
      io << '"'
    else
      io << val
    end
  end
end
