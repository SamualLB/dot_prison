class DotPrison::Prison::Patrols::Station < DotPrison::StoreConsumer
  handle(:last_visit, :Float64, :LastVisit)
  handle(:schedule, :Int32, :Schedule)
  handle(:visitor, :"Reference(Object)", :"Visitor.i", :"Visitor.u")

  # TODO: Change to Enum, or create reference to specific type
  handle(:visitor_type, :String, :EntityType)

  custom_handle(:position, :"Tuple(Int32, Int32)", :"Pos.x", :"Pos.y")

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @position = {store.parse_int(:"Pos.x"), store.parse_int(:"Pos.y")}
  end
end

require "./station/*"
