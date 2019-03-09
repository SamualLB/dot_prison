module DotPrison::Prison::Object::Office
  macro included
    handle(:office, :"Reference(Room)", :"Office.i", :"Office.u")
  end
end
