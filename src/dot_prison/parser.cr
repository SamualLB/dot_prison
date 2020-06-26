class DotPrison::Parser
  def initialize(string_or_io : String | IO)
    @lexer = Lexer.new(string_or_io)
    next_token
  end

  private delegate token, to: @lexer
  private delegate next_token, to: @lexer

  def parse
    Log.debug { "Starting .prison parse" }
    parse_table
  end

  private def parse_key : String
    token.value
  end

  # Read a String value
  private def parse_text : String
    next_token.value
  end

  # Read a map, BEGIN to END
  private def parse_table : Table
    table = Table.new
    until token.type == :END || token.type == :EOF
      case token.type
      when :TEXT
        key = parse_key
        val = parse_text
        Log.debug { "Parsed text: \"#{key}\": \"#{val}\"" }
        # Check for duplicate key, table in array if duplicated
        if table[key]?
          # Duplicate key
          old_val = table[key]
          case old_val
          when String then table[key] = [table[key].as(String)] of String
          when Array(String) then nil
          else raise "Mixing string and table array"
          end
          table[key].as(Array(String)) << val
        else
          table[key] = val
        end
        next_token
      when :BEGIN
        next_token
        key = parse_key
        next_token
        val = parse_table
        Log.debug { "Parsed table: \"#{key}\": #{val.size} items" }
        if table[key]?
          # Duplicate key
          old_val = table[key]
          case old_val
          when Table then table[key] = [old_val] of Table
          when Array(Table) then nil
          else raise "Mixing table and string array"
          end
          table[key].as(Array(Table)) << val
        else
          table[key] = val
        end
        next_token
      when :EOF
        raise "Reached EOF without END"
      end
    end
    table
  end
end
