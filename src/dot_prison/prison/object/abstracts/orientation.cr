module DotPrison::Prison::Object::Orientation

  @or_x = 0.0
  @or_y = 0.0
  @orientation : Float64? = nil

  def initialize(prison : Prison, store : Store)
    super
    @or_x = store.parse_float("Or.x")
    @or_y = store.parse_float("Or.y")
  end

  # Angle between 0 and 2 PI radians from top
  def orientation : Float64
    @orientation ||= find_angle(@or_x, @or_y) / Math::PI
  end

  private def find_angle(x, y)
    res = Math.atan2(x, -y)
    res += 2*Math::PI if res < 0.0
    res
  end

  # Needs to be in radians... not PI radians
  def convert_angle(ang)
    {Math.sin(ang), -Math.cos(ang)}
  end
end
