require "../src/dot_prison"

Log.setup :info

prison = DotPrison::Prison.new(DotPrison.parse(ARGV[0]))
prison.unconsumed_tree.each { |i| puts "#{i[0]}: #{i[1]}" }
