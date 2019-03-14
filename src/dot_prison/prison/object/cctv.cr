class DotPrison::Prison::Object::CCTV < DotPrison::Prison::Object
  include ObjectProperties
  include Rotation
  include WallContact
  include Powered
  include Trigger

  handle(:active, :Bool, :Active)
  handle(:rotate_direction, :Float64, :RotateDir)
  handle(:wall_check_timer, :Float64, :WallCheckTimer)

  def initialize(store : Store, prison : Prison)
    super
  end
end
