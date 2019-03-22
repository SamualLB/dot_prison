class DotPrison::Prison::Misconduct::Entry < DotPrison::StoreConsumer
  handle(:quantity, :Float64, :Quantity)
  handle(:convicted, :Bool, :Convicted)
  handle(:punished, :Bool, :Punished)

  custom_handle(:type, :Type, :Type)

  def initialize(store : Store, @prison : Prison)
    super
    type = Type.from_store store.parse_string(:Type)
  end

  enum Type
    ContrabandLuxuries
    ContrabandNarcotics
    ContrabandTools
    ContrabandWeapons
    Destruction
    EscapeAttempt
    InjuredPrisoner
    InjuredStaff
    Murder
    SeriousInjury

    def self.from_store(str) : Type | String
      str = str || ""
      parsed = parse? str
      return parsed if parsed
      DotPrison.logger.debug "Unknown misconduct type: #{str}" unless str.empty?
      str
    end
  end
end
