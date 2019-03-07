class DotPrison::Prison::Object::Prisoner < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation
  include Velocity

  handle(:last_misconduct, :Float64, :TimeOfLastMisconduct)
  handle(:last_ate, :Float64, :LastAte)
  handle(:boiling_point, :Float64, :BoilingPoint)
  handle(:timer, :Float64, :Timer)
  handle(:cell, :"Reference(Cell)", :"Cell.i", :"Cell.u")
  handle(:energy, :Float64, :Energy)
  handle(:walk_speed, :Float64, :AiWalkSpeed)
  handle(:carrier, :"Reference(Object)", :"CarrierId.i", :"CarrierId.u")
  handle(:loaded, :Bool, :Loaded)
  handle(:money, :Float64, :AvailableMoney)
  handle(:station, :"Reference(Room)", :"Station.i", :"Station.u")
  handle(:last_visitors, :Float64, :LastVisitors)
  handle(:ai_set_target, :Bool, :AiSetTarget)
  handle(:job_id, :Int32, :JobId)
  handle(:last_treated, :Float64, :LastTreated)
  handle(:attack_timer, :Float64, :AttackTimer)
  handle(:damage, :Float64, :Damage)
  handle(:shackled, :Bool, :Shackled)
  handle(:carried, :Int32, :Carried)
  handle(:carrying, :"Reference(Object)", :"Carrying.i", :"Carrying.u")
  handle(:snitch_timer, :Float64, :SnitchTimer)
  handle(:naked, :Bool, :Naked)
  handle(:book_in_cell, :Bool, :BookInCell)
  handle(:carrying_book, :Bool, :CarryingBook)
  handle(:library, :"Reference(Room)", :"Library.i", :"Library.u")
  handle(:healing_job_id, :Int32, :HealingJobId)

  custom_handle(:needs, :Store, :Needs)
  custom_handle(:experience, :Store, :Experience)
  custom_handle(:status_effects, :Store, :StatusEffects)
  custom_handle(:bio, :Store, :Bio)
  custom_handle(:category, :Category, :Category)
  custom_handle(:destination, :"Tuple(Float64, Float64)", :"Dest.x", :"Dest.y")
  custom_handle(:required_cell_type, :String, :RequiredCellType)

  def initialize(store : Store, prison : Prison)
    super
    @needs = store.parse_store(:Needs)
    @experience = store.parse_store(:Experience)
    @status_effects = store.parse_store(:StatusEffects)
    @bio = store.parse_store(:Bio)
    @category = Category.from_store(store.parse_string(:Category))
    @destination = {store.parse_float(:"Dest.x"), store.parse_float(:"Dest.y")}
    @required_cell_type = store.parse_string(:RequiredCellType) || "Unset"
  end

  enum Category
    Minimum
    Normal
    Maximum
    Protected
    Super

    def self.from_store(str) : Category
      case str
      when "Minimum"   then Minimum
      when "Normal"    then Normal
      when "MaxSec"    then Maximum
      when "Protected" then Protected
      when "SuperMax"  then Super
      when nil, ""     then Normal
      else
        DotPrison.logger.debug "Unknown prisoner category #{str}"
        Normal
      end
    end
  end
end
