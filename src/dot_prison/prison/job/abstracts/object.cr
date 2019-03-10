module DotPrison::Prison::Job::Object
  macro included
    handle(:object, :"Reference(Object)", :"ObjAssigned.i", :"ObjAssigned.u")
  end
end
