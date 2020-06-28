require "../src/dot_prison"

Log.setup :info

prison = DotPrison::Prison.new(DotPrison.parse(ARGV[0]))
puts prison.policy_data.unconsumed
