class DotPrison::Prison::Object::CCTVMonitor < DotPrison::Prison::Object
  include ObjectProperties
  include Powered
  include Rotation
  include Job

  handle(:active, :Bool, :Active)
  handle(:guard_operating, :Bool, :GuardOperating)
end
