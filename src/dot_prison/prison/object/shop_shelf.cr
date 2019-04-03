class DotPrison::Prison::Object::ShopShelf < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include StoredObject

  handle(:stock, :Int32, :Stock)

  def initialize(store : Store, prison : Prison)
    super
  end
end
