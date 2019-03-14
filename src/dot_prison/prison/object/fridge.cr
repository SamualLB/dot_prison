class DotPrison::Prison::Object::Fridge < DotPrison::Prison::Object
  NO_SLOTS = 2

  include ObjectProperties
  include ReferenceSlot
  include Rotation
  include Powered

  def initialize(store : Store, prison : Prison)
    super
  end
end
