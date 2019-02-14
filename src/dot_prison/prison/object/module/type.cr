module DotPrison::Prison::Object::Module::Type
  property type : String? = nil
  property sub_type = 0

  def initialize(prison : Prison, store : Store)
    @type = parse_string(store, "Type")
    @sub_type = parse_integer(store, "SubType")
    super
  end
end
