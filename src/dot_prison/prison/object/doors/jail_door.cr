class DotPrison::Prison::Object::JailDoor < DotPrison::Prison::Object
  include ObjectProperties

  handle(:cell, :"Reference(Room)", :"CellId.i", :"CellId.u")
end
