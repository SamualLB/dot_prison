class DotPrison::Prison::Object::Radio < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
