class DotPrison::Prison::Object::SofaChairSingle < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include Rotation
  include WallContact
  include ReferenceSlot
end
