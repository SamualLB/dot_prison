# TODO: Separate out into subclasses
struct DotPrison::Object < DotPrison::Consumer
  consume :id, Int32, :"Id.i"
  consume :uid, Int32, :"Id.u"
  consume :type, String, :Type
  consume :sub_type, Int32, :SubType
  consume :pos, {Float64, Float64}, :"Pos.x", :"Pos.y"
  consume :orientation, {Float64, Float64}, :"Or.x", :"Or.y"
  consume :velocity, {Float64, Float64}, :"Vel.x", :"Vel.y"
  consume :destination, {Float64, Float64}, :"Dest.x", :"Dest.y"
  consume :attack_timer, Float64, :AttackTimer
  consume :equipment, String, :Equipment
  consume :secondary_equipment, String, :SecondaryEquipment
  consume :energy, Float64, :Energy
  consume :office_id, Int32, :"Office.i"
  consume :office_uid, Int32, :"Office.u"
  consume :timer, Float64, :Timer
  consume :opening_direction, {Int32, Int32}, :"OpenDir.x", :"OpenDir.y"
  consume :sector_timer, Float64, :SectorTimer
  consume :cell_id_timer, Float64, :CellIdTimer
  consume :age, Int32, :Age
  consume :natural, Bool, :Natural
  consume :close_timer, Float64, :CloseTimer
  consume :open, Float64, :Open
  consume :mode, String, :Mode
  consume :remotely_openable, Int32, :RemotelyOpenable
  consume :powered, Bool, :Powered
  consume :on, Bool, :On
  consume :damage, Float64, :Damage
  consume :body_armour, String, :BodyArmour
  consume :station_id, Int32, :"Station.i"
  consume :station_uid, Int32, :"Station.u"
  consume :tazer_trained, Bool, :TazerTrained
  consume :squad_member, Int32, :SquadMember
  consume :needs, DotPrison::Needs, :Needs
  consume :bio, DotPrison::Bio, :Bio
  consume :cell_id, Int32, :"CellId.i"
  consume :cell_uid, Int32, :"CellId.u"
  consume :walls, {Float64, Float64}, :"Walls.x", :"Walls.y"
  consume :trigger_time, Float64, :TriggerTime
  consume :triggered_by_id, Int32, :"TriggeredBy.i"
  consume :triggered_by_uid, Int32, :"TriggeredBy.u"
  consume :door_id, Int32, :"Door.i"
  consume :door_uid, Int32, :"Door.u"
end
