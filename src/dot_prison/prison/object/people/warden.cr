class DotPrison::Prison::Object::Warden < DotPrison::Prison::Object
  include Orientation

  def initialize(prison : Prison, store : Store)
    super
    puts "#{@or_x}, #{@or_y}"
    puts orientation
  end
end
