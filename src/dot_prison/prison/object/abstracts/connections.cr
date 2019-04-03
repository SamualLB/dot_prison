module DotPrison::Prison::Object::ConnectionProperties
  macro included
    custom_handle :connections, :"Array(Connection)", :Connections
  end

  def initialize(store : Store, prison : Prison)
    super
    @connections = [] of Connection
    store.parse_indexed_store(:Connections) do |conn|
      connections << Connection.new(conn, prison)
    end
  end
end

class DotPrison::Prison::Object::Connection < DotPrison::StoreConsumer
  handle :to, :"Reference(Object)", :"To.i", :"To.u"
  handle :triggered, :Bool, :Triggered
  handle :time_index, :Float64, :TimeIndex

  custom_handle :via, :"Array(Tuple(Float64, Float64))", :Via

  def initialize(store : Store, prison : Prison)
    super
    @via = [] of {Float64, Float64}
    store.parse_indexed_store(:Via) do |v|
      via << {v.parse_float(:x), v.parse_float(:y)}
    end
  end
end
