class DotPrison::Prison::Object::Sniper < DotPrison::Prison::Object
  include ObjectProperties

  handle(:tower, :"Reference(GuardTower)", :"TowerId.i", :"TowerId.u")
end
