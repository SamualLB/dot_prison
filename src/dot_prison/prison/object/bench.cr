class DotPrison::Prison::Object::Bench < DotPrison::Prison::Object
  NO_SLOTS = 4

  include ObjectProperties
  include ReferenceSlot
  include Rotation
end
