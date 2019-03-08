abstract class DotPrison::StoreConsumer
  HANDLED_PROPERTIES = [] of Nil

  property unhandled = Store.new

  abstract def init_store(store : Store, prison : Prison?)

  def initialize(store : Store, prison : Prison)
    init_store(store, prison)
  end

  macro inherited
    HANDLED_PROPERTIES = [] of NamedTuple(property: Symbol?, type: Symbol?, keys: Tuple(Symbol) | Tuple(Symbol, Symbol))

    macro handle(prop, typ, k, k2 = :"")
      \{% HANDLED_PROPERTIES << {property: prop, type: typ, keys: {k, k2}} %}
      property! \{{prop.id}} : \{{typ.id}}
    end

    macro custom_handle(property, type, *keys)
      \{% HANDLED_PROPERTIES << {property: property, type: type, keys: keys} %}
      property! \{{property.id}} : \{{type.id}}
    end

    macro no_handle(k, k2 = :"")
      \{% HANDLED_PROPERTIES << {property: nil, type: nil, keys: {k, k2}} %}
    end

    private def find_unhandled(store : Store)
      keys = [] of Symbol
      HANDLED_PROPERTIES.each do |prop|
        prop[:keys].each do |k|
          keys << k
        end
      end
      store.each do |k, v|
        found = keys.each do |key|
          break true if key.to_s == k
          false
        end
        unless found
          @unhandled[k] = v
          DotPrison.logger.debug "Unhandled property #{k} for {{@type}} (#{v})"
        end
      end
    end

    macro finished
      private def init_store(store : Store, prison : Prison?)
        \{% for props in HANDLED_PROPERTIES %}
          \{% if    props[:type] == :String %}
            @\{{props[:property].id}} = store.parse_string(\{{props[:keys][0]}})
          \{% elsif props[:type] == :Int32 %}
            @\{{props[:property].id}} = store.parse_int(\{{props[:keys][0]}})
          \{% elsif props[:type] == :Float64 %}
            @\{{props[:property].id}} = store.parse_float(\{{props[:keys][0]}})
          \{% elsif props[:type] == :Bool %}
            @\{{props[:property].id}} = store.parse_bool(\{{props[:keys][0]}})
          \{% elsif (props[:type] || :"").starts_with? "Reference(" %}
                                                                                                                                                                                                                                                                                         @\{{props[:property].id}} = \{{props[:type].id}}.new(prison.as(Prison), store.parse_int(\{{props[:keys][0]}}), store.parse_int(\{{props[:keys][1]}}))
          \{% else %}
          \{% end %}
        \{% end %}
        find_unhandled(store)
      end
    end
  end
end
