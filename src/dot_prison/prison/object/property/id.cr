module DotPrison::Prison::Object::Property::ID
  property id = 0
  property unique_id = 0

  def initialize(prison : Prison, store : Store)
    @id = parse_integer(store, "Id.i")
    @unique_id = parse_integer(store, "Id.u")
  end
end
