abstract struct DotPrison::Consumer
  abstract def store : DotPrison::Store

  macro inherited
    getter store : DotPrison::Store

    def initialize(@store : DotPrison::Store)
    end

    # :nodoc:
    HANDLED_PROPERTIES = [] of Symbol

    # :nodoc:
    macro consume(prop, typ, *keys)
      \{% for k in keys %}
         \{% HANDLED_PROPERTIES << k %}
      \{% end %}

      def \{{prop.id}} : \{{typ}}
        \{% if typ.id == String.id %}
           store.parse_string \{{keys[0]}}, ""
        \{% elsif typ.id == Int32.id %}
           store.parse_int \{{keys[0]}}
        \{% elsif typ.id == Float64.id %}
           store.parse_float \{{keys[0]}}
        \{% elsif typ.id == Bool.id %}
           store.parse_bool \{{keys[0]}}
        \{% elsif typ.id == {Int32, Int32}.id %}
           {store.parse_int(\{{keys[0]}}), store.parse_int(\{{keys[1]}})}
        \{% elsif typ.id == {Float64, Float64}.id %}
           {store.parse_float(\{{keys[0]}}), store.parse_float(\{{keys[1]}})}
        \{% elsif typ.resolve == DotPrison::Store %}
           store.parse_store(\{{keys[0]}})
        \{% elsif typ.resolve < DotPrison::Consumer %}
           \{{typ}}.new(store.parse_store(\{{keys[0]}}))
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

    # Keys for the associated store that have not been consumed
    #
    # This may be because they have not been implemented yet,
    # they may have an unknown purpose, or could be part of an
    # unsupported mod
    def unhandled : Array(String)
      out = [] of String
      sorted = HANDLED_PROPERTIES.sort
      store.each do |k, v|
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
