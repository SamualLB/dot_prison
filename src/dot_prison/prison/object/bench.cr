class DotPrison::Prison::Object::Bench < DotPrison::Prison::Object
  include Slot

  def initialize(prison : Prison, store : Store)
    super
  end

  def no_slots
    4
  end
end
