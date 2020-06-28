class DotPrison::Builder
  @root = DotPrison::Table.new
  @protected = false

  def element(k : String | Symbol, v)
    raise "Protected builder" if @protected
    @root[k.to_s] = v.to_s
  end

  def element(k : String | Symbol, &v)
    raise "Protected builder" if @protected
    @protected = true
    t = Table.build do |b|
      yield b
    end
    @root[k.to_s] = t
    @protected = false
  end
end

class DotPrison::Table
  def self.build : DotPrison::Table
    builder = DotPrison::Builder.new
    yield builder
    builder.@root
  end
end
