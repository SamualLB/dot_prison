require "json"

struct DotPrison::Store
  alias Type = Hash(String, String | Store)

  property content = Type.new
  property name = ""

  forward_missing_to @content
end
