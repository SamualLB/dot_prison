class DotPrison::Prison::Object::SortingTable < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Rotation
  include Powered
  include ReferenceSlot

  handle(:job_id, :Int32, :JobId)
  handle(:timer, :Float64, :Timer)
end
