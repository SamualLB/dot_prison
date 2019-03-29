enum DotPrison::Prison::Execution::Stage
  Start
  Lockdown
  Testing
  Assemble
  Witnesses
  Escort
  Execution
  Dismissed
  FinalReport

  def self.from_store(store) : Hash(Stage, {Bool, Float64})
    hash = {} of Stage => {Bool, Float64}
    each do |st|
      hash[st] = {store.parse_bool("#{st}Started"), store.parse_float("#{st}Progress")}
    end
    hash
  end
end
