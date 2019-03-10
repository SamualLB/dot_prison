class DotPrison::Prison::Object::Teacher < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation
  include EmptyNeeds

  handle(:external, :Bool, :IsExternalTeacher)
end
