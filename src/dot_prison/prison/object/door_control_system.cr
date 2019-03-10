class DotPrison::Prison::Object::DoorControlSystem < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include Powered
  include Job

  handle(:guard_operating, :Bool, :GuardOperating)
  handle(:last_press, :Float64, :LastPress)
end
