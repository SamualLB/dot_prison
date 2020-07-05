require "./spec_helper"

describe DotPrison::Builder do
  describe "#build" do
    it "builds a String key to String value" do
      built = DotPrison::Table.build do |t|
        t.element "TestKey", "TestValue"
      end
      parsed = DotPrison::Parser.new("TestKey TestValue").parse
      built.should eq parsed
    end

    it "builds a Symbol to String value" do
      built = DotPrison::Table.build do |t|
        t.element :TestKey, "TestValue"
      end
      parsed = DotPrison::Parser.new("TestKey TestValue").parse
      built.should eq parsed
    end

    it "builds a Int value" do
      built = DotPrison::Table.build do |t|
        t.element :TestKey, 12345
      end
      parsed = DotPrison::Parser.new("TestKey 12345").parse
      built.should eq parsed
    end

    it "builds a Float value" do
      built = DotPrison::Table.build do |t|
        t.element :TestKey, 564.327
      end
      parsed = DotPrison::Parser.new("TestKey 564.327").parse
      built.should eq parsed
    end

    it "builds a Bool value" do
      built = DotPrison::Table.build do |t|
        t.element :TestKey, true
      end
      parsed = DotPrison::Parser.new("TestKey true").parse
      built.should eq parsed
    end

    it "builds a Table" do
      built = DotPrison::Table.build do |t|
        t.element :TestKey do
        end
      end
      parsed = DotPrison::Parser.new("BEGIN TestKey END").parse
      built.should eq parsed
    end

    it "can add two of the same key" do
      built = DotPrison::Table.build do |t|
        t.element :TestKey, "Value1"
        t.element :TestKey, "Value2"
      end
      parsed = DotPrison::Parser.new("TestKey Value1 TestKey Value2").parse
      built.should eq parsed
    end
  end
end
