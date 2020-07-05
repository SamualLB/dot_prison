# AKA a Lua table / HashMap. String keys to String or Table values. Values can also be arrays
# of Strings or Tables.
class DotPrison::Table
  private alias InnerType = Hash(String, DotPrison::Table | Array(DotPrison::Table) | String | Array(String))

  @content = InnerType.new

  # Return the `String` at `key`. On non-String or missing value, returns `default_value`
  def parse_string(key : String | Symbol, default_value : String = "") : String
    ret = @content[key.to_s]?
    return ret if ret.is_a? String
    default_value
  end

  # Return the `String` at `key` or `nil` on non-String or missing
  def parse_string?(key : String | Symbol) : String?
    ret = @content[key.to_s]?
    return ret if ret.is_a? String
    nil
  end

  # Return the `String` at `key` or `KeyError` on non-String or missing
  def parse_string!(key : String | Symbol) : String
    ret = @content[key.to_s]
    return ret if ret.is_a? String
    raise KeyError.new("Non-string value #{ret} (#{ret.class}) for \"#{key}\"")
  end

  # Return the `Table` at `key`. On non-Table or missing value, sets and returns
  # a new `Table`
  def parse_table(key : String | Symbol) : Table
    ret = @content[key.to_s]?
    return ret if ret.is_a? Table
    @content[key.to_s] = Table.new
  end

  # Return the `Table` at `key` or `nil` on non-Table or missing
  def parse_table?(key : String | Symbol) : Table?
    ret = @content[key.to_s]?
    return ret if ret.is_a? Table
    nil
  end

  # Return the `Table` at `key` or `KeyError` on non-String or missing
  def parse_table!(key : String | Symbol) : Table
    ret = @content[key.to_s]
    return ret if ret.is_a? Table
    raise KeyError.new("Non-table value #{ret} (#{ret.class}) for \"#{key}\"")
  end

  # Return the `Int32` at `key`. On non-Int or missing value, returns `default_value`
  def parse_int(key : String | Symbol, default_value : Int32 = 0) : Int32
    str_val = parse_string?(key)
    return default_value unless str_val.is_a? String
    int_val = str_val.to_i?
    return default_value unless int_val
    int_val
  end

  # Return the `Int32` at `key` or `nil` on non-Int or missing
  def parse_int?(key : String | Symbol) : Int32?
    str_val = parse_string?(key)
    return nil unless str_val.is_a? String
    int_val = str_val.to_i?
    return nil unless int_val
    int_val
  end

  # Return the `Int32` at `key` or raises KeyError on non-Int or missing
  def parse_int!(key : String | Symbol) : Int32
    str_val = parse_string!(key)
    int_val = str_val.to_i?
    return int_val if int_val
    raise KeyError.new("Non-Int value #{str_val} (#{str_val.class}) for \"#{key}\"")
  end

  # Return the `Float64` at `key`. On non-Float or missing value, returns `default_value`
  def parse_float(key : String | Symbol, default_value : Float64 = 0.0) : Float64
    str_val = parse_string?(key)
    return default_value unless str_val.is_a? String
    flt_val = str_val.to_f?
    return default_value unless flt_val
    flt_val
  end

  # Return the `Float64` at `key` or `nil` on non-Float or missing
  def parse_float?(key : String | Symbol) : Float64?
    str_val = parse_string?(key)
    return nil unless str_val.is_a? String
    flt_val = str_val.to_f?
    return nil unless flt_val
    flt_val
  end

  # Return the `Float64` at `key` or raises KeyError on non-Float or missing
  def parse_float!(key : String | Symbol) : Float64
    str_val = parse_string!(key)
    flt_val = str_val.to_f?
    return flt_val if flt_val
    raise KeyError.new("Non-Float value #{str_val} (#{str_val.class}) for \"#{key}\"")
  end

  # Return the `Bool` at `key`. On non-Bool or missing value, returns `default_value`
  def parse_bool(key : String | Symbol, default_value : Bool = false) : Bool
    str_val = parse_string?(key)
    return true if str_val == "true"
    return false if str_val == "false"
    default_value
  end

  # Return the `Bool` at `key` or `nil` on non-bool or missing
  def parse_bool?(key : String | Symbol) : Bool?
    str_val = parse_string?(key)
    return true if str_val == "true"
    return false if str_val == "false"
    nil
  end

  # Return the `Bool` at `key` or raises KeyError on non-Bool or missing.
  def parse_bool!(key : String | Symbol) : Bool
    str_val = parse_string!(key)
    return true if str_val == "true"
    return false if str_val == "false"
    raise KeyError.new("Non-Bool value #{str_val} (#{str_val.class}) for \"#{key}\"")
  end

  # Return the `Array(String)` at `key`. On String value, replaces the value with
  # a Array(String) containing the String. On invalid or missing values, a new
  # `Array(String)` is set and returned.
  def parse_string_array(key : String | Symbol) : Array(String)
    arr = @content[key.to_s]?
    case arr
    when Array(String) then arr
    when String        then @content[key.to_s] = [arr] of String
    else                    @content[key.to_s] = [] of String
    end
  end

  # Return the `Array(String)` at `key`. On String, replaces with an `Array(String)`
  # Returns nil on other values or missing.
  def parse_string_array?(key : String | Symbol) : Array(String)?
    arr = @content[key.to_s]?
    case arr
    when Array(String) then arr
    when String        then @content[key.to_s] = [arr] of String
    else                    nil
    end
  end

  # Return the `Array(String)` at `key`. On String, replaces with an `Array(String)`.
  # Raises `KeyError` on other values or missing.
  def parse_string_array!(key : String | Symbol) : Array(String)
    arr = @content[key.to_s]
    case arr
    when Array(String) then arr
    when String        then @content[key.to_s] = [arr] of String
    else raise KeyError.new("Non-String Array value #{arr} (#{arr.class}) for \"#{key}\"")
    end
  end

  # Return the `Array(Table)` at `key`. On single Table, replaces the value
  # with a Array(Table) containing the Table. On invalid or missing values,
  # a new `Array(Table)` is set and returned
  def parse_table_array(key : String | Symbol) : Array(Table)
    arr = @content[key.to_s]?
    case arr
    when Array(Table) then arr
    when Table        then @content[key.to_s] = [arr] of Table
    else                   @content[key.to_s] = [] of Table
    end
  end

  # Return the `Array(Table)` at `key`. On Table, replaces with an `Array(Table)`.
  # Returns nil on other values or missing
  def parse_table_array?(key : String | Symbol) : Array(Table)?
    arr = @content[key.to_s]?
    case arr
    when Array(Table) then arr
    when Table        then @content[key.to_s] = [arr] of Table
    else                   nil
    end
  end

  # Return the `Array(Table)` at `key`. On Table, replaces with an `Array(Table)`.
  # Raises `KeyError` on other values or missing
  def parse_table_array!(key : String | Symbol) : Array(Table)
    arr = @content[key.to_s]
    case arr
    when Array(Table) then arr
    when Table        then @content[key.to_s] = [arr] of Table
    else raise KeyError.new("Non-Table Array value #{arr} (#{arr.class}) for \"#{key}\"")
    end
  end

  def ==(other : self)
    self.@content == other.@content
  end

  def []=(k : Symbol, v)
    @content[k.to_s] = v
  end

  delegate :[]?, :[], :[]=, size, empty?, each, to: @content
end
