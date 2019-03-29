class DotPrison::Prison::DeploymentSchedule < DotPrison::StoreConsumer
  NO_SCHEDULES = 10

  custom_handle :chosen_schedule, :"Hash(Int32, Int32)", :ChosenSchedule
  custom_handle :schedules, :"Hash(Int32, Schedule)", :Schedules

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @chosen_schedule = {} of Int32 => Int32
    sch_store = store.parse_store :ChosenSchedule
    (0...24).each do |i|
      chosen_schedule[i] = sch_store.parse_int("Hour #{i}")
    end
    sch_store = store.parse_store :Schedules
    @schedules = {} of Int32 => Schedule
    (0...NO_SCHEDULES).each do |i|
      schedules[i] = Schedule.new(sch_store.parse_store("Schedule #{i}"), prison)
    end
  end
end

require "./deployment_schedule/*"
