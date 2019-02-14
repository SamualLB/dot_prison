module DotPrison::Prison::Object::Module::Position
  property x = 0.0
  property y = 0.0

  def initialize(prison : Prison, store : Store)
    @x = parse_float(store, "Pos.x")
    @y = parse_float(store, "Pos.y")
    super
  end
end
