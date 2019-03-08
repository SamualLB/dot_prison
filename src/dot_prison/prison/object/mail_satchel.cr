class DotPrison::Prison::Object::MailSatchel < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:quantity, :Int32, :Quantity)

  custom_handle(:recipients, :Store, :Recipients)

  def initialize(store : Store, prison : Prison)
    super
    @recipients = store.parse_store(:Recipients)
  end
end
