class DotPrison::Prison::Object::SchoolDesk < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include Rotation
  include WallContact
  include ReferenceSlot

  def initialize(store : Store, prison : Prison)
    super
  end
end
