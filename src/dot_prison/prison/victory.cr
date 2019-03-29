class DotPrison::Prison::Victory < DotPrison::StoreConsumer
  handle :recent_death, :"Tuple(Float64, Float64)", :"RecentDeath.x", :"RecentDeath.y"
  handle :strike_cooldown, :Float64, :StrikeCooldown

  custom_handle :log, :"Array(Log)", :Log
  custom_handle :conditions, :"Hash(Condition::Type | String, Condition)", :Conditions

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @log = [] of Log
    store.parse_indexed_store(:Log) do |l|
      log << Log.new(l, prison)
    end
    @conditions = {} of Condition::Type | String => Condition
    store.parse_store(:Conditions).each do |k, v|
      next unless v.is_a? Store
      typ = Condition::Type.from_store(k)
      next unless k
      conditions[k] = Condition.new(v, prison)
    end
  end
end

require "./victory/*"
