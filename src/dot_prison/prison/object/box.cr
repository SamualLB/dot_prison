class DotPrison::Prison::Object::Box < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:contents, :String, :Contents)
  handle(:opened, :Bool, :Opened)

  def initialize(store : Store, prison : Prison)
    super
  end
end
