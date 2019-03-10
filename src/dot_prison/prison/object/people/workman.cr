class DotPrison::Prison::Object::Workman < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation
  include EmptyNeeds
  include Job
  include Carrying
end
