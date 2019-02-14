class DotPrison::Prison::Cell
  DEFAULT_MATERIAL = Material::Dirt

  property prison : Prison
  property x = 0
  property y = 0
  property material = DEFAULT_MATERIAL
  property condition = 0.0
  property indoors = false

  property! room_reference : RoomReference

  def initialize(@prison, store : Store)
    x, y = store.name.split ' '
    @x = x.to_i; @y = y.to_i
    parse_material(store)
    parse_condition(store)
    parse_indoors(store)
    parse_room(store)
  end

  delegate room, to: room_reference

  private def parse_material(store : Store)
    string = store["Mat"]?
    return if string.is_a? Store
    if string
      mat = Material.parse?(string)
    else
      mat = DEFAULT_MATERIAL
    end
    if mat
      @material = mat
    else
      DotPrison.logger.debug "Unknown material when parsing Store: #{string}"
    end
  end

  private def parse_condition(store : Store)
    string = store["Con"]?
    return unless string.is_a?(String)
    float = string.to_f?
    if float
      @condition = float
    else
      DotPrison.logger.debug "Malformed float: #{string}"
    end
  end

  private def parse_indoors(store : Store)
    string = store["Ind"]?
    bool = string == "true" ? true : false
    @indoors = bool
  end

  private def parse_room(store : Store)
    id_str = store["Room.i"]?
    unique_id_str = store["Room.u"]?
    @room_reference = RoomReference.new(@prison)
    return unless id_str.is_a?(String) && unique_id_str.is_a?(String)
    id = id_str.to_i?; unique_id = unique_id_str.to_i?
    unless id && unique_id
      DotPrison.logger.debug "Malformed room ids: #{id_str}, #{unique_id_str}"
      return
    end
    room_reference.room = {id, unique_id}
  end

  enum Material
    Dirt
    Water
    ConcreteWall
    BrickWall
    PerimeterWall
    Fence
    Sand
    Grass
    ConcreteTiles
    ConcreteFloor
    WoodenFloor
    WhiteTiles
    FancyTiles
    MetalFloor
    MosaicFloor
    MarbleTiles
    PavingStone
    CeramicFloor
    Stone
    Road
    RoadMarkingsLeft
    RoadMarkings
    RoadMarkingsRight
  end
end
