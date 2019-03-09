require "./store_consumer"

class DotPrison::Prison < DotPrison::StoreConsumer

  handle(:version, :String, :Version)
  handle(:time_index, :Float64, :TimeIndex)
  handle(:time_warp, :Float64, :TimeWarpFactor)
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

  handle(:max_staff_break, :Int32, :MaxStaffBreakPercent)
  handle(:balance, :Float64, :Balance)

  handle(:first_death_row_notice, :Bool, :FirstDeathRowNotice)
  handle(:objects_centre_aligned, :Bool, :ObjectsCentreAligned)
  handle(:bio_versions, :Int32, :BioVersions)
  handle(:needs_version, :Int32, :NeedsVersion)
  handle(:entity_version, :Int32, :EntityVersion)

  custom_handle(:size, :"Tuple(Int32, Int32)", :NumCellsX, :NumCellsY)
  custom_handle(:origin, :"Tuple(Int32, Int32)", :OriginX, :OriginY)
  custom_handle(:origin_size, :"Tuple(Int32, Int32)", :OriginW, :OriginH)

  custom_handle(:cells, :"Hash({Int32, Int32}, Cell)", :Cells)
  custom_handle(:objects, :"Hash(Int32, Object)", :Objects)

  property rooms = Hash(Int32, Room).new

  def initialize(store : Store)
    init_store(store)
    @size = {store.parse_int(:NumCellsX), store.parse_int(:NumCellsY)}
    @origin = {store.parse_int(:OriginX), store.parse_int(:OriginY)}
    @origin_size = {store.parse_int(:OriginW), store.parse_int(:OriginH)}
    @cells = Cell.parse(store.parse_store(:Cells), self)
    @objects = Object.parse(store.parse_store(:Objects), self)
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
