class DotPrison::Prison::Cell < DotPrison::StoreConsumer
  property! prison : Prison

  handle(:indoors, :Bool, :Ind)
  handle(:condition, :Float64, :Con)
  handle(:room, :"Reference(Room)", :"Room.i", :"Room.u")

  custom_handle(:material, :Material, :Mat)

  def initialize(store : Store, @prison)
    init_store(store, prison)
    @material = Material.parse?(store.parse_string("Mat") || "") || Material::DEFAULT
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
