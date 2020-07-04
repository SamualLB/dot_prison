require "./spec_helper"

describe DotPrison::Table do
  describe "#parse_string" do
    parsed = DotPrison::Parser.new("TestKey TestString").parse

    it "parses String key" do
      parsed.parse_string("TestKey").should eq "TestString"
    end

    it "parses Symbol key" do
      parsed.parse_string(:TestKey).should eq "TestString"
    end

    it "returns nil by default" do
      parsed.parse_string("FakeKey").should be_nil
    end

    it "uses default value" do
      parsed.parse_string("TestKey", "NotFound").should_not eq "NotFound"
      parsed.parse_string("FakeKey", "NotFound").should eq "NotFound"
    end
  end

  describe "#parse_table" do
    parsed = DotPrison::Parser.new("BEGIN Table InnerKey InnerVal END OuterKey OVal").parse

    it "parses String key" do
      (sto = parsed.parse_table("Table")).class.should eq DotPrison::Table
      sto.empty?.should be_false
    end

    it "parses Symbol key" do
      (sto = parsed.parse_table(:Table)).class.should eq DotPrison::Table
      sto.size.should eq 1
    end

    it "returns empty Table if key not found" do
      (sto = parsed.parse_table("FakeTable")).class.should eq DotPrison::Table
      sto.empty?.should be_true

      (sto = parsed.parse_table(:FakeTable)).class.should eq DotPrison::Table
      sto.empty?.should be_true
    end
  end

  describe "#parse_table?" do
    parsed = DotPrison::Parser.new("BEGIN Table Key Val END").parse

    it "parses String key" do
      (sto = parsed.parse_table?("Table")).class.should eq DotPrison::Table
      sto = sto.as(DotPrison::Table)
      sto.empty?.should be_false
    end

    it "parses Symbol key" do
      (sto = parsed.parse_table?(:Table)).class.should eq DotPrison::Table
      sto = sto.as(DotPrison::Table)
      sto.size.should eq 1
    end

    it "returns nil if key not found" do
      parsed.parse_table?("FakeTable").should be_nil
      parsed.parse_table?(:FakeTable).should be_nil
    end
  end

  describe "#parse_int" do
    parsed = DotPrison::Parser.new("Test1 123 Test2 456.789 Test3 False").parse

    it "parses String key" do
      parsed.parse_int("Test1").should eq 123
    end

    it "parses Symbol key" do
      parsed.parse_int(:Test1).should eq 123
    end

    it "return 0 by default on invalid data" do
      parsed.parse_int("Test2").should eq 0
      parsed.parse_int(:Test2).should eq 0
      parsed.parse_int("Test3").should eq 0
      parsed.parse_int(:Test3).should eq 0
    end

    it "can have alternative default values" do
      parsed.parse_int("Test2", 456).should eq 456
      parsed.parse_int(:Test2, 456).should eq 456
      parsed.parse_int("Test3", 101112).should eq 101112
      parsed.parse_int(:Test3, 101112).should eq 101112
    end
  end

  describe "#parse_float" do
    parsed = DotPrison::Parser.new("Test1 1.23 Test2 456 Test3 True").parse

    it "parses String key" do
      parsed.parse_float("Test1").should eq 1.23
    end

    it "parses Symbol key" do
      parsed.parse_float(:Test1).should eq 1.23
    end

    it "parses integers" do
      parsed.parse_float("Test2").should eq 456
      parsed.parse_float(:Test2).should eq 456
      parsed.parse_float("Test2").should eq 456.0
      parsed.parse_float(:Test2).should eq 456.0
    end

    it "returns default value of 0.0 when key is not found" do
      parsed.parse_float("Test4").should eq 0.0
      parsed.parse_float(:Test4).should eq 0.0
    end

    it "returns default when encountering invalid data" do
      parsed.parse_float("Test3").should eq 0.0
      parsed.parse_float(:Test3).should eq 0.0
    end

    it "can have alternative default values" do
      parsed.parse_float("Test3", 7.89).should eq 7.89
      parsed.parse_float(:Test3, 7.89).should eq 7.89
      parsed.parse_float("Test3").should_not eq "True"
      parsed.parse_float(:Test3).should_not eq "True"
      parsed.parse_float("Test3").should_not eq true
      parsed.parse_float(:Test3).should_not eq true
    end
  end

  describe "#parse_bool" do
    parsed = DotPrison::Parser.new("K1 true K2 false K3 maybe K5 truee K6 fals K7 True K8 False").parse

    it "parses String key" do
      parsed.parse_bool("K1").should be_true
      parsed.parse_bool("K2").should be_false
    end

    it "parses Symbol key" do
      parsed.parse_bool(:K1).should be_true
      parsed.parse_bool(:K2).should be_false
    end

    it "returns false on invalid data" do
      parsed.parse_bool("K3").should be_false
      parsed.parse_bool(:K3).should be_false
      parsed.parse_bool("K5").should be_false
      parsed.parse_bool(:K5).should be_false
      parsed.parse_bool("K6").should be_false
      parsed.parse_bool(:K6).should be_false
    end

    it "doesn't recognise True or False, only lowercase" do
      parsed.parse_bool("K7").should be_false
      parsed.parse_bool(:K7).should be_false
      parsed.parse_bool("K8").should be_false
      parsed.parse_bool(:K8).should be_false
    end

    it "return false when key not found" do
      parsed.parse_bool("K4").should be_false
      parsed.parse_bool(:K4).should be_false
    end
  end

  describe "#parse_string_array" do
    parsed = DotPrison::Parser.new("K1 K1Val1 K1 K1Val2 K2 K2Val1 K3 K3Val1 K3 K3Val2 K3 K3Val3 BEGIN K5 K5Key1 K5Val1 END BEGIN K5 K5Key2 K5Val2 END").parse

    it "parses String key" do
      parsed.parse_string_array("K1").should eq ["K1Val1", "K1Val2"]
      parsed.parse_string_array("K3").should eq ["K3Val1", "K3Val2", "K3Val3"]
    end

    it "parses Symbol key" do
      parsed.parse_string_array(:K1).should eq ["K1Val1", "K1Val2"]
      parsed.parse_string_array(:K3).should eq ["K3Val1", "K3Val2", "K3Val3"]
    end

    it "makes single string into an array" do
      parsed.parse_string_array("K2").should eq ["K2Val1"]
      parsed.parse_string_array(:K2).should eq ["K2Val1"]
    end

    it "returns empty array when key not found" do
      parsed.parse_string_array("K4").should eq [] of String
      parsed.parse_string_array(:K4).should eq [] of String
    end

    it "returns empty array when key holds invalid type" do
      parsed.parse_string_array("K5").should eq [] of String
      parsed.parse_string_array(:K5).should eq [] of String
    end

    it "cannot parse mixed Strings and Tables" do
      expect_raises(Exception, "Mixing table and string array") do
        DotPrison::Parser.new("K6 K6Val BEGIN K6 END").parse
      end
      expect_raises(Exception, "Mixing string and table array") do
        DotPrison::Parser.new("BEGIN K7 END K7 K7Val").parse
      end
    end
  end

  describe "#parse_table_array" do
    parsed = DotPrison::Parser.new("BEGIN K1 K1Key1 K1Val1 END BEGIN K1 K1Key2 K1Val2 END BEGIN K2 K2Key1 K2Key1 END K3 K3Val1 K3 K3Val2").parse

    it "parses String key" do
      parsed.parse_table_array("K1").size.should eq 2
    end

    it "parses Symbol key" do
      parsed.parse_table_array(:K1).size.should eq 2
    end

    it "makes single Table into an array" do
      (arr = parsed.parse_table_array("K2")).class.should eq Array(DotPrison::Table)
      arr.size.should eq 1
      (arr = parsed.parse_table_array(:K2)).class.should eq Array(DotPrison::Table)
      arr.size.should eq 1
    end

    it "returns empty array when key not found" do
      (arr = parsed.parse_table_array("K4")).class.should eq Array(DotPrison::Table)
      arr.empty?.should be_true
      (arr = parsed.parse_table_array(:K4)).class.should eq Array(DotPrison::Table)
      arr.empty?.should be_true
    end

    it "returns empty array when key holds invalid type" do
      (arr = parsed.parse_table_array("K3")).class.should eq Array(DotPrison::Table)
      arr.empty?.should be_true
      (arr = parsed.parse_table_array(:K3)).class.should eq Array(DotPrison::Table)
      arr.empty?.should be_true
    end
  end
end
