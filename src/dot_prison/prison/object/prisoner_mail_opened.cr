class DotPrison::Prison::Object::PrisonerMailOpened < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:remove_timer, :Float64, :RemoveTimer)
end
