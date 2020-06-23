class Object
  def to_prison
    String.build do |str|
      to_prison str
    end
  end

  def to_prison(io : IO)
    DotPrison.build(io) do |prison|
      to_prison(prison)
    end
  end
end
