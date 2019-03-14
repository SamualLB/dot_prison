class DotPrison::Prison::Object::PoolTable < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
