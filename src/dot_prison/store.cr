require "json"

struct DotPrison::Store
  alias Type = Hash(String, String | Array(String) | Store | Array(Store))

  property content = Type.new
  property name : String

  def initialize(@name = "")
  end

  def parse_string(key : String | Symbol, default_value : String? = nil) : String?
    key = key.to_s if key.is_a?(Symbol)
    val = @content[key]?
    unless val.is_a?(String)
      #DotPrison.logger.debug "Unset value #{key} in #{self}"
      return default_value
    end
    val
  end

  def parse_store(key : String | Symbol) : Store
    parse_store?(key) || Store.new
  end

  def parse_store?(key : String | Symbol) : Store?
    key = key.to_s if key.is_a?(Symbol)
    val = @content[key]?
    return val if val.is_a?(Store)
    nil
  end

  def parse_int(key : String | Symbol, default_value : Int32 = 0) : Int32
    str_val = parse_string(key, "")
    int_val = str_val.to_i?
    unless int_val
      #DotPrison.logger.debug "Invalid int #{str_val} for #{key}"
      return default_value
    end
    int_val
  end

  def parse_float(key : String | Symbol, default_value : Float64 = 0.0) : Float64
    str_val = parse_string(key, "")
    flt_val = str_val.to_f?
    unless flt_val
      #DotPrison.logger.debug "Invalid float #{str_val} for #{key}"
      return default_value
    end
    flt_val
  end

  def parse_bool(key : String | Symbol) : Bool
    str_val = parse_string(key, "")
    str_val == "true"
  end

  def parse_string_array(key : String | Symbol) : Array(String)
    key = key.to_s if key.is_a? Symbol
    val = @content[key]?
    case val
    when String        then [val]
    when Array(String) then val
    else                    [] of String
    end
  end

  def parse_store_array(key : String | Symbol) : Array(Store)
    key = key.to_s if key.is_a? Symbol
    val = @content[key]?
    case val
    when Store        then [val]
    when Array(Store) then val
    else                   [] of Store
    end
  end

  def parse_indexed_store(key : String | Symbol | Nil = nil, &block)
    sto = key ? parse_store(key) : self
    size = sto.parse_int(:Size)
    actual_size = 0
    (0...size).each do |i|
      internal = sto.parse_store? "[i #{i}]"
      next unless internal
      yield internal
      actual_size += 1
    end
  end

  def parse_indexed_int(key : String | Symbol) : Array(Store)
    sto = key ? parse_store(key) : self
    size = sto.parse_int(:Size)
    ret = [] of Store
    (0...size).each do |i|
      ret << sto.parse_store "[i #{i}]"
    end
    ret
  end

  def parse_indexed_int(key : String | Symbol, &block)
    sto = key ? parse_store(key) : self
    size = sto.parse_int(:Size)
    actual_size = 0
    (0...size).each do |i|
      yield sto.parse_int "[i #{i}]"
      actual_size += 1
    end
  end

  def parse_indexed_int(key : String | Symbol) : Array(Int32)
    sto = key ? parse_store(key) : self
    size = sto.parse_int(:Size)
    ret = [] of Int32
    (0...size).each do |i|
      ret << sto.parse_int "[i #{i}]"
    end
    ret
  end

  forward_missing_to @content
end
