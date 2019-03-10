module DotPrison::Prison::Object::EmptyNeeds
  macro included
    custom_handle(:needs, :Store, :Needs)
  end

  def initialize(store : Store, prison : Prison)
    super
    @needs = store.parse_store(:Needs)
  end
end
