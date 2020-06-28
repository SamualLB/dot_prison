struct DotPrison::Prison::MutatorSystem < DotPrison::Consumer
  # TODO: More entries
  enum Identifier
    SlowDeliveries
  end

  {% for i in Identifier.constants %}
    consume :{{i.id.underscore}}, Bool, :{{i.id}}
  {% end %}
end
