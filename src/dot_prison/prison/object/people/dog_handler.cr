class DotPrison::Prison::Object::DogHandler < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include StaffNeeds
  include PatrolProperties
  include Orientation
  include EquipmentProperties
  include ArmourProperties
  include Carrying

  handle(:dog, :"Reference(Dog)", :"DogId.i", :"DogId.u")
  handle(:dog_leashed, :Bool, :DogLeashed)
  handle(:dog_resting, :Bool, :DogResting)
end
