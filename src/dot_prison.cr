require "logger"
require "./dot_prison/*"

module DotPrison
  VERSION = "0.1.0"

  @@logger = Logger.new(STDERR, level: Logger::INFO)

  class_getter logger

  extend self

  def self.parse(path : String)
    Parser.new(File.new(path)).parse
  end
end

store = DotPrison.parse(ARGV[0])

p store.class

p store.version
