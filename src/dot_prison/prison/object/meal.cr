class DotPrison::Prison::Object::Meal < DotPrison::Prison::Object
  NO_SLOTS = 2

  include ObjectProperties
  include Slot
  include Orientation

  handle(:quantity, :Float64, :Quantity)
  handle(:staff_meal, :Bool, :StaffMeal)
  handle(:current_food_item, :Int32, :CurrentFoodItem)
end
