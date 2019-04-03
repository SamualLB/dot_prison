class DotPrison::Prison::Object::PowerSwitch < DotPrison::Prison::Object
  include ObjectProperties
  include Powered
  include Rotation

  handle :switched, :Bool, :Switch

  def initialize(store : Store, prison : Prison)
    super
  end
end
