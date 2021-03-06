# TODO: Pretty much useless
#
# Maybe some sort of forwarding consumer
struct DotPrison::Prison::Informants < DotPrison::Consumer
  struct Informant < DotPrison::Consumer
    enum State
      Gone
    end

    consume :prisoner_id, Int32, :"Prisoner.i"
    consume :prisoner_uid, Int32, :"Prisoner.u"
    consume :state, State, :State
    consume :timer, Float64, :Timer
    consume :coverage, Float64, :Coverage
    consume :burn_point, Float64, :BurnPoint
    consume :highest_suspicion, Float64, :HighestSuspicion
  end

  consume :informants, DotPrison::IndexedTable(Informant), :Informants
end
