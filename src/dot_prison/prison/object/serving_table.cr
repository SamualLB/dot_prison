class DotPrison::Prison::Object::ServingTable < DotPrison::Prison::Object
  NO_SLOTS = 5

  include ReferenceSlot

  def initialize(prison : Prison, store : Store)
    super
  end
end
