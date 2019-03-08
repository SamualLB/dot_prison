class DotPrison::Prison::Object::DogHandler < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation
  include Velocity
  include StaffNeeds

  handle(:dog, :"Reference(Dog)", :"DogId.i", :"DogId.u")
  handle(:dog_leashed, :Bool, :DogLeashed)
  handle(:dog_resting, :Bool, :DogResting)
end
