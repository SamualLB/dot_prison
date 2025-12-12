require "../spec_helper"

describe DotPrison::Prison do
  describe "#new" do
    it "can be created from an empty table" do
      DotPrison::Prison.new(DotPrison::Table.new())
    end

    it "can be created from a relevant table" do
      DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse)
    end
  end

  describe "#adviser_system" do
    it "returns an `AdviserSystem`" do
      DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse).adviser_system.should be_a DotPrison::Prison::AdviserSystem
    end
  end

  describe "#balance" do
    it "returns a `Float64`" do
      DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse).balance.should be_a Float64
    end
  end

  describe "#balance=" do
    it "can be set to a positive `Float`" do
      prison = DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse)
      prison.balance = 1.01_f64
      prison.balance = 1.02_f32
    end

    it "can be set to a negative `Float`" do
      prison = DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse)
      prison.balance = -1.01_f64
      prison.balance = -1.02_f32
    end

    it "can be set to an positive `Int`" do
      prison = DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse)
      prison.balance = 0_i128
      prison.balance = 1_i64
      prison.balance = 2_i32
      prison.balance = 3_i16
      prison.balance = 4_i8
      prison.balance = 45_u128
      prison.balance = 5_u64
      prison.balance = 6_u32
      prison.balance = 7_u16
      prison.balance = 10_u8
    end

    it "can be set to an negative `Int`" do
      prison = DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse)
      prison.balance = -10_i128
      prison.balance = -1_i64
      prison.balance = -2_i32
      prison.balance = -3_i16
      prison.balance = -4_i8
    end

    it "can be set and retrieved" do
      prison = DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse)
      prison.balance = 1.0
      prison.balance.should eq 1.0
      prison.balance = 2
      prison.balance.should eq 2.0
    end
  end

  describe "#bio_version" do
    it "returns an `Int32`" do
      DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse).bio_version.should be_a Int32
    end
  end

  describe "#bio_version=" do
    it "can be set to an `Int`" do
      prison = DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse)
      prison.bio_version = 1_i128
      prison.bio_version = 2_i64
      prison.bio_version = 3_i32
      prison.bio_version = 4_i16
      prison.bio_version = 5_i8
      prison.bio_version = 6_u128
      prison.bio_version = 7_u64
      prison.bio_version = 8_u32
      prison.bio_version = 9_u16
      prison.bio_version = 10_u8
      prison.bio_version = -11_i128
      prison.bio_version = -12_i64
      prison.bio_version = -13_i32
      prison.bio_version = -14_i16
      prison.bio_version = -15_i8
    end

    it "can be set and retrieved" do
      prison = DotPrison::Prison.new(DotPrison::Parser.new(File.new("./spec/sample_prison.prison")).parse)
      prison.bio_version = 1
      prison.bio_version.should eq 1
      prison.bio_version = -2
      prison.bio_version.should eq -2
    end
  end
end