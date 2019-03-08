class DotPrison::Prison::Object::MetalDetector < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include Powered

  handle(:alarm, :Float64, :Alarm)
end
