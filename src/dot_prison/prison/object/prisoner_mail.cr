class DotPrison::Prison::Object::PrisonerMail < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:opened, :Bool, :Opened)
  handle(:owner, :"Reference(Prisoner)", :"Owner.i", :"Owner.u")
end
