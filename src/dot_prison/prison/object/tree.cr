class DotPrison::Prison::Object::Tree < DotPrison::Prison::Object
  include ObjectProperties

  handle(:age, :Float64, :Age)

  def initialize(store : Store, prison : Prison)
    super
  end
end
