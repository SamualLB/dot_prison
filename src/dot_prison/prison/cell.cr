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
    @material = Material.parse?(store.parse_string("Mat") || "") || DEFAULT_MATERIAL
    @condition = store.parse_float("Con")
    @indoors = store.parse_bool("Ind")
    parse_room(store)
  end

  delegate room, to: room_reference

  private def parse_room(store : Store)
    id = store.parse_int("Room.i")
    uid = store.parse_int("Room.u")
    @room_reference = RoomReference.new(@prison)
    return unless id && uid
    return if id == 0 && uid == 0
    room_reference.room = {id, uid}
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
