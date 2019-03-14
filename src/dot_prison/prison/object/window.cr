class DotPrison::Prison::Object::Window < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
