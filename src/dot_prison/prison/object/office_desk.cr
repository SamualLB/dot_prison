class DotPrison::Prison::Object::OfficeDesk < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include WallContact

  def initialize(store : Store, prison : Prison)
    super
  end
end
