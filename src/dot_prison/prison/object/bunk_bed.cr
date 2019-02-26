class DotPrison::Prison::Object::BunkBed < DotPrison::Prison::Object
  NO_SLOTS = 2

  include ReferenceSlot

  def initialize(prison : Prison, store : Store)
    super
  end
end
