module DotPrison::Prison::Object::Orientation
  macro included
    handle(:or_x, :Float64, :"Or.x")
    handle(:or_y, :Float64, :"Or.y")
  end

  @orientation : Float64? = nil

  def orientation : Float64
    @orientation ||= Orientation.find_angle(or_x, or_y)
  end

  def orientation=(new_o : Float64)
    @orientation = new_o
    @or_x, @or_y = Orientation.convert_angle(new_o)
  end

  def orientation_x=(new : Float64)
    @or_x = new
    @orientation = nil
  end

  def orientation_y=(new : Float64)
    @or_y = new
    @orientation = nil
  end

  def orientation=(new : Tuple(Float64, Float64))
    @or_x = new[0]
    @or_y = new[1]
    @orientation = nil
  end

  # Parse PA x, y format to 0..2PI radians
  #
  # From top of screen clockwise
  protected def self.find_angle(x, y)
    res = Math.atan2(x, -y)
    res += 2*Math::PI if res < 0.0
    res
  end

  # Convert back to PA format
  protected def self.convert_angle(ang) : Tuple(Float64, Float64)
    {Math.sin(ang), -Math.cos(ang)}
  end
end
