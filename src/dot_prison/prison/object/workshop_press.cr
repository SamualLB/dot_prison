class DotPrison::Prison::Object::WorkshopPress < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Powered
  include ReferenceSlot

  handle(:job_id, :Int32, :JobId)
end
