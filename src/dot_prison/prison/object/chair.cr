class DotPrison::Prison::Object::Chair < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include Rotation
  include ReferenceSlot
end
