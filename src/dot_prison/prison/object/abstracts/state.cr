module DotPrison::Prison::Object::StateProperties
  macro included
    custom_handle :state, :"State | String", :State
  end

  def initialize(store : Store, prison : Prison)
    super
    state = State.from_store(store.parse_string(:State))
  end
end

enum DotPrison::Prison::Object::State
  Resting

  def self.from_store(str) : State | String | Nil
    return nil unless str.is_a? String
    parsed = parse? str
    return parsed if parsed
    DotPrison.logger.debug "Unknown object state: #{str}"
    str
  end
end
