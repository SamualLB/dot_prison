class DotPrison::Prison::Object::BunkBed < DotPrison::Prison::Object
  NO_SLOTS = 2

  include ObjectProperties
  include ReferenceSlot
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
