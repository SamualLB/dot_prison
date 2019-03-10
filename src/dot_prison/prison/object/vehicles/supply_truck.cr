class DotPrison::Prison::Object::SupplyTruck < DotPrison::Prison::Object
  NO_SLOTS = 8

  include ObjectProperties
  include ReferenceSlot

  handle(:sound_state, :Int32, :SoundState)
  handle(:speed, :Float64, :Speed)
end
