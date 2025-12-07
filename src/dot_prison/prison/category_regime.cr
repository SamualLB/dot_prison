struct DotPrison::Prison::CategoryRegime < DotPrison::Consumer
  consume :current_activity, String, :CurrentActivity
  consume :previous_activity, String, :PreviousActivity
  
  {% for i in 0...24 %}
    consume :"[i {{i}}]"
  {% end %}

  def [](i : Int32) : String
    raise IndexError.new("Regime slot #{i} out of bounds (0...24)") unless (0...24).includes?(i)
    table.parse_string("[i #{i}]", "")
  end
end
