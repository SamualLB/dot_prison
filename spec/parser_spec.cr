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

    it "reads string key: value" do
      DotPrison::Parser.new("TestKey TestValue").parse["TestKey"].should eq "TestValue"
      DotPrison::Parser.new("TestKey FakeValue").parse["TestKey"].should_not eq "TestValue"
    end

    it "reads empty Store" do
      str = "BEGIN TestStore END"
      DotPrison::Parser.new(str).parse["TestStore"].should eq DotPrison::Store.new("TestStore")
      DotPrison::Parser.new(str).parse["FakeStore"]?.should_not eq DotPrison::Store.new("TestStore")
    end

    it "reads quoted key" do
      str = "BEGIN \"12 34\" END"
      DotPrison::Parser.new(str).parse["12 34"].should eq DotPrison::Store.new("12 34")
      DotPrison::Parser.new(str).parse["12 34"].should_not eq DotPrison::Store.new
      str = "\"56 78\" Val"
      DotPrison::Parser.new(str).parse["56 78"].should eq "Val"
    end

    it "parses Store" do
      str = "BEGIN Store Key1 Val1 Key2 Val2 END"
      sto = DotPrison::Parser.new(str).parse["Store"]
      sto.class.should eq DotPrison::Store
      sto = sto.as(DotPrison::Store)
      sto["Key1"].should eq "Val1"
      sto["Key2"].should eq "Val2"
    end

    it "parses Store children" do
      str = "BEGIN One Str1 Val1 BEGIN Two Str2 Val2 BEGIN Three Str3 Val3 END END END"
      sto = DotPrison::Parser.new(str).parse["One"]
      sto.class.should eq DotPrison::Store
      sto = sto.as DotPrison::Store
      sto["Str1"].should eq "Val1"
      (sto2 = sto["Two"]).class.should eq DotPrison::Store
      sto2 = sto2.as DotPrison::Store
      sto2["Str2"].should eq "Val2"
      (sto3 = sto2["Three"]).class.should eq DotPrison::Store
      sto3 = sto3.as DotPrison::Store
      sto3["Str3"].should eq "Val3"
    end

    it "parses duplicate Store keys" do
      str = "BEGIN Key Key1 Val1 END BEGIN Key Key2 Val2 END"
      arr = DotPrison::Parser.new(str).parse["Key"]
      arr.class.should eq Array(DotPrison::Store)
      arr.size.should eq 2
      arr = arr.as(Array(DotPrison::Store))
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

    it "parses mixed String and Store" do
      str = "TestKey TestValue BEGIN TestStore InnerKey InnerValue END"
      sto = DotPrison::Parser.new(str).parse
      sto["TestKey"].should eq "TestValue"
      (sub = sto["TestStore"]).class.should eq DotPrison::Store
      sub = sub.as(DotPrison::Store)
      sub.name.should eq "TestStore"
      sub["InnerKey"].should eq "InnerValue"
    end
  end
end
