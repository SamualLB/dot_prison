class DotPrison::Prison::Object::Workman < DotPrison::Prison::Object
  include Orientation
  def initialize(prison : Prison, store : Store)
    super
    puts @or_x
    puts @or_y
    puts orientation
    puts convert_angle(orientation * Math::PI)
    puts ""
  end
end
