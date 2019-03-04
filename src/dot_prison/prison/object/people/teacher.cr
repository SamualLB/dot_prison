class DotPrison::Prison::Object::Teacher < DotPrison::Prison::Object
  HANDLED_PROPERTIES.push "IsExternalTeacher"

  property external : Bool

  def initialize(prison : Prison, store : Store)
    super
    @external = store.parse_bool("IsExternalTeacher")
  end
end
