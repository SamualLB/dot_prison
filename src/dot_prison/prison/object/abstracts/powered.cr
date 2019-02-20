module DotPrison::Prison::Object::Powered
  @powered = false
  @power_on = false

  def initialize(prison : Prison, store : Store)
    super
    @powered = store.parse_bool("Powered")
    @power_on = store.parse_bool("On")
  end
end
