class DotPrison::Prison::Intake::Pool < DotPrison::StoreConsumer
  handle :size, :Int32, :Pool
  handle :ratio, :Float64, :Ratio
  handle :next_intake, :Int32, :NextIntake # ????
  handle :queue, :Int32, :Queue # ????
  handle :nitgs, :Int32, :NumNITGs # ????

  no_handle :PrisonerCategory

  def self.from_store(store : Store, prison : Prison) : {Category | String, Pool}
    cls = Category.from_store(store.parse_string(:PrisonerCategory))
    return {cls, new(store, prison)}
  end
end
