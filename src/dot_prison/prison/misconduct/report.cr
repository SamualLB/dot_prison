class DotPrison::Prison::Misconduct::Report < DotPrison::StoreConsumer
  handle(:prisoner, :"Reference(Object::Prisoner)", :"PrisonerId.i", :"PrisonerId.u")
  handle(:scratched, :Bool, :Scratched)
  handle(:no_punishment, :Float64, :Punishment_None)
  handle(:lockdown, :Float64, :Punishment_Lockdown)
  handle(:solitary, :Float64, :Punishment_Solitary)

  custom_handle(:current_punishment, :Punishment, :CurrentPunishment)
  custom_handle(:misconduct, :"Array(Entry)", :MisconductEntries)

  def initialize(store : Store, @prison : Prison)
    super
    current_punishment = Punishment.from_store(store.parse_int(:CurrentPunishment))
    @misconduct = [] of Entry
    store.parse_indexed_store(:MisconductEntries) do |entry|
      misconduct << Entry.new(entry, prison)
    end
  end
end
