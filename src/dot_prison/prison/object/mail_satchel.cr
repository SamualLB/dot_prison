class DotPrison::Prison::Object::MailSatchel < DotPrison::Prison::Object
  include ObjectProperties
  include Orientation

  handle(:quantity, :Int32, :Quantity)

  custom_handle(:recipients, :Store, :Recipients)
  custom_handle :mail_type, :"MailType | String", :MailType

  def initialize(store : Store, prison : Prison)
    super
    @recipients = store.parse_store(:Recipients)
    @mail_type = MailType.from_store(store.parse_string(:MailType))
  end

  enum MailType
    MailSorted

    def self.from_store(str) : MailType | String | Nil
      return nil unless str.is_a? String
      parsed = parse? str
      return parsed if parsed
      DotPrison.logger.debug "Unknown mail type: #{str}"
      str
    end
  end
end
