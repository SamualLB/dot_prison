class DotPrison::Prison::Object::Table < DotPrison::Prison::Object
  NO_SLOTS = 4

  include ObjectProperties
  include WallContact
  include Rotation
  include ReferenceSlot
end
