class DotPrison::Prison::Object::UnknownObject < DotPrison::Prison::Object
  include ObjectProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
