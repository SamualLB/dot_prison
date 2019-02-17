class DotPrison::Prison::Object::Chair < DotPrison::Prison::Object
  include Rotation
  def initialize(prison : Prison, store : Store)
    super
  end
end
