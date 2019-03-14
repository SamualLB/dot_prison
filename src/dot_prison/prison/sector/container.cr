class DotPrison::Prison::Sector::Container < DotPrison::StoreConsumer
  handle(:next_id, :Int32, :NextSectorId)

  custom_handle(:sectors, :"Array(Sector)", :Sectors)

  def initialize(store : Store, prison : Prison)
    init_store(store, prison)
    @sectors = Array(Sector).new
    store.parse_indexed_store(:Sectors) do |sec|
      sectors << Sector.new(sec, prison)
    end
  end
end
