module DotPrison::Prison::Object::Velocity
  @velocity_x : Float64 = 0.0
  @velocity_y : Float64 = 0.0

  def initialize(prison : Prison, store : Store)
    super
    @velocity_x = store.parse_float("Vel.x")
    @velocity_y = store.parse_float("Vel.y")
  end
end
