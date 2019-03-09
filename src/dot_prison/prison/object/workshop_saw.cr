class DotPrison::Prison::Object::WorkshopSaw < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Powered
  include ReferenceSlot

  handle(:job_id, :Int32, :JobId)
  handle(:timer, :Float64, :Timer)
end
