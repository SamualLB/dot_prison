class DotPrison::Prison::Object::Workman < DotPrison::Prison::Object
  include Orientation
  def initialize(prison : Prison, store : Store)
    super
  end
end
