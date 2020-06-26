class DotPrison::Table
  private alias InnerType = Hash(String, DotPrison::Table | Array(DotPrison::Table) | String | Array(String))

  @content = InnerType.new

  def parse_string(key : String | Symbol, default_value : String? = nil) : String?
    key = key.to_s if key.is_a?(Symbol)
    val = @content[key]?
    unless val.is_a?(String)
      #DotPrison.logger.debug "Unset value #{key} in #{self}"
      return default_value
    end
    val
  end

  def parse_table(key : String | Symbol) : Table
    parse_table?(key) || Table.new
  end

  def parse_table?(key : String | Symbol) : Table?
    key = key.to_s if key.is_a?(Symbol)
    val = @content[key]?
    return val if val.is_a?(Table)
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

  def parse_table_array(key : String | Symbol) : Array(Table)
    key = key.to_s if key.is_a? Symbol
    val = @content[key]?
    case val
    when Table        then [val]
    when Array(Table) then val
    else                   [] of Table
    end
  end

  def parse_indexed_table(key : String | Symbol | Nil = nil, &block)
    table = key ? parse_table(key) : self
    size = table.parse_int(:Size)
    actual_size = 0
    (0...size).each do |i|
      internal = table.parse_table? "[i #{i}]"
      next unless internal
      yield internal
      actual_size += 1
    end
  end

  def parse_indexed_table(key : String | Symbol | Nil = nil) : Array(Table)
    table = key ? parse_table(key) : self
    size = table.parse_int(:Size)
    ret = [] of Table
    (0...size).each do |i|
      internal = table.parse_table? "[i #{i}]"
      next unless internal
      ret << internal
    end
    ret
  end

  def parse_indexed_int(key : String | Symbol | Nil = nil, &block)
    sto = key ? parse_table(key) : self
    size = sto.parse_int(:Size)
    actual_size = 0
    (0...size).each do |i|
      yield sto.parse_int "[i #{i}]"
      actual_size += 1
    end
  end

  def parse_indexed_int(key : String | Symbol | Nil = nil) : Array(Int32)
    sto = key ? parse_table(key) : self
    size = sto.parse_int(:Size)
    ret = [] of Int32
    (0...size).each do |i|
      ret << sto.parse_int "[i #{i}]"
    end
    ret
  end

  def ==(other : self)
    self.@content == other.@content
  end

  delegate :[]?, :[], :[]=, size, empty?, to: @content
end
