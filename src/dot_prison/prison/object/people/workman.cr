class DotPrison::Prison::Object::Workman < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation
  include EmptyNeeds
  include Job
  include Carrying

  def initialize(store : Store, prison : Prison)
    super
  end
end
