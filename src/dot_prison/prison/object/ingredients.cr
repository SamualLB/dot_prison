class DotPrison::Prison::Object::Ingredients < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  def initialize(store : Store, prison : Prison)
    super
  end
end
