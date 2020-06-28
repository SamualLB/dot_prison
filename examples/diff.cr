require "../src/dot_prison"

prison1 = DotPrison::Prison.new(DotPrison.parse(ARGV[0]))
prison2 = DotPrison::Prison.new(DotPrison.parse(ARGV[1]))

puts prison1 == prison2
