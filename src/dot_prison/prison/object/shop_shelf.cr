class DotPrison::Prison::Object::ShopShelf < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  handle(:stock, :Int32, :Stock)
end
