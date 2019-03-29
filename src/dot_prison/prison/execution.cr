class DotPrison::Prison::Execution < DotPrison::StoreConsumer
  handle :active, :Bool, :Active
  handle :previous_illegal, :Bool, :PreviousExecutionIllegal
  handle :time, :Float64, :ExecutionTime
  handle :room, :"Reference(Room)", :"RoomId.i", :"RoomId.u"
  handle :prisoner, :"Reference(Object::Prisoner)", :"PrisonerId.i", :"PrisonerId.u"

  custom_handle :stages, :"Hash(Stage, {Bool, Float64})", :Stages

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    stages = Stage.from_store(store.parse_store(:Stages))
  end
end

require "./execution/*"
