class DotPrison::Prison::Object::PhoneBooth < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include WallContact
  include Powered
  include Trigger

  def initialize(store : Store, prison : Prison)
    super
  end
end
