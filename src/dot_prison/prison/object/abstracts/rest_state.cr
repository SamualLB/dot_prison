module DotPrison::Prison::Object::RestStateProperties
  macro included
    custom_handle :rest_state, :"RestState | String", :RestState
  end
end

enum DotPrison::Prison::Object::RestState
  RestStateRequired

  def self.from_store(str) : RestState | String | Nil
    return nil unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown rest state: #{str}"
    str
  end
end
