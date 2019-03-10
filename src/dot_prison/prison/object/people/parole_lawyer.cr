class DotPrison::Prison::Object::ParoleLawyer < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include EmptyNeeds
  include ExternalTeacher
  include Rotation
end
