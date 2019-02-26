class DotPrison::Prison::Object::Prisoner < DotPrison::Prison::Object
  HANDLED_PROPERTIES.push "Experience", "StatusEffects", "Needs", "Bio", "TimeOfLastMisconduct", "LastAte", "BoilingPoint", "Category", "Timer", "Cell.i", "Cell.u", "Energy", "CarrierId.i", "CarrierId.u", "AiWalkSpeed", "Loaded", "AvailableMoney", "Station.i", "Station.u", "Dest.x", "Dest.y", "Vel.x", "Vel.y", "LastVisitors"

  include Orientation

  @experience : Store
  @status_effects : Store
  @needs : Store
  @bio : Store
  @timer : Float64

  property last_misconduct : Float64
  property last_ate : Float64
  property boiling_point : Float64
  property category : Category
  property cell : CellReference
  property energy : Float64
  property carrier : CarrierReference
  property walk_speed : Float64
  property loaded : Bool
  property money : Float64
  property station : StationReference
  property destination : Tuple(Float64, Float64)
  property velocity : Tuple(Float64, Float64)
  property last_visitors : Float64

  def initialize(prison : Prison, store : Store)
    super
    @experience = store.parse_store("Experience")
    @status_effects = store.parse_store("StatusEffects")
    @needs = store.parse_store("Needs")
    @bio = store.parse_store("Bio")
    @timer = store.parse_float("Timer")

    @last_misconduct = store.parse_float("TimeOfLastMisconduct")
    @last_ate = store.parse_float("LastAte")
    @boiling_point = store.parse_float("BoilingPoint")
    @category = Category.from_store(store.parse_string("Category"))
    @cell = CellReference.new(prison, store.parse_int("Cell.i"), store.parse_int("Cell.u"))
    @energy = store.parse_float("Energy")
    @carrier = CarrierReference.new(prison, store.parse_int("CarrierId.i"), store.parse_int("CarrierId.u"))
    @walk_speed = store.parse_float("AiWalkSpeed")
    @loaded = store.parse_bool("Loaded")
    @money = store.parse_float("AvailableMoney")
    @station = StationReference.new(prison, store.parse_int("Station.i"), store.parse_int("Station.u"))
    @destination = {store.parse_float("Dest.x"), store.parse_float("Dest.y")}
    @velocity = {store.parse_float("Vel.x"), store.parse_float("Vel.y")}
    @last_visitors = store.parse_float("LastVisitors")
  end

  enum Category
    Minumum
    Normal
    Maximum
    Protected
    Super

    def self.from_store(str) : Category
      case str
      when "Minumum" then Minumum
      when "Normal" then Normal
      when "MaxSec" then Maximum
      when "Protected" then Protected
      when "SuperMax" then Super
      when Nil, "" then Normal
      else
        DotPrison.logger.debug "Unknown prisoner category #{str}"
        Normal
      end
    end
  end
end
