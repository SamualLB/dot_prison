# AKA Notebook page
class DotPrison::Prison::Object::Collectable < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  def initialize(store : Store, prison : Prison)
    super
  end
end
