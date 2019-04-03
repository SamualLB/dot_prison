module DotPrison::Prison::Object::RegimeProperties
  macro included
    custom_handle :regimes, :Regimes, :Regimes
  end

  def initialize(store : Store, prison : Prison)
    super
    @regimes = Regimes.new(store.parse_store(:Regimes), prison)
  end
end

require "../../regime"

class DotPrison::Prison::Object::Regimes < DotPrison::StoreConsumer
  {% for t in ::DotPrison::Prison::Regime::Activity.constants %}
    handle :{{t.underscore}}, :Bool, :{{t}}
  {% end %}
  
  def initialize(store : Store, prison : Prison)
    init_store(store, prison)
    {% for t in ::DotPrison::Prison::Regime::Activity.constants %}
      @{{t.underscore}} = store.parse_bool(:{{t}})
    {% end %}
  end
end
