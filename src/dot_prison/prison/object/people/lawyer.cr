class DotPrison::Prison::Object::Lawyer < DotPrison::Prison::Object
  include ObjectProperties
  include PeopleProperties
  include Orientation
  include Office
  include EquipmentProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
