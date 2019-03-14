class DotPrison::Prison::Object::RuinedBook < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:garbage, :Bool, :Garbage)

  def initialize(store : Store, prison : Prison)
    super
  end
end
