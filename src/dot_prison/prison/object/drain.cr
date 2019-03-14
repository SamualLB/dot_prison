class DotPrison::Prison::Object::Drain < DotPrison::Prison::Object
  include ObjectProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
