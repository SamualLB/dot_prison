require "logger"
require "./dot_prison/*"

module DotPrison
  VERSION = "0.1.0"

  @@logger = Logger.new(STDERR, level: Logger::INFO)

  class_getter logger

  extend self
end

parsed : DotPrison::Store? = nil

File.open("/home/sam/.Prison Architect/saves/Island.prison") do |file|
#File.open("/home/sam/.Prison Architect/saves/Ship.prison") do |file|
#File.open("/home/sam/.Prison Architect/saves/Test.prison") do |file|
  parsed = DotPrison::Parser.new(file).parse
end

parsed = parsed.as(DotPrison::Store)

DotPrison::Prison.new(parsed)
