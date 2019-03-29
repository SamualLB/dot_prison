class DotPrison::Prison::Grant::Container
  TYPES = ["Grant_bootstraps", "Grant_Administration", "Grant_FirstCellBlock", "Grant_Health", "Grant_Maintenance", "Grant_Visitation", "Grant_BasicSecurity", "Grant_EnhancedSecurity", "Grant_AdvancedSecurity", "Grant_PrisonerWorkforce", "Grant_ReduceStaffStress", "Grant_ShortTermInvestment", "Grant_LongTermInvestment", "Grant_CellBlock50", "Grant_CellBlock100", "Grant_CellBlock200", "Grant_PrisonLabour", "Grant_DrugSearch", "Grant_ContrabandSupply"]

  property! grants : Hash(String, Grant)

  def initialize(store : Store, prison : Prison)
    @grants = Hash(String, Grant).new
    store.each do |k, v|
      next unless v.is_a? Store
      found = TYPES.each do |typ|
        if k == typ
          grants[k] = Grant.new(v, prison)
          break true
        end
        false
      end
      unless found
        grants[k] = Grant.new(v, prison)
        DotPrison.logger.debug "Unknown grant #{k}"
      end
    end
  end
end
