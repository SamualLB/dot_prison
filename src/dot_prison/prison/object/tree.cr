class DotPrison::Prison::Object::Tree < DotPrison::Prison::Object
  HANDLED_PROPERTIES.push "Age"

  property age : Float64

  def initialize(prison : Prison, store : Store)
    super
    @age = store.parse_float("Age")
  end
end
