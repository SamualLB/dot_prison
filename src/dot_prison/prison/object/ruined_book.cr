class DotPrison::Prison::Object::RuinedBook < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:garbage, :Bool, :Garbage)
end
