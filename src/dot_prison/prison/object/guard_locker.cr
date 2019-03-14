class DotPrison::Prison::Object::GuardLocker < DotPrison::Prison::Object
  include ObjectProperties
  include WallContact
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
