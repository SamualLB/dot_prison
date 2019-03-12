class DotPrison::Prison::Sector::Container < DotPrison::StoreConsumer
  handle(:next_id, :Int32, :NextSectorId)

  no_handle(:Sectors)

  property! sectors : InnerContainer

  def initialize(store : Store, prison : Prison)
    init_store(store, prison)
    @sectors = InnerContainer.new(store.parse_store(:Sectors), prison)
  end
end
