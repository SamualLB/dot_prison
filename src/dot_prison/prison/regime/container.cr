class DotPrison::Prison::Regime::Container < DotPrison::StoreConsumer
  KNOWN_REGIMES = {"None" => :None, Category::MinSec => :MinSec, Category::Normal => :Normal, Category::MaxSec => :MaxSec, Category::Protected => :Protected, Category::SuperMax => :SuperMax, Category::DeathRow => :DeathRow}

  {% for k, v in KNOWN_REGIMES %}
    no_handle({{v}})
  {% end %}

  handle(:bangup, :Bool, :Bangup)
  handle(:previous_hour, :Int32, :PreviousHour)

  getter regimes = {} of Category | String => Regime

  def initialize(store : Store, prison : Prison)
    init_store(store)
    KNOWN_REGIMES.each do |k, v|
      regimes[k] = Regime.new(store.parse_store(v), prison)
    end
  end
end
