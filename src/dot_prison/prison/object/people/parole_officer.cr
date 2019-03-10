class DotPrison::Prison::Object::ParoleOfficer < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include EmptyNeeds
  include ExternalTeacher
  include Rotation
end
