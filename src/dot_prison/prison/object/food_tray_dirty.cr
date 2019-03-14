class DotPrison::Prison::Object::FoodTrayDirty < DotPrison::Prison::Object
  NO_SLOTS = 2

  include ObjectProperties
  include Slot
  include Orientation

  handle(:staff_meal, :Bool, :StaffMeal)
  handle(:quantity, :Float64, :Quantity)
  handle(:current_food_item, :Int32, :CurrentFoodItem)
  handle(:loaded, :Bool, :Loaded)
  handle(:carrier, :"Reference(Object)", :"CarrierId.i", :"CarrierId.u")

  def initialize(store : Store, prison : Prison)
    super
  end
end
