class DotPrison::Prison::Object::CarpenterTable < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include Powered
  include ReferenceSlot

  def initialize(store : Store, prison : Prison)
    super
  end
end
