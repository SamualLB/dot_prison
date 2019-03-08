class DotPrison::Prison::Object::Dog < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation
  include Velocity

  handle(:sniff_timer, :Float64, :SniffTimer)
  handle(:tunnel_timer, :Float64, :TunnelTimer)
  handle(:guard, :"Reference(DogHandler)", :"GuardId.i", :"GuardId.u")
  handle(:target, :"Reference(Object)", :"TargetObjectId.i", :"TargetObjectId.u")
end
