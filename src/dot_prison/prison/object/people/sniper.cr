class DotPrison::Prison::Object::Sniper < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation
  include Velocity

  handle(:tower, :"Reference(GuardTower)", :"TowerId.i", :"TowerId.u")
end
