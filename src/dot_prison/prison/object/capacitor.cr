class DotPrison::Prison::Object::Capacitor < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include Powered

  def initialize(store : Store, prison : Prison)
    super
  end
end
