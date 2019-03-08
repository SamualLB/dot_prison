class DotPrison::Prison::Object::Garbage < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation
  
  handle(:weight, :Float64, :Weight)
  handle(:garbage, :Bool, :Garbage)
  handle(:age, :Float64, :Age)
end
