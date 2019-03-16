require "./store_consumer"

class DotPrison::Prison < DotPrison::StoreConsumer

  handle(:version, :String, :Version)
  handle(:time_index, :Float64, :TimeIndex)
  handle(:time_warp, :Float64, :TimeWarpFactor)
  handle(:size, :"Tuple(Int32, Int32)", :NumCellsX, :NumCellsY)
  handle(:origin, :"Tuple(Int32, Int32)", :OriginX, :OriginY)
  handle(:origin_size, :"Tuple(Int32, Int32)", :OriginW, :OriginH)

  handle(:random_seed, :Int32, :RandomSeed)
  handle(:seconds_played, :Int32, :SecondsPlayed)
  handle(:reoffend, :Int32, :Reoffend)
  handle(:next_object_id, :Int32, :"ObjectId.next")

  handle(:electricity_enabled, :Bool, :EnabledElectricity)
  handle(:water_enabled, :Bool, :EnabledWater)
  handle(:food_enabled, :Bool, :EnabledFood)
  handle(:misconduct_enabled, :Bool, :EnabledMisconduct)
  handle(:gangs_enabled, :Bool, :EnabledGangs)
  handle(:decay_enabled, :Bool, :EnabledDecay)
  handle(:weather_enabled, :Bool, :EnabledWeather)
  handle(:failure_conditions_enabled, :Bool, :FailureConditions)
  handle(:cell_quality_enabled, :Bool, :UseCellQuality)
  handle(:staff_needs_enabled, :Bool, :StaffNeeds)
  handle(:generate_forests, :Bool, :GenerateForests)
  handle(:cheats_enabled, :Bool, :CheatsEnabled)
  handle(:unlimited_funds_enabled, :Bool, :UnlimitedFunds)

  handle(:immediate_foundations, :Bool, :ImmediateFoundations)
  handle(:immediate_terrain, :Bool, :ImmediateTerrain)
  handle(:immediate_objects, :Bool, :ImmediateObjects)

  handle(:max_staff_break, :Int32, :MaxStaffBreakPercent)
  handle(:balance, :Float64, :Balance)

  handle(:first_death_row_notice, :Bool, :FirstDeathRowNotice)
  handle(:objects_centre_aligned, :Bool, :ObjectsCentreAligned)
  handle(:bio_versions, :Int32, :BioVersions)
  handle(:needs_version, :Int32, :NeedsVersion)
  handle(:entity_version, :Int32, :EntityVersion)

  custom_handle(:cells, :"Hash({Int32, Int32}, Cell)", :Cells)
  custom_handle(:objects, :"Hash(Int32, Object)", :Objects)
  custom_handle(:rooms, :"Hash(Int32, Room)", :Rooms)
  custom_handle(:jobs, :"Array(Job)", :WorkQ)
  custom_handle(:regimes, :"Regime::Container", :Regime)
  custom_handle(:finance, :Finance, :Finance)
  custom_handle(:patrols, :Patrols, :Patrols)
  custom_handle(:electricity, :Electricity, :Electricity)
  custom_handle(:water, :Water, :Water)
  custom_handle(:research, :"Research::Container", :Research)
  custom_handle(:penalties, :"Penalty::Container", :Penalties)
  custom_handle(:sectors, :"Sector::Container", :Sectors)
  custom_handle(:grants, :"Grant::Container", :Grants)

  property! objects_size : Int32
  property! rooms_size : Int32
  property! next_job_id : Int32

  def initialize(store : Store)
    init_store(store)
    @cells = Cell.parse(store.parse_store(:Cells), self)
    @objects, @objects_size = Object.parse(store.parse_store(:Objects), self)
    @rooms, @rooms_size = Room.parse(store.parse_store(:Rooms), self)
    @jobs, @next_job_id = Job.parse(store.parse_store(:WorkQ), self)
    @regimes = Regime::Container.new(store.parse_store(:Regime), self)
    @finance = Finance.new(store.parse_store(:Finance), self)
    @patrols = Patrols.new(store.parse_store(:Patrols), self)
    @electricity = Electricity.new(store.parse_store(:Electricity), self)
    @water = Water.new(store.parse_store(:Water), self)
    @research = Research::Container.new(store.parse_store(:Research), self)
    @penalties = Penalty::Container.new(store.parse_store(:Penalties), self)
    @sectors = Sector::Container.new(store.parse_store(:Sectors), self)
    @grants = Grant::Container.new(store.parse_store(:Grants), self)
  end

  protected def find(uid : Int32? = nil, id : Int32? = nil, type : Class? = nil) : Room | Cell | Object | Nil
    case type
      when Room
        find_room(uid, id)
      #when specific object
      when Object
        find_object(uid, id, type)
      else
        find_room(uid) || find_object(uid)
        return nil
    end
  end


protected def find_object(uid : Int32? = nil, id : Int32? = nil)
  obj = objects[id]? if id
  return obj if obj
  objects.each do |k, obj|
    return obj if obj.unique_id == uid
  end
end

protected def find_room(uid : Int32? = nil, id : Int32? = nil)
  rm = rooms[id]? if id
  return rm if rm
  rooms.each do |k, rm|
    return rm if rm.unique_id == uid
  end
end

end


require "./prison/*"
