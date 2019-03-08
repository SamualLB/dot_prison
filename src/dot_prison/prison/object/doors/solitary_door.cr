class DotPrison::Prison::Object::SolitaryDoor < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  handle(:cell, :"Reference(Room)", :"CellId.i", :"CellId.u")
end
