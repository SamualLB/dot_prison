class DotPrison::Prison::Object::DogCrate < DotPrison::Prison::Object
  NO_SLOTS = 1

  include ObjectProperties
  include Rotation
  include ReferenceSlot

  handle(:occupied, :Int32, :Occupied)
  handle(:occupier, :"Reference(Dog)", :"Occupier.i", :"Occupier.u")

  def initialize(store : Store, prison : Prison)
    super
  end
end
