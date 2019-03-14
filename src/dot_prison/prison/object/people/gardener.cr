class DotPrison::Prison::Object::Gardener < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include StaffNeeds
  include Orientation
  include Job

  def initialize(store : Store, prison : Prison)
    super
  end
end
