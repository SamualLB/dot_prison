class DotPrison::Prison::Object::Sniper < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation
  include StaffNeeds
  include EquipmentProperties

  handle(:tower, :"Reference(GuardTower)", :"TowerId.i", :"TowerId.u")
  handle(:search_timer, :Float64, :SearchTimer)
end
