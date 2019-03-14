class DotPrison::Prison::Object::WeaponRack < DotPrison::Prison::Object
  include ObjectProperties
  include WallContact

  def initialize(store : Store, prison : Prison)
    super
  end
end
