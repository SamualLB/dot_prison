class DotPrison::Prison::Object::Bed < DotPrison::Prison::Object
  include DotPrison::Prison::Object::Rotation

  def initialize(prison : Prison, store : Store)
    super
  end
end
