class DotPrison::Prison::Object::LicensePlateBlank < DotPrison::Prison::Object
  include ObjectProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
