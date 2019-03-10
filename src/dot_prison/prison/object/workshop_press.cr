class DotPrison::Prison::Object::WorkshopPress < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Powered
  include ReferenceSlot
  include Job
end
