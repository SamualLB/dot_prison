class DotPrison::Prison::Object::PowerStation < DotPrison::Prison::Object
  include ObjectProperties
  include Powered

  handle(:demand, :Float64, :Demand)
  handle(:capacity, :Int32, :Capacity)

  def initialize(store : Store, prison : Prison)
    super
  end
end
