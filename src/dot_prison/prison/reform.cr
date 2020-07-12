struct DotPrison::Prison::Reform < DotPrison::Consumer
  struct Program < DotPrison::Consumer
    struct Identifier < DotPrison::Consumer
      consume :id, Int32, :"Id.i"
      consume :uid, Int32, :"Id.u"
    end

    enum Type
      AlcoholicsMeeting
      Carpentry
      DeathRowAppeal
      FoundationEducation
      GeneralEducation
      KitchenInduction
      Methadone
      ParoleHearing
      SpiritualGuidance
      TazerTraining
      Therapy
      WorkshopInduction
    end

    consume :id, Int32, :Id
    consume :type, Type, :Type
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
    consume :objects, Array(Identifier), :Objects
    consume :students, Array(Identifier), :Students
  end

  struct Allocation < DotPrison::Consumer
    consume :object_id, Int32, :"Object.i"
    consume :object_uid, Int32, :"Object.u"
    consume :student_id, Int32, :"Student.i"
    consume :student_uid, Int32, :"Student.u"
    consume :last_used, Float64, :LastUsed
    consume :slot_id, Int32, :SlotId
  end

  struct Report < DotPrison::Consumer
    consume :started, Int32, :Started
    consume :finished, Int32, :Finished
    consume :passed, Int32, :Passed
  end

  struct Reports < DotPrison::Consumer
    def [](v : Program::Type)
      Report.new(table.parse_table(v.to_s))
    end
  end

  consume :next_program_id, Int32, :NextProgramId
  consume :programs, DotPrison::IndexedTable(Program), :Programs
  consume :allocations, Array(Allocation), :Allocations
  consume :reports, Reports, :Reports
end
