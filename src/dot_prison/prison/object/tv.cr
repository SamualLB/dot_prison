class DotPrison::Prison::Object::TV < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include WallContact
  include Powered

  def initialize(store : Store, prison : Prison)
    super
  end
end
