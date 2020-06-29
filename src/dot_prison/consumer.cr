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

      def \{{prop.id}}
        \{% if typ.id == String.id %}
           table.parse_string \{{keys[0]}}, ""
        \{% elsif typ.id == Int32.id %}
           table.parse_int \{{keys[0]}}
        \{% elsif typ.id == Float64.id %}
           table.parse_float \{{keys[0]}}
        \{% elsif typ.id == Bool.id %}
           table.parse_bool \{{keys[0]}}
        \{% elsif typ.id == {Int32, Int32}.id %}
           {table.parse_int(\{{keys[0]}}), table.parse_int(\{{keys[1]}})}
        \{% elsif typ.id == {Float64, Float64}.id %}
           {table.parse_float(\{{keys[0]}}), table.parse_float(\{{keys[1]}})}
        \{% elsif typ.resolve < Array %}
           DotPrison::ArrayTable(\{{typ.resolve.type_vars[0]}}).new(table.parse_table(\{{keys[0]}}))
        \{% elsif typ.resolve == DotPrison::Table %}
           table.parse_table(\{{keys[0]}})
        \{% elsif typ.resolve < DotPrison::Consumer %}
           \{{typ}}.new(table.parse_table(\{{keys[0]}}))
        \{% else %}
           \{% puts typ %}
           \{% raise "Unhandled type for DotPrison::Consumer" %}
        \{% end %}
      end
    end

    # :nodoc:
    macro consume_array(prop, typ, key)
      consume(key)
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
