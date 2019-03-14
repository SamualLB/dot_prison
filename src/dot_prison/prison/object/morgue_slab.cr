class DotPrison::Prison::Object::MorgueSlab < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include WallContact

  def initialize(store : Store, prison : Prison)
    super
  end
end
