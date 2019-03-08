class DotPrison::Prison::Object::SupplyTruck < DotPrison::Prison::Object
  include ObjectProperties

  handle(:sound_state, :Int32, :SoundState)
  handle(:speed, :Float64, :Speed)
end
