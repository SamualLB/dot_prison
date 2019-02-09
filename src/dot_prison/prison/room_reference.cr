class DotPrison::Prison::RoomReference
  getter id : Int32? = nil
  getter unique_id : Int32? = nil
  @room : Room? = nil

  def initialize(@prison : Prison)
  end

  def room : Room?
    return nil unless @room || @id || @unique_id
    @room = @prison.find_room?(@id) || @prison.find_unique_room?(@unique_id)
  end

  def room=(room : Room)
    @room = room
    @id = room.id
    @unique_id = room.unique_id
  end

  def room=(ids : Tuple(Int32, Int32))
    @id = ids[0]
    @unique_id = ids[1]
    #@room = @prison.find_room?(@id) || @prison.find_unique_room?(@unique_id)
  end

  def room=(nothing : Nil)
    @room = nil
    @id = nil
    @unique_id = nil
  end
end
