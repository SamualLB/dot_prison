class DotPrison::Prison::Object::Foreman < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include RestStateProperties
  include Office
  include Orientation
  include EquipmentProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
