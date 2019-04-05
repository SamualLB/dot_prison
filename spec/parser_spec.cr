require "./spec_helper"

describe DotPrison::Parser do
  describe "#new" do
    it "is created" do
      DotPrison::Parser.new("TestString TestValue").class.should eq DotPrison::Parser
    end
  end

  describe "#parse" do
    it "reads empty" do
      DotPrison::Parser.new("").parse.should eq DotPrison::Store.new
      DotPrison::Parser.new("").parse.should_not eq DotPrison::Store.new("TestName")
    end
  end
end
