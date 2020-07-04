# A struct that provides access to a table
#
# The #consume macro is used to specify the method name,
# type, as well as the key(s) from the table
#
# A consumer is simply an access layer to the table, so data
# is not fully copied
abstract struct DotPrison::Consumer
  abstract def table : DotPrison::Table

  macro inherited
    getter table : DotPrison::Table

    def initialize(@table : DotPrison::Table)
    end

    # :nodoc:
    HANDLED_PROPERTIES = [] of Symbol

    # :nodoc:
    macro consume(prop, typ, *keys)
      \{% for k in keys %}
         \{% HANDLED_PROPERTIES << k %}
      \{% end %}

      \{% res = typ.resolve %}
      \{% if res == String %}
         def \{{prop.id}} : String
           table.parse_string \{{keys[0]}}, ""
         end
         def \{{prop.id}}=(v : String)
           table[\{{keys[0]}}] = v
         end
      \{% elsif res == Int32 %}
         def \{{prop.id}} : Int32
           table.parse_int \{{keys[0]}}
         end
         def \{{prop.id}}=(v : Int)
           table[\{{keys[0]}}] = v.to_s
         end
      \{% elsif res == Float64 %}
         def \{{prop.id}} : Float64
           table.parse_int \{{keys[0]}}
         end
         def \{{prop.id}}=(v : Float)
           table[\{{keys[0]}}] = v.to_s
         end
         def \{{prop.id}}=(v : Int)
            table[\{{keys[0]}}] = v.to_s
         end
      \{% elsif res == Bool %}
         def \{{prop.id}} : Bool
           table.parse_bool \{{keys[0]}}
         end
         def \{{prop.id}}=(v : Bool)
           table[\{{keys[0]}}] = v.to_s
         end
      \{% elsif res == Tuple(Int32, Int32) %}
         def \{{prop.id}} : Tuple(Int32, Int32)
           {table.parse_int(\{{keys[0]}}), table.parse_int(\{{keys[1]}})}
         end
         def \{{prop.id}}=(v : Tuple(Int32, Int32))
           table[\{{keys[0]}}] = v[0].to_s
           table[\{{keys[1]}}] = v[1].to_s
         end
      \{% elsif res == Tuple(Float64, Float64) %}
         def \{{prop.id}} : Tuple(Float64, Float64)
           {table.parse_float(\{{keys[0]}}), table.parse_float(\{{keys[1]}})}
         end
         def \{{prop.id}}=(v : Tuple(Float, Float))
           table[\{{keys[0]}}] = v[0].to_s
           table[\{{keys[1]}}] = v[1].to_s
         end
      \{% elsif res < Array %}
         def \{{prop.id}} : DotPrison::ArrayTable(\{{res.type_vars[0]}})
           DotPrison::ArrayTable(\{{res.type_vars[0]}}).new(table.parse_table(\{{keys[0]}}))
         end
      \{% elsif res < DotPrison::Consumer %}
         def \{{prop.id}} : \{{res}}
           \{{res}}.new(table.parse_table(\{{keys[0]}}))
         end
      \{% elsif res == DotPrison::Table %}
         def \{{prop.id}} : DotPrison::Table
           table.parse_table \{{keys[0]}}
         end
      \{% else %}
         \{% raise "Cannot consume type #{res}" %}
      \{% end %}
    end

    # :nodoc:
    macro consume(key)
      \{% HANDLED_PROPERTIES << key %}
    end

    # :nodoc:
    macro consume(key1, key2)
      \{%
        HANDLED_PROPERTIES << key1
        HANDLED_PROPERTIES << key2
        %}
    end

    # Keys for the associated table that have not been consumed
    #
    # This may be because they have not been implemented yet,
    # they may have an unknown purpose, or could be part of an
    # unsupported mod
    def unconsumed : Array(String)
      out = [] of String
      sorted = HANDLED_PROPERTIES.sort
      table.each do |k, v|
        found = sorted.each do |s|
          break true if s.to_s == k.to_s
          false
        end
        out << k.to_s unless found
      end
      out
    end
  end
end
