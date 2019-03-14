# AKA Notebook page
class DotPrison::Prison::Object::Collectable < DotPrison::Prison::Object
  include ObjectProperties

  def initialize(store : Store, prison : Prison)
    super
  end
end
