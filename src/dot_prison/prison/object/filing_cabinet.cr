class DotPrison::Prison::Object::FilingCabinet < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include WallContact

  def initialize(store : Store, prison : Prison)
    super
  end
end
