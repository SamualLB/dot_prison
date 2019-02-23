class DotPrison::Prison::Object::Table < DotPrison::Prison::Object
  include WallContact

  def initialize(prison : Prison, store : Store)
    super
  end
end
