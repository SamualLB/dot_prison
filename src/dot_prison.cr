require "log"
require "./dot_prison/*"

module DotPrison
  VERSION = "0.1.0"

  Log = ::Log.for("dot_prison")

  extend self

  def self.parse(path : String)
    Parser.new(File.new(path)).parse
  end
end
