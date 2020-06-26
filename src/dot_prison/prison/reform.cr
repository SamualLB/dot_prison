struct DotPrison::Prison::Reform < DotPrison::Consumer
  struct Program < DotPrison::Consumer
    consume :id, Int32, :Id
    # TODO: Enum
    consume :type, String, :Type
    consume :start_hour, Int32, :StartHour
    # TODO: Unknown meaning
    consume :error, String, :Error
    consume :progress, Float64, :ClassProgress
    consume :fee_paid, Bool, :SessionFeePaid
    consume :max_places, Int32, :MaxPlaces
    consume :teacher_id, Int32, :"Teacher.i"
    consume :teacher_uid, Int32, :"Teacher.u"
    consume :room_id, Int32, :"Room.i"
    consume :room_uid, Int32, :"Room.u"
    # TODO: i array
    consume :objects, DotPrison::Table, :Objects
    # TODO: i array
    consume :students, DotPrison::Table, :Students
  end

  consume :next_program_id, Int32, :NextProgramId
  consume :programs, DotPrison::IndexedTable(Program), :Programs
  # TODO: i array
  consume :allocations, DotPrison::Table, :Allocations
  # TODO: Enum key to report
  consume :reports, DotPrison::Table, :Reports
end
