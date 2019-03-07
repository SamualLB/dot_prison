class DotPrison::Prison::Object::DogCrate < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  handle(:occupied, :Int32, :Occupied)
  handle(:occupier, :"Reference(Dog)", :"Occupier.i", :"Occupier.u")
  
end
