class DotPrison::Prison::Object::IroningBoard < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Rotation
  include ReferenceSlot
  include Powered
  include Job

  handle(:timer, :Float64, :Timer)
end
