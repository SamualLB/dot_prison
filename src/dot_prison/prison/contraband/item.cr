class DotPrison::Prison::Contraband::Item < DotPrison::StoreConsumer
  handle(:birth_time, :Float64, :BirthTime)
  handle(:prisoner, :"Reference(Object::Prisoner)", :"Prisoner.i", :"Prisoner.u")
  handle(:prisoner_chance, :Float64, :"Prisoner.chance")
  handle(:from_room, :"Reference(Room)", :"FromRoom.i", :"FromRoom.u")
  handle(:object, :"Reference(Object)", :"Object.i", :"Object.u")
  handle(:object_chance, :Float64, :"Object.chance")
  handle :found_time, :Float64, :FoundTime
  handle :found_position, :"Tuple(Float64, Float64)", :"FoundPos.x", :"FoundPos.y"

  custom_handle(:item_type, :String, :ItemType) #TODO
  custom_handle(:state, :String, :State) #TODO
  custom_handle(:drug_type, :String, :DrugType) #TODO
  custom_handle(:log, :"Array(Log)", :Log)

  def initialize(store : Store, prison : Prison)
    init_store(store, prison)
    @log = [] of Log
    store.parse_store(:Log).parse_store_array(:i).each do |l|
      log << Log.new(l, prison)
    end
  end
end
