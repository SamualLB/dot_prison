class DotPrison::Prison::Object::Bench < DotPrison::Prison::Object
  NO_SLOTS = 4

  include ReferenceSlot

  def initialize(prison : Prison, store : Store)
    super
  end
end
