class DotPrison::Prison::Object::IroningBoard < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Rotation
  include ReferenceSlot
end
