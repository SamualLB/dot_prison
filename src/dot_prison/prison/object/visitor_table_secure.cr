class DotPrison::Prison::Object::VisitorTableSecure < DotPrison::Prison::Object
  NO_SLOTS = 2

  include ObjectProperties
  include Rotation
  include Powered
  include Trigger
  include ReferenceSlot

  handle(:timer, :Float64, :Timer)
  handle(:visitor, :"Reference(Visitor)", :"Visitor.i", :"Visitor.u")

  def initialize(store : Store, prison : Prison)
    super
  end
end
