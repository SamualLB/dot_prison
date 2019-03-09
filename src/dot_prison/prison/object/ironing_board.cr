class DotPrison::Prison::Object::IroningBoard < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Rotation
  include ReferenceSlot
  include Powered

  handle(:timer, :Float64, :Timer)
  handle(:job_id, :Int32, :JobId)
end
