class DotPrison::Prison::Object::DoorControlSystem < DotPrison::Prison::Object
  include ObjectProperties
  include ConnectionProperties
  include Rotation
  include Powered
  include Job

  handle(:guard_operating, :Bool, :GuardOperating)
  handle(:last_press, :Float64, :LastPress)

  def initialize(store : Store, prison : Prison)
    super
  end
end
