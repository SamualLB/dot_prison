class DotPrison::Prison::Victory::Log < DotPrison::StoreConsumer
  handle :time_index, :Float64, :TimeIndex
  handle :health, :Int32, :Grading_Health
  handle :security, :Int32, :Grading_Security
  handle :punishment, :Int32, :Grading_Punishment
  handle :reform, :Int32, :Grading_Reform
  handle :prisoner, :"Reference(Object::Prisoner)", :"PrisonerId.i", :"PrisonerId.u"
  handle :reoffending_chance, :Float64, :ReoffendingChance

  custom_handle :type, :String, :Type # TODO
end
