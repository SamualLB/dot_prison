class DotPrison::Prison::Object::WeightsBench < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include ReferenceSlot
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
