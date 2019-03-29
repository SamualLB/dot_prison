class DotPrison::Prison::Object::Prisoner::Experience < DotPrison::StoreConsumer
  handle :tick_timer, :Float64, :TickTimer
  handle :starting_reoffending_chance, :Float64, :StartingReoffendingChance
  
  custom_handle :experience, :"Hash(ExperienceType | String, Float64)", :Experience
  custom_handle :results, :Store, :Results

  def initialize(store : Store, @prison : Prison)
    init_store(store, prison)
    @experience = {} of ExperienceType | String => Float64
    xp_store = store.parse_store(:Experience)
    xp_store.each do |k, v|
      next unless v.is_a? String
      typ = ExperienceType.from_store(k)
      next unless typ
      experience[typ] = xp_store.parse_float(k)
    end

    # TODO Find out what this does?
    @results = store.parse_store(:results)
    DotPrison.logger.debug "Found results! #{results}" unless results.@content.empty?
  end
end
