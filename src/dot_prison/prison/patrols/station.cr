class DotPrison::Prison::Patrols::Station < DotPrison::StoreConsumer
  handle(:last_visit, :Float64, :LastVisit)
  handle(:schedule, :Int32, :Schedule)
  handle(:visitor, :"Reference(Object)", :"Visitor.i", :"Visitor.u")
  handle(:position, :"Tuple(Int32, Int32)", :"Pos.x", :"Pos.y")

  # TODO: Change to Enum, or create reference to specific type
  handle(:visitor_type, :String, :EntityType)
end

require "./station/*"
