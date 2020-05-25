require "./store"

class DotPrison::Prison < DotPrison::Store
  def version
    parse_string("Version", "").as String
  end

  def version=(n)
    @content["Version"] = n.to_s
  end
end
