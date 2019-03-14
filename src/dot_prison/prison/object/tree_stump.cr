class DotPrison::Prison::Object::TreeStump < DotPrison::Prison::Object
  include ObjectProperties

  handle(:lifetime, :Float64, :Lifetime)

  def initialize(store : Store, prison : Prison)
    super
  end
end
