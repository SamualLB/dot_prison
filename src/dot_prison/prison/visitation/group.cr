class DotPrison::Prison::Visitation::Group < DotPrison::StoreConsumer
  handle(:prisoner, :"Reference(Object::Prisoner)", :"Prisoner.i", :"Prisoner.u")
  handle(:table, :"Reference(Object)", :"Table.i", :"Table.u")
  handle(:leader, :"Reference(Object::Visitor)", :"PartyLeader.i", :"PartyLeader.u")
  handle(:visitor2, :"Reference(Object::Visitor)", :"Visitor2.i", :"Visitor2.u")
  handle(:visitor3, :"Reference(Object::Visitor)", :"Visitor3.i", :"Visitor3.u")
  handle(:timer, :Float64, :Timer)

  custom_handle(:state, :"State | String", :State)

  def initialize(store : Store, prison : Prison)
    super
    @state = State.from_store(store.parse_string(:State))
  end

  enum State
    Leaving
    Waiting
    Visiting
    Arriving

    DEFAULT = Leaving

    def self.from_store(str) : State | String
      return DEFAULT unless str.is_a? String
      parsed = parse? str
      return parsed if parsed
      DotPrison.logger.debug "Unknown visitor status: #{str}"
      str
    end
  end
end
