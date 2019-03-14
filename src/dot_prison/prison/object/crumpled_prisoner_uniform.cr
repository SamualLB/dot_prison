class DotPrison::Prison::Object::CrumpledPrisonerUniform < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation

  def initialize(store : Store, prison : Prison)
    super
  end
end
