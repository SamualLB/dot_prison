class DotPrison::Prison::Object::Sniper < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation
  include Velocity
  include StaffNeeds

  handle(:tower, :"Reference(GuardTower)", :"TowerId.i", :"TowerId.u")
end
