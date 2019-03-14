class DotPrison::Prison::Object::Sink < DotPrison::Prison::Object
  NO_SLOTS = 3

  include ObjectProperties
  include Rotation
  include Job
  include ReferenceSlot

  handle(:clean_timer, :Float64, :CleanTimer)

  def initialize(store : Store, prison : Prison)
    super
  end
end
