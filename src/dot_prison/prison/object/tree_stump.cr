class DotPrison::Prison::Object::TreeStump < DotPrison::Prison::Object
  HANDLED_PROPERTIES.push "Lifetime"

  property lifetime : Float64

  def initialize(prison : Prison, store : Store)
    super
    @lifetime = store.parse_float("Lifetime")
  end
end
