require "./store_consumer"

class DotPrison::Prison::Cell < DotPrison::Prison::StoreConsumer
  property! prison : Prison

  handle(:indoors, :Bool, :Ind)
  handle(:condition, :Float64, :Con)
  custom_handle(:material, :Material, :Mat)
  custom_handle(:room, :"Reference(Room)", :"Room.i", :"Room.u")

  def initialize(@prison, store : Store)
    init_store(store)
    @material = Material.parse?(store.parse_string("Mat") || "") || Material::DEFAULT
    @room = Reference(Room).new(prison, store.parse_int(:"Room.i"), store.parse_int(:"Room.u"))
    puts @unhandled unless @unhandled.empty?
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

    DEFAULT = Dirt
  end
end
