class DotPrison::Prison::Patrols::Station::Container < DotPrison::StoreConsumer
  custom_handle(:stations, :"Array(Station)", :i)

  def initialize(store : Store, prison : Prison)
    init_store(store)
    @stations = [] of Station
    store.parse_store_array(:i).each do |station|
      stations << Station.new(station, prison)
    end
  end
end
