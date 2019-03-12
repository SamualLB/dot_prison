class DotPrison::Prison::Sector < DotPrison::StoreConsumer
  handle(:id, :Int32, :id)
  handle(:top_left, :"Tuple(Int32, Int32)", :"TopLeft.x", :"TopLeft.y")
  handle(:bottom_right, :"Tuple(Int32, Int32)", :"BottomRight.x", :"BottomRight.y")
  handle(:centre, :"Tuple(Float64, Float64)", :"Centre.x", :"Centre.y")
  handle(:squares, :Int32, :NumSquares)
  handle(:floor_squares, :Int32, :NumFloorSquares)
  handle(:indoor, :Bool, :Indoor)
  handle(:room, :"Reference(Room)", :"Room.i", :"Room.u")
  handle(:manual_targets, :Bool, :ManualTargets)

  custom_handle(:zone, :"Zone | String", :Zone)
  custom_handle(:jobs, :"Job::Container", :Jobs)

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @zone = Zone.from_store(store.parse_string(:Zone))
    @jobs = Job::Container.new(store.parse_store(:Jobs), prison)
  end
end

require "./sector/*"
