struct DotPrison::Prison::Execution < DotPrison::Consumer
  # TODO: Maybe an enum-indexed object
  struct Stages < DotPrison::Consumer
    {% for stage in [:Start, :Lockdown, :Testing, :Assemble, :Witnesses, :Escort, :Execution, :Dismissed, :FinalReport] %}
      consume :{{stage.id.underscore}}_started, Bool, :{{stage.id}}Started
      consume :{{stage.id.underscore}}_progress, Float64, :{{stage.id}}Progress
    {% end %}
  end

  consume :active, Bool, :Active
  consume :previous_illegal, Bool, :PreviousExecutionIllegal
  consume :execution_time, Float64, :ExecutionTime
  consume :room_id, Int32, :"RoomId.i"
  consume :room_uid, Int32, :"RoomId.u"
  consume :prisoner_id, Int32, :"PrisonerId.i"
  consume :prisoner_uid, Int32, :"PrisonerId.u"
  # TODO: Unknown format
  consume :actors, DotPrison::Table, :Actors
  consume :stages, Stages, :Stages
end
