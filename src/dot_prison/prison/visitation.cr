struct DotPrison::Prison::Visitation < DotPrison::Consumer
  struct Group < DotPrison::Consumer
    # TODO: Enummable
    consume :state, String, :State
    consume :timer, Float64, :Timer
    consume :leader_id, Int32, :"PartyLeader.i"
    consume :leader_uid, Int32, :"PartyLeader.u"
    consume :table_id, Int32, :"Table.i"
    consume :table_uid, Int32, :"Table.u"
    consume :prisoner_id, Int32, :"Prisoner.i"
    consume :prisoner_uid, Int32, :"Prisoner.u"
  end

  consume :waiting, Int32, :Waiting
  consume :timer, Float64, :Timer
  consume :visit_count, Int32, :VisitCount
  consume :active_groups, Int32, :ActiveVisitorGroups
  consume :visitations, Array(Group), :Visitation
end
