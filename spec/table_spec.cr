require "./spec_helper"

describe DotPrison::Table do
  describe "#parse_string" do
    parsed = DotPrison::Parser.new("TestKey TestString BEGIN TestTable END").parse

    it "parses String key" do
      parsed.parse_string("TestKey").should eq "TestString"
    end

    it "parses Symbol key" do
      parsed.parse_string(:TestKey).should eq "TestString"
    end

    it "defaults to empty String \"\" when not found" do
      parsed.parse_string("FakeKey").should eq ""
    end

    it "returns default value on non-String types" do
      parsed.parse_string(:TestTable).should eq ""
    end

    it "uses default value" do
      parsed.parse_string("TestKey", "NotFound").should_not eq "NotFound"
      parsed.parse_string("FakeKey", "NotFound").should eq "NotFound"
    end
  end

  describe "#parse_string?" do
    parsed = DotPrison::Parser.new("NewKey NewString BEGIN NewTable END").parse

    it "parses String key" do
      parsed.parse_string?("NewKey").should eq "NewString"
    end

    it "parses Symbol key" do
      parsed.parse_string?(:NewKey).should eq "NewString"
    end

    it "returns nil on non-String value" do
      parsed.parse_string?(:NewTable).should be_nil
    end

    it "returns nil on empty value" do
      parsed.parse_string?("OldKey").should be_nil
      parsed.parse_string?(:OldKey).should be_nil
    end
  end

  describe "#parse_string!" do
    parsed = DotPrison::Parser.new("CoolKey CoolVal BEGIN CoolTable END").parse

    it "parses String key" do
      parsed.parse_string!("CoolKey").should eq "CoolVal"
    end

    it "parses Symbol key" do
      parsed.parse_string!(:CoolKey).should eq "CoolVal"
    end

    it "raises KeyError on non-String value" do
      expect_raises(KeyError, /DotPrison::Table/) do
        parsed.parse_string!(:CoolTable)
      end
    end

    it "raises KeyError on missing value" do
      expect_raises(KeyError) do
        parsed.parse_string!(:NotCoolKey)
      end
    end
  end

  describe "#parse_table" do
    parsed = DotPrison::Parser.new("BEGIN Table InnerKey InnerVal END OuterKey OVal OuterKey2 OVal2").parse

    it "parses String key" do
      (sto = parsed.parse_table("Table")).class.should eq DotPrison::Table
      sto.empty?.should be_false
    end

    it "parses Symbol key" do
      (sto = parsed.parse_table(:Table)).class.should eq DotPrison::Table
      sto.size.should eq 1
    end

    it "creates empty Table if empty" do
      (sto = parsed.parse_table("FakeTable")).class.should eq DotPrison::Table
      sto.empty?.should be_true
      parsed.parse_table("FakeTable").object_id.should eq sto.object_id

      (sto = parsed.parse_table(:OtherFakeTable)).class.should eq DotPrison::Table
      sto.empty?.should be_true
      parsed.parse_table(:OtherFakeTable).object_id.should eq sto.object_id
    end

    it "overwrites with empty Table if non-Table" do
      (tab = parsed.parse_table("OuterKey")).should be_a DotPrison::Table
      tab.empty?.should be_true
      parsed.parse_table("OuterKey").object_id.should eq tab.object_id

      (tab = parsed.parse_table(:OuterKey2)).should be_a DotPrison::Table
      tab.empty?.should be_true
      parsed.parse_table(:OuterKey2).object_id.should eq tab.object_id
    end
  end

  describe "#parse_table?" do
    parsed = DotPrison::Parser.new("BEGIN Table Key Val END OtherKey1 Val1").parse

    it "parses String key" do
      (tab = parsed.parse_table?("Table")).class.should eq DotPrison::Table
      tab.as(DotPrison::Table).empty?.should be_false
    end

    it "parses Symbol key" do
      (tab = parsed.parse_table?(:Table)).class.should eq DotPrison::Table
      tab.as(DotPrison::Table).size.should eq 1
    end

    it "returns nil on non-Table value" do
      parsed.parse_table?("OtherKey1").should be_nil
      parsed.parse_table?(:OtherKey1).should be_nil
    end

    it "returns nil if key not found" do
      parsed.parse_table?("FakeTable").should be_nil
      parsed.parse_table?(:FakeTable).should be_nil
    end
  end

  describe "#parse_table!" do
    parsed = DotPrison::Parser.new("BEGIN Table! Key1 Val1 END OtherKey OtherVal").parse

    it "parses String key" do
      (tab = parsed.parse_table!("Table!")).class.should eq DotPrison::Table
      tab.empty?.should be_false
    end

    it "parses Symbol key" do
      (tab = parsed.parse_table!(:Table!)).class.should eq DotPrison::Table
      tab.empty?.should be_false
    end

    it "raises KeyError on non-Table value" do
      expect_raises(KeyError, /String/) do
        parsed.parse_table!(:OtherKey)
      end
    end

    it "raises KeyError on missing value" do
      expect_raises(KeyError) do
        parsed.parse_table!(:FakeKey)
      end
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

  describe "#parse_int?" do
    parsed = DotPrison::Parser.new("Test1 431 Test2 747.43 Test3 Number").parse

    it "parses String key" do
      parsed.parse_int?("Test1").should eq 431
    end

    it "parses Symbol key" do
      parsed.parse_int?(:Test1).should eq 431
    end

    it "returns nil on non-Int values" do
      parsed.parse_int?("Test2").should be_nil
      parsed.parse_int?("Test3").should be_nil
    end

    it "returns nil on missing values" do
      parsed.parse_int?("Test5435").should be_nil
      parsed.parse_int?("Test456365").should be_nil
    end
  end

  describe "#parse_int!" do
    parsed = DotPrison::Parser.new("Test1 765 Test2 432.654 Test3 Plop").parse

    it "parses String key" do
      parsed.parse_int!("Test1").should eq 765
    end

    it "parses Symbol key" do
      parsed.parse_int!(:Test1).should eq 765
    end

    it "raises KeyError on non-Int values" do
      expect_raises(KeyError, /String/) do
        parsed.parse_int!("Test3")
      end
    end

    it "raises KeyError on missing values" do
      expect_raises(KeyError) do
        parsed.parse_int!("Test4312")
      end
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
    end
  end

  describe "#parse_float?" do
    parsed = DotPrison::Parser.new("Test1 453.34 Test2 324 Test3 Hello").parse

    it "parses String key" do
      parsed.parse_float?("Test1").should eq 453.34
    end

    it "parses Symbol key" do
      parsed.parse_float?(:Test1).should eq 453.34
    end

    it "parses integer values" do
      parsed.parse_float?("Test2").should eq 324.0
      parsed.parse_float?(:Test2).should eq 324.0
    end

    it "returns nil on missing key" do
      parsed.parse_float?("Test10000").should be_nil
      parsed.parse_float?(:Test43214).should be_nil
    end

    it "returns nil on non-float values" do
      parsed.parse_float?("Test3").should be_nil
      parsed.parse_float?(:Test3).should be_nil
    end
  end

  describe "#parse_float!" do
    parsed = DotPrison::Parser.new("Test1 654.32 Test2 765 Test3 NoHello").parse

    it "parses String key" do
      parsed.parse_float!("Test1").should eq 654.32
    end

    it "parses Symbol key" do
      parsed.parse_float!(:Test1).should eq 654.32
    end

    it "parses integer values" do
      parsed.parse_float!("Test2").should eq 765.0
      parsed.parse_float!(:Test2).should eq 765.0
    end

    it "raises KeyError on missing key" do
      expect_raises(KeyError) do
        parsed.parse_float!("Test542")
      end
      expect_raises(KeyError) do
        parsed.parse_float!(:Test432)
      end
    end

    it "raises KeyError on non-float values" do
      expect_raises(KeyError, /String/) do
        parsed.parse_float!("Test3")
      end
      expect_raises(KeyError, /String/) do
        parsed.parse_float!(:Test3)
      end
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

    it "return default value when key not found" do
      parsed.parse_bool("K4").should be_false
      parsed.parse_bool(:K4).should be_false
      parsed.parse_bool("K4", true).should be_true
      parsed.parse_bool(:K4, true).should be_true
      parsed.parse_bool("K4", false).should be_false
      parsed.parse_bool(:K4, false).should be_false
    end
  end

  describe "#parse_bool?" do
    parsed = DotPrison::Parser.new("Key1 true Key2 false Key4 True Key5 5434.32").parse

    it "parses String key" do
      parsed.parse_bool?("Key1").should be_true
      parsed.parse_bool?("Key2").should be_false
    end

    it "parses Symbol key" do
      parsed.parse_bool?(:Key1).should be_true
      parsed.parse_bool?(:Key2).should be_false
    end

    it "returns nil on non-Bool value" do
      parsed.parse_bool?(:Key4).should be_nil
      parsed.parse_bool?("Key4").should be_nil
      parsed.parse_bool?(:Key5).should be_nil
      parsed.parse_bool?("Key5").should be_nil
    end

    it "returns nil on missing key" do
      parsed.parse_bool?(:Key3).should be_nil
      parsed.parse_bool?("Key3").should be_nil
    end
  end

  describe "#parse_bool!" do
    parsed = DotPrison::Parser.new("K1 false K2 true K4 falsey K5 truthy").parse

    it "parses String key" do
      parsed.parse_bool!("K1").should be_false
      parsed.parse_bool!("K2").should be_true
    end

    it "parses Symbol key" do
      parsed.parse_bool!(:K1).should be_false
      parsed.parse_bool!(:K2).should be_true
    end

    it "raises KeyError on non-Bool value" do
      expect_raises(KeyError, /String/) do
        parsed.parse_bool!(:K4)
      end
      expect_raises(KeyError, /String/) do
        parsed.parse_bool!(:K5)
      end
    end

    it "raises KeyError on missing key" do
      expect_raises(KeyError) do
        parsed.parse_bool!(:K3)
      end
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

    it "makes single String into an Array" do
      (arr = parsed.parse_string_array("K2")).should eq ["K2Val1"]
      parsed.parse_string_array(:K2).object_id.should eq arr.object_id
    end

    it "returns empty Array when key not found" do
      (arr = parsed.parse_string_array("K4")).should eq [] of String
      parsed.parse_string_array(:K4).object_id.should eq arr.object_id
    end

    it "returns empty Array when key holds invalid type" do
      (arr = parsed.parse_string_array("K5")).should eq [] of String
      parsed.parse_string_array(:K5).object_id.should eq arr.object_id
    end
  end

  describe "#parse_string_array?" do
    parsed = DotPrison::Parser.new("Key1 Val1 Key1 Val2 Key1 Val3 Key2 Val4 Key2 Val5 BEGIN Table InnerKey InnerVal END Key3 Val6").parse

    it "parses String key" do
      parsed.parse_string_array?("Key1").should eq ["Val1", "Val2", "Val3"]
      parsed.parse_string_array?("Key2").should eq ["Val4", "Val5"]
    end

    it "parses Symbol key" do
      parsed.parse_string_array?(:Key1).should eq ["Val1", "Val2", "Val3"]
      parsed.parse_string_array?(:Key2).should eq ["Val4", "Val5"]
    end

    it "makes single String into an Array" do
      (arr = parsed.parse_string_array?("Key3")).should eq ["Val6"]
      parsed.parse_string_array?(:Key3).object_id.should eq arr.object_id
    end

    it "returns nil on missing key" do
      parsed.parse_string_array?("Key4").should be_nil
      parsed.parse_string_array?(:Ket5).should be_nil
    end

    it "returns nil on non-String or String Array value" do
      parsed.parse_string_array?("Table").should be_nil
      parsed.parse_string_array?(:Table).should be_nil
    end
  end

  describe "#parse_string_array!" do
    parsed = DotPrison::Parser.new("Key1 Val1 Key1 Val2 Key1 Val3 Key2 Val4 Key2 Val5 BEGIN Table InnerKey InnerVal END Key3 Val6").parse

    it "parses String key" do
      parsed.parse_string_array!("Key1").should eq ["Val1", "Val2", "Val3"]
      parsed.parse_string_array!("Key2").should eq ["Val4", "Val5"]
    end

    it "parses Symbol key" do
      parsed.parse_string_array!(:Key1).should eq ["Val1", "Val2", "Val3"]
      parsed.parse_string_array!(:Key2).should eq ["Val4", "Val5"]
    end

    it "makes single String into an Array" do
      (arr = parsed.parse_string_array!("Key3")).should eq ["Val6"]
      parsed.parse_string_array!(:Key3).object_id.should eq arr.object_id
    end

    it "raises KeyError on missing key" do
      expect_raises(KeyError) do
        parsed.parse_string_array!("Key4")
      end
      expect_raises(KeyError) do
        parsed.parse_string_array!(:Key5)
      end
    end

    it "raises KeyError on non-String or String Array value" do
      expect_raises(KeyError, /DotPrison::Table/) do
        parsed.parse_string_array!("Table")
      end
      expect_raises(KeyError, /DotPrison::Table/) do
        parsed.parse_string_array!(:Table)
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
      (arr = parsed.parse_table_array("K2")).should be_a Array(DotPrison::Table)
      arr.size.should eq 1
      parsed.parse_table_array(:K2).object_id.should eq arr.object_id
    end

    it "returns empty array when key not found" do
      (arr = parsed.parse_table_array("K4")).should be_a Array(DotPrison::Table)
      arr.empty?.should be_true
      parsed.parse_table_array(:K4).object_id.should eq arr.object_id
    end

    it "returns empty array when key holds invalid type" do
      (arr = parsed.parse_table_array("K3")).should be_a Array(DotPrison::Table)
      arr.empty?.should be_true
      parsed.parse_table_array(:K3).object_id.should eq arr.object_id
    end
  end

  describe "#parse_table_array?" do
    parsed = DotPrison::Parser.new("BEGIN K1 K1Key1 K1Val1 END BEGIN K1 K1Key2 K1Val2 END BEGIN K2 K2Key1 K2Key1 END K3 K3Val1 K3 K3Val2").parse

    it "parses String key" do
      parsed.parse_table_array?("K1").as(Array(DotPrison::Table)).size.should eq 2
    end

    it "parses Symbol key" do
      parsed.parse_table_array?(:K1).as(Array(DotPrison::Table)).size.should eq 2
    end

    it "makes single Table into an array" do
      (arr = parsed.parse_table_array?("K2")).should be_a Array(DotPrison::Table)
      arr.as(Array(DotPrison::Table)).size.should eq 1
      parsed.parse_table_array?(:K2).object_id.should eq arr.object_id
    end

    it "returns nil on missing key" do
      parsed.parse_table_array?("K4").should be_nil
      parsed.parse_table_array?(:K4).should be_nil
    end

    it "returns nil on invalid value" do
      parsed.parse_table_array?("K3").should be_nil
      parsed.parse_table_array?(:K3).should be_nil
    end
  end
end
