module DotPrison::Prison::Object::DoorCell
  macro included
    handle :cell, :"Reference(Room)", :"CellId.i", :"CellId.u"
  end
end
