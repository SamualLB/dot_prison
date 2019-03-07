class DotPrison::Prison::Object::Box < DotPrison::Prison::Object
  include ObjectProperties
  @contents : Object? = nil

  def initialize(store : Store, prison : Prison)
    init_store(store, prison)
    parse_contents(store)
  end

  protected def parse_contents(store : Store)
    str = store.parse_string("Contents")
  end
end
