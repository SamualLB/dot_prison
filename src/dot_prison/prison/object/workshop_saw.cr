class DotPrison::Prison::Object::WorkshopSaw < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Powered
  include ReferenceSlot
  include Job

  handle(:timer, :Float64, :Timer)
end
