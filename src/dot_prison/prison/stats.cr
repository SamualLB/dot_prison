class DotPrison::Prison::Stats < DotPrison::StoreConsumer
  custom_handle :today, :"Hash(Stat | String, Float64)", :Today
  custom_handle :persistent, :"Hash(Stat | String, Float64)", :Persistent
  custom_handle :history, :"Hash(Stat | String, Hash(Int32, Float64))", :History

  def initialize(store : Store, @prison : Prison)
    init_store(store)
    @today = {} of Stat | String => Float64
    store.parse_store(:Today).each do |k, v|
      stat = Stat.from_store(k)
      next unless stat
      today[stat] = store.parse_store(:Today).parse_float(k)
    end
    @persistent = {} of Stat | String => Float64
    store.parse_store(:Persistent).each do |k, v|
      stat = Stat.from_store(k)
      next unless stat
      persistent[stat] = store.parse_store(:Persistent).parse_float(k)
    end
    @history = {} of Stat | String => Hash(Int32, Float64)
    store.parse_store(:History).each do |k, v|
      next unless v.is_a? Store
      stat = Stat.from_store k
      next unless stat
      history[stat] = {} of Int32 => Float64
      v.parse_store_array(:NewDirectory).each do |entry|
        history[stat][entry.parse_int(:Day)] = entry.parse_float(:Value)
      end
    end
  end
end

require "./stats/*"
