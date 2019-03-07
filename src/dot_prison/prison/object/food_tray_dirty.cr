class DotPrison::Prison::Object::FoodTrayDirty < DotPrison::Prison::Object
  handle(:loaded, :Bool, :Loaded)
  handle(:carrier, :"Reference(Object)", :"CarrierId.i", :"CarrierId.u")

  NO_SLOTS = 2

  include Slot
  include Orientation
end
