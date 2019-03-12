class DotPrison::Prison::Penalty::Container < DotPrison::StoreConsumer
  handle(:points, :Float64, :Points)

  no_handle(:Penalties)

  property! penalties : InnerContainer

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    penalties = InnerContainer.new(store.parse_store(:Penalties), prison)
  end
end
