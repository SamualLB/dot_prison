class DotPrison::Prison::Object::RoadGate < DotPrison::Prison::Object
  include ObjectProperties
  include DoorProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
