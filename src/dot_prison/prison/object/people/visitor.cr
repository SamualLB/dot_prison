class DotPrison::Prison::Object::Visitor < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:leaving, :Bool, :Leaving)
end
