class DotPrison::Prison::Cell
  DEFAULT_MATERIAL = Material::Dirt

  property prison : Prison
  property x = 0
  property y = 0
  property material = DEFAULT_MATERIAL
  property condition = 0.0
  property indoors = false

  @room_id : Int32? = nil
  @room_unique_id : Int32? = nil
  @room : Room? = nil

  def initialize(@prison, store : Store)
    x, y = store.name.split ' '
    @x = x.to_i; @y = y.to_i
    parse_material(store)
    parse_condition(store)
    parse_indoors(store)
    parse_room(store)
  end

  def room
    return nil unless @room || @room_id || @room_unique_id
    @room ||= prison.find_room?(@room_id) || prison.find_unique_room?(@room_unique_id)
  end

  def room=(room : Room)
    @room = room
    @room_id = room.id
    @room_unique_id = room.unique_id
  end

  def room=(nothing : Nil)
    @room = nil
    @room_id = nil
    @room_unique_id = nil
  end

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
    @condition = float if float
  end

  private def parse_indoors(store : Store)
    string = store["Ind"]?
    bool = string == "true" ? true : false
    @indoors = bool
  end

  private def parse_room(store : Store)
    id_str = store["Room.i"]?
    unique_id_str = store["Room.u"]?
    return unless id_str.is_a?(String) && unique_id_str.is_a?(String)
    id = id_str.to_i?; unique_id = unique_id_str.to_i?
    return unless id && unique_id
    @room_id = id; @room_unique_id = unique_id
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
