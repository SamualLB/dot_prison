class DotPrison::Prison::Penalty < DotPrison::StoreConsumer
  handle(:object, :"Reference(Object)", :"ObjectId.i", :"ObjectId.u")
  handle(:time, :Float64, :Time)
  handle(:committed, :Bool, :Committed)

  custom_handle(:event, :"Event | Int32", :Event)

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @event = Event.from_store(store.parse_int(:Event))
  end
end

require "./penalty/*"
