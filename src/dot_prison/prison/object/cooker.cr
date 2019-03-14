class DotPrison::Prison::Object::Cooker < DotPrison::Prison::Object
  include ObjectProperties
  include Powered
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
