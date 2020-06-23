require "log"
require "./dot_prison/*"

Log.setup(:notice)

module DotPrison
  VERSION = "0.1.0"

  Log = ::Log.for("dot_prison")

  extend self

  def self.parse(path : String)
    Parser.new(File.new(path)).parse
  end
end

store = DotPrison.parse(ARGV[0])

p store.class

p store.version
