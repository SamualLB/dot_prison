class DotPrison::Prison::Object::StatusLight < DotPrison::Prison::Object
  include ObjectProperties
  include Powered
  include Trigger

  def initialize(store : Store, prison : Prison)
    super
  end
end
