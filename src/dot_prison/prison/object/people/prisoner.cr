class DotPrison::Prison::Object::Prisoner < DotPrison::Prison::Object
  HANDLED_PROPERTIES.push "Experience", "StatusEffects", "Needs", "Bio", "TimeOfLastMisconduct", "LastAte", "BoilingPoint", "Category", "Timer", "Cell.i", "Cell.u", "Energy", "CarrierId.i", "CarrierId.u", "AiWalkSpeed", "Loaded", "AvailableMoney", "Station.i", "Station.u", "Dest.x", "Dest.y", "Vel.x", "Vel.y", "LastVisitors", "AiSetTarget", "JobId", "LastTreated", "AttackTimer", "Damage", "RequiredCellType", "Shackled", "Carried", "Carrying.i", "Carrying.u", "SnitchTimer", "Naked", "BookInCell", "CarryingBook", "Library.i", "Library.u"

  include Orientation

  @experience : Store
  @status_effects : Store
  @needs : Store
  @bio : Store
  @timer : Float64
  @required_cell_type : String
  @carried : Int32

  property last_misconduct : Float64
  property last_ate : Float64
  property boiling_point : Float64
  property category : Category
  property cell : Reference(Cell)
  property energy : Float64
  property carrier : Reference(Object)
  property walk_speed : Float64
  property loaded : Bool
  property money : Float64
  property station : Reference(Room)
  property destination : Tuple(Float64, Float64)
  property velocity : Tuple(Float64, Float64)
  property last_visitors : Float64
  property ai_set_target : Bool
  property job_id : Int32
  property last_treated : Float64
  property attack_timer : Float64
  property damage : Float64
  property shackled : Bool
  property carrying : Reference(Object)
  property snitch_timer : Float64
  property naked : Bool
  property book_in_cell : Bool
  property carrying_book : Bool
  property library : Reference(Room)

  def initialize(prison : Prison, store : Store)
    super
    @experience = store.parse_store("Experience")
    @status_effects = store.parse_store("StatusEffects")
    @needs = store.parse_store("Needs")
    @bio = store.parse_store("Bio")
    @timer = store.parse_float("Timer")
    @required_cell_type = store.parse_string("Solitary") || "Unset"

    @last_misconduct = store.parse_float("TimeOfLastMisconduct")
    @last_ate = store.parse_float("LastAte")
    @boiling_point = store.parse_float("BoilingPoint")
    @category = Category.from_store(store.parse_string("Category"))
    @cell = Reference(Cell).new(prison, store.parse_int("Cell.i"), store.parse_int("Cell.u"))
    @energy = store.parse_float("Energy")
    @carrier = Reference(Object).new(prison, store.parse_int("CarrierId.i"), store.parse_int("CarrierId.u"))
    @walk_speed = store.parse_float("AiWalkSpeed")
    @loaded = store.parse_bool("Loaded")
    @money = store.parse_float("AvailableMoney")
    @station = Reference(Room).new(prison, store.parse_int("Station.i"), store.parse_int("Station.u"))
    @destination = {store.parse_float("Dest.x"), store.parse_float("Dest.y")}
    @velocity = {store.parse_float("Vel.x"), store.parse_float("Vel.y")}
    @last_visitors = store.parse_float("LastVisitors")
    @ai_set_target = store.parse_bool("AiSetTarget")
    @job_id = store.parse_int("JobId")
    @last_treated = store.parse_float("LastTreated")
    @attack_timer = store.parse_float("AttackTimer")
    @damage = store.parse_float("Damage")
    @shackled = store.parse_bool("Shackled")
    @carried = store.parse_int("Carried")
    @carrying = Reference(Object).new(prison, store.parse_int("Carrying.i"), store.parse_int("Carrying.u"))
    @snitch_timer = store.parse_float("SnitchTimer")
    @naked = store.parse_bool("Naked")
    @book_in_cell = store.parse_bool("BookInCell")
    @carrying_book = store.parse_bool("CarryingBook")
    @library = Reference(Room).new(prison, store.parse_int("Library.i"), store.parse_int("Library.u"))
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
