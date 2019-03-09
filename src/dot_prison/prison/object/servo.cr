class DotPrison::Prison::Object::Servo < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include Powered
  include Trigger

  handle(:door, :"Reference(Door)", :"Door.i", :"Door.u")
end
