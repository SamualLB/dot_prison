class DotPrison::Prison::Object::TV < DotPrison::Prison::Object
  include Powered

  def initialize(prison : Prison, store : Store)
    super
  end
end
