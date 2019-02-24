class DotPrison::Prison::Object::ServingTable < DotPrison::Prison::Object
  NO_SLOTS = 5

  include Slot

  def initialize(prison : Prison, store : Store)
    super
    puts @slots.size
  end
end
