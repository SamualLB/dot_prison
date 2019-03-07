class DotPrison::Prison::Object::MailSatchel < DotPrison::Prison::Object
  include ObjectProperties

  handle(:quantity, :Int32, :Quantity)
end
