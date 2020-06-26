struct DotPrison::Prison::Construction < DotPrison::Consumer
  consume :next_job_id, Int32, :nextjobId
  consume :auto_lights, Bool, :AutoLights

  # TODO: Unknown format
  consume :jobs, DotPrison::Table, :Jobs

  # TODO: Custom container
  consume :planning_jobs, DotPrison::Table, :PlanningJobs

  # TODO: Seems to be an indexed table
  consume :clone_rooms, DotPrison::Table, :CloneRooms

  # TODO: Unknown format
  consume :blocked_areas, DotPrison::Table, :BlockedAreas
end
