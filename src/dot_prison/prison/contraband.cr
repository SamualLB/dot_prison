class DotPrison::Prison::Contraband < DotPrison::StoreConsumer
  handle(:timer, :Float64, :Timer)
  handle(:object_index, :Int32, :ObjectIndex)

  custom_handle(:prisoners, :"Array(Prisoner)", :Prisoners)
  custom_handle(:trackers, :"Array(Item)", :Trackers)
  custom_handle(:historical_trackers, :"Array(Item)", :HistoricalTrackers)

  def initialize(store : Store, @prison : Prison)
    init_store(store)
    @prisoners = [] of Prisoner
    store.parse_indexed_store(:Prisoners) do |pris|
      prisoners << Prisoner.new(pris, prison)
    end
    @trackers = [] of Item
    store.parse_indexed_store(:Trackers) do |item|
      trackers << Item.new(item, prison)
    end
    @historical_trackers = [] of Item
    store.parse_indexed_store(:HistoricalTrackers) do |item|
      historical_trackers << Item.new(item, prison)
    end
  end
end

require "./contraband/*"
