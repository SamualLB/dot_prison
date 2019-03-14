class DotPrison::Prison::Object::StaffDoor < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include DoorProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
