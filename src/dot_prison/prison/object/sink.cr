class DotPrison::Prison::Object::Sink < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Rotation
  include ReferenceSlot

  handle(:clean_timer, :Float64, :CleanTimer)
end
