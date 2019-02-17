module DotPrison::Prison::Object::Rotation
  @rotation : Direction = Direction::Down

  def initialize(prison : Prison, store : Store)
    super
    or_x = store.parse_float("Or.x")
    or_y = store.parse_float("Or.y")
    @rotation = parse_rotation(or_x, or_y)
  end

  def parse_rotation(x, y) : Direction
    #0, 0          => Down
    #-1. -EPSILON  => Left
    #0, -1         => Up
    #1, +EPSILON   => Right
    if x.abs <= Float64::EPSILON*2
      if y.abs <= Float64::EPSILON*2
        Direction::Up
      elsif y.abs >= 1.0-Float64::EPSILON*2
        Direction::Down
      else
        raise "Orientation not in range for Rotation: #{x}, #{y}"
      end
    elsif x <= -1.0+Float64::EPSILON*2
      Direction::Left
    elsif x >= 1.0-Float64::EPSILON*2
      Direction::Right
    else
      raise "Orientation not in range for Rotation: #{x}, #{y}"
    end
  end

  enum Direction
    Down
    Left
    Up
    Right
  end
end
