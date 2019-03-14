class DotPrison::Prison::Object::PrisonerMailOpened < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:remove_timer, :Float64, :RemoveTimer)

  def initialize(store : Store, prison : Prison)
    super
  end
end
