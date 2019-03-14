class DotPrison::Prison::Object::PowerSwitch < DotPrison::Prison::Object
  include ObjectProperties
  include Powered
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
