class DotPrison::Prison::Object::SolitaryDoor < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include DoorProperties

  handle(:cell, :"Reference(Room)", :"CellId.i", :"CellId.u")
end
