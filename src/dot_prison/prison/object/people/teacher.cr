class DotPrison::Prison::Object::Teacher < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:external, :Bool, :IsExternalTeacher)
end
