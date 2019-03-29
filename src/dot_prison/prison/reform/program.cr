class DotPrison::Prison::Reform::Program < DotPrison::StoreConsumer
  handle(:id, :Int32, :Id)
  handle(:start_hour, :Int32, :StartHour)
  handle(:class_progress, :Float64, :ClassProgress)
  handle(:session_fee_paid, :Bool, :SessionFeePaid)
  handle(:manual_program, :Bool, :ManualProgram)
  handle(:max_places, :Int32, :MaxPlaces)
  handle(:room, :"Reference(Room)", :"Room.i", :"Room.u")
  handle(:teacher, :"Reference(Object)", :"Teacher.i", :"Teacher.u")
  handle(:secondary_teacher, :"Reference(Object)", :"SecondaryTeacher.i", :"SecondaryTeacher.u")

  custom_handle(:type, :String, :Type) # TODO
  custom_handle(:error, :String, :Error) # TODO
  custom_handle(:objects, :"Array(Object)", :Objects)
  custom_handle(:students, :"Array(Object)", :Students)

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    objects = store.parse_store(:Objects).parse_store_array(:i)
    students = store.parse_store(:Students).parse_store_array(:i)
  end
end
