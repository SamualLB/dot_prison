class DotPrison::Prison::Object::CarpenterTable < DotPrison::Prison::Object
  include ObjectProperties
  include Powered

  def initialize(store : Store, prison : Prison)
    super
  end
end
