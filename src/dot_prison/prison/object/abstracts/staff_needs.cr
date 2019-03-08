module DotPrison::Prison::Object::StaffNeeds
  macro included
    custom_handle(:needs, :Store, :Needs)
  end

  def initialize(store : Store, prison : Prison)
    super
    @needs = store.parse_store(:Needs)
  end
end
