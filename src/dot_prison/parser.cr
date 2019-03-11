class DotPrison::Parser
  def initialize(string_or_io : String | IO)
    @lexer = Lexer.new(string_or_io)
    next_token
  end

  private delegate token, to: @lexer
  private delegate next_token, to: @lexer

  def parse
    store = Store.new
    until token.type == :EOF
      case token.type
      when :TEXT
        # Parse K:V
        tmp = parse_text
        store[tmp[0]] = tmp[1]
      when :BEGIN
        # Parse BEGIN
        tmp = parse_store
        store[tmp.name] = tmp
      when :END
        raise "Unexpected END, not inside BEGIN"
      end
      next_token
    end
    store
  end

  # Read a Key: Value pair
  private def parse_text : {String, String}
    {token.value, next_token.value}
  end

  private def parse_store : Store
    store = Store.new
    store.name = next_token.value
    next_token
    until token.type == :END
      case token.type
      when :TEXT
        tmp = parse_text
        # Have to check if key exists to prevent overwrite
        #
        # Prisoner traits are store non-uniquely
        #
        # Store them temporarily with & between
        #
        # ```.prison
        # Traits Violent
        # Traits RisksLife
        # ```
        #
        # Will become
        #
        # ```crystal
        # "Violent&RisksLife"
        # ```
        if store[tmp[0]]?
          # Duplicate key
          old_val = store[tmp[0]]
          if old_val.is_a? String
            store[tmp[0]] = [store[tmp[0]].as(String)] of String
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
          if old_val.is_a? Store
            store.content[tmp.name] = [old_val] of Store
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
