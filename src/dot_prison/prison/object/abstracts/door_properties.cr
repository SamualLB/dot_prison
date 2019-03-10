# Changing, int
module DotPrison::Prison::Object::DoorProperties
  macro included
    handle(:close_timer, :Float64, :CloseTimer)
    handle(:open, :Float64, :Open)
    handle(:close_timer, :Float64, :CloseTimer)
    handle(:remotely_openable, :Int32, :RemotelyOpenable)
    handle(:sector_timer, :Float64, :SectorTimer)
    handle(:cell_id_timer, :Float64, :CellIdTimer)
    handle(:changing, :Int32, :Changing)

    custom_handle(:mode, :DoorMode, :Mode)
    custom_handle(:open_direction, :"Tuple(Int32, Int32)", :"OpenDir.x", :"OpenDir.y")
  end

  def initialize(store : Store, prison : Prison)
    super
    @open_direction = {store.parse_int(:"OpenDir.x"), store.parse_int(:"OpenDir.y")}
    @mode = DoorMode.from_store(store.parse_string(:Mode))
  end
end

enum DotPrison::Prison::Object::DoorMode
  Normal
  LockedOpen

  DEFAULT = Normal
  def self.from_store(str) : DoorMode
    return DEFAULT unless str.is_a?(String)
    parsed = parse?(str)
    return parsed if parsed
    DotPrison.logger.debug "Unknown door mode: #{str}"
    DEFAULT
  end
end
