class DotPrison::Prison::Object::PrisonerUniform < DotPrison::Prison::Object
  include Orientation

  def initialize(prison : Prison, store : Store)
    super
  end
end
