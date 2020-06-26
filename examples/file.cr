require "../src/dot_prison"

prison = DotPrison::Prison.new(DotPrison.parse(ARGV[0]))
File.open("dot_prison.prison", "w") do |file|
  prison.to_prison(file)
end
