class DotPrison::Prison::Object::PhoneMonitor < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include Powered
  include Job

  handle(:guard_operating, :Bool, :GuardOperating)
  handle(:listening, :Bool, :Listening)
end
