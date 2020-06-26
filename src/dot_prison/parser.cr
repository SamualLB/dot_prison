class DotPrison::Parser
  def initialize(string_or_io : String | IO)
    @lexer = Lexer.new(string_or_io)
    next_token
  end

  private delegate token, to: @lexer
  private delegate next_token, to: @lexer

  def parse
    Log.debug { "Starting .prison parse" }
    parse_store
  end

  private def parse_key : String
    token.value
  end

  # Read a String value
  private def parse_text : String
    next_token.value
  end

  # Read a Store, BEGIN to END
  private def parse_store : Store
    store = Store.new
    until token.type == :END || token.type == :EOF
      case token.type
      when :TEXT
        key = parse_key
        val = parse_text
        Log.debug { "Parsed text: \"#{key}\": \"#{val}\"" }
        # Check for duplicate key, store in array if duplicated
        if store[key]?
          # Duplicate key
          old_val = store[key]
          case old_val
          when String then store[key] = [store[key].as(String)] of String
          when Array(String) then nil
          else raise "Mixing string and store array"
          end
          store[key].as(Array(String)) << val
        else
          store[key] = val
        end
        next_token
      when :BEGIN
        next_token
        key = parse_key
        next_token
        val = parse_store
        Log.debug { "Parsed store: \"#{key}\": #{val.size} items" }
        if store[key]?
          # Duplicate key
          old_val = store[key]
          case old_val
          when Store then store[key] = [old_val] of Store
          when Array(Store) then nil
          else raise "Mixing store and string array"
          end
          store[key].as(Array(Store)) << val
        else
          store[key] = val
        end
        next_token
      when :EOF
        raise "Reached EOF without END"
      end
    end
    store
  end
end
