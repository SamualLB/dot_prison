class DotPrison::Prison::Object::BunkBed < DotPrison::Prison::Object
  NO_SLOTS = 2

  include Slot

  def initialize(prison : Prison, store : Store)
    super
    puts HANDLED_PROPERTIES
  end
end
