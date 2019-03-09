class DotPrison::Prison::Cell < DotPrison::StoreConsumer
  property! prison : Prison
  property! x : Int32
  property! y : Int32

  handle(:indoors, :Bool, :Ind)
  handle(:condition, :Float64, :Con)
  handle(:room, :"Reference(Room)", :"Room.i", :"Room.u")

  custom_handle(:material, :Material, :Mat)

  def initialize(store : Store, @prison, coords : Tuple(Int32, Int32))
    init_store(store, prison)
    @x, @y = coords[0], coords[1]
    @material = Material.from_store(store.parse_string(:Mat))
  end

  # Parse all cells in a store
  def self.parse(store : Store, prison : Prison) : Hash({Int32, Int32}, Cell)
    ret = Hash({Int32, Int32}, Cell).new
    store.each do |coords, cell|
      next unless cell.is_a?(Store)
      coords = parse_coords(coords)
      next unless coords
      x, y = coords
      ret[{x, y}] = Cell.new(cell, prison, {x, y})
    end
    ret
  end

  private def self.parse_coords(str : String) : {Int32, Int32}?
    arr = str.split ' '
    if arr.size >= 2
      x, y = arr[0], arr[1]
    else
      return nil
    end
    x = x.to_i32?
    y = y.to_i32?
    return nil unless x && y
    {x, y}
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

    def self.from_store(str) : Material
      return DEFAULT unless str.is_a?(String)
      parsed = parse?(str)
      return parsed if parsed
      DotPrison.logger.debug "Unknown material #{str}"
      DEFAULT
    end
  end
end
