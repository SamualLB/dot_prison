class DotPrison::Prison::Object::AppealsLawyer < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation
  include ExternalTeacher
  include EmptyNeeds

  def initialize(store : Store, prison : Prison)
    super
  end
end
