class DotPrison::Prison::Object::GuardTower < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include ReferenceSlot
  include Rotation
end
