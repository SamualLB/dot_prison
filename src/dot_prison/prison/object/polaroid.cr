class DotPrison::Prison::Object::Polaroid < DotPrison::Prison::Object
  include ObjectProperties

  handle(:birth_time, :Float64, :BirthTime)
  handle(:index, :Int32, :PolaroidIndex)
  handle(:garbage, :Bool, :Garbage)

  def initialize(store : Store, prison : Prison)
    super
  end
end
