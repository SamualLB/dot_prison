class DotPrison::Prison::Object::Sprinkler < DotPrison::Prison::Object
  include ObjectProperties
  include WallContact

  handle(:timer, :Float64, :Timer)
end
