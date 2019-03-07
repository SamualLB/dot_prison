class DotPrison::Prison::Object::Teacher < DotPrison::Prison::Object
  include ObjectProperties

  handle(:external, :Bool, :IsExternalTeacher)
end
