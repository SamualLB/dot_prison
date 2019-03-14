class DotPrison::Prison::Object::VisitorTable < DotPrison::Prison::Object
  NO_SLOTS = 4

  include ObjectProperties
  include Powered
  include ReferenceSlot
  include Rotation

  handle(:timer, :Float64, :Timer)

  def initialize(store : Store, prison : Prison)
    super
  end
end
