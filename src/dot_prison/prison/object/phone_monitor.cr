class DotPrison::Prison::Object::PhoneMonitor < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include Powered

  handle(:job_id, :Int32, :JobId)
  handle(:guard_operating, :Bool, :GuardOperating)
  handle(:listening, :Bool, :Listening)
end
