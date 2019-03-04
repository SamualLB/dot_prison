abstract class DotPrison::Prison::StoreConsumer
  HANDLED_PROPERTIES = [] of Nil

  macro inherited
    HANDLED_PROPERTIES = [] of NamedTuple(property: Symbol, type: String, keys: Array(Symbol), parser: Nil, unparser: Nil)

    macro handle(prop, typ, k)
      \{% HANDLED_PROPERTIES << {property: prop, type: typ, keys: [k], parser: nil, unparser: nil} %}
    end

    macro custom_handle(property, type, parser, unparser, *keys)
      \{% HANDLED_PROPERTIES << {property: property, type: type, keys: keys.to_a, parser: parser, unparser: unparser} %}
    end

    macro finished
      \{% for props in HANDLED_PROPERTIES %}
         property! \{{props[:property].id}} : \{{props[:type]}}
      \{% end %}

      def initialize(store : Store)
        \{% for props in HANDLED_PROPERTIES %}
          \{% if !props[:parser] %}
            \{% type = props[:type].resolve %}
            \{% if type == String %}
               @\{{props[:property].id}} = store.parse_string(\{{props[:keys][0]}})
            \{% elsif type == Int32 %}
               @\{{props[:property].id}} = store.parse_int(\{{props[:keys][0]}})
            \{% elsif type == Float64 %}
               @\{{props[:property].id}} = store.parse_float(\{{props[:keys][0]}})
            \{% elsif type == Bool %}
               @\{{props[:property].id}} = store.parse_float(\{{props[:keys][0]}})
            \{% else %}
               \{{props[:type].class_name}}
              \{{props[:parser]}}(store)
            \{% end %}
          \{% end %}
        \{% end %}
      end
    end
  end
end

# handle(:test, String, :Test)
# handle(:other_test, :OtherTest, Nil, handler: :parse_other)
# custom_handle(:orientation, Float64?)
