class DotPrison::Prison::Penalty::Container < DotPrison::StoreConsumer
  handle(:points, :Float64, :Points)

  custom_handle(:penalties, :"Array(Penalty)", :Penalties)

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @penalties = Array(Penalty).new
    store.parse_indexed_store(:Penalties) do |sto|
      penalties << Penalty.new(sto, prison)
    end
  end
end
