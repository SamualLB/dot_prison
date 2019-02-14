module DotPrison::Prison::Object::Orientation

  @or_x = 0.0
  @or_y = 0.0

  def initialize(prison : Prison, store : Store)
    super()
    @or_x = store.parse_float("Or.x")
    @or_y = store.parse_float("Or.y")
  end

  def orientation : Float64
    # parse or_x, or_y
    0.0
  end
end
