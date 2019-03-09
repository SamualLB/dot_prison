# Changing, int
module DotPrison::Prison::Object::DoorProperties
  macro included
    handle(:close_timer, :Float64, :CloseTimer)
    handle(:open, :Float64, :Open)
    handle(:close_timer, :Float64, :CloseTimer)
    handle(:remotely_openable, :Int32, :RemotelyOpenable)
    handle(:sector_timer, :Float64, :SectorTimer)
    handle(:cell_id_timer, :Float64, :CellIdTimer)

    #custom_handle(:mode, :DoorMode, :Mode)
    custom_handle(:open_direction, :"Tuple(Int32, Int32)", :"OpenDir.x", :"OpenDir.y")
  end

  def initialize(store : Store, prison : Prison)
    super
    @open_direction = {store.parse_int(:"OpenDir.x"), store.parse_int(:"OpenDir.y")}
  end
end
