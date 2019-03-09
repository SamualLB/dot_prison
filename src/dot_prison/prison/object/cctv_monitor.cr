class DotPrison::Prison::Object::CCTVMonitor < DotPrison::Prison::Object
  include ObjectProperties
  include Powered
  include Rotation

  handle(:job_id, :Int32, :JobId)
  handle(:active, :Bool, :Active)
  handle(:guard_operating, :Bool, :GuardOperating)
end
