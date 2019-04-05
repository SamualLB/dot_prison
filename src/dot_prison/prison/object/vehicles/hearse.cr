class DotPrison::Prison::Object::Hearse < DotPrison::Prison::Object
  include ObjectProperties
  include StateProperties

  handle(:sound_state, :Int32, :SoundState)
  handle(:wait_timer, :Float64, :WaitTimer)
  handle(:processing_room, :"Reference(Room)", :"ProcessingRoomId.i", :"ProcessingRoomId.u")

  def initialize(store : Store, prison : Prison)
    super
  end
end
