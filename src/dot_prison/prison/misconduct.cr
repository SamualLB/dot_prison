class DotPrison::Prison::Misconduct < DotPrison::StoreConsumer
  handle(:time_without_incident, :Float64, :TimeWithoutIncident)

  custom_handle(:reports, :"Hash(Int32, Report)", :MisconductReports)
  custom_handle(:policies, :"Policy::Container", :Policy)

  def initialize(store : Store, @prison : Prison)
    init_store(store)
    @reports = {} of Int32 => Report
    store.parse_store(:MisconductReports).each do |k, v|
      next unless v.is_a? Store
      reports[v.parse_int(:"PrisonerId.i")] = Report.new(v, prison)
    end
    @policies = Policy::Container.new(store.parse_store(:Policy), prison)
  end
end

require "./misconduct/*"
