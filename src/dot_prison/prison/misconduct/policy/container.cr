class DotPrison::Prison::Misconduct::Policy::Container
  TYPES = ["None", "Complaint", "Destruction", "EscapeAttempt", "InjuredPrisoner", "InjuredStaff", "SeriousInjury", "Intoxicated", "Murder", "ContrabandWeapons", "ContrabandTools", "ContrabandNarcotics", "ContrabandLuxuries"]

  property! policies : Hash(String, Policy)

  def initialize(store : Store, prison : Prison)
    @policies = {} of String => Policy
    store.each do |k, v|
      next unless v.is_a? Store
      found = TYPES.each do |typ|
        if k == typ
          policies[k] = Policy.new(v, prison)
          break true
        end
        false
      end
      unless found
        policies[k] = Policy.new(v, prison)
        DotPrison.logger.debug "Unknown policy: #{k}"
      end
    end
  end
end
