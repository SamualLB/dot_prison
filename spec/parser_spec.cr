require "./spec_helper"

describe DotPrison::Parser do
  describe "#new" do
    it "is created" do
      DotPrison::Parser.new("TestString TestValue").class.should eq DotPrison::Parser
    end
  end

  describe "#parse" do
    it "reads empty" do
      DotPrison::Parser.new("").parse.should eq DotPrison::Table.new
    end

    it "reads string key: value" do
      DotPrison::Parser.new("TestKey TestValue").parse["TestKey"].should eq "TestValue"
      DotPrison::Parser.new("TestKey FakeValue").parse["TestKey"].should_not eq "TestValue"
    end

    it "reads empty Table" do
      str = "BEGIN TestTable END"
      table = DotPrison::Table.new
      table["TestTable"] = DotPrison::Table.new
      DotPrison::Parser.new(str).parse.should eq table
    end

    it "reads quoted key" do
      str = "BEGIN \"12 34\" END"
      table = DotPrison::Table.new
      table["12 34"] = DotPrison::Table.new
      DotPrison::Parser.new(str).parse.should eq table
    end

    it "parses Table" do
      str = "BEGIN Table Key1 Val1 Key2 Val2 END"
      sto = DotPrison::Parser.new(str).parse["Table"]
      sto.class.should eq DotPrison::Table
      sto = sto.as(DotPrison::Table)
      sto["Key1"].should eq "Val1"
      sto["Key2"].should eq "Val2"
    end

    it "parses Table children" do
      str = "BEGIN One Str1 Val1 BEGIN Two Str2 Val2 BEGIN Three Str3 Val3 END END END"
      sto = DotPrison::Parser.new(str).parse["One"]
      sto.class.should eq DotPrison::Table
      sto = sto.as DotPrison::Table
      sto["Str1"].should eq "Val1"
      (sto2 = sto["Two"]).class.should eq DotPrison::Table
      sto2 = sto2.as DotPrison::Table
      sto2["Str2"].should eq "Val2"
      (sto3 = sto2["Three"]).class.should eq DotPrison::Table
      sto3 = sto3.as DotPrison::Table
      sto3["Str3"].should eq "Val3"
    end

    it "parses duplicate Table keys" do
      str = "BEGIN Key Key1 Val1 END BEGIN Key Key2 Val2 END"
      arr = DotPrison::Parser.new(str).parse["Key"]
      arr.class.should eq Array(DotPrison::Table)
      arr.size.should eq 2
      arr = arr.as(Array(DotPrison::Table))
      arr[0]["Key1"].should eq "Val1"
      arr[1]["Key2"].should eq "Val2"
    end

    it "parses duplicate String keys" do
      str = "TestKey Value1 TestKey Value2"
      arr = DotPrison::Parser.new(str).parse["TestKey"]
      arr.class.should eq Array(String)
      arr.size.should eq 2
      arr[0].should eq "Value1"
      arr[1].should eq "Value2"
    end

    it "parses mixed String and Table" do
      str = "TestKey TestValue BEGIN TestTable InnerKey InnerValue END"
      sto = DotPrison::Parser.new(str).parse
      sto["TestKey"].should eq "TestValue"
      (sub = sto["TestTable"]).class.should eq DotPrison::Table
      sub = sub.as(DotPrison::Table)
      sub["InnerKey"].should eq "InnerValue"
    end
  end
end
