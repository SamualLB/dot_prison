class DotPrison::Prison::Object::PhoneMonitor < DotPrison::Prison::Object
  include ObjectProperties
  include ConnectionProperties
  include Rotation
  include Powered
  include Job

  handle(:guard_operating, :Bool, :GuardOperating)
  handle(:listening, :Bool, :Listening)

  def initialize(store : Store, prison : Prison)
    super
  end
end
