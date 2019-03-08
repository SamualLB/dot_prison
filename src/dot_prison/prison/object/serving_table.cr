class DotPrison::Prison::Object::ServingTable < DotPrison::Prison::Object
  NO_SLOTS = 5

  include ObjectProperties
  include Rotation
  include ReferenceSlot

  handle(:staff_table, :Bool, :StaffTable)
  handle(:serving, :Bool, :Serving)
end
