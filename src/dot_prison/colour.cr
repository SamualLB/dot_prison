struct DotPrison::Colour
  # :nodoc:
  GROUP_REGEX = /^0x([a-f0-9]{2})([a-f0-9]{2})([a-f0-9]{2})([a-f0-9]{2})$/
  
  # Red value 0..255
  getter r : UInt8
  # Green value 0..255
  getter g : UInt8
  # Blue value 0..255
  getter b : UInt8
  # Alpha value 0..255
  getter a : UInt8

  # Create by specifying the red, green, blue, and optionally alpha values
  def initialize(r, g, b, a = 255)
    @r = (r % 256).to_u8
    @g = (g % 256).to_u8
    @b = (b % 256).to_u8
    @a = (a % 256).to_u8
  end

  def to_s(io : IO)
    io << "0x"
    s = @r.to_s(16)
    io << '0' if s.size < 2
    io << s
    s = @g.to_s(16)
    io << '0' if s.size < 2
    io << s
    s = @b.to_s(16)
    io << '0' if s.size < 2
    io << s
    s = @a.to_s(16)
    io << '0' if s.size < 2
    io << s
  end

  # Create from the stored value, or nil on invalid values
  def self.parse(str : String) : self?
    return nil unless (res = GROUP_REGEX.match(str))
    Colour.new(res[1].to_u8(16), res[2].to_u8(16), res[3].to_u8(16), res[4].to_u8(16))
  end
end
