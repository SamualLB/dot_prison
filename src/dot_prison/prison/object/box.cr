class DotPrison::Prison::Object::Box < DotPrison::Prison::Object
  @contents : Object? = nil

  def initialize(prison : Prison, store : Store)
    super
    parse_contents(store)
  end

  protected def parse_contents(store : Store)
    str = store.parse_string("Contents")
  end
end
