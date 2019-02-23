module DotPrison::Prison::Object::Velocity
  macro included
    HANDLED_PROPERTIES.push "Vel.x", "Vel.y"
  end

  @velocity_x = 0.0
  @velocity_y = 0.0

  def initialize(prison : Prison, store : Store)
    super
    @velocity_x = store.parse_float("Vel.x")
    @velocity_y = store.parse_float("Vel.y")
  end
end
