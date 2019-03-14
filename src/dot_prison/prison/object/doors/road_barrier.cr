class DotPrison::Prison::Object::RoadBarrier < DotPrison::Prison::Object
  include ObjectProperties
  include DoorProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
