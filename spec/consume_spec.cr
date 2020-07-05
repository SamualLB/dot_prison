require "./spec_helper"

FILE_CONTENTS = "
StringTest   HelloThere
IntTest      546
FloatTest    123.45
BoolTest     true
IntTuple.x   543
IntTuple.y   765
FloatTuple.x 765.432
FloatTuple.y 454.321
BEGIN SubTable
  InnerIntTest 4314
END
BEGIN SubArray
  BEGIN i END
  BEGIN i END
  BEGIN i END
  BEGIN i END
  BEGIN i END
END
BEGIN GridTest
  BEGIN \"0 0\" Value 0 END
  BEGIN \"4 1\" Value 1 END
  BEGIN \"8 2\" Value 2 END
END
BEGIN IndexedTest
  Size 3
  BEGIN \"[i 0]\" Value 1 END
  BEGIN \"[i 1]\" Value 2 END
  BEGIN \"[i 2]\" Value 3 END
END
ExtraTest    false
"
struct InnerConsumer < DotPrison::Consumer
  consume :inner_int_test, Int32, :InnerIntTest
end

struct ValueConsumer < DotPrison::Consumer
  consume :value, Int32, :Value
end

struct ConsumerTest < DotPrison::Consumer
  consume :string_test, String, :StringTest
  consume :int_test, Int32, :IntTest
  consume :float_test, Float64, :FloatTest
  consume :bool_test, Bool, :BoolTest
  consume :int_tuple_test, Tuple(Int32, Int32), :"IntTuple.x", :"IntTuple.y"
  consume :float_tuple_test, Tuple(Float64, Float64), :"FloatTuple.x", :"FloatTuple.y"
  consume :sub, InnerConsumer, :SubTable
  consume :array_test, Array(DotPrison::Table), :SubArray
  consume :grid_test, DotPrison::GridTable(ValueConsumer), :GridTest
  consume :indexed_test, DotPrison::IndexedTable(ValueConsumer), :IndexedTest
end

describe DotPrison::Consumer do
  consumed = ConsumerTest.new(DotPrison::Parser.new(FILE_CONTENTS).parse)

  describe "#consume" do
    it "can read consumed String" do
      consumed.string_test.should eq "HelloThere"
    end

    it "can read consumed Int" do
      consumed.int_test.should eq 546
    end

    it "can read consumed Float" do
      consumed.float_test.should eq 123.45
    end

    it "can read consumed Bool" do
      consumed.bool_test.should be_true
    end

    it "can read consumed Int Tuple" do
      consumed.int_tuple_test.should eq({543, 765})
    end

    it "can read consumed Float Tuple" do
      consumed.float_tuple_test.should eq({765.432, 454.321})
    end

    it "can read Consumer children" do
      consumed.sub.should be_a InnerConsumer
      consumed.sub.inner_int_test.should eq 4314
    end

    it "can read consumed Array" do
      consumed.array_test.size.should eq 5
    end

    it "can read consumed Grid Store" do
      consumed.grid_test[0, 0].value.should eq 0
      consumed.grid_test[4, 1].value.should eq 1
      consumed.grid_test[8, 2].value.should eq 2
    end

    it "can read consumed Indexed Store" do
      consumed.indexed_test.size.should eq 3
      consumed.indexed_test[0].value.should eq 1
      consumed.indexed_test[1].value.should eq 2
      consumed.indexed_test[2].value.should eq 3
    end
  end

  describe "#unconsumed" do
    it "tracks unconsumed keys" do
      consumed.unconsumed.should eq ["ExtraTest"]
    end
  end
end
