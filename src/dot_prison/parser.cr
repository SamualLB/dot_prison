class DotPrison::Parser
  def initialize(string_or_io : String | IO)
    @lexer = Lexer.new(string_or_io)
    next_token
  end

  private delegate token, to: @lexer
  private delegate next_token, to: @lexer

  def parse
    Log.debug { "Starting .prison parse" }
    parse_store ""
  end

  # Read a Key: Value pair
  private def parse_text : {String, String}
    {token.value, next_token.value}
  end

  private def parse_store : Store
    name = next_token.value
    next_token
    parse_store(name)
  end

  private def parse_store(store_name : String) : Store
    Log.debug { "New store: #{store_name}" }
    store = Store.new
    store.name = store_name
    until token.type == :END || token.type == :EOF
      case token.type
      when :TEXT
        tmp = parse_text
        Log.debug { "Parsed text: \"#{tmp[0]}\": \"#{tmp[1]}\"" }
        # Check for duplicate key, store in array if duplicated
        if store[tmp[0]]?
          # Duplicate key
          old_val = store[tmp[0]]
          case old_val
          when String then store[tmp[0]] = [store[tmp[0]].as(String)] of String
          when Array(String) then nil
          else raise "Mixing string and store array"
          end
          store[tmp[0]].as(Array(String)) << tmp[1]
        else
          store[tmp[0]] = tmp[1]
        end
      when :BEGIN
        tmp = parse_store
        if store[tmp.name]?
          # Duplicate key
          old_val = store[tmp.name]
          case old_val
          when Store then store.content[tmp.name] = [old_val] of Store
          when Array(Store) then nil
          else raise "Mixing store and string array"
          end
          store[tmp.name].as(Array(Store)) << tmp
        else
          store[tmp.name] = tmp
        end
      when :EOF
        raise "Reached EOF without END"
      end
      next_token
    end
    store
  end
end
