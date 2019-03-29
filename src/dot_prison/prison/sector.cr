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
  handle(:access_only, :Bool, :AccessOnly)
  handle(:controller, :Float64, :Controller)

  custom_handle(:zone, :"Zone | String", :Zone)
  custom_handle(:jobs, :"Array(Job)", :Jobs)
  custom_handle(:stations, :"Array(Station)", :Stations)
  custom_handle(:targets, :"Array(Int32)", :Targets)

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @zone = Zone.from_store(store.parse_string(:Zone))
    @jobs = Array(Job).new
    store.parse_indexed_store(:Jobs) do |job|
      jobs << Job.new(job, prison)
    end
    @stations = Array(Station).new
    store.parse_indexed_store(:Stations) do |stat|
      stations << Station.new(stat, prison)
    end
    @targets = store.parse_indexed_int(:Targets)
  end
end

require "./sector/*"
