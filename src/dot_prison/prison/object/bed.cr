class DotPrison::Prison::Object::Bed < DotPrison::Prison::Object
  include Rotation

  def initialize(prison : Prison, store : Store)
    super
  end
end
