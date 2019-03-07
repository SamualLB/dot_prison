class DotPrison::Prison::Object::SolitaryDoor < DotPrison::Prison::Object
  include ObjectProperties

  handle(:cell, :"Reference(Room)", :"CellId.i", :"CellId.u")
end
