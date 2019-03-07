class DotPrison::Prison::Object::PrisonerMail < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:opened, :Bool, :Opened)
end
