class DotPrison::Prison::Object::Door < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include DoorProperties
  include DoorCell

  def initialize(store : Store, prison : Prison)
    super
  end
end
