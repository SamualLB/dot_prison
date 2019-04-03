class DotPrison::Prison::Object::Psychologist < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include RestStateProperties
  include Orientation
  include Office

  def initialize(store : Store, prison : Prison)
    super
  end
end
