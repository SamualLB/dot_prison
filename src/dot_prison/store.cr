require "json"

struct DotPrison::Store
  alias Type = Hash(String, String | Store)

  property content = Type.new
  property name : String

  def initialize(@name = "")
  end

  def parse_string(key : String, default_value : String? = nil) : String?
    val = @content[key]?
    unless val.is_a?(String)
      #DotPrison.logger.debug "Unset value #{key} in #{self}"
      return default_value
    end
    val
  end

  def parse_store(key : String) : Store
    parse_store?(key) || Store.new
  end

  def parse_store?(key : String) : Store?
    val = @content[key]?
    return val if val.is_a?(Store)
    nil
  end

  def parse_int(key : String, default_value : Int32 = 0) : Int32
    str_val = parse_string(key, "")
    int_val = str_val.to_i?
    unless int_val
      #DotPrison.logger.debug "Invalid int #{str_val} for #{key}"
      return default_value
    end
    int_val
  end

  def parse_float(key : String, default_value : Float64 = 0.0) : Float64
    str_val = parse_string(key, "")
    flt_val = str_val.to_f?
    unless flt_val
      #DotPrison.logger.debug "Invalid float #{str_val} for #{key}"
      return default_value
    end
    flt_val
  end

  def parse_bool(key : String) : Bool
    str_val = parse_string(key, "")
    str_val == "true"
  end

  forward_missing_to @content
end
