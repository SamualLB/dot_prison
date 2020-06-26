require "../src/dot_prison"

prison = DotPrison::Prison.new(DotPrison.parse(ARGV[0]))
p prison.balance
#puts prison.to_prison
