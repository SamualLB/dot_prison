module DotPrison::Prison::Object::WallContact
  @wall_contact_x = 0.0
  @wall_contact_y = 0.0

  def initialize(prison : Prison, store : Store)
    super
    @wall_contact_x = store.parse_float("Walls.x")
    @wall_contact_y = store.parse_float("Walls.y")
  end
end
