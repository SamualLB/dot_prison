struct DotPrison::Prison::CoveragePlan < DotPrison::Consumer
  struct Plan < DotPrison::Consumer
    struct Content < DotPrison::Consumer
      consume :trigger_condition_value, Int32, :TriggerConditionValue
      consume :alt_trigger_condition_value, Int32, :AltTriggerConditionValue
      consume :emergency_squads_request_num, Int32, :EmergencySquadsRequestNum
      consume :emergency_active, Bool, :EmergencyActive
    end

    consume :is_active, Bool, :Active
    consume :is_auto, Bool, :AutoServices
    consume :contents, Array(Content), :List
  end

  consume :arson_accidents_plan, Plan, :ArsonAccidentsPlan
  consume :preservation_plan, Plan, :PreservationPlan
  consume :restoration_plan, Plan, :RestorationPlan
  consume :health_safety_plan, Plan, :HealthSafetyPlan
  consume :pest_control_plan, Plan, :PestControlPlan
end