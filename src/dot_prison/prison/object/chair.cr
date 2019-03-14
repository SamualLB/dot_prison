class DotPrison::Prison::Object::Chair < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include Rotation
  include ReferenceSlot

  def initialize(store : Store, prison : Prison)
    super
  end
end
