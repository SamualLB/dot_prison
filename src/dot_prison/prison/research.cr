struct DotPrison::Prison::Research < DotPrison::Consumer
  def unconsumed
    old = previous_def
    new = [] of String
    old.each do |o|
      found = Identifier.each do |i|
        break true if o == i.to_s
        false
      end
      new << o unless found
    end
    new
  end

  def [](id : Identifier)
    Task.new(table.parse_table(id.to_s))
  end

  struct Task < DotPrison::Consumer
    consume :desired, Bool, :Desired
    consume :progress, Float64, :Progress
  end

  enum Identifier
    None
    Warden
    Maintainance
    Security
    Legal
    MentalHealth
    Finance
    CCTV
    RemoteAccess
    Health
    Cleaning
    GroundsKeeping
    Deployment
    Patrols
    Dogs
    PrisonLabour
    Education
    LandExpansion
    Contraband
    Policy
    Armoury
    BodyArmour
    Tazers
    TazersForEveryone
    BankLoans
    LowerTaxes1
    LowerTaxes2
    ExtraGrant
    AdvancedManagement
    Deathrow
    PermanentPunishment
    RemoveMinCellSize
    ReduceExecutionLiability
    LegalPrep
    LegalDefense
    GuardTowers
    ForestryLabour
    Orderly

    def to_s : String
      return "Cctv" if self == CCTV
      super
    end
  end
end
