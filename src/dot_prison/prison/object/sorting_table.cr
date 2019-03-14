class DotPrison::Prison::Object::SortingTable < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Rotation
  include Powered
  include ReferenceSlot
  include Job

  handle(:timer, :Float64, :Timer)

  def initialize(store : Store, prison : Prison)
    super
  end
end
