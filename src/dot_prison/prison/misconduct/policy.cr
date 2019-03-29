class DotPrison::Prison::Misconduct::Policy < DotPrison::StoreConsumer
  handle(:quantity, :Int32, :Quantity)
  handle(:search_prisoner, :Bool, :SearchPrisoner)
  handle(:search_cell, :Bool, :SearchCell)
  
  custom_handle(:category_change, :CategoryChange, :CategoryChange)
  custom_handle(:punishment, :Punishment, :Punishment)

  def initialize(store : Store, prison : Prison)
    super
    @category_change = CategoryChange.from_store(store.parse_string(:CategoryChange))
    @punishment = Punishment.from_store(store.parse_string(:Punishment))
  end

  enum CategoryChange
    None
    SetSuper
    Up

    DEFAULT = None

    def self.from_store(str) : CategoryChange
      return DEFAULT unless str.is_a? String
      parsed = parse? str
      return parsed if parsed
      DotPrison.logger.debug "Unknown category change: #{str}"
      DEFAULT
    end
  end

  enum Punishment
    None
    Lockdown
    Solitary
    
    DEFAULT = None

    def self.from_store(str) : Punishment
      return DEFAULT unless str.is_a? String
      parsed = parse? str
      return parsed if parsed
      DotPrison.logger.debug "Unknown policy punishment: #{str}"
      DEFAULT
    end

  end
end

require "./policy/*"
