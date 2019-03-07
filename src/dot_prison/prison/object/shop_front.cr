class DotPrison::Prison::Object::ShopFront < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  handle(:operator_present, :Bool, :OperatorPresent)
  handle(:open, :Bool, :Open)
  handle(:shop, :"Reference(Room)", :"ShopId.i", :"ShopId.u")
  handle(:cash_stored, :Int32, :CashStored)
end
