class DotPrison::Prison::Object::SofaChairDouble < DotPrison::Prison::Object
  NO_SLOTS = 2

  include ObjectProperties
  include Rotation
  include WallContact
  include ReferenceSlot

  def initialize(store : Store, prison : Prison)
    super
  end
end
