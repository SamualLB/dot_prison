class DotPrison::Prison::Contraband::Log < DotPrison::StoreConsumer
  handle :time, :Float64, :Time
  handle :confirmed, :Bool, :Confirmed
  handle :position, :"Tuple(Float64, Float64)", :"Pos.x", :"Pos.y"

  custom_handle(:status, :"Status | String", :Log)

  def initialize(store : Store, prison : Prison)
    init_store(store, prison)
    @status = Status.from_store(store.parse_string(:Log))
  end

  enum Status
    Detected
    Dog
    Found
    Hidden
    Position
    Smuggled
    Stolen
    Thrown
    Traded

    DEFAULT = Position

    def self.from_store(inp) : Status | String
      return DEFAULT unless inp.is_a? String
      parsed = parse? inp
      return parsed if parsed
      DotPrison.logger.debug "Unknown contraband log status: #{inp}"
      inp
    end
  end
end
