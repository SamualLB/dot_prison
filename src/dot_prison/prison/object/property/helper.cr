module DotPrison::Prison::Object::Property::Helper
  protected def parse_string(store : Store, key : String, default_value : String? = nil) : String?
    val = store[key]?
    unless val.is_a?(String)
      DotPrison.logger.debug("Unset value #{key} in #{store}")
      return default_value
    end
    val
  end

  protected def parse_integer(store : Store, key : String, default_value : Int32 = 0) : Int32
    str_val = parse_string(store, key) || ""
    int_val = str_val.to_i?
    unless int_val
      DotPrison.logger.debug "Invalid integer #{str_val} for #{key}"
      return default_value
    end
    int_val
  end

  protected def parse_float(store : Store, key : String, default_value : Float64 = 0.0) : Float64
    str_val = parse_string(store, key) || ""
    flt_val = str_val.to_f?
    unless flt_val
      DotPrison.logger.debug "Invalid float #{str_val} for #{key}"
      return default_value
    end
    flt_val
  end

  protected def parse_bool(store : Store, key : String) : Bool
    str_val = parse_string(store, key) || ""
    str_val == "true" ? true : false
  end
end
