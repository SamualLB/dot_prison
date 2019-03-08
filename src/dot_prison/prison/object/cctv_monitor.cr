class DotPrison::Prison::Object::CCTVMonitor < DotPrison::Prison::Object
  include ObjectProperties
  include Powered

  handle(:guard_operating, :Bool, :GuardOperating)
end
