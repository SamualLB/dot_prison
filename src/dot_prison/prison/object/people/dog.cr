class DotPrison::Prison::Object::Dog < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation

  handle(:sniff_timer, :Float64, :SniffTimer)
  handle(:tunnel_timer, :Float64, :TunnelTimer)
  handle(:guard, :"Reference(DogHandler)", :"GuardId.i", :"GuardId.u")
  handle(:target, :"Reference(Object)", :"TargetObjectId.i", :"TargetObjectId.u")

  def initialize(store : Store, prison : Prison)
    super
  end
end
