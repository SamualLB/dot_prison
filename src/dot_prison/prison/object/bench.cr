class DotPrison::Prison::Object::Bench < DotPrison::Prison::Object
  NO_SLOTS = 4

  include Slot

  def initialize(prison : Prison, store : Store)
    super
  end
end
